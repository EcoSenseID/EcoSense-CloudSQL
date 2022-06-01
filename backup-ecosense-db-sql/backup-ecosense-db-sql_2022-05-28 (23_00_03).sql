--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: campaign_participant; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.campaign_participant (
    id_campaign integer NOT NULL,
    id_user integer NOT NULL,
    is_completed boolean NOT NULL,
    joined_timestamp timestamp without time zone NOT NULL,
    completed_timestamp timestamp without time zone NOT NULL
);


--
-- Name: campaigns; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.campaigns (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    initiator character varying(50) NOT NULL,
    description character varying(255) NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    poster_url character varying(2083) NOT NULL
);


--
-- Name: campaigns_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.campaigns_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: campaigns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.campaigns_id_seq OWNED BY public.campaigns.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    photo_url character varying(2083) NOT NULL,
    color_hex character varying(7)
);


--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: category_campaign; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.category_campaign (
    id_category integer NOT NULL,
    id_campaign integer NOT NULL,
    earned_experience_point integer NOT NULL
);


--
-- Name: completed_tasks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.completed_tasks (
    id_task integer NOT NULL,
    id_user integer NOT NULL,
    photo_url character varying(2083) NOT NULL,
    "timestamp" timestamp without time zone NOT NULL
);


--
-- Name: roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(255) NOT NULL
);


--
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.role_id_seq OWNED BY public.roles.id;


--
-- Name: tasks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tasks (
    id integer NOT NULL,
    id_campaign integer NOT NULL,
    order_number integer NOT NULL,
    name character varying(255) NOT NULL,
    require_proof boolean NOT NULL
);


--
-- Name: tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tasks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tasks_id_seq OWNED BY public.tasks.id;


--
-- Name: user_experience_points; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_experience_points (
    id_category integer NOT NULL,
    id_user integer NOT NULL,
    experience_point integer NOT NULL
);


