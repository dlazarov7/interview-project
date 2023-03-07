toc.dat                                                                                             0000600 0004000 0002000 00000015657 14401730672 0014461 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP       2    2                 {            CompanyTeamsManagement    15.2    15.2                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                    0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                    0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                    1262    16399    CompanyTeamsManagement    DATABASE     �   CREATE DATABASE "CompanyTeamsManagement" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Bulgarian_Bulgaria.1252';
 (   DROP DATABASE "CompanyTeamsManagement";
                postgres    false                     2615    16400    main    SCHEMA        CREATE SCHEMA main;
    DROP SCHEMA main;
                postgres    false         �            1259    16415 	   companies    TABLE     }   CREATE TABLE main.companies (
    id integer NOT NULL,
    name character varying NOT NULL,
    country character varying
);
    DROP TABLE main.companies;
       main         heap    postgres    false    6         �            1259    16434    companies_id_seq    SEQUENCE     �   ALTER TABLE main.companies ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME main.companies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            main          postgres    false    6    217         �            1259    16401 	   employees    TABLE     t  CREATE TABLE main.employees (
    id integer NOT NULL,
    "position" integer NOT NULL,
    salary double precision,
    "starDate" date,
    "endDate" date,
    team_id integer,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    username character varying NOT NULL,
    "e-mail" character varying NOT NULL,
    manager_id integer
);
    DROP TABLE main.employees;
       main         heap    postgres    false    6         �            1259    16435    employees_id_seq    SEQUENCE     �   ALTER TABLE main.employees ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME main.employees_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            main          postgres    false    215    6         �            1259    16408    teams    TABLE     �   CREATE TABLE main.teams (
    id integer NOT NULL,
    department integer NOT NULL,
    company_id integer NOT NULL,
    name character varying NOT NULL,
    description character varying
);
    DROP TABLE main.teams;
       main         heap    postgres    false    6         �            1259    16436    teams_id_seq    SEQUENCE     �   ALTER TABLE main.teams ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME main.teams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            main          postgres    false    216    6                   0    16415 	   companies 
   TABLE DATA           4   COPY main.companies (id, name, country) FROM stdin;
    main          postgres    false    217       3339.dat 	          0    16401 	   employees 
   TABLE DATA           �   COPY main.employees (id, "position", salary, "starDate", "endDate", team_id, first_name, last_name, username, "e-mail", manager_id) FROM stdin;
    main          postgres    false    215       3337.dat 
          0    16408    teams 
   TABLE DATA           L   COPY main.teams (id, department, company_id, name, description) FROM stdin;
    main          postgres    false    216       3338.dat            0    0    companies_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('main.companies_id_seq', 40, true);
          main          postgres    false    218                    0    0    employees_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('main.employees_id_seq', 29, true);
          main          postgres    false    219                    0    0    teams_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('main.teams_id_seq', 2, true);
          main          postgres    false    220         w           2606    16421    companies companies_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY main.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY main.companies DROP CONSTRAINT companies_pkey;
       main            postgres    false    217         q           2606    16407    employees employees_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY main.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY main.employees DROP CONSTRAINT employees_pkey;
       main            postgres    false    215         u           2606    16414    teams teams_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY main.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY main.teams DROP CONSTRAINT teams_pkey;
       main            postgres    false    216         s           1259    16433    fki_company_id_ref_id_fk    INDEX     N   CREATE INDEX fki_company_id_ref_id_fk ON main.teams USING btree (company_id);
 *   DROP INDEX main.fki_company_id_ref_id_fk;
       main            postgres    false    216         r           1259    16427    fki_team_id_ref_id_fk    INDEX     L   CREATE INDEX fki_team_id_ref_id_fk ON main.employees USING btree (team_id);
 '   DROP INDEX main.fki_team_id_ref_id_fk;
       main            postgres    false    215         z           2606    16428    teams company_id_ref_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY main.teams
    ADD CONSTRAINT company_id_ref_id_fk FOREIGN KEY (company_id) REFERENCES main.companies(id) NOT VALID;
 B   ALTER TABLE ONLY main.teams DROP CONSTRAINT company_id_ref_id_fk;
       main          postgres    false    217    3191    216         x           2606    16422    employees team_id_ref_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY main.employees
    ADD CONSTRAINT team_id_ref_id_fk FOREIGN KEY (team_id) REFERENCES main.teams(id) NOT VALID;
 C   ALTER TABLE ONLY main.employees DROP CONSTRAINT team_id_ref_id_fk;
       main          postgres    false    3189    216    215         y           2606    16437 %   employees teams_menag_id_ref_teams_id    FK CONSTRAINT     �   ALTER TABLE ONLY main.employees
    ADD CONSTRAINT teams_menag_id_ref_teams_id FOREIGN KEY (manager_id) REFERENCES main.teams(id) NOT VALID;
 M   ALTER TABLE ONLY main.employees DROP CONSTRAINT teams_menag_id_ref_teams_id;
       main          postgres    false    3189    215    216                                                                                         3339.dat                                                                                            0000600 0004000 0002000 00000000224 14401730672 0014255 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        17	Malqka_mix	Bulgaria
18	Talasami OOD	Bulgaria
16	Petrovo-Air	Bulgaria
38	Nova Brazilia	Brazil
39	balcan containers	bulgaria
40	dfvsdvc	sdsdc
\.


                                                                                                                                                                                                                                                                                                                                                                            3337.dat                                                                                            0000600 0004000 0002000 00000001722 14401730672 0014257 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	2	2000	2011-09-12	\N	2	Dimitar	Lazarov	dlaza	mitaka@gmail.com	2
1	1	2500	2021-05-21	\N	1	Aleksandar	Farkov	filfil	farkov@gmail.com	1
3	4	3000	2000-12-17	\N	2	Danisval	Ivanov	podutsum	divanov4@gmaol.com	2
20	2	1234	2023-03-07	\N	1	pruch	kozelski	kozela12	kozel@abv.bg	1
21	9	23456	2023-03-07	\N	1	Vancho	Praporski	praporeco	paraspora17@abv.bg	1
22	11	2000	2023-03-07	\N	2	Biser	Andonov	biserkata2	biserkata2@gmail.com	2
11	4	4444	2023-03-07	\N	2	Postgre	SQL	dbich	db@gmail.com	2
23	4	2600	2023-03-07	\N	1	Ivan	Lipev	lipata	lipata@gmail.com	1
24	11	2200	2023-03-07	\N	1	Tomislav	Kitanov	kitarata	kitarata@gmail.com	1
25	3	3460	2020-09-27	\N	1	Dimitar	Tsavkov	tsevta	tsevta@abv.bg	\N
26	12	3000	2022-01-01	\N	2	Iveta	Razsolkova	razsolnica	razsolnica@gmail.com	\N
27	15	1250	2021-09-15	\N	1	Stanislav	Shotev	shotoveDApia	shotove@abv.bg	\N
28	13	3000	2023-02-12	\N	2	Kiril	Dambov	gambata	gambini@gmail.com	\N
29	12	3000	2022-06-06	\N	1	Ilian	Apostolov	lqkata	lqkata@abv.bg	\N
\.


                                              3338.dat                                                                                            0000600 0004000 0002000 00000000066 14401730672 0014260 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	1	16	TROIA	only top G
2	2	17	chechenci	no need
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                          restore.sql                                                                                         0000600 0004000 0002000 00000014140 14401730672 0015370 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

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

DROP DATABASE "CompanyTeamsManagement";
--
-- Name: CompanyTeamsManagement; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "CompanyTeamsManagement" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Bulgarian_Bulgaria.1252';


ALTER DATABASE "CompanyTeamsManagement" OWNER TO postgres;

\connect "CompanyTeamsManagement"

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
-- Name: main; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA main;


ALTER SCHEMA main OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: companies; Type: TABLE; Schema: main; Owner: postgres
--

CREATE TABLE main.companies (
    id integer NOT NULL,
    name character varying NOT NULL,
    country character varying
);


ALTER TABLE main.companies OWNER TO postgres;

--
-- Name: companies_id_seq; Type: SEQUENCE; Schema: main; Owner: postgres
--

ALTER TABLE main.companies ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME main.companies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: employees; Type: TABLE; Schema: main; Owner: postgres
--

CREATE TABLE main.employees (
    id integer NOT NULL,
    "position" integer NOT NULL,
    salary double precision,
    "starDate" date,
    "endDate" date,
    team_id integer,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    username character varying NOT NULL,
    "e-mail" character varying NOT NULL,
    manager_id integer
);


ALTER TABLE main.employees OWNER TO postgres;

--
-- Name: employees_id_seq; Type: SEQUENCE; Schema: main; Owner: postgres
--

ALTER TABLE main.employees ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME main.employees_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: teams; Type: TABLE; Schema: main; Owner: postgres
--

CREATE TABLE main.teams (
    id integer NOT NULL,
    department integer NOT NULL,
    company_id integer NOT NULL,
    name character varying NOT NULL,
    description character varying
);


ALTER TABLE main.teams OWNER TO postgres;

--
-- Name: teams_id_seq; Type: SEQUENCE; Schema: main; Owner: postgres
--

ALTER TABLE main.teams ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME main.teams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: companies; Type: TABLE DATA; Schema: main; Owner: postgres
--

COPY main.companies (id, name, country) FROM stdin;
\.
COPY main.companies (id, name, country) FROM '$$PATH$$/3339.dat';

--
-- Data for Name: employees; Type: TABLE DATA; Schema: main; Owner: postgres
--

COPY main.employees (id, "position", salary, "starDate", "endDate", team_id, first_name, last_name, username, "e-mail", manager_id) FROM stdin;
\.
COPY main.employees (id, "position", salary, "starDate", "endDate", team_id, first_name, last_name, username, "e-mail", manager_id) FROM '$$PATH$$/3337.dat';

--
-- Data for Name: teams; Type: TABLE DATA; Schema: main; Owner: postgres
--

COPY main.teams (id, department, company_id, name, description) FROM stdin;
\.
COPY main.teams (id, department, company_id, name, description) FROM '$$PATH$$/3338.dat';

--
-- Name: companies_id_seq; Type: SEQUENCE SET; Schema: main; Owner: postgres
--

SELECT pg_catalog.setval('main.companies_id_seq', 40, true);


--
-- Name: employees_id_seq; Type: SEQUENCE SET; Schema: main; Owner: postgres
--

SELECT pg_catalog.setval('main.employees_id_seq', 29, true);


--
-- Name: teams_id_seq; Type: SEQUENCE SET; Schema: main; Owner: postgres
--

SELECT pg_catalog.setval('main.teams_id_seq', 2, true);


--
-- Name: companies companies_pkey; Type: CONSTRAINT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);


--
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (id);


--
-- Name: fki_company_id_ref_id_fk; Type: INDEX; Schema: main; Owner: postgres
--

CREATE INDEX fki_company_id_ref_id_fk ON main.teams USING btree (company_id);


--
-- Name: fki_team_id_ref_id_fk; Type: INDEX; Schema: main; Owner: postgres
--

CREATE INDEX fki_team_id_ref_id_fk ON main.employees USING btree (team_id);


--
-- Name: teams company_id_ref_id_fk; Type: FK CONSTRAINT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.teams
    ADD CONSTRAINT company_id_ref_id_fk FOREIGN KEY (company_id) REFERENCES main.companies(id) NOT VALID;


--
-- Name: employees team_id_ref_id_fk; Type: FK CONSTRAINT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.employees
    ADD CONSTRAINT team_id_ref_id_fk FOREIGN KEY (team_id) REFERENCES main.teams(id) NOT VALID;


--
-- Name: employees teams_menag_id_ref_teams_id; Type: FK CONSTRAINT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.employees
    ADD CONSTRAINT teams_menag_id_ref_teams_id FOREIGN KEY (manager_id) REFERENCES main.teams(id) NOT VALID;


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                