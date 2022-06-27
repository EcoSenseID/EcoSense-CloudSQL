--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.3

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
    description character varying(255) NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    poster_url character varying(2083) NOT NULL,
    id_initiator integer NOT NULL
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
    "timestamp" timestamp without time zone NOT NULL,
    caption character varying(500)
);


--
-- Name: histories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.histories (
    id integer NOT NULL,
    id_user integer NOT NULL,
    label character varying(100) NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    confidence_percent integer NOT NULL
);


--
-- Name: histories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.histories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: histories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.histories_id_seq OWNED BY public.histories.id;


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
    firebase_uid character varying(40) NOT NULL,
    name character varying
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
-- Name: histories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.histories ALTER COLUMN id SET DEFAULT nextval('public.histories_id_seq'::regclass);


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
3	1	f	2022-06-06 04:21:11.583	2022-06-06 04:21:11.583
4	1	f	2022-06-06 04:21:14.202	2022-06-06 04:21:14.202
8	24	t	2022-06-11 07:17:46.045	2022-06-11 08:09:40.842
2	1	f	2022-06-04 04:43:08.981	2022-06-04 04:43:08.981
7	24	t	2022-06-11 07:30:19.314	2022-06-11 08:10:06.741
1	13	f	2022-06-09 03:38:57.678	2022-06-09 03:38:57.678
7	7	t	2022-06-07 14:16:39.885	2022-06-09 11:51:58.038
2	7	t	2022-06-08 16:36:55.26	2022-06-09 12:08:07.072
3	7	t	2022-06-08 14:14:36.092	2022-06-09 12:08:13.774
4	7	t	2022-06-08 14:10:36.457	2022-06-09 14:05:26.347
5	7	t	2022-06-06 12:28:56.041	2022-06-09 14:24:57.642
6	7	t	2022-06-06 12:35:11.645	2022-06-09 14:31:32.888
5	24	t	2022-06-11 08:12:14.286	2022-06-11 08:13:10.273
8	7	t	2022-06-09 14:35:34.681	2022-06-09 14:47:26.048
6	24	t	2022-06-11 08:10:56.254	2022-06-11 08:13:35.682
2	8	t	2022-06-09 15:34:06.676	2022-06-09 15:37:07.411
2	17	f	2022-06-09 15:58:57.6	2022-06-09 15:58:57.6
3	19	f	2022-06-09 17:05:43.933	2022-06-09 17:05:43.933
7	19	f	2022-06-09 17:06:04.915	2022-06-09 17:06:04.915
4	19	f	2022-06-09 17:06:46.086	2022-06-09 17:06:46.086
1	19	t	2022-06-09 17:05:07.12	2022-06-09 17:10:43.678
2	19	t	2022-06-09 17:06:31.926	2022-06-09 17:10:54.521
1	20	f	2022-06-10 06:33:18.525	2022-06-10 06:33:18.525
1	21	f	2022-06-10 12:20:18.129	2022-06-10 12:20:18.129
1	23	f	2022-06-10 12:21:23.819	2022-06-10 12:21:23.819
3	24	t	2022-06-11 08:15:27.835	2022-06-11 08:33:23.498
2	24	t	2022-06-11 08:16:33.387	2022-06-11 08:33:54.455
5	6	f	2022-06-10 18:11:39.742	2022-06-10 18:11:39.742
6	6	f	2022-06-10 18:11:59.532	2022-06-10 18:11:59.532
1	6	t	2022-06-09 17:42:13.598	2022-06-11 09:16:12.873
2	6	t	2022-06-09 17:45:20.666	2022-06-11 09:16:49.217
4	6	t	2022-06-09 17:42:35.666	2022-06-11 09:17:04.783
1	7	t	2022-06-08 12:23:46.693	2022-06-12 12:34:59.22
4	24	t	2022-06-11 08:14:05.008	2022-06-13 04:07:38.468
1	24	t	2022-06-11 07:27:18.317	2022-06-19 13:58:46.122
1	1	f	2022-06-06 04:20:54.087	2022-06-11 07:57:30.939
\.


