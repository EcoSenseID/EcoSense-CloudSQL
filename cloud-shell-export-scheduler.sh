export PROJECT_ID="ecosense-bangkit"
export DEMO="ecosense-db-sql-dump"
export BUCKET_NAME="ecosense-db-sql-dump"
export SQL_INSTANCE="ecosense-db"
export GCF_NAME="${DEMO}-gcf"
export PUBSUB_TOPIC="${DEMO}-topic"
export SCHEDULER_JOB="${DEMO}-job"
export SQL_ROLE="sqlExporter"
export STORAGE_ROLE="simpleStorageRole"
export REGION="asia-southeast1"

export SQL_SA=(`gcloud sql instances describe ${SQL_INSTANCE} \
    --project ${PROJECT_ID} \
    --format "value(serviceAccountEmailAddress)"`)

# Create IAM Roles
gcloud iam roles create ${STORAGE_ROLE} --project ${PROJECT_ID} \
    --title "Simple Storage Role" \
    --description "Grant permissions to view and create objects in Cloud Storage" \
    --permissions "storage.objects.create,storage.objects.get"

gcloud iam roles create ${SQL_ROLE} --project ${PROJECT_ID} \
    --title "SQL Exporter Role" \
    --description "Grant permissions to export data from a Cloud SQL instance to a Cloud Storage bucket as a SQL dump or CSV file" \
    --permissions "cloudsql.instances.export"

# Bind the simpleStorageRole role to Cloud Service Account
gsutil iam ch serviceAccount:${SQL_SA}:projects/${PROJECT_ID}/roles/${STORAGE_ROLE} gs://${BUCKET_NAME}

# Make a new Service Account for Cloud Function and bind the sqlExporter role
gcloud iam service-accounts create ${GCF_NAME} \
    --display-name "Service Account for GCF and SQL Admin API"

gcloud projects add-iam-policy-binding ${PROJECT_ID} \
    --member="serviceAccount:${GCF_NAME}@${PROJECT_ID}.iam.gserviceaccount.com" \
    --role="projects/${PROJECT_ID}/roles/${SQL_ROLE}"

# Create a new Pub/Sub topic
gcloud pubsub topics create ${PUBSUB_TOPIC}

# Make main.py file for Cloud Function
cat <<EOF > main.py

import base64
import logging
import json
import pytz

from datetime import datetime
from httplib2 import Http

from googleapiclient import discovery
from googleapiclient.errors import HttpError
from oauth2client.client import GoogleCredentials

def main(event, context):
    pubsub_message = json.loads(base64.b64decode(event['data']).decode('utf-8'))
    credentials = GoogleCredentials.get_application_default()

    service = discovery.build('sqladmin', 'v1beta4', http=credentials.authorize(Http()), cache_discovery=False)

    datestamp = datetime.now(pytz.timezone('Asia/Jakarta')).strftime("%Y-%m-%d (%H_%M_%S)") # format timestamp: Year-Month-Day Hour_Minute_Second
    uri = "{0}/backup-{1}_{2}.sql".format(pubsub_message['gs'], pubsub_message['db'], datestamp)

    instances_export_request_body = {
      "exportContext": {
        "kind": "sql#exportContext",
        "fileType": "SQL",
        "uri": uri,
        "databases": [
          pubsub_message['db']
        ]
      }
    }

    try:
      request = service.instances().export(
            project=pubsub_message['project'],
            instance=pubsub_message['instance'],
            body=instances_export_request_body
        )
      response = request.execute()
    except HttpError as err:
        logging.error("Could NOT run backup. Reason: {}".format(err))
    else:
      logging.info("Backup task status: {}".format(response))

EOF

# Make requirements.txt file for Cloud Function
cat <<EOF > requirements.txt
google-api-python-client
Oauth2client
EOF

# Deploy main.py and requirements.txt to Cloud Functions with Python 3.9 runtime
gcloud functions deploy ${GCF_NAME} \
    --trigger-topic ${PUBSUB_TOPIC} \
    --runtime python39 \
    --entry-point main \
    --service-account ${GCF_NAME}@${PROJECT_ID}.iam.gserviceaccount.com

# Create a new Scheduler Job which sends message to Pub/Sub every 23.00
gcloud scheduler jobs create pubsub ${SCHEDULER_JOB} \
    --schedule '0 23 * * *' \
    --topic ${PUBSUB_TOPIC} \
    --message-body '{"db":"ecosense-db-sql","instance":'\"${SQL_INSTANCE}\"',"project":'\"${PROJECT_ID}\"',"gs":'\"gs://ecosense-db-sql-dump\"'}' \
    --time-zone 'Asia/Jakarta'

# Test
gcloud scheduler jobs run ${SCHEDULER_JOB}
gcloud sql operations list --instance ${SQL_INSTANCE} --limit 1  # Check if the export job exists
