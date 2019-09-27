--
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 11.5

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Ukraine.1251' LC_CTYPE = 'Russian_Ukraine.1251';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

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
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name:  discipline; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public." discipline" (
    id integer NOT NULL,
    name text NOT NULL,
    "number of tests" integer,
    "lessons per week" integer,
    teachers integer NOT NULL
);


ALTER TABLE public." discipline" OWNER TO postgres;

--
-- Name:  discipline_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public." discipline_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public." discipline_id_seq" OWNER TO postgres;

--
-- Name:  discipline_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public." discipline_id_seq" OWNED BY public." discipline".id;


--
-- Name:  discipline_teachers_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public." discipline_teachers_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public." discipline_teachers_seq" OWNER TO postgres;

--
-- Name:  discipline_teachers_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public." discipline_teachers_seq" OWNED BY public." discipline".teachers;


--
-- Name: classes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.classes (
    id integer NOT NULL,
    name text NOT NULL,
    classroom text NOT NULL,
    school integer NOT NULL
);


ALTER TABLE public.classes OWNER TO postgres;

--
-- Name: classes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.classes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.classes_id_seq OWNER TO postgres;

--
-- Name: classes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.classes_id_seq OWNED BY public.classes.id;


--
-- Name: classes_school_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.classes_school_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.classes_school_seq OWNER TO postgres;

--
-- Name: classes_school_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.classes_school_seq OWNED BY public.classes.school;