--
-- Data for Name: campaigns; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.campaigns (id, title, description, start_date, end_date, poster_url, id_initiator) FROM stdin;
7	Android Partee!	A campaign for people to love Android OS and use them. Android make the most out of a mobile phone!	2022-06-09	2022-11-09	https://storage.googleapis.com/ecosense-campaign-posters/1653552991401-androidparty.png	1
8	10 Days of Yoga	A campaign for people who love peaceful mind and healthy soul. Yoga will energize your body and soul and make the best version of you!	2022-06-11	2022-10-10	https://storage.googleapis.com/ecosense-campaign-posters/1653554613013-yoga.jpg	1
2	City with Green Nature	To transform city with green nature, we have to conserving and extending health and welfare standards for nature reserves. These nature parks serve as buffers and complementary habitats for native flora and fauna to thrive.	2022-06-09	2022-12-25	https://images.pexels.com/photos/417351/pexels-photo-417351.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2	1
4	Green Goes with Everything!	Creating green will make people feel good about the sustainability of the environment and people all around the world to make positive impact on the environment with the go-green movement.	2022-06-12	2022-10-29	https://images.pexels.com/photos/5396853/pexels-photo-5396853.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load	1
5	Save Earth, Go Green!	Going green products are an important and relevant aspect to one’s lifestyle. Clean and going green products contribute to a healthy environment and raise environmental consciousness.	2022-06-13	2022-10-30	https://images.pexels.com/photos/3698534/pexels-photo-3698534.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2	1
1	Earth Day Campaign	This is the moment to change it all — the business climate, the political climate, and how we take action on climate. Now is the time for the unstoppable courage to preserve and protect our health, our families, and our livelihoods.	2022-06-07	2022-10-12	https://upload.wikimedia.org/wikipedia/commons/4/41/Earth_Day_Flag.jpg	1
6	Solution to Less Pollution	Prevention practices are essential for preserving wetlands, groundwater sources and other critical ecosystems - areas in which we especially want to stop pollution before it begins.	2022-06-14	2022-10-31	https://images.pexels.com/photos/4167579/pexels-photo-4167579.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2	1
3	Clean and Green	Clean and Green aims to inspire people around the world to care for and protect our environment by adopting a clean, green and sustainable lifestyle.	2022-06-08	2022-11-01	https://images.pexels.com/photos/5748316/pexels-photo-5748316.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2	1
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
2	2	100
1	1	100
3	3	100
5	7	100
5	8	100
4	4	100
5	5	100
4	6	50
5	6	50
\.