--
-- Name: user_role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_role (
    id_user integer NOT NULL,
    id_role integer NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    firebase_uid character varying(40) NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: campaigns id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.campaigns ALTER COLUMN id SET DEFAULT nextval('public.campaigns_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);


--
-- Name: tasks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tasks ALTER COLUMN id SET DEFAULT nextval('public.tasks_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: campaign_participant; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.campaign_participant (id_campaign, id_user, is_completed, joined_timestamp, completed_timestamp) FROM stdin;
\.


--
-- Data for Name: campaigns; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.campaigns (id, title, initiator, description, start_date, end_date, poster_url) FROM stdin;
2	City with Green Nature.	Kenji	To transform city with green nature, we have to conserving and extending health and welfare standards for nature reserves. These nature parks serve as buffers and complementary habitats for native flora and fauna to thrive.	2022-05-23	2022-05-27	https://images.pexels.com/photos/417351/pexels-photo-417351.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2
3	Clean and Green	Kenji	Clean and Green aims to inspire people around the world to care for and protect our environment by adopting a clean, green and sustainable lifestyle.	2022-05-24	2022-05-28	https://images.pexels.com/photos/5748316/pexels-photo-5748316.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2
4	Green Goes with Everything!	Kenji	Creating green will make people feel good about the sustainability of the environment and people all around the world to make positive impact on the environment with the go-green movement.	2022-05-25	2022-05-29	https://images.pexels.com/photos/5396853/pexels-photo-5396853.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load
5	Save Earth, Go Green!	Kenji	Going green products are an important and relevant aspect to one’s lifestyle. Clean and going green products contribute to a healthy environment and raise environmental consciousness.	2022-05-26	2022-05-30	https://images.pexels.com/photos/3698534/pexels-photo-3698534.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2
6	Solution to Less Pollution	Kenji	Prevention practices are essential for preserving wetlands, groundwater sources and other critical ecosystems - areas in which we especially want to stop pollution before it begins.	2022-05-27	2022-05-31	https://images.pexels.com/photos/4167579/pexels-photo-4167579.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2
1	Earth Day Campaign	Kenji Marwies	This is the moment to change it all — the business climate, the political climate, and how we take action on climate. Now is the time for the unstoppable courage to preserve and protect our health, our families, and our livelihoods.	2022-05-12	2022-07-12	https://upload.wikimedia.org/wikipedia/commons/4/41/Earth_Day_Flag.jpg
7	Android Party!	Ken Tandrian	A campaign for people to love Android OS and use them.	2022-05-31	2022-06-10	https://storage.googleapis.com/ecosense-campaign-posters/1653552991401-androidparty.png
8	10 Days of Yoga	Ken Tandrian	A campaign for people who love peaceful mind and healthy soul.	2022-05-28	2022-06-10	https://storage.googleapis.com/ecosense-campaign-posters/1653554613013-yoga.jpg
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.categories (id, name, photo_url, color_hex) FROM stdin;
1	Water Pollution	https://cdn.pixabay.com/photo/2019/06/20/10/08/contamination-4286704_1280.jpg	#206A5D
2	Air Pollution	https://cdn.pixabay.com/photo/2021/10/10/21/30/power-plant-6698838_1280.jpg	#81B214
3	Food Waste	https://images.pexels.com/photos/4997810/pexels-photo-4997810.jpeg?auto=compress&cs=tinysrgb&w=1600	#F58634
4	Plastic Free	https://images.pexels.com/photos/802221/pexels-photo-802221.jpeg?auto=compress&cs=tinysrgb&w=1600	#E25DD7
5	Energy Efficiency	https://images.pexels.com/photos/1635332/pexels-photo-1635332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2	#DB3069
\.


--
-- Data for Name: category_campaign; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.category_campaign (id_category, id_campaign, earned_experience_point) FROM stdin;
1	1	200
2	2	300
3	3	500
4	4	400
5	5	300
5	7	100
5	8	100
\.


--
-- Data for Name: completed_tasks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.completed_tasks (id_task, id_user, photo_url, "timestamp") FROM stdin;
1	1	https://images.pexels.com/photos/3850512/pexels-photo-3850512.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2	2022-05-23 16:30:00
2	1	https://images.pexels.com/photos/3519441/pexels-photo-3519441.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2	2022-05-23 17:00:00
3	1	https://images.pexels.com/photos/1301856/pexels-photo-1301856.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2	2022-05-24 18:00:00
4	1	https://images.pexels.com/photos/325521/pexels-photo-325521.jpeg?cs=srgb&dl=pexels-leah-kelley-325521.jpg&fm=jpg	2022-05-22 20:00:00
5	1	https://images.pexels.com/photos/7879909/pexels-photo-7879909.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2	2022-05-23 15:00:00
1	2	https://images.pexels.com/photos/3850512/pexels-photo-3850512.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2	2022-05-24 17:00:00
2	2	https://images.pexels.com/photos/3519441/pexels-photo-3519441.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2	2022-05-25 21:00:00
1	3	https://images.pexels.com/photos/3850512/pexels-photo-3850512.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2	2022-05-24 12:00:00
1	4	https://images.pexels.com/photos/3850512/pexels-photo-3850512.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2	2022-05-25 08:00:00
1	5	https://images.pexels.com/photos/3850512/pexels-photo-3850512.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2	2022-05-24 13:30:00
1	1	https://storage.googleapis.com/ecosense-task-proofs/1653480938695-androidparty.png	2022-05-25 12:15:38.708
2	2	https://storage.googleapis.com/ecosense-task-proofs/1653481005635-androidparty.png	2022-05-25 12:16:45.647
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.roles (id, name, description) FROM stdin;
1	Admin	The role who participates in campaigns, logs in through mobile application.
2	User	The role who organizes campaigns, log in through web application.
\.


--
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tasks (id, id_campaign, order_number, name, require_proof) FROM stdin;
1	1	1	Water your plants at 10.00 AM in the morning	t
2	1	1	Buy eco-friendly products and avoid products made with harmful chemicals.	t
3	1	2	Adopt a road, park or beach, and pick up litter.	t
4	1	3	Plant a garden. Even a small container garden will help save on trips to the store and packaging materials.	t
5	1	4	Spend more time outside.	t
6	1	5	Pack drinks in a thermos or reusable water bottle.	t
7	2	1	Pack lunches in reusable containers.	t
8	2	2	Bring your own shopping bags.	t
9	2	3	Used paper based straws or even qtips.	t
10	2	4	Choose cloth napkins instead of paper.	t
11	2	5	Books - donate to the library, used bookstore or neighborhood children. There are also a lot of fun crafts you can try with worn versions.	t
12	3	1	Buy locally - ‘made products when possible. Craft fairs are great places to get unique, local gifts.	t
13	3	2	Water wisely - If you must water plants, do it early in the morning before the sun causes evaporation. Collect and use rainwater for your garden.	t
14	3	3	Water your outdoor plants in the early morning or in the evening - not in the heat of the day.	t
15	3	4	Go organic. Do not use pesticides on your lawn or plants.	t
16	3	5	Teach children to be environmentally aware. Model eco-friendly practices and then explain why you do them.	t
17	4	1	Limit “screen time” including T.V., video games, computer, etc.	t
18	4	2	Use a timer to take shorter showers	t
19	4	3	Wait until you have a full load of laundry or dishes before you started the machine.	t
20	4	4	Hang your clothes to dry rather than using a dryer	t
21	4	5	Plant trees together	t
22	5	1	Take your own cloth bags or backpack when you go grocery shopping	t
23	5	2	Pack leftovers in reusable containers rather than a throwaway wrap	t
24	5	3	Create a recycling container for your vehicle for bottles and cans.	t
25	5	4	Containers - repurpose old containers for planters, craft storage or kitchen storage	t
26	5	5	Use rechargeable batteries or recycle your old batteries	t
27	7	1	Use an Android phone.	t
28	7	2	Use an Android application.	t
29	7	3	Search for Android mascot.	t
30	7	4	Make an Android application.	f
31	8	1	Standing Forward Fold (Uttanasana)	t
32	8	2	Warrior I (Virabhadrasana I)	t
33	8	3	Cat-Cow Pose (Marjaryasana-Bitilasana)	t
34	8	4	Cobra Pose (Bhujangasana)	t
35	8	5	Bow Pose (Dhanurasana)	t
36	8	6	King Dancer Pose (Natarajasana)	t
37	8	7	Bridge Pose (Setu Bandha Sarvangasana)	t
38	8	8	Butterfly Pose (Baddha Konasana)	t
\.


--
-- Data for Name: user_experience_points; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_experience_points (id_category, id_user, experience_point) FROM stdin;
1	1	100
1	2	150
1	3	125
1	4	175
1	5	325
1	6	200
1	7	225
1	8	175
1	9	150
1	10	325
2	1	250
2	2	100
2	3	125
2	4	175
2	5	50
2	6	125
2	7	225
2	8	375
2	9	300
2	10	100
3	1	200
3	2	250
3	3	275
3	4	350
3	5	125
3	6	100
3	7	300
3	8	275
3	9	200
3	10	175
4	1	250
4	2	225
4	3	125
4	4	100
4	5	125
4	6	225
4	7	375
4	8	300
4	9	250
4	10	275
5	1	350
5	2	125
5	3	100
5	4	125
5	5	225
5	6	375
5	7	300
5	8	125
5	9	125
5	10	225
\.


--
-- Data for Name: user_role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_role (id_user, id_role) FROM stdin;
1	1
2	1
3	1
4	1
5	1
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, firebase_uid) FROM stdin;
1	vsAJyonioiWeUEvpzZ2jYCaCdAI3
2	borvSEcapVd8DJgbPhbzMVT4IdH2
3	rpaEoUn1NfbDobQWY1IqhFbTsJs1
4	5V9F5yjc1weJ1VCpH0rkHtiySNx1
5	taHexcnivybFSNsYLUUAHdEw4z12
\.


--
-- Name: campaigns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.campaigns_id_seq', 8, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.categories_id_seq', 1, true);


--
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.role_id_seq', 2, true);


--
-- Name: tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tasks_id_seq', 38, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 5, true);


--
-- Name: campaigns campaigns_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.campaigns
    ADD CONSTRAINT campaigns_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: roles role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- Name: tasks tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: campaign_participant campaign_participant_id_campaign_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.campaign_participant
    ADD CONSTRAINT campaign_participant_id_campaign_fkey FOREIGN KEY (id_campaign) REFERENCES public.campaigns(id);


--
-- Name: category_campaign category_campaign_id_campaign_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.category_campaign
    ADD CONSTRAINT category_campaign_id_campaign_fkey FOREIGN KEY (id_campaign) REFERENCES public.campaigns(id);


--
-- Name: category_campaign category_campaign_id_category_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.category_campaign
    ADD CONSTRAINT category_campaign_id_category_fkey FOREIGN KEY (id_category) REFERENCES public.categories(id);


--
-- Name: completed_tasks completed_tasks_id_task_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.completed_tasks
    ADD CONSTRAINT completed_tasks_id_task_fkey FOREIGN KEY (id_task) REFERENCES public.tasks(id);


--
-- Name: completed_tasks completed_tasks_id_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.completed_tasks
    ADD CONSTRAINT completed_tasks_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.campaigns(id);


--
-- Name: tasks tasks_id_campaign_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_id_campaign_fkey FOREIGN KEY (id_campaign) REFERENCES public.campaigns(id);


--
-- Name: user_experience_points user_experience_points_id_category_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_experience_points
    ADD CONSTRAINT user_experience_points_id_category_fkey FOREIGN KEY (id_category) REFERENCES public.categories(id);


--
-- Name: user_role user_role_id_role_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT user_role_id_role_fkey FOREIGN KEY (id_role) REFERENCES public.roles(id);


--
-- Name: user_role user_role_id_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT user_role_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.users(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM cloudsqladmin;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO cloudsqlsuperuser;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: FUNCTION pg_replication_origin_advance(text, pg_lsn); Type: ACL; Schema: pg_catalog; Owner: -
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_advance(text, pg_lsn) TO cloudsqlsuperuser;


--
-- Name: FUNCTION pg_replication_origin_create(text); Type: ACL; Schema: pg_catalog; Owner: -
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_create(text) TO cloudsqlsuperuser;


--
-- Name: FUNCTION pg_replication_origin_drop(text); Type: ACL; Schema: pg_catalog; Owner: -
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_drop(text) TO cloudsqlsuperuser;


--
-- Name: FUNCTION pg_replication_origin_oid(text); Type: ACL; Schema: pg_catalog; Owner: -
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_oid(text) TO cloudsqlsuperuser;


--
-- Name: FUNCTION pg_replication_origin_progress(text, boolean); Type: ACL; Schema: pg_catalog; Owner: -
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_progress(text, boolean) TO cloudsqlsuperuser;


--
-- Name: FUNCTION pg_replication_origin_session_is_setup(); Type: ACL; Schema: pg_catalog; Owner: -
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_is_setup() TO cloudsqlsuperuser;


--
-- Name: FUNCTION pg_replication_origin_session_progress(boolean); Type: ACL; Schema: pg_catalog; Owner: -
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_progress(boolean) TO cloudsqlsuperuser;


--
-- Name: FUNCTION pg_replication_origin_session_reset(); Type: ACL; Schema: pg_catalog; Owner: -
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_reset() TO cloudsqlsuperuser;


--
-- Name: FUNCTION pg_replication_origin_session_setup(text); Type: ACL; Schema: pg_catalog; Owner: -
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_setup(text) TO cloudsqlsuperuser;


--
-- Name: FUNCTION pg_replication_origin_xact_reset(); Type: ACL; Schema: pg_catalog; Owner: -
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_xact_reset() TO cloudsqlsuperuser;


--
-- Name: FUNCTION pg_replication_origin_xact_setup(pg_lsn, timestamp with time zone); Type: ACL; Schema: pg_catalog; Owner: -
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_xact_setup(pg_lsn, timestamp with time zone) TO cloudsqlsuperuser;


--
-- Name: FUNCTION pg_show_replication_origin_status(OUT local_id oid, OUT external_id text, OUT remote_lsn pg_lsn, OUT local_lsn pg_lsn); Type: ACL; Schema: pg_catalog; Owner: -
--

GRANT ALL ON FUNCTION pg_catalog.pg_show_replication_origin_status(OUT local_id oid, OUT external_id text, OUT remote_lsn pg_lsn, OUT local_lsn pg_lsn) TO cloudsqlsuperuser;


--
-- PostgreSQL database dump complete
--