--
-- Name: school; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.school (
    name text NOT NULL,
    city text NOT NULL,
    type text NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.school OWNER TO postgres;

--
-- Name: school_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.school_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.school_id_seq OWNER TO postgres;

--
-- Name: school_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.school_id_seq OWNED BY public.school.id;


--
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students (
    id integer NOT NULL,
    full_name text NOT NULL,
    phone_number text,
    cities text NOT NULL,
    classes integer NOT NULL
);


ALTER TABLE public.students OWNER TO postgres;

--
-- Name: students_classes_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.students_classes_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.students_classes_seq OWNER TO postgres;

--
-- Name: students_classes_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.students_classes_seq OWNED BY public.students.classes;


--
-- Name: students_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.students_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.students_id_seq OWNER TO postgres;

--
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.students_id_seq OWNED BY public.students.id;


--
-- Name: teachers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teachers (
    id integer NOT NULL,
    full_name text NOT NULL,
    number text NOT NULL,
    school integer NOT NULL,
    classes integer NOT NULL
);


ALTER TABLE public.teachers OWNER TO postgres;

--
-- Name: teachers_classes_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teachers_classes_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teachers_classes_seq OWNER TO postgres;

--
-- Name: teachers_classes_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teachers_classes_seq OWNED BY public.teachers.classes;


--
-- Name: teachers_discipline; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teachers_discipline (
    id integer NOT NULL,
    teachers integer NOT NULL,
    discipline integer NOT NULL
);


ALTER TABLE public.teachers_discipline OWNER TO postgres;

--
-- Name: teachers_discipline_discipline_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teachers_discipline_discipline_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teachers_discipline_discipline_seq OWNER TO postgres;

--
-- Name: teachers_discipline_discipline_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teachers_discipline_discipline_seq OWNED BY public.teachers_discipline.discipline;


--
-- Name: teachers_discipline_teachers_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teachers_discipline_teachers_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teachers_discipline_teachers_seq OWNER TO postgres;

--
-- Name: teachers_discipline_teachers_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teachers_discipline_teachers_seq OWNED BY public.teachers_discipline.teachers;


--
-- Name: teachers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teachers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teachers_id_seq OWNER TO postgres;

--
-- Name: teachers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teachers_id_seq OWNED BY public.teachers.id;


--
-- Name: teachers_school_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teachers_school_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teachers_school_seq OWNER TO postgres;

--
-- Name: teachers_school_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teachers_school_seq OWNED BY public.teachers.school;


--
-- Name:  discipline id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public." discipline" ALTER COLUMN id SET DEFAULT nextval('public." discipline_id_seq"'::regclass);


--
-- Name:  discipline teachers; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public." discipline" ALTER COLUMN teachers SET DEFAULT nextval('public." discipline_teachers_seq"'::regclass);


--
-- Name: classes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classes ALTER COLUMN id SET DEFAULT nextval('public.classes_id_seq'::regclass);


--
-- Name: classes school; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classes ALTER COLUMN school SET DEFAULT nextval('public.classes_school_seq'::regclass);


--
-- Name: school id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.school ALTER COLUMN id SET DEFAULT nextval('public.school_id_seq'::regclass);


--
-- Name: students id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students ALTER COLUMN id SET DEFAULT nextval('public.students_id_seq'::regclass);


--
-- Name: students classes; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students ALTER COLUMN classes SET DEFAULT nextval('public.students_classes_seq'::regclass);


--
-- Name: teachers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers ALTER COLUMN id SET DEFAULT nextval('public.teachers_id_seq'::regclass);


--
-- Name: teachers school; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers ALTER COLUMN school SET DEFAULT nextval('public.teachers_school_seq'::regclass);


--
-- Name: teachers classes; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers ALTER COLUMN classes SET DEFAULT nextval('public.teachers_classes_seq'::regclass);


--
-- Name: teachers_discipline teachers; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers_discipline ALTER COLUMN teachers SET DEFAULT nextval('public.teachers_discipline_teachers_seq'::regclass);


--
-- Name: teachers_discipline discipline; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers_discipline ALTER COLUMN discipline SET DEFAULT nextval('public.teachers_discipline_discipline_seq'::regclass);


--
-- Data for Name:  discipline; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public." discipline" (id, name, "number of tests", "lessons per week", teachers) FROM stdin;
\.
COPY public." discipline" (id, name, "number of tests", "lessons per week", teachers) FROM '$$PATH$$/2902.dat';

--
-- Data for Name: classes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.classes (id, name, classroom, school) FROM stdin;
\.
COPY public.classes (id, name, classroom, school) FROM '$$PATH$$/2896.dat';

--
-- Data for Name: school; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.school (name, city, type, id) FROM stdin;
\.
COPY public.school (name, city, type, id) FROM '$$PATH$$/2894.dat';

--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students (id, full_name, phone_number, cities, classes) FROM stdin;
\.
COPY public.students (id, full_name, phone_number, cities, classes) FROM '$$PATH$$/2904.dat';

--
-- Data for Name: teachers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teachers (id, full_name, number, school, classes) FROM stdin;
\.
COPY public.teachers (id, full_name, number, school, classes) FROM '$$PATH$$/2899.dat';

--
-- Data for Name: teachers_discipline; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teachers_discipline (id, teachers, discipline) FROM stdin;
\.
COPY public.teachers_discipline (id, teachers, discipline) FROM '$$PATH$$/2908.dat';

--
-- Name:  discipline_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public." discipline_id_seq"', 1, false);


--
-- Name:  discipline_teachers_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public." discipline_teachers_seq"', 1, false);


--
-- Name: classes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.classes_id_seq', 1, false);


--
-- Name: classes_school_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.classes_school_seq', 1, false);


--
-- Name: school_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.school_id_seq', 1, false);


--
-- Name: students_classes_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.students_classes_seq', 1, false);


--
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.students_id_seq', 1, false);


--
-- Name: teachers_classes_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teachers_classes_seq', 1, false);


--
-- Name: teachers_discipline_discipline_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teachers_discipline_discipline_seq', 1, false);


--
-- Name: teachers_discipline_teachers_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teachers_discipline_teachers_seq', 1, false);


--
-- Name: teachers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teachers_id_seq', 1, false);


--
-- Name: teachers_school_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teachers_school_seq', 1, false);


--
-- Name:  discipline  discipline_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public." discipline"
    ADD CONSTRAINT " discipline_pkey" PRIMARY KEY (id);


--
-- Name: classes classes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classes
    ADD CONSTRAINT classes_pkey PRIMARY KEY (id);


--
-- Name: school school_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.school
    ADD CONSTRAINT school_pkey PRIMARY KEY (id);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- Name: teachers_discipline teachers_discipline_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers_discipline
    ADD CONSTRAINT teachers_discipline_pkey PRIMARY KEY (id);


--
-- Name: teachers teachers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_pkey PRIMARY KEY (id);


--
-- Name: fki_classes_def; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_classes_def ON public.teachers USING btree (classes);


--
-- Name: fki_classes_def1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_classes_def1 ON public.students USING btree (classes);


--
-- Name: fki_discipline_def1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_discipline_def1 ON public.teachers_discipline USING btree (discipline);


--
-- Name: fki_school_ref; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_school_ref ON public.classes USING btree (school);


--
-- Name: fki_school_ref2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_school_ref2 ON public.teachers USING btree (school);


--
-- Name: fki_teachers_def; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_teachers_def ON public." discipline" USING btree (teachers);


--
-- Name: fki_teachers_def1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_teachers_def1 ON public.teachers_discipline USING btree (teachers);


--
-- Name: teachers classes_def; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT classes_def FOREIGN KEY (classes) REFERENCES public.classes(id) NOT VALID;


--
-- Name: students classes_def1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT classes_def1 FOREIGN KEY (classes) REFERENCES public.classes(id) NOT VALID;


--
-- Name: teachers_discipline discipline_def1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers_discipline
    ADD CONSTRAINT discipline_def1 FOREIGN KEY (discipline) REFERENCES public." discipline"(id) NOT VALID;


--
-- Name: classes school_ref; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classes
    ADD CONSTRAINT school_ref FOREIGN KEY (school) REFERENCES public.school(id) NOT VALID;


--
-- Name: teachers school_ref; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT school_ref FOREIGN KEY (school) REFERENCES public.school(id) NOT VALID;


--
-- Name: teachers school_ref2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT school_ref2 FOREIGN KEY (school) REFERENCES public.school(id) NOT VALID;


--
-- Name: teachers_discipline teachers_def; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers_discipline
    ADD CONSTRAINT teachers_def FOREIGN KEY (teachers) REFERENCES public.teachers(id) NOT VALID;


--
-- Name: teachers_discipline teachers_def1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers_discipline
    ADD CONSTRAINT teachers_def1 FOREIGN KEY (teachers) REFERENCES public.teachers(id) NOT VALID;


--
-- PostgreSQL database dump complete
--

