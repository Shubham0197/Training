--
-- PostgreSQL database dump
--

-- Dumped from database version 12.11 (Ubuntu 12.11-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.11 (Ubuntu 12.11-0ubuntu0.20.04.1)

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
-- Name: action_text_rich_texts; Type: TABLE; Schema: public; Owner: itsacheckmate
--

CREATE TABLE public.action_text_rich_texts (
    id bigint NOT NULL,
    name character varying NOT NULL,
    body text,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.action_text_rich_texts OWNER TO itsacheckmate;

--
-- Name: action_text_rich_texts_id_seq; Type: SEQUENCE; Schema: public; Owner: itsacheckmate
--

CREATE SEQUENCE public.action_text_rich_texts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.action_text_rich_texts_id_seq OWNER TO itsacheckmate;

--
-- Name: action_text_rich_texts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: itsacheckmate
--

ALTER SEQUENCE public.action_text_rich_texts_id_seq OWNED BY public.action_text_rich_texts.id;


--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: itsacheckmate
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.active_storage_attachments OWNER TO itsacheckmate;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: itsacheckmate
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_attachments_id_seq OWNER TO itsacheckmate;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: itsacheckmate
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: itsacheckmate
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    service_name character varying NOT NULL,
    byte_size bigint NOT NULL,
    checksum character varying,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.active_storage_blobs OWNER TO itsacheckmate;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: itsacheckmate
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_blobs_id_seq OWNER TO itsacheckmate;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: itsacheckmate
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: active_storage_variant_records; Type: TABLE; Schema: public; Owner: itsacheckmate
--

CREATE TABLE public.active_storage_variant_records (
    id bigint NOT NULL,
    blob_id bigint NOT NULL,
    variation_digest character varying NOT NULL
);


ALTER TABLE public.active_storage_variant_records OWNER TO itsacheckmate;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE; Schema: public; Owner: itsacheckmate
--

CREATE SEQUENCE public.active_storage_variant_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_variant_records_id_seq OWNER TO itsacheckmate;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: itsacheckmate
--

ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNED BY public.active_storage_variant_records.id;


--
-- Name: admin_users; Type: TABLE; Schema: public; Owner: itsacheckmate
--

CREATE TABLE public.admin_users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp(6) without time zone,
    remember_created_at timestamp(6) without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp(6) without time zone,
    last_sign_in_at timestamp(6) without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.admin_users OWNER TO itsacheckmate;

--
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: itsacheckmate
--

CREATE SEQUENCE public.admin_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_users_id_seq OWNER TO itsacheckmate;

--
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: itsacheckmate
--

ALTER SEQUENCE public.admin_users_id_seq OWNED BY public.admin_users.id;


--
-- Name: aircrafts; Type: TABLE; Schema: public; Owner: itsacheckmate
--

CREATE TABLE public.aircrafts (
    id bigint NOT NULL,
    name text,
    cruising_range integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    aircraft_updated_at timestamp without time zone,
    certifieds_count integer DEFAULT 0,
    place character varying DEFAULT 'Delhi'::character varying,
    availability timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.aircrafts OWNER TO itsacheckmate;

--
-- Name: aircrafts_id_seq; Type: SEQUENCE; Schema: public; Owner: itsacheckmate
--

CREATE SEQUENCE public.aircrafts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aircrafts_id_seq OWNER TO itsacheckmate;

--
-- Name: aircrafts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: itsacheckmate
--

ALTER SEQUENCE public.aircrafts_id_seq OWNED BY public.aircrafts.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: itsacheckmate
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO itsacheckmate;

--
-- Name: certifieds; Type: TABLE; Schema: public; Owner: itsacheckmate
--

CREATE TABLE public.certifieds (
    id bigint NOT NULL,
    employee_id integer,
    aircraft_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.certifieds OWNER TO itsacheckmate;

--
-- Name: certifieds_employees; Type: TABLE; Schema: public; Owner: itsacheckmate
--

CREATE TABLE public.certifieds_employees (
    certified_id bigint NOT NULL,
    employee_id bigint NOT NULL
);


ALTER TABLE public.certifieds_employees OWNER TO itsacheckmate;

--
-- Name: certifieds_id_seq; Type: SEQUENCE; Schema: public; Owner: itsacheckmate
--

CREATE SEQUENCE public.certifieds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.certifieds_id_seq OWNER TO itsacheckmate;

--
-- Name: certifieds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: itsacheckmate
--

ALTER SEQUENCE public.certifieds_id_seq OWNED BY public.certifieds.id;


--
-- Name: cities; Type: TABLE; Schema: public; Owner: itsacheckmate
--

CREATE TABLE public.cities (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.cities OWNER TO itsacheckmate;

--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: itsacheckmate
--

CREATE SEQUENCE public.cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cities_id_seq OWNER TO itsacheckmate;

--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: itsacheckmate
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- Name: countries; Type: TABLE; Schema: public; Owner: itsacheckmate
--

CREATE TABLE public.countries (
    id bigint NOT NULL,
    name character varying
);


ALTER TABLE public.countries OWNER TO itsacheckmate;

--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: itsacheckmate
--

CREATE SEQUENCE public.countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.countries_id_seq OWNER TO itsacheckmate;

--
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: itsacheckmate
--

ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id;


--
-- Name: employees; Type: TABLE; Schema: public; Owner: itsacheckmate
--

CREATE TABLE public.employees (
    id bigint NOT NULL,
    name character varying NOT NULL,
    salary integer,
    mobile_number character varying(12),
    "DOB" date DEFAULT '1997-01-01'::date,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    count_of_pilots integer,
    trainer_id bigint,
    email character varying,
    account_type character varying,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp(6) without time zone,
    remember_created_at timestamp(6) without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp(6) without time zone,
    last_sign_in_at timestamp(6) without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    confirmation_token character varying,
    confirmed_at timestamp(6) without time zone,
    confirmation_sent_at timestamp(6) without time zone,
    unconfirmed_email character varying,
    place character varying DEFAULT 'Delhi'::character varying,
    availability timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.employees OWNER TO itsacheckmate;

--
-- Name: employees_id_seq; Type: SEQUENCE; Schema: public; Owner: itsacheckmate
--

CREATE SEQUENCE public.employees_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employees_id_seq OWNER TO itsacheckmate;

--
-- Name: employees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: itsacheckmate
--

ALTER SEQUENCE public.employees_id_seq OWNED BY public.employees.id;


--
-- Name: flights; Type: TABLE; Schema: public; Owner: itsacheckmate
--

CREATE TABLE public.flights (
    id bigint NOT NULL,
    "from" text,
    destination text,
    distance integer,
    price integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    departs timestamp(6) without time zone,
    arrives timestamp(6) without time zone,
    status integer DEFAULT 0
);


ALTER TABLE public.flights OWNER TO itsacheckmate;

--
-- Name: flights_aircrafts; Type: TABLE; Schema: public; Owner: itsacheckmate
--

CREATE TABLE public.flights_aircrafts (
    id bigint NOT NULL,
    flight_id bigint,
    aircraft_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.flights_aircrafts OWNER TO itsacheckmate;

--
-- Name: flights_aircrafts_id_seq; Type: SEQUENCE; Schema: public; Owner: itsacheckmate
--

CREATE SEQUENCE public.flights_aircrafts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.flights_aircrafts_id_seq OWNER TO itsacheckmate;

--
-- Name: flights_aircrafts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: itsacheckmate
--

ALTER SEQUENCE public.flights_aircrafts_id_seq OWNED BY public.flights_aircrafts.id;


--
-- Name: flights_id_seq; Type: SEQUENCE; Schema: public; Owner: itsacheckmate
--

CREATE SEQUENCE public.flights_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.flights_id_seq OWNER TO itsacheckmate;

--
-- Name: flights_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: itsacheckmate
--

ALTER SEQUENCE public.flights_id_seq OWNED BY public.flights.id;


--
-- Name: schedules; Type: TABLE; Schema: public; Owner: itsacheckmate
--

CREATE TABLE public.schedules (
    id bigint NOT NULL,
    flight_id bigint,
    aircraft_id bigint,
    employee_id bigint,
    status character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.schedules OWNER TO itsacheckmate;

--
-- Name: schedules_id_seq; Type: SEQUENCE; Schema: public; Owner: itsacheckmate
--

CREATE SEQUENCE public.schedules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.schedules_id_seq OWNER TO itsacheckmate;

--
-- Name: schedules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: itsacheckmate
--

ALTER SEQUENCE public.schedules_id_seq OWNED BY public.schedules.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: itsacheckmate
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO itsacheckmate;

--
-- Name: action_text_rich_texts id; Type: DEFAULT; Schema: public; Owner: itsacheckmate
--

ALTER TABLE ONLY public.action_text_rich_texts ALTER COLUMN id SET DEFAULT nextval('public.action_text_rich_texts_id_seq'::regclass);


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: itsacheckmate
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: itsacheckmate
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: active_storage_variant_records id; Type: DEFAULT; Schema: public; Owner: itsacheckmate
--

ALTER TABLE ONLY public.active_storage_variant_records ALTER COLUMN id SET DEFAULT nextval('public.active_storage_variant_records_id_seq'::regclass);


--
-- Name: admin_users id; Type: DEFAULT; Schema: public; Owner: itsacheckmate
--

ALTER TABLE ONLY public.admin_users ALTER COLUMN id SET DEFAULT nextval('public.admin_users_id_seq'::regclass);


--
-- Name: aircrafts id; Type: DEFAULT; Schema: public; Owner: itsacheckmate
--

ALTER TABLE ONLY public.aircrafts ALTER COLUMN id SET DEFAULT nextval('public.aircrafts_id_seq'::regclass);


--
-- Name: certifieds id; Type: DEFAULT; Schema: public; Owner: itsacheckmate
--

ALTER TABLE ONLY public.certifieds ALTER COLUMN id SET DEFAULT nextval('public.certifieds_id_seq'::regclass);


--
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: itsacheckmate
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- Name: countries id; Type: DEFAULT; Schema: public; Owner: itsacheckmate
--

ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);


--
-- Name: employees id; Type: DEFAULT; Schema: public; Owner: itsacheckmate
--

ALTER TABLE ONLY public.employees ALTER COLUMN id SET DEFAULT nextval('public.employees_id_seq'::regclass);


--
-- Name: flights id; Type: DEFAULT; Schema: public; Owner: itsacheckmate
--

ALTER TABLE ONLY public.flights ALTER COLUMN id SET DEFAULT nextval('public.flights_id_seq'::regclass);


--
-- Name: flights_aircrafts id; Type: DEFAULT; Schema: public; Owner: itsacheckmate
--

ALTER TABLE ONLY public.flights_aircrafts ALTER COLUMN id SET DEFAULT nextval('public.flights_aircrafts_id_seq'::regclass);


--
-- Name: schedules id; Type: DEFAULT; Schema: public; Owner: itsacheckmate
--

ALTER TABLE ONLY public.schedules ALTER COLUMN id SET DEFAULT nextval('public.schedules_id_seq'::regclass);


--
-- Data for Name: action_text_rich_texts; Type: TABLE DATA; Schema: public; Owner: itsacheckmate
--

COPY public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at) FROM stdin;
2	content		Employee	24	2022-08-01 01:40:24.10928	2022-08-01 01:40:24.10928
\.


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: itsacheckmate
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
3	image	Employee	2	5	2022-07-27 09:29:46.628985
4	image	Employee	4	6	2022-07-27 09:30:56.986066
5	image	Employee	3	7	2022-07-28 07:41:42.78561
\.


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: itsacheckmate
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) FROM stdin;
3	rspsohaw8nrmdquukmrjgjcqj8lc	Screenshot from 2022-05-04 14-09-29.png	image/png	\N	local	1047317	eupzmxGczqmUIPORw8Fv+Q==	2022-06-29 07:45:41.754814
4	mopt2puw302z16emkmw5j4kh2l8b	Screenshot from 2022-04-18 21-39-23.png	image/png	\N	local	3370265	8J49HlYRvG9/WbHzO1wz2Q==	2022-06-29 07:46:02.280702
5	q40lqes962nux5iqxr8poe9hmg3f	photo.png	image/png	{"identified":true,"analyzed":true}	local	2146	CV+KcwdhNL7BlrlT/a0GzA==	2022-07-27 09:29:46.627243
6	mai1lrn5nds4wsc2nvtav7s9jjld	photo.png	image/png	{"identified":true,"analyzed":true}	local	2146	CV+KcwdhNL7BlrlT/a0GzA==	2022-07-27 09:30:56.984681
7	bv582i9fiq6hgr87gthx1hc8q0w7	photo.png	image/png	{"identified":true,"analyzed":true}	local	2146	CV+KcwdhNL7BlrlT/a0GzA==	2022-07-28 07:41:42.783934
\.


--
-- Data for Name: active_storage_variant_records; Type: TABLE DATA; Schema: public; Owner: itsacheckmate
--

COPY public.active_storage_variant_records (id, blob_id, variation_digest) FROM stdin;
\.


--
-- Data for Name: admin_users; Type: TABLE DATA; Schema: public; Owner: itsacheckmate
--

COPY public.admin_users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at) FROM stdin;
1	s@gmail.com	$2a$12$UlK9B4AOXM2UuX/hmZsEduQ0kG.17PvpFTeNrGwIGULjbkKi1RgiC	\N	\N	2022-06-28 15:26:33.722552	2	2022-06-28 15:26:33.727281	2022-06-28 15:21:33.099903	127.0.0.1	127.0.0.1	2022-06-28 15:21:33.096655	2022-06-28 15:26:33.727377
\.


--
-- Data for Name: aircrafts; Type: TABLE DATA; Schema: public; Owner: itsacheckmate
--

COPY public.aircrafts (id, name, cruising_range, created_at, updated_at, aircraft_updated_at, certifieds_count, place, availability) FROM stdin;
3	Airbus20	1234566	2022-05-23 19:45:56.466482	2022-07-29 13:00:44.155286	\N	3	DELHI	2022-07-31 05:53:16.260032
7	Airbus30	1234566	2022-05-23 19:45:56.466482	2022-07-29 13:01:36.008484	\N	3	DELHI	2022-07-31 05:53:16.260032
5	Airbus10	12	2022-05-23 19:45:56.466482	2022-07-29 13:01:53.657511	\N	2	DELHI	2022-07-31 05:53:16.260032
2	Airbus	1234566	2022-05-23 19:45:56.466482	2022-07-31 18:55:01.251819	\N	3	DELHI	2022-07-31 18:55:01.251355
6	Airbus320	1234566	2022-05-23 19:45:56.466482	2022-07-31 19:14:48.998358	\N	2	MUMBAI	2022-07-31 22:12:00
1	Airbus60	1234566	2022-05-23 19:45:56.466482	2022-08-01 14:20:44.250729	\N	1	PUNE	2022-08-01 17:19:00
29	Boeing777	242434	2022-08-01 18:12:55.8648	2022-08-02 19:27:24.378772	\N	0	Delhi	2022-08-02 19:27:24.374755
36	Boeing730	242434	2022-08-02 19:48:36.934103	2022-08-02 19:48:36.934103	\N	0	Delhi	2022-08-02 19:48:36.934372
4	Airbus620	1234566	2022-05-23 19:45:56.466482	2022-08-02 19:57:39.750648	\N	2	MUMBAI	2022-08-02 21:37:00
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: itsacheckmate
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2022-05-23 13:40:06.919012	2022-05-23 13:40:06.919012
\.


--
-- Data for Name: certifieds; Type: TABLE DATA; Schema: public; Owner: itsacheckmate
--

COPY public.certifieds (id, employee_id, aircraft_id, created_at, updated_at) FROM stdin;
5	7	5	2022-05-23 19:53:00.27089	2022-05-23 19:53:00.27089
8	2	2	2022-05-23 19:53:00.27089	2022-05-23 19:53:00.27089
9	4	3	2022-05-23 19:53:00.27089	2022-05-23 19:53:00.27089
10	6	4	2022-05-23 19:53:00.27089	2022-05-23 19:53:00.27089
11	3	4	2022-05-23 19:53:00.27089	2022-05-23 19:53:00.27089
13	6	7	2022-05-23 19:53:00.27089	2022-05-23 19:53:00.27089
14	3	5	2022-05-23 19:53:00.27089	2022-05-23 19:53:00.27089
17	4	2	2022-05-31 09:35:13.397631	2022-05-31 09:35:13.397631
2	4	1	2022-05-23 19:53:00.27089	2022-06-06 13:40:48.889935
7	5	6	2022-05-23 19:53:00.27089	2022-08-02 13:50:50.739598
4	5	3	2022-05-23 19:53:00.27089	2022-08-02 13:50:50.742409
12	5	7	2022-05-23 19:53:00.27089	2022-08-02 13:50:50.744257
23	5	29	2022-08-02 23:54:38.713759	2022-08-02 23:54:38.713759
24	1	36	2022-08-02 23:54:48.695394	2022-08-02 23:55:15.278609
25	9	3	2022-08-03 00:04:05.578294	2022-08-03 00:04:05.578294
\.


--
-- Data for Name: certifieds_employees; Type: TABLE DATA; Schema: public; Owner: itsacheckmate
--

COPY public.certifieds_employees (certified_id, employee_id) FROM stdin;
\.


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: itsacheckmate
--

COPY public.cities (id, name, created_at, updated_at) FROM stdin;
1	DELHI	2022-07-28 18:35:06.66276	2022-07-28 18:35:06.66276
2	MUMBAI	2022-07-28 18:41:16.801293	2022-07-28 18:41:16.801293
3	PUNE	2022-07-28 18:43:25.621968	2022-07-28 18:43:25.621968
4	BANGLORE	2022-07-28 18:43:40.909712	2022-07-28 18:43:40.909712
5	INDORE	2022-07-28 18:44:07.344113	2022-07-28 18:44:07.344113
6	CHANDIGARH	2022-07-28 18:44:49.472151	2022-07-28 18:44:49.472151
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: itsacheckmate
--

COPY public.countries (id, name) FROM stdin;
\.


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: itsacheckmate
--

COPY public.employees (id, name, salary, mobile_number, "DOB", created_at, updated_at, count_of_pilots, trainer_id, email, account_type, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email, place, availability) FROM stdin;
4	Amar	45000	123456789	2000-12-12	2022-05-23 19:47:10.970648	2022-08-01 14:20:44.24854	3	\N	amar@gmail.com	\N		\N	\N	\N	0	\N	\N	\N	\N	\N	2022-07-28 18:34:01.441193	\N	\N	PUNE	2022-08-01 17:19:00
25	sam12	\N	\N	1997-01-01	2022-07-28 12:56:04.366041	2022-08-02 19:26:47.868983	\N	\N	sam12@gmail.com	\N	$2a$12$7re05QxmdO0BD7p5MemXqOiX.9ZFl81j2o/TthnUswTqyPPuGoKye	\N	\N	\N	0	\N	\N	\N	\N	sLnLjQhvK6gQ7FX7UVnv	2022-07-28 18:34:01.441193	2022-07-28 12:56:04.366134	\N	DELHI	2022-08-02 19:26:47.851863
26	sam123	\N	\N	1997-01-01	2022-07-28 12:57:39.807676	2022-08-02 19:26:47.870397	\N	\N	sam123@gmail.com	\N	$2a$12$W4ZkQOYfx4Y8CMYK/DB85OPpsE7ApbocfCN/7iv/xTkBSLtOqifRO	\N	\N	\N	0	\N	\N	\N	\N	hsNyLqshujCLsEhfVkrX	2022-07-28 18:34:01.441193	2022-07-28 12:57:39.807738	\N	DELHI	2022-08-02 19:26:47.851863
27	sam1234	\N	\N	1997-01-01	2022-07-28 12:58:47.466932	2022-08-02 19:26:47.871795	\N	\N	sam1234@gmail.com	\N	$2a$12$DexCRxLNodiLwazC4xJV5uCA0tStxdj.3KgDa.DFfyKdjSEacjeg6	\N	\N	\N	0	\N	\N	\N	\N	9nfp3dfxpNsUCggP27M_	2022-07-28 18:34:01.441193	2022-07-28 12:58:47.467012	\N	DELHI	2022-08-02 19:26:47.851863
6	Sam	75000	123456789	2000-12-12	2022-05-23 19:47:10.970648	2022-08-02 19:57:39.748345	2	\N	sam@gmail.com	\N		\N	\N	\N	0	\N	\N	\N	\N	\N	2022-07-28 18:34:01.441193	\N	\N	MUMBAI	2022-08-02 21:37:00
1	Ajay	30000	123456789	2000-12-12	2022-05-23 19:47:10.970648	2022-08-02 19:26:47.867229	5	\N	ajay@gmail.com	\N		\N	\N	\N	0	\N	\N	\N	\N	\N	2022-07-28 18:34:01.441193	\N	\N	DELHI	2022-08-02 19:26:47.851863
5	Pritam	\N	\N	1997-01-01	2022-08-02 13:46:51.377956	2022-08-02 19:26:47.864508	4	\N	pritam@gmail.com	PILOT	$2a$12$vGMl1hxTcRiOhpdWVWAttuSUNGJSM3jk20wBOKohlIQT/5mOklJp.	\N	\N	\N	1	2022-08-02 14:18:05.42242	2022-08-02 14:18:05.42242	127.0.0.1	127.0.0.1	AZBJfmXybFVGLCoh9kwY	2022-08-02 13:46:55.113921	2022-08-02 13:46:51.37805	\N	Delhi	2022-08-02 19:26:47.851863
9	naman	123345	123456789	2000-12-12	2022-05-23 19:47:10.970648	2022-08-02 19:26:47.862743	1	\N	naman@gmail.com	\N		\N	\N	\N	0	\N	\N	\N	\N	\N	2022-07-28 18:34:01.441193	\N	\N	DELHI	2022-08-02 19:26:47.851863
2	Ajith	85000	123456789	2000-12-12	2022-05-23 19:47:10.970648	2022-07-31 06:16:27.160113	1	\N	ajith@gmail.com	\N		\N	\N	\N	0	\N	\N	\N	\N	\N	2022-07-28 18:34:01.441193	\N	\N	DELHI	2022-07-31 06:16:27.159753
8	shubham	120000	123456789	2000-12-12	2022-05-23 19:47:10.970648	2022-08-03 13:27:56.713948	0	\N	shubham@gmail.com	ADMIN	$2a$12$r4gH6YZDFz5fpuiFyT18g.n19JaU2MDCnSehwbxtE6jhzZ9rAHzkm	789830352d66c7ccb96b4ad8024a9a95b8c6b798d1072c611e8eca14e7e6fa3a	2022-08-01 14:14:09.550141	\N	20	2022-08-03 13:27:56.713575	2022-08-02 19:07:34.341834	127.0.0.1	127.0.0.1	\N	2022-07-28 18:34:01.441193	\N	\N	DELHI	2022-08-02 19:26:47.851863
7	Ram	150000	123456789	2000-12-12	2022-05-23 19:47:10.970648	2022-07-31 06:16:27.15832	1	\N	ram@gmail.com	\N		\N	\N	\N	0	\N	\N	\N	\N	\N	2022-07-28 18:34:01.441193	\N	\N	DELHI	2022-07-31 06:16:27.157871
3	Arnab	50000	123456789	2000-12-12	2022-05-23 19:47:10.970648	2022-07-31 06:16:27.143637	2	\N	arnab@gmail.com	\N		\N	\N	\N	0	\N	\N	\N	\N	\N	2022-07-28 18:34:01.441193	\N	\N	DELHI	2022-07-31 06:16:27.139918
24	sandy	\N	\N	1997-01-01	2022-07-28 12:32:33.517093	2022-08-02 19:26:47.854179	\N	\N	sandy@gmail.com	PILOT	$2a$12$BOPiPWMEXWUKjH319UXSluEiJvS6T0rfP99ZZBUCVXhcF4sAs0fcy	\N	\N	\N	3	2022-08-01 13:46:15.671999	2022-08-01 01:50:32.747268	127.0.0.1	127.0.0.1	ETgdYH2iNAts--dYzcdE	2022-07-28 18:34:01	2022-07-28 12:32:33	\N	DELHI	2022-08-02 19:26:47.851863
\.


--
-- Data for Name: flights; Type: TABLE DATA; Schema: public; Owner: itsacheckmate
--

COPY public.flights (id, "from", destination, distance, price, created_at, updated_at, departs, arrives, status) FROM stdin;
29	DELHI	PUNE	1224	2999	2022-07-31 19:13:38.036495	2022-07-31 19:13:38.036495	2022-07-31 23:13:00	2022-07-31 23:59:00	0
30	PUNE	BANGLORE	2342	1999	2022-07-31 19:14:10.549777	2022-07-31 19:14:10.549777	2022-08-01 00:06:00	2022-08-01 01:14:00	0
28	DELHI	MUMBAI	1234	1999	2022-07-31 19:13:04.403996	2022-07-31 19:14:48.983985	2022-07-31 21:12:00	2022-07-31 22:12:00	1
31	DELHI	CHANDIGARH	500	1909	2022-08-01 14:05:41.262935	2022-08-01 14:13:40.017255	2022-08-01 16:05:00	2022-08-01 17:05:00	1
32	DELHI	PUNE	1600	1234	2022-08-01 14:19:43.737327	2022-08-01 14:20:44.246123	2022-08-01 16:19:00	2022-08-01 17:19:00	1
33	DELHI	MUMBAI	1234	1234	2022-08-02 18:37:07.152293	2022-08-02 19:57:39.746032	2022-08-02 20:36:00	2022-08-02 21:37:00	1
34	DELHI	BANGLORE	12345	3999	2022-08-03 13:28:43.905179	2022-08-03 13:28:43.905179	2022-08-03 15:28:00	2022-08-03 17:28:00	0
\.


--
-- Data for Name: flights_aircrafts; Type: TABLE DATA; Schema: public; Owner: itsacheckmate
--

COPY public.flights_aircrafts (id, flight_id, aircraft_id, created_at, updated_at) FROM stdin;
1	\N	\N	2022-06-21 16:41:56.690235	2022-06-21 16:41:56.690235
2	\N	\N	2022-06-21 16:42:28.899002	2022-06-21 16:42:28.899002
3	\N	\N	2022-06-21 16:42:54.795701	2022-06-21 16:42:54.795701
4	\N	\N	2022-06-21 16:43:39.661282	2022-06-21 16:43:39.661282
5	\N	\N	2022-06-22 06:52:07.387728	2022-06-22 06:52:07.387728
\.


--
-- Data for Name: schedules; Type: TABLE DATA; Schema: public; Owner: itsacheckmate
--

COPY public.schedules (id, flight_id, aircraft_id, employee_id, status, created_at, updated_at) FROM stdin;
3	28	6	5	Scheduled	2022-07-31 19:14:49.010857	2022-07-31 19:14:49.010857
5	32	1	4	Scheduled	2022-08-01 14:20:44.256186	2022-08-01 14:20:44.256186
6	33	4	6	Scheduled	2022-08-02 19:57:39.738422	2022-08-02 19:57:39.738422
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: itsacheckmate
--

COPY public.schema_migrations (version) FROM stdin;
20220523133352
20220523134047
20220523134301
20220523134535
20220523134937
20220523135619
20220523135928
20220523155125
20220523163829
20220523164336
20220523170125
20220523183505
20220524110325
20220524110434
20220524152406
20220524175923
20220525115733
20220606082556
20220606133353
20220607095548
20220608082045
20220614114130
20220627122349
20220627162557
20220628150848
20220727185040
20220727185041
20220727185042
20220728072827
20220728073251
20220728080157
20220728081243
20220728125217
20220728164523
20220728183055
20220729141041
20220731121922
20220802134332
\.


--
-- Name: action_text_rich_texts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: itsacheckmate
--

SELECT pg_catalog.setval('public.action_text_rich_texts_id_seq', 3, true);


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: itsacheckmate
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 5, true);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: itsacheckmate
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 7, true);


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: itsacheckmate
--

SELECT pg_catalog.setval('public.active_storage_variant_records_id_seq', 1, false);


--
-- Name: admin_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: itsacheckmate
--

SELECT pg_catalog.setval('public.admin_users_id_seq', 1, true);


--
-- Name: aircrafts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: itsacheckmate
--

SELECT pg_catalog.setval('public.aircrafts_id_seq', 36, true);


--
-- Name: certifieds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: itsacheckmate
--

SELECT pg_catalog.setval('public.certifieds_id_seq', 25, true);


--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: itsacheckmate
--

SELECT pg_catalog.setval('public.cities_id_seq', 8, true);


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: itsacheckmate
--

SELECT pg_catalog.setval('public.countries_id_seq', 1, false);


--
-- Name: employees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: itsacheckmate
--

SELECT pg_catalog.setval('public.employees_id_seq', 27, true);


--
-- Name: flights_aircrafts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: itsacheckmate
--

SELECT pg_catalog.setval('public.flights_aircrafts_id_seq', 5, true);


--
-- Name: flights_id_seq; Type: SEQUENCE SET; Schema: public; Owner: itsacheckmate
--

SELECT pg_catalog.setval('public.flights_id_seq', 34, true);


--
-- Name: schedules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: itsacheckmate
--

SELECT pg_catalog.setval('public.schedules_id_seq', 6, true);


--
-- Name: action_text_rich_texts action_text_rich_texts_pkey; Type: CONSTRAINT; Schema: public; Owner: itsacheckmate
--

ALTER TABLE ONLY public.action_text_rich_texts
    ADD CONSTRAINT action_text_rich_texts_pkey PRIMARY KEY (id);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: itsacheckmate
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: itsacheckmate
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: active_storage_variant_records active_storage_variant_records_pkey; Type: CONSTRAINT; Schema: public; Owner: itsacheckmate
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT active_storage_variant_records_pkey PRIMARY KEY (id);


--
-- Name: admin_users admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: itsacheckmate
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- Name: aircrafts aircrafts_pkey; Type: CONSTRAINT; Schema: public; Owner: itsacheckmate
--

ALTER TABLE ONLY public.aircrafts
    ADD CONSTRAINT aircrafts_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: itsacheckmate
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: certifieds certifieds_pkey; Type: CONSTRAINT; Schema: public; Owner: itsacheckmate
--

ALTER TABLE ONLY public.certifieds
    ADD CONSTRAINT certifieds_pkey PRIMARY KEY (id);


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: itsacheckmate
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: itsacheckmate
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: itsacheckmate
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);


--
-- Name: flights_aircrafts flights_aircrafts_pkey; Type: CONSTRAINT; Schema: public; Owner: itsacheckmate
--

ALTER TABLE ONLY public.flights_aircrafts
    ADD CONSTRAINT flights_aircrafts_pkey PRIMARY KEY (id);


--
-- Name: flights flights_pkey; Type: CONSTRAINT; Schema: public; Owner: itsacheckmate
--

ALTER TABLE ONLY public.flights
    ADD CONSTRAINT flights_pkey PRIMARY KEY (id);


--
-- Name: schedules schedules_pkey; Type: CONSTRAINT; Schema: public; Owner: itsacheckmate
--

ALTER TABLE ONLY public.schedules
    ADD CONSTRAINT schedules_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: itsacheckmate
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: index_action_text_rich_texts_uniqueness; Type: INDEX; Schema: public; Owner: itsacheckmate
--

CREATE UNIQUE INDEX index_action_text_rich_texts_uniqueness ON public.action_text_rich_texts USING btree (record_type, record_id, name);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: itsacheckmate
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: itsacheckmate
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: itsacheckmate
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_active_storage_variant_records_uniqueness; Type: INDEX; Schema: public; Owner: itsacheckmate
--

CREATE UNIQUE INDEX index_active_storage_variant_records_uniqueness ON public.active_storage_variant_records USING btree (blob_id, variation_digest);


--
-- Name: index_admin_users_on_email; Type: INDEX; Schema: public; Owner: itsacheckmate
--

CREATE UNIQUE INDEX index_admin_users_on_email ON public.admin_users USING btree (email);


--
-- Name: index_admin_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: itsacheckmate
--

CREATE UNIQUE INDEX index_admin_users_on_reset_password_token ON public.admin_users USING btree (reset_password_token);


--
-- Name: index_certifieds_employees_on_certified_id_and_employee_id; Type: INDEX; Schema: public; Owner: itsacheckmate
--

CREATE INDEX index_certifieds_employees_on_certified_id_and_employee_id ON public.certifieds_employees USING btree (certified_id, employee_id);


--
-- Name: index_employees_on_email; Type: INDEX; Schema: public; Owner: itsacheckmate
--

CREATE UNIQUE INDEX index_employees_on_email ON public.employees USING btree (email);


--
-- Name: index_employees_on_name; Type: INDEX; Schema: public; Owner: itsacheckmate
--

CREATE INDEX index_employees_on_name ON public.employees USING btree (name);


--
-- Name: index_employees_on_reset_password_token; Type: INDEX; Schema: public; Owner: itsacheckmate
--

CREATE UNIQUE INDEX index_employees_on_reset_password_token ON public.employees USING btree (reset_password_token);


--
-- Name: index_employees_on_trainer_id; Type: INDEX; Schema: public; Owner: itsacheckmate
--

CREATE INDEX index_employees_on_trainer_id ON public.employees USING btree (trainer_id);


--
-- Name: index_flights_aircrafts_on_aircraft_id; Type: INDEX; Schema: public; Owner: itsacheckmate
--

CREATE INDEX index_flights_aircrafts_on_aircraft_id ON public.flights_aircrafts USING btree (aircraft_id);


--
-- Name: index_flights_aircrafts_on_flight_id; Type: INDEX; Schema: public; Owner: itsacheckmate
--

CREATE INDEX index_flights_aircrafts_on_flight_id ON public.flights_aircrafts USING btree (flight_id);


--
-- Name: index_schedules_on_aircraft_id; Type: INDEX; Schema: public; Owner: itsacheckmate
--

CREATE INDEX index_schedules_on_aircraft_id ON public.schedules USING btree (aircraft_id);


--
-- Name: index_schedules_on_employee_id; Type: INDEX; Schema: public; Owner: itsacheckmate
--

CREATE INDEX index_schedules_on_employee_id ON public.schedules USING btree (employee_id);


--
-- Name: index_schedules_on_flight_id; Type: INDEX; Schema: public; Owner: itsacheckmate
--

CREATE INDEX index_schedules_on_flight_id ON public.schedules USING btree (flight_id);


--
-- Name: certifieds fk_rails_7066a38612; Type: FK CONSTRAINT; Schema: public; Owner: itsacheckmate
--

ALTER TABLE ONLY public.certifieds
    ADD CONSTRAINT fk_rails_7066a38612 FOREIGN KEY (employee_id) REFERENCES public.employees(id);


--
-- Name: active_storage_variant_records fk_rails_993965df05; Type: FK CONSTRAINT; Schema: public; Owner: itsacheckmate
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT fk_rails_993965df05 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: itsacheckmate
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: certifieds fk_rails_ca7a8974c1; Type: FK CONSTRAINT; Schema: public; Owner: itsacheckmate
--

ALTER TABLE ONLY public.certifieds
    ADD CONSTRAINT fk_rails_ca7a8974c1 FOREIGN KEY (aircraft_id) REFERENCES public.aircrafts(id);


--
-- Name: employees fk_rails_e7dc927d02; Type: FK CONSTRAINT; Schema: public; Owner: itsacheckmate
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT fk_rails_e7dc927d02 FOREIGN KEY (trainer_id) REFERENCES public.employees(id);


--
-- PostgreSQL database dump complete
--

