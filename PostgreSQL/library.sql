--
-- PostgreSQL database dump
--

-- Dumped from database version 12.10 (Ubuntu 12.10-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.10 (Ubuntu 12.10-0ubuntu0.20.04.1)

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

--
-- Name: issue_book(integer, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.issue_book(integer, integer, integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$
 declare passed boolean;
 begin
insert into issue_return_details(book_id,student_id,issuer_user_id) values($1,$2,$3);
  return passed;
  end;
  $_$;


ALTER FUNCTION public.issue_book(integer, integer, integer) OWNER TO postgres;

--
-- Name: issued_amt(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.issued_amt() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin 
if (select quantity from book where id=new.book_id)=(select issued_quantity from book where id=new.book_id) then
raise exception 'all books under this title is issued';
elsif( select count(*) from issue_return_details 
where student_id=new.student_id)= (select maxamtloan from department where 
id = (select department_id from student_class_details where 
id=(select student_class_id from student where id=new.student_id) ))then 
raise exception 'No more books can be issued to USER';
elsif((select quantity from book where id=new.book_id)>(select issued_quantity from book where id=new.book_id))then
update book set issued_quantity=(select issued_quantity from book where id=new.book_id)+1 where id=new.book_id;
end if;
return new;
end;
$$;


ALTER FUNCTION public.issued_amt() OWNER TO postgres;

--
-- Name: return_book(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.return_book(integer, integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$
 declare passed boolean;
 begin
 if not exists( select * from issue_return_details where book_id=$1 and student_id=$2 and return_date is null  )then
 raise exception 'not book issued';
 end if;
  update issue_return_details set return_date=current_date where book_id=$1 and student_id=$2 and return_date is null;
  update book set issued_quantity=(select issued_quantity from book where id=$1)-1 where id=$1;
  if((select current_date-(issuer_date) from issue_return_details where  book_id=$1 and student_id=$2  order by issuer_date desc limit 1)>7) then
  insert into fine(issue_id,student_id,amount) select id,student_id,50 from issue_return_details
  where  book_id=$1 and student_id=$2 and return_date=current_date order by issuer_date desc limit 1;
  end if;
  return passed;
  end;
  $_$;


ALTER FUNCTION public.return_book(integer, integer) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: author; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.author (
    id integer NOT NULL,
    author_name character varying(100) NOT NULL
);


ALTER TABLE public.author OWNER TO postgres;

--
-- Name: author_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.author_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.author_id_seq OWNER TO postgres;

--
-- Name: author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.author_id_seq OWNED BY public.author.id;


--
-- Name: authorization_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authorization_type (
    id integer NOT NULL,
    access_type character varying(100) NOT NULL,
    description character varying(100)
);


ALTER TABLE public.authorization_type OWNER TO postgres;

--
-- Name: authorization_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.authorization_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authorization_type_id_seq OWNER TO postgres;

--
-- Name: authorization_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.authorization_type_id_seq OWNED BY public.authorization_type.id;


--
-- Name: book; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book (
    id integer NOT NULL,
    publisher_id integer,
    title character varying(250) NOT NULL,
    volume character varying(50) DEFAULT '1'::character varying,
    quantity integer,
    issued_quantity integer,
    type_id integer
);


ALTER TABLE public.book OWNER TO postgres;

--
-- Name: book_author; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book_author (
    book_id integer NOT NULL,
    author_id integer NOT NULL
);


ALTER TABLE public.book_author OWNER TO postgres;

--
-- Name: book_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.book_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.book_id_seq OWNER TO postgres;

--
-- Name: book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.book_id_seq OWNED BY public.book.id;


--
-- Name: book_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book_type (
    id integer NOT NULL,
    type character varying(100) NOT NULL,
    subtype character varying(100)
);


ALTER TABLE public.book_type OWNER TO postgres;

--
-- Name: book_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.book_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.book_type_id_seq OWNER TO postgres;

--
-- Name: book_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.book_type_id_seq OWNED BY public.book_type.id;


--
-- Name: department; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.department (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    maxamtloan integer
);


ALTER TABLE public.department OWNER TO postgres;

--
-- Name: department_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.department_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.department_id_seq OWNER TO postgres;

--
-- Name: department_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.department_id_seq OWNED BY public.department.id;


--
-- Name: fine; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fine (
    id integer NOT NULL,
    issue_id integer NOT NULL,
    student_id integer NOT NULL,
    amount integer DEFAULT 0 NOT NULL,
    payment_status boolean DEFAULT false
);


ALTER TABLE public.fine OWNER TO postgres;

--
-- Name: fine_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fine_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fine_id_seq OWNER TO postgres;

--
-- Name: fine_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fine_id_seq OWNED BY public.fine.id;


--
-- Name: issue_return_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.issue_return_details (
    id integer NOT NULL,
    book_id integer NOT NULL,
    student_id integer NOT NULL,
    issuer_date date DEFAULT CURRENT_DATE NOT NULL,
    return_date date,
    issuer_user_id integer NOT NULL
);


ALTER TABLE public.issue_return_details OWNER TO postgres;

--
-- Name: issue_return_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.issue_return_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issue_return_details_id_seq OWNER TO postgres;

--
-- Name: issue_return_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.issue_return_details_id_seq OWNED BY public.issue_return_details.id;


--
-- Name: publisher; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.publisher (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    address character varying(250)
);


ALTER TABLE public.publisher OWNER TO postgres;

--
-- Name: publisher_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.publisher_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.publisher_id_seq OWNER TO postgres;

--
-- Name: publisher_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.publisher_id_seq OWNED BY public.publisher.id;


--
-- Name: student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student (
    id integer NOT NULL,
    student_class_id integer,
    name character varying(250) NOT NULL,
    mobile bigint
);


ALTER TABLE public.student OWNER TO postgres;

--
-- Name: student_class_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student_class_details (
    id integer NOT NULL,
    department_id integer,
    name character varying(250) NOT NULL,
    year_start integer,
    year_end integer
);


ALTER TABLE public.student_class_details OWNER TO postgres;

--
-- Name: student_class_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.student_class_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.student_class_details_id_seq OWNER TO postgres;

--
-- Name: student_class_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.student_class_details_id_seq OWNED BY public.student_class_details.id;


--
-- Name: student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.student_id_seq OWNER TO postgres;

--
-- Name: student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.student_id_seq OWNED BY public.student.id;


--
-- Name: system_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_user (
    id integer NOT NULL,
    name character varying(250) NOT NULL,
    mobile bigint,
    active_status boolean DEFAULT false NOT NULL,
    authorization_id integer
);


ALTER TABLE public.system_user OWNER TO postgres;

--
-- Name: system_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.system_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.system_user_id_seq OWNER TO postgres;

--
-- Name: system_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.system_user_id_seq OWNED BY public.system_user.id;


--
-- Name: author id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.author ALTER COLUMN id SET DEFAULT nextval('public.author_id_seq'::regclass);


--
-- Name: authorization_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authorization_type ALTER COLUMN id SET DEFAULT nextval('public.authorization_type_id_seq'::regclass);


--
-- Name: book id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book ALTER COLUMN id SET DEFAULT nextval('public.book_id_seq'::regclass);


--
-- Name: book_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_type ALTER COLUMN id SET DEFAULT nextval('public.book_type_id_seq'::regclass);


--
-- Name: department id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department ALTER COLUMN id SET DEFAULT nextval('public.department_id_seq'::regclass);


--
-- Name: fine id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fine ALTER COLUMN id SET DEFAULT nextval('public.fine_id_seq'::regclass);


--
-- Name: issue_return_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue_return_details ALTER COLUMN id SET DEFAULT nextval('public.issue_return_details_id_seq'::regclass);


--
-- Name: publisher id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publisher ALTER COLUMN id SET DEFAULT nextval('public.publisher_id_seq'::regclass);


--
-- Name: student id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student ALTER COLUMN id SET DEFAULT nextval('public.student_id_seq'::regclass);


--
-- Name: student_class_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_class_details ALTER COLUMN id SET DEFAULT nextval('public.student_class_details_id_seq'::regclass);


--
-- Name: system_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_user ALTER COLUMN id SET DEFAULT nextval('public.system_user_id_seq'::regclass);


--
-- Data for Name: author; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.author (id, author_name) FROM stdin;
1	Premchand
2	Amithabh
3	Shakespeare
4	Anna
\.


--
-- Data for Name: authorization_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authorization_type (id, access_type, description) FROM stdin;
1	admin	admin
2	issuer	issuer
3	editor	editor
\.


--
-- Data for Name: book; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.book (id, publisher_id, title, volume, quantity, issued_quantity, type_id) FROM stdin;
3	2	MartialGod	1	2	0	1
7	2	where is everything	1	2	0	2
9	2	DBA	1	2	0	2
11	2	Let us C	1	2	0	2
1	1	godan	1	2	2	1
13	2	Let us JAVA	1	2	1	2
12	2	Let us C++	1	2	1	2
10	2	DSA	1	2	1	2
4	3	How to win	1	2	0	2
2	2	sharmdan	1	2	0	1
6	2	You can do	1	2	0	2
8	2	How it works	1	2	0	2
\.


--
-- Data for Name: book_author; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.book_author (book_id, author_id) FROM stdin;
1	1
2	4
3	1
4	2
6	1
7	1
1	4
8	1
9	2
10	1
11	1
12	3
13	4
13	3
13	2
12	1
13	1
\.


--
-- Data for Name: book_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.book_type (id, type, subtype) FROM stdin;
1	classic	\N
2	novel	\N
\.


--
-- Data for Name: department; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.department (id, name, maxamtloan) FROM stdin;
1	Computer	3
2	Mechanical	3
3	Electrical	3
4	Biotech	3
\.


--
-- Data for Name: fine; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fine (id, issue_id, student_id, amount, payment_status) FROM stdin;
1	11	5	50	f
2	9	1	50	f
3	8	3	50	f
\.


--
-- Data for Name: issue_return_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.issue_return_details (id, book_id, student_id, issuer_date, return_date, issuer_user_id) FROM stdin;
14	13	5	2022-04-25	\N	2
15	12	4	2022-04-25	\N	2
16	10	2	2022-04-25	\N	2
5	1	1	2022-03-23	\N	1
6	1	2	2022-03-23	\N	1
11	4	5	2022-03-23	2022-04-25	1
9	2	1	2022-03-23	2022-04-25	1
8	2	3	2022-03-23	2022-04-25	1
12	6	6	2022-04-25	2022-04-25	2
13	8	5	2022-04-25	2022-04-25	2
\.


--
-- Data for Name: publisher; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.publisher (id, name, address) FROM stdin;
1	Delhi Publisher	India
2	Faridabad Publisher	India
3	Indian Publisher	India
\.


--
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student (id, student_class_id, name, mobile) FROM stdin;
1	2	shubham	8708481323
2	1	param	8708481223
3	1	karam	9708481223
4	3	pritam	7708481223
5	4	roham	7508481223
6	6	soham	7508481255
\.


--
-- Data for Name: student_class_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student_class_details (id, department_id, name, year_start, year_end) FROM stdin;
1	1	Btech	2018	2022
2	1	Mtech	2020	2022
3	2	Btech	2018	2022
4	3	Btech	2018	2022
5	3	Mtech	2020	2022
6	4	Mtech	2020	2022
\.


--
-- Data for Name: system_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.system_user (id, name, mobile, active_status, authorization_id) FROM stdin;
4	kim	12322356789	f	3
1	sam	123456789	t	1
2	wam	122356789	t	2
3	run	122356789	t	3
\.


--
-- Name: author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.author_id_seq', 4, true);


--
-- Name: authorization_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.authorization_type_id_seq', 3, true);


--
-- Name: book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.book_id_seq', 13, true);


--
-- Name: book_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.book_type_id_seq', 2, true);


--
-- Name: department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.department_id_seq', 4, true);


--
-- Name: fine_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fine_id_seq', 3, true);


--
-- Name: issue_return_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.issue_return_details_id_seq', 16, true);


--
-- Name: publisher_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.publisher_id_seq', 3, true);


--
-- Name: student_class_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.student_class_details_id_seq', 6, true);


--
-- Name: student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.student_id_seq', 6, true);


--
-- Name: system_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.system_user_id_seq', 4, true);


--
-- Name: author author_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.author
    ADD CONSTRAINT author_pkey PRIMARY KEY (id);


--
-- Name: authorization_type authorization_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authorization_type
    ADD CONSTRAINT authorization_type_pkey PRIMARY KEY (id);


--
-- Name: book book_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_pkey PRIMARY KEY (id);


--
-- Name: book_type book_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_type
    ADD CONSTRAINT book_type_pkey PRIMARY KEY (id);


--
-- Name: department department_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_pkey PRIMARY KEY (id);


--
-- Name: fine fine_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fine
    ADD CONSTRAINT fine_pkey PRIMARY KEY (id);


--
-- Name: issue_return_details issue_return_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue_return_details
    ADD CONSTRAINT issue_return_details_pkey PRIMARY KEY (id);


--
-- Name: publisher publisher_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publisher
    ADD CONSTRAINT publisher_pkey PRIMARY KEY (id);


--
-- Name: student_class_details student_class_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_class_details
    ADD CONSTRAINT student_class_details_pkey PRIMARY KEY (id);


--
-- Name: student student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (id);


--
-- Name: system_user system_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_user
    ADD CONSTRAINT system_user_pkey PRIMARY KEY (id);


--
-- Name: issue_return_details issue_amount; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER issue_amount BEFORE INSERT ON public.issue_return_details FOR EACH ROW EXECUTE FUNCTION public.issued_amt();


--
-- Name: book_author book_author_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_author
    ADD CONSTRAINT book_author_author_id_fkey FOREIGN KEY (author_id) REFERENCES public.author(id);


--
-- Name: book_author book_author_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_author
    ADD CONSTRAINT book_author_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.book(id);


--
-- Name: book book_publisher_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_publisher_id_fkey FOREIGN KEY (publisher_id) REFERENCES public.publisher(id);


--
-- Name: book book_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.book_type(id);


--
-- Name: fine fine_issue_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fine
    ADD CONSTRAINT fine_issue_id_fkey FOREIGN KEY (issue_id) REFERENCES public.issue_return_details(id);


--
-- Name: fine fine_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fine
    ADD CONSTRAINT fine_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student(id);


--
-- Name: issue_return_details issue_return_details_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue_return_details
    ADD CONSTRAINT issue_return_details_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.book(id);


--
-- Name: issue_return_details issue_return_details_issuer_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue_return_details
    ADD CONSTRAINT issue_return_details_issuer_user_id_fkey FOREIGN KEY (issuer_user_id) REFERENCES public.system_user(id);


--
-- Name: issue_return_details issue_return_details_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue_return_details
    ADD CONSTRAINT issue_return_details_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student(id);


--
-- Name: student_class_details student_class_details_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_class_details
    ADD CONSTRAINT student_class_details_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.department(id);


--
-- Name: student student_student_class_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_student_class_id_fkey FOREIGN KEY (student_class_id) REFERENCES public.student_class_details(id);


--
-- Name: system_user system_user_authorization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_user
    ADD CONSTRAINT system_user_authorization_id_fkey FOREIGN KEY (authorization_id) REFERENCES public.authorization_type(id);


--
-- PostgreSQL database dump complete
--

