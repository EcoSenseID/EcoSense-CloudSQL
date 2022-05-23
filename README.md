# EcoSense Cloud SQL
A collection of exported SQL dump files as a backup of our PostgreSQL database in Google Cloud SQL.

## Cloud SQL Configuration
| Configuration  | Detail |
| ------------- | ------------- |
| Region  | asia-southeast1 (Singapore)  |
| DB Version  | PostgreSQL 14.2  |
| vCPUs | 1 vCPU|
| Memory            |          628.74 MB|
| Storage | 100 GB
| Network throughput (MB/s) | 125 of 125
| Disk throughput (MB/s) | Read: 48.0 of 125.0 / Write: 37.9 of 37.9
| IOPS  | Read: 3,000 of 15,000 / Write: 3,000 of 4,500
| Connections | Public IP
| Backup | Automated
| Availability | Single zone
| Point-in-time recovery | Enabled

## Infrastructure
- Google Cloud Storage
  - Firebase Profile Picture storage `ecosense-bangkit.appspot.com`
  - Cloud SQL Dump storage `ecosense-db-sql-dump`
- Cloud SQL 
  - Instance `ecosense-db`
  - Database `ecosense-db-sql`
- Cloud Scheduler 
  - Scheduler Job `ecosense-db-sql-dump-job` - Runs every 11.00 PM
- Cloud Pub/Sub
  - Topic `ecosense-db-sql-dump-topic`
- Cloud Functions 
  - Export Cloud SQL to GCS `ecosense-db-sql-dump-gcf`

```mermaid
graph LR;
    A([Scheduler Job])-->B([Pub/Sub]);
    B([Pub/Sub])-->C([Cloud Functions]);
    C([Cloud Functions])-->D([Cloud SQL]);
    D([Cloud SQL])-->E([Google Cloud Storage]);
```

##
&#169; Ecosense 2022.
