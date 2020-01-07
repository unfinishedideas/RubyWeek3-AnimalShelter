--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: animals; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE public.animals (
    id integer NOT NULL,
    name character varying,
    breed character varying,
    type character varying,
    date_admit timestamp without time zone,
    gender character varying
);


ALTER TABLE public.animals OWNER TO "Guest";

--
-- Name: animals_customers; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE public.animals_customers (
    id integer NOT NULL,
    animal_id integer,
    customer_id integer
);


ALTER TABLE public.animals_customers OWNER TO "Guest";

--
-- Name: animals_customers_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE public.animals_customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.animals_customers_id_seq OWNER TO "Guest";

--
-- Name: animals_customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE public.animals_customers_id_seq OWNED BY public.animals_customers.id;


--
-- Name: animals_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE public.animals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.animals_id_seq OWNER TO "Guest";

--
-- Name: animals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE public.animals_id_seq OWNED BY public.animals.id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    name character varying,
    preference character varying,
    breed character varying,
    phone character varying
);


ALTER TABLE public.customers OWNER TO "Guest";

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_id_seq OWNER TO "Guest";

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- Name: animals id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.animals ALTER COLUMN id SET DEFAULT nextval('public.animals_id_seq'::regclass);


--
-- Name: animals_customers id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.animals_customers ALTER COLUMN id SET DEFAULT nextval('public.animals_customers_id_seq'::regclass);


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- Data for Name: animals; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY public.animals (id, name, breed, type, date_admit, gender) FROM stdin;
\.


--
-- Data for Name: animals_customers; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY public.animals_customers (id, animal_id, customer_id) FROM stdin;
\.


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY public.customers (id, name, preference, breed, phone) FROM stdin;
\.


--
-- Name: animals_customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('public.animals_customers_id_seq', 1, false);


--
-- Name: animals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('public.animals_id_seq', 1, false);


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('public.customers_id_seq', 1, false);


--
-- Name: animals_customers animals_customers_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.animals_customers
    ADD CONSTRAINT animals_customers_pkey PRIMARY KEY (id);


--
-- Name: animals animals_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.animals
    ADD CONSTRAINT animals_pkey PRIMARY KEY (id);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