--
-- Data for Name: completed_tasks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.completed_tasks (id_task, id_user, photo_url, "timestamp", caption) FROM stdin;
1	1	https://images.pexels.com/photos/3850512/pexels-photo-3850512.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2	2022-05-23 16:30:00	\N
2	1	https://images.pexels.com/photos/3519441/pexels-photo-3519441.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2	2022-05-23 17:00:00	\N
3	1	https://images.pexels.com/photos/1301856/pexels-photo-1301856.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2	2022-05-24 18:00:00	\N
4	1	https://images.pexels.com/photos/325521/pexels-photo-325521.jpeg?cs=srgb&dl=pexels-leah-kelley-325521.jpg&fm=jpg	2022-05-22 20:00:00	\N
5	1	https://images.pexels.com/photos/7879909/pexels-photo-7879909.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2	2022-05-23 15:00:00	\N
1	2	https://images.pexels.com/photos/3850512/pexels-photo-3850512.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2	2022-05-24 17:00:00	\N
2	2	https://images.pexels.com/photos/3519441/pexels-photo-3519441.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2	2022-05-25 21:00:00	\N
1	3	https://images.pexels.com/photos/3850512/pexels-photo-3850512.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2	2022-05-24 12:00:00	\N
1	4	https://images.pexels.com/photos/3850512/pexels-photo-3850512.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2	2022-05-25 08:00:00	\N
1	5	https://images.pexels.com/photos/3850512/pexels-photo-3850512.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2	2022-05-24 13:30:00	\N
1	1	https://storage.googleapis.com/ecosense-task-proofs/1653480938695-androidparty.png	2022-05-25 12:15:38.708	\N
2	2	https://storage.googleapis.com/ecosense-task-proofs/1653481005635-androidparty.png	2022-05-25 12:16:45.647	\N
7	7	https://storage.googleapis.com/ecosense-task-proofs/1654512530368-06-Jun-20227423390471791549900.jpg	2022-06-06 10:48:50.401	\N
1	7	https://storage.googleapis.com/ecosense-task-proofs/1654610844037-07-Jun-20227768279252752178601.jpg	2022-06-07 14:07:24.055	\N
1	7	https://storage.googleapis.com/ecosense-task-proofs/1654611140815-07-Jun-20222843085051977465557.jpg	2022-06-07 14:12:20.827	\N
1	7	https://storage.googleapis.com/ecosense-task-proofs/1654611349045-07-Jun-20228604908724139737147.jpg	2022-06-07 14:15:49.053	\N
1	7	https://storage.googleapis.com/ecosense-task-proofs/1654612066004-07-Jun-20221345348202103594442.jpg	2022-06-07 14:27:46.009	\N
1	7	https://storage.googleapis.com/ecosense-task-proofs/1654612570667-07-Jun-20225932017069877599034.jpg	2022-06-07 14:36:10.697	\N
2	7	https://storage.googleapis.com/ecosense-task-proofs/1654691320749-08-Jun-20222156454849013893684.jpg	2022-06-08 12:28:40.81	\N
22	7	https://storage.googleapis.com/ecosense-task-proofs/1654692396311-08-Jun-20226711644582368001810.jpg	2022-06-08 12:46:36.334	\N
12	7	https://storage.googleapis.com/ecosense-task-proofs/1654698605173-08-Jun-20223620739900581922120.jpg	2022-06-08 14:30:05.213	\N
13	7	https://storage.googleapis.com/ecosense-task-proofs/1654698785228-08-Jun-20227448223974881020317.jpg	2022-06-08 14:33:05.328	\N
14	7	https://storage.googleapis.com/ecosense-task-proofs/1654699262297-08-Jun-20222475961154467707531.jpg	2022-06-08 14:41:02.333	\N
15	7	https://storage.googleapis.com/ecosense-task-proofs/1654700823751-08-Jun-20228643789620256561542.jpg	2022-06-08 15:07:03.84	\N
16	7	https://storage.googleapis.com/ecosense-task-proofs/1654700931974-08-Jun-20221020453975252946266.jpg	2022-06-08 15:08:51.988	\N
17	7	https://storage.googleapis.com/ecosense-task-proofs/1654706181793-08-Jun-20228864422820028836614.jpg	2022-06-08 16:36:21.852	\N
3	7	https://storage.googleapis.com/ecosense-task-proofs/1654707622082-09-Jun-20228562266976405825751.jpg	2022-06-08 17:00:22.155	\N
4	7	https://storage.googleapis.com/ecosense-task-proofs/1654707653428-09-Jun-20223862425963136253485.jpg	2022-06-08 17:00:53.449	\N
5	7	https://storage.googleapis.com/ecosense-task-proofs/1654707682143-09-Jun-20223715892758292348007.jpg	2022-06-08 17:01:22.154	\N
6	7	https://storage.googleapis.com/ecosense-task-proofs/1654707717780-09-Jun-20228749996710588365781.jpg	2022-06-08 17:01:57.784	\N
23	7	https://storage.googleapis.com/ecosense-task-proofs/1654747842038-09-Jun-20227612137893570295270.jpg	2022-06-09 04:10:42.096	tez
8	7	https://storage.googleapis.com/ecosense-task-proofs/1654748296554-09-Jun-20228736378722696979047.jpg	2022-06-09 04:18:16.59	"tes lagi"
9	7	https://storage.googleapis.com/ecosense-task-proofs/1654750216505-09-Jun-2022901980841323117038.jpg	2022-06-09 04:50:16.513	mmm
10	7	https://storage.googleapis.com/ecosense-task-proofs/1654775011145-09-Jun-20226122878677084327821.jpg	2022-06-09 11:43:31.169	tes caption brow
11	7	https://storage.googleapis.com/ecosense-task-proofs/1654775081443-09-Jun-20229003809921722087464.jpg	2022-06-09 11:44:41.537	hore
27	7	https://storage.googleapis.com/ecosense-task-proofs/1654775318881-09-Jun-20223311417400760686479.jpg	2022-06-09 11:48:38.889	ohyeh
28	7	https://storage.googleapis.com/ecosense-task-proofs/1654775479965-09-Jun-20229000948624983804182.jpg	2022-06-09 11:51:19.97	vano stupid
29	7	https://storage.googleapis.com/ecosense-task-proofs/1654775503275-09-Jun-20228355347225914062875.jpg	2022-06-09 11:51:43.28	hue
30	7	https://storage.googleapis.com/ecosense-task-proofs/1654775515155-09-Jun-2022364518340883643036.jpg	2022-06-09 11:51:55.159	
18	7	https://storage.googleapis.com/ecosense-task-proofs/1654777713175-09-Jun-20225585738885092493112.jpg	2022-06-09 12:28:33.221	yeyy
19	7	https://storage.googleapis.com/ecosense-task-proofs/1654783475289-09-Jun-2022928006249838036051.jpg	2022-06-09 14:04:35.303	miring
20	7	https://storage.googleapis.com/ecosense-task-proofs/1654783502345-09-Jun-20223890486248003869013.jpg	2022-06-09 14:05:02.353	hm
21	7	https://storage.googleapis.com/ecosense-task-proofs/1654783524738-09-Jun-20221255391524053926145.jpg	2022-06-09 14:05:24.743	yogs
24	7	https://storage.googleapis.com/ecosense-task-proofs/1654784629366-09-Jun-20223552228841866267128.jpg	2022-06-09 14:23:49.37	anjay
25	7	https://storage.googleapis.com/ecosense-task-proofs/1654784656502-09-Jun-20224738439019397874233.jpg	2022-06-09 14:24:16.511	
26	7	https://storage.googleapis.com/ecosense-task-proofs/1654784694542-09-Jun-2022240230148496156952.jpg	2022-06-09 14:24:54.548	xxx
39	7	https://storage.googleapis.com/ecosense-task-proofs/1654785018968-09-Jun-2022584009731703057896.jpg	2022-06-09 14:30:18.972	d
40	7	https://storage.googleapis.com/ecosense-task-proofs/1654785048713-09-Jun-20225194958803899988703.jpg	2022-06-09 14:30:48.719	
41	7	https://storage.googleapis.com/ecosense-task-proofs/1654785061799-09-Jun-20226175887608201295684.jpg	2022-06-09 14:31:01.81	y
42	7	https://storage.googleapis.com/ecosense-task-proofs/1654785072768-09-Jun-2022938875173632749032.jpg	2022-06-09 14:31:12.775	
43	7	https://storage.googleapis.com/ecosense-task-proofs/1654785091284-09-Jun-20227403614606276534702.jpg	2022-06-09 14:31:31.289	
31	7	https://storage.googleapis.com/ecosense-task-proofs/1654785790738-09-Jun-20229043795744002748019.jpg	2022-06-09 14:43:10.742	
32	7	https://storage.googleapis.com/ecosense-task-proofs/1654785930564-09-Jun-2022383459319160474526.jpg	2022-06-09 14:45:30.57	
33	7	https://storage.googleapis.com/ecosense-task-proofs/1654785945117-09-Jun-20222907694917813663886.jpg	2022-06-09 14:45:45.121	
34	7	https://storage.googleapis.com/ecosense-task-proofs/1654785957169-09-Jun-20222591347486582972230.jpg	2022-06-09 14:45:57.174	
35	7	https://storage.googleapis.com/ecosense-task-proofs/1654785973236-09-Jun-20223023204800047078218.jpg	2022-06-09 14:46:13.239	
36	7	https://storage.googleapis.com/ecosense-task-proofs/1654785992696-09-Jun-20225187385630733828161.jpg	2022-06-09 14:46:32.703	
37	7	https://storage.googleapis.com/ecosense-task-proofs/1654786014955-09-Jun-20221681892617552079063.jpg	2022-06-09 14:46:54.961	kobra
38	7	https://storage.googleapis.com/ecosense-task-proofs/1654786042665-09-Jun-20221146605031218539669.jpg	2022-06-09 14:47:22.669	owo
7	8	https://storage.googleapis.com/ecosense-task-proofs/1654788875091-09-Jun-20221188617513684835183.jpg	2022-06-09 15:34:35.121	
8	8	https://storage.googleapis.com/ecosense-task-proofs/1654788895853-09-Jun-20225541970334672820285.jpg	2022-06-09 15:34:55.862	
9	8	https://storage.googleapis.com/ecosense-task-proofs/1654788935648-09-Jun-20228536338556880023287.jpg	2022-06-09 15:35:35.654	
10	8	https://storage.googleapis.com/ecosense-task-proofs/1654788977118-09-Jun-20222160224320239598823.jpg	2022-06-09 15:36:17.124	
11	8	https://storage.googleapis.com/ecosense-task-proofs/1654788992107-09-Jun-20226321995038810268939.jpg	2022-06-09 15:36:32.111	
17	6	https://storage.googleapis.com/ecosense-task-proofs/1654796574046-10-Jun-20228578608538617265685.jpg	2022-06-09 17:42:54.065	
18	6	https://storage.googleapis.com/ecosense-task-proofs/1654796586644-10-Jun-20227159359130777572543.jpg	2022-06-09 17:43:06.656	
19	6	https://storage.googleapis.com/ecosense-task-proofs/1654796597325-10-Jun-20227498395067152161105.jpg	2022-06-09 17:43:17.335	
20	6	https://storage.googleapis.com/ecosense-task-proofs/1654796606574-10-Jun-20227119808671723006869.jpg	2022-06-09 17:43:26.58	
21	6	https://storage.googleapis.com/ecosense-task-proofs/1654796640407-10-Jun-20226057417326541920371.jpg	2022-06-09 17:44:00.412	
7	6	https://storage.googleapis.com/ecosense-task-proofs/1654796728970-10-Jun-20226707515409686284239.jpg	2022-06-09 17:45:28.979	
8	6	https://storage.googleapis.com/ecosense-task-proofs/1654796739214-10-Jun-2022925764156476943510.jpg	2022-06-09 17:45:39.219	
9	6	https://storage.googleapis.com/ecosense-task-proofs/1654796747649-10-Jun-20224553334528187545982.jpg	2022-06-09 17:45:47.66	
10	6	https://storage.googleapis.com/ecosense-task-proofs/1654796756391-10-Jun-20221521400017832697814.jpg	2022-06-09 17:45:56.398	
11	6	https://storage.googleapis.com/ecosense-task-proofs/1654796781451-10-Jun-20226832829547575617520.jpg	2022-06-09 17:46:21.456	
1	20	https://storage.googleapis.com/ecosense-task-proofs/1654863531338-10-Jun-20221921866740801959660.jpg	2022-06-10 12:18:51.359	
2	20	https://storage.googleapis.com/ecosense-task-proofs/1654863546890-10-Jun-20222840922684975281708.jpg	2022-06-10 12:19:06.909	
1	21	https://storage.googleapis.com/ecosense-task-proofs/1654863629955-10-Jun-20228707050434218755515.jpg	2022-06-10 12:20:29.965	
1	23	https://storage.googleapis.com/ecosense-task-proofs/1654863694560-10-Jun-20228286354212986505272.jpg	2022-06-10 12:21:34.567	
1	6	https://storage.googleapis.com/ecosense-task-proofs/1654863898056-10-Jun-20229093099755918839566.jpg	2022-06-10 12:24:58.06	
2	6	https://storage.googleapis.com/ecosense-task-proofs/1654871160109-10-Jun-20225385693221791883539.jpg	2022-06-10 14:26:00.128	
3	6	https://storage.googleapis.com/ecosense-task-proofs/1654871169078-10-Jun-20223609034858879589660.jpg	2022-06-10 14:26:09.088	
4	6	https://storage.googleapis.com/ecosense-task-proofs/1654871178486-10-Jun-20226563366231543411127.jpg	2022-06-10 14:26:18.494	
5	6	https://storage.googleapis.com/ecosense-task-proofs/1654871187661-10-Jun-20227028553893907200481.jpg	2022-06-10 14:26:27.665	
6	6	https://storage.googleapis.com/ecosense-task-proofs/1654872658934-10-Jun-2022703746056427485505.jpg	2022-06-10 14:50:58.955	
31	24	https://storage.googleapis.com/ecosense-task-proofs/1654932504893-11-Jun-20229072167364827075665.jpg	2022-06-11 07:28:24.917	
32	24	https://storage.googleapis.com/ecosense-task-proofs/1654932513950-11-Jun-20224728402748753535611.jpg	2022-06-11 07:28:33.968	
33	24	https://storage.googleapis.com/ecosense-task-proofs/1654932523504-11-Jun-20227961492020196130065.jpg	2022-06-11 07:28:43.512	
34	24	https://storage.googleapis.com/ecosense-task-proofs/1654932533065-11-Jun-20225580449603713869702.jpg	2022-06-11 07:28:53.07	
35	24	https://storage.googleapis.com/ecosense-task-proofs/1654932542409-11-Jun-20221071017072714912326.jpg	2022-06-11 07:29:02.414	
36	24	https://storage.googleapis.com/ecosense-task-proofs/1654932550769-11-Jun-20222139763920365160929.jpg	2022-06-11 07:29:10.774	
37	24	https://storage.googleapis.com/ecosense-task-proofs/1654932560279-11-Jun-20223330440587341065187.jpg	2022-06-11 07:29:20.284	
38	24	https://storage.googleapis.com/ecosense-task-proofs/1654932575098-11-Jun-20228737620455955403081.jpg	2022-06-11 07:29:35.103	
27	24	https://storage.googleapis.com/ecosense-task-proofs/1654932629131-11-Jun-20227222918408996445508.jpg	2022-06-11 07:30:29.136	
28	24	https://storage.googleapis.com/ecosense-task-proofs/1654932642179-11-Jun-20226777653785042062061.jpg	2022-06-11 07:30:42.236	
29	24	https://storage.googleapis.com/ecosense-task-proofs/1654932651165-11-Jun-20223094175005516191115.jpg	2022-06-11 07:30:51.179	
30	24		2022-06-11 07:31:00.107	
39	24	https://storage.googleapis.com/ecosense-task-proofs/1654935069242-11-Jun-20229005523175400425975.jpg	2022-06-11 08:11:09.27	
40	24	https://storage.googleapis.com/ecosense-task-proofs/1654935080700-11-Jun-20226729507095429566410.jpg	2022-06-11 08:11:20.715	
41	24	https://storage.googleapis.com/ecosense-task-proofs/1654935091624-11-Jun-2022866543937421220233.jpg	2022-06-11 08:11:31.632	
42	24	https://storage.googleapis.com/ecosense-task-proofs/1654935104405-11-Jun-20221606856090213181358.jpg	2022-06-11 08:11:44.411	
43	24	https://storage.googleapis.com/ecosense-task-proofs/1654935119553-11-Jun-20225184777999600325178.jpg	2022-06-11 08:11:59.558	
22	24	https://storage.googleapis.com/ecosense-task-proofs/1654935143831-11-Jun-20222476469650531844918.jpg	2022-06-11 08:12:23.836	
23	24	https://storage.googleapis.com/ecosense-task-proofs/1654935155328-11-Jun-20227231159269852444456.jpg	2022-06-11 08:12:35.332	
24	24	https://storage.googleapis.com/ecosense-task-proofs/1654935165918-11-Jun-20225322274114606449108.jpg	2022-06-11 08:12:45.924	
25	24	https://storage.googleapis.com/ecosense-task-proofs/1654935177138-11-Jun-20227133194502544242325.jpg	2022-06-11 08:12:57.144	
26	24	https://storage.googleapis.com/ecosense-task-proofs/1654935187172-11-Jun-2022923445830486273239.jpg	2022-06-11 08:13:07.177	
17	24	https://storage.googleapis.com/ecosense-task-proofs/1654935255238-11-Jun-20228697020518847266518.jpg	2022-06-11 08:14:15.246	
18	24	https://storage.googleapis.com/ecosense-task-proofs/1654935264019-11-Jun-20224133397850142429047.jpg	2022-06-11 08:14:24.026	
19	24	https://storage.googleapis.com/ecosense-task-proofs/1654935276805-11-Jun-20221737546520338301157.jpg	2022-06-11 08:14:36.81	
20	24	https://storage.googleapis.com/ecosense-task-proofs/1654935288145-11-Jun-20223501472711645562807.jpg	2022-06-11 08:14:48.15	
21	24	https://storage.googleapis.com/ecosense-task-proofs/1654935299828-11-Jun-20222145548472334971901.jpg	2022-06-11 08:14:59.832	
12	24	https://storage.googleapis.com/ecosense-task-proofs/1654935338064-11-Jun-20227975500511986144279.jpg	2022-06-11 08:15:38.069	
13	24	https://storage.googleapis.com/ecosense-task-proofs/1654935347420-11-Jun-20226012286113084823448.jpg	2022-06-11 08:15:47.425	
14	24	https://storage.googleapis.com/ecosense-task-proofs/1654935355986-11-Jun-20228482128833705676868.jpg	2022-06-11 08:15:55.992	
15	24	https://storage.googleapis.com/ecosense-task-proofs/1654935364963-11-Jun-20228499571513076823092.jpg	2022-06-11 08:16:04.967	
16	24	https://storage.googleapis.com/ecosense-task-proofs/1654935374261-11-Jun-20222927186697232086287.jpg	2022-06-11 08:16:14.265	
7	24	https://storage.googleapis.com/ecosense-task-proofs/1654935402344-11-Jun-20225827434015178682630.jpg	2022-06-11 08:16:42.348	
8	24	https://storage.googleapis.com/ecosense-task-proofs/1654935410703-11-Jun-20222824248276921723869.jpg	2022-06-11 08:16:50.707	
9	24	https://storage.googleapis.com/ecosense-task-proofs/1654935420799-11-Jun-20226820267758852509420.jpg	2022-06-11 08:17:00.804	
10	24	https://storage.googleapis.com/ecosense-task-proofs/1654935429412-11-Jun-20228684870604489308860.jpg	2022-06-11 08:17:09.419	
11	24	https://storage.googleapis.com/ecosense-task-proofs/1654935437606-11-Jun-20228894187226874121259.jpg	2022-06-11 08:17:17.61	
1	24	https://storage.googleapis.com/ecosense-task-proofs/1654936187940-11-Jun-20228972715957136872701.jpg	2022-06-11 08:29:47.944	
2	24	https://storage.googleapis.com/ecosense-task-proofs/1654939745091-11-Jun-20227017130174980881830.jpg	2022-06-11 09:29:05.142	
3	24	https://storage.googleapis.com/ecosense-task-proofs/1654939756254-11-Jun-20221940384323731095900.jpg	2022-06-11 09:29:16.271	
4	24	https://storage.googleapis.com/ecosense-task-proofs/1654939791361-11-Jun-20221094549008720451272.jpg	2022-06-11 09:29:51.369	
5	24	https://storage.googleapis.com/ecosense-task-proofs/1654939801757-11-Jun-20227059232213852655383.jpg	2022-06-11 09:30:01.762	
6	24	https://storage.googleapis.com/ecosense-task-proofs/1654944830594-11-Jun-20225769627921410470167.jpg	2022-06-11 10:53:50.653	
1	13	https://storage.googleapis.com/ecosense-task-proofs/1655090857034-13-Jun-20229113345839259338501.jpg	2022-06-13 03:27:37.161	thirsty boy
\.


--
-- Data for Name: histories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.histories (id, id_user, label, "timestamp", confidence_percent) FROM stdin;
1	1	Apple___Apple_scab	2022-06-06 10:42:45.012	80
2	8	Orange___Haunglongbing_(Citrus_greening)	2022-06-07 05:46:52.719	63
3	8	Orange___Haunglongbing_(Citrus_greening)	2022-06-07 05:47:05.869	55
4	8	Orange___Haunglongbing_(Citrus_greening)	2022-06-07 05:48:34.121	63
5	8	Orange___Haunglongbing_(Citrus_greening)	2022-06-07 06:05:56.413	74
6	8	Grape___Esca_(Black_Measles)	2022-06-07 06:16:46.136	41
7	8	Cherry_(including_sour)___Powdery_mildew	2022-06-07 06:21:12.911	46
8	8	Corn_(maize)___Cercospora_leaf_spot Gray_leaf_spot	2022-06-07 06:21:26.63	82
9	6	Apple___Apple_scab	2022-06-08 14:32:41.483	81
10	8	Orange___Haunglongbing_(Citrus_greening)	2022-06-09 16:19:36.008	62
11	6	Orange___Haunglongbing_(Citrus_greening)	2022-06-10 14:52:31.916	75
12	24	Tomato___Late_blight	2022-06-11 09:40:20.654	76
13	24	Tomato___Late_blight	2022-06-11 10:44:41.485	62
14	24	Tomato___Late_blight	2022-06-11 10:56:17.279	84
15	7	Tomato___Late_blight	2022-06-12 12:38:16.873	48
16	7	Tomato___Late_blight	2022-06-12 12:39:00.579	78
17	13	Tomato___Late_blight	2022-06-13 17:49:43.046	82
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
7	2	1	Pack lunches in reusable containers.	t
8	2	2	Bring your own shopping bags.	t
9	2	3	Used paper based straws or even qtips.	t
10	2	4	Choose cloth napkins instead of paper.	t
11	2	5	Books - donate to the library, used bookstore or neighborhood children. There are also a lot of fun crafts you can try with worn versions.	t
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
2	1	2	Buy eco-friendly products and avoid products made with harmful chemicals.	t
3	1	3	Adopt a road, park or beach, and pick up litter.	t
4	1	4	Plant a garden. Even a small container garden will help save on trips to the store and packaging materials.	t
5	1	5	Spend more time outside.	t
6	1	6	Pack drinks in a thermos or reusable water bottle.	t
39	6	1	Take your own cloth bags or backpack when you go grocery shopping.	t
40	6	2	Pack leftovers in reusable containers rather than a throwaway wrap.	t
41	6	3	Create a recycling container for your vehicle for bottles and cans.	t
42	6	4	Repurpose old containers for planters, craft storage or kitchen storage	t
43	6	5	Use rechargeable batteries or recycle your old batteries.	t
12	3	1	Buy locally - ‘made products when possible. Craft fairs are great places to get unique, local gifts.	t
13	3	2	Water wisely - If you must water plants, do it early in the morning before the sun causes evaporation. Collect and use rainwater for your garden.	t
14	3	3	Water your outdoor plants in the early morning or in the evening - not in the heat of the day.	t
15	3	4	Go organic. Do not use pesticides on your lawn or plants.	t
16	3	5	Teach children to be environmentally aware. Model eco-friendly practices and then explain why you do them.	t
\.


--
-- Data for Name: user_experience_points; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_experience_points (id_category, id_user, experience_point) FROM stdin;
1	2	150
1	3	125
1	4	175
1	5	325
1	8	175
1	9	150
1	10	325
2	1	250
2	2	100
2	3	125
2	4	175
2	5	50
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
1	1	100
5	24	800
3	24	300
2	24	400
1	6	1000
2	6	725
4	6	825
1	7	425
4	24	400
1	24	500
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
6	2
7	2
8	2
9	2
10	2
11	2
1	2
13	2
13	2
14	2
15	2
15	2
16	2
17	2
17	2
18	2
19	2
20	2
21	2
21	2
22	2
23	2
24	2
6	1
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, firebase_uid, name) FROM stdin;
2	borvSEcapVd8DJgbPhbzMVT4IdH2	\N
4	5V9F5yjc1weJ1VCpH0rkHtiySNx1	\N
7	0xCs4jzdYZRZWjn1ARUKTW5bFmm2	\N
8	FRQW233dR7ff3UPfxMLOfns7Ubi2	\N
9	KvZPkiuIUuV7quVmBjJafsW5bya2	\N
10	bi9ujKuDusdNKSNMGW5zbdKuwH02	\N
11	ug3wXzpvL9R4Ev9rKq51HSi2bU62	\N
1	vsAJyonioiWeUEvpzZ2jYCaCdAI3	Ken Tandrian
3	rpaEoUn1NfbDobQWY1IqhFbTsJs1	Kenrick Tandrian
13	sseRBsmzMkVQljLv2k66NtJZ9jU2	\N
14	sseRBsmzMkVQljLv2k66NtJZ9jU2	\N
15	A7jvZkiN84MNl0tUmUM7E64GKD02	\N
16	A7jvZkiN84MNl0tUmUM7E64GKD02	\N
17	2xSFaCK1OscY0Li83H7hd9fbVTo2	\N
18	2xSFaCK1OscY0Li83H7hd9fbVTo2	\N
19	MOURf6ncuOQ2gxi1ReW7gy0TbYP2	\N
20	EYVS7xmIxRUQ4PFRluyyPmGGrE22	\N
21	4Ek8JZSOnYO0Y1PEGxPorBzMVu63	\N
22	4Ek8JZSOnYO0Y1PEGxPorBzMVu63	\N
23	QkhL0Ea8W9U07O1mpDMGspulpWr2	\N
5	taHexcnivybFSNsYLUUAHdEw4z12	Mirsa Salsabila
24	ShGHMV9K44cEATXBxxjaofryVis1	\N
6	H7ROsfEsYKfQ5q9fwO5p43w97lh1	Deddy Romnan
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
-- Name: histories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.histories_id_seq', 17, true);


--
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.role_id_seq', 2, true);


--
-- Name: tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tasks_id_seq', 43, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 24, true);


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
-- Name: histories histories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.histories
    ADD CONSTRAINT histories_pkey PRIMARY KEY (id);


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
-- Name: campaigns campaigns_id_initiator_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.campaigns
    ADD CONSTRAINT campaigns_id_initiator_fkey FOREIGN KEY (id_initiator) REFERENCES public.users(id);


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
    ADD CONSTRAINT completed_tasks_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.users(id);


--
-- Name: histories histories_id_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.histories
    ADD CONSTRAINT histories_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.users(id);


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

