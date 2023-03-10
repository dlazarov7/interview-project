PGDMP     !                     {            CompanyTeamsManagement    15.2    15.2                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16399    CompanyTeamsManagement    DATABASE     ?   CREATE DATABASE "CompanyTeamsManagement" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Bulgarian_Bulgaria.1252';
 (   DROP DATABASE "CompanyTeamsManagement";
                postgres    false                        2615    16400    main    SCHEMA        CREATE SCHEMA main;
    DROP SCHEMA main;
                postgres    false            ?            1259    16415 	   companies    TABLE     }   CREATE TABLE main.companies (
    id integer NOT NULL,
    name character varying NOT NULL,
    country character varying
);
    DROP TABLE main.companies;
       main         heap    postgres    false    6            ?            1259    16434    companies_id_seq    SEQUENCE     ?   ALTER TABLE main.companies ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME main.companies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            main          postgres    false    6    217            ?            1259    16401 	   employees    TABLE     t  CREATE TABLE main.employees (
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
       main         heap    postgres    false    6            ?            1259    16435    employees_id_seq    SEQUENCE     ?   ALTER TABLE main.employees ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME main.employees_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            main          postgres    false    215    6            ?            1259    16408    teams    TABLE     ?   CREATE TABLE main.teams (
    id integer NOT NULL,
    department integer NOT NULL,
    company_id integer NOT NULL,
    name character varying NOT NULL,
    description character varying
);
    DROP TABLE main.teams;
       main         heap    postgres    false    6            ?            1259    16436    teams_id_seq    SEQUENCE     ?   ALTER TABLE main.teams ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME main.teams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            main          postgres    false    216    6                      0    16415 	   companies 
   TABLE DATA                 main          postgres    false    217   ?       	          0    16401 	   employees 
   TABLE DATA                 main          postgres    false    215   ?       
          0    16408    teams 
   TABLE DATA                 main          postgres    false    216   ?                  0    0    companies_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('main.companies_id_seq', 40, true);
          main          postgres    false    218                       0    0    employees_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('main.employees_id_seq', 29, true);
          main          postgres    false    219                       0    0    teams_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('main.teams_id_seq', 2, true);
          main          postgres    false    220            w           2606    16421    companies companies_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY main.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY main.companies DROP CONSTRAINT companies_pkey;
       main            postgres    false    217            q           2606    16407    employees employees_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY main.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY main.employees DROP CONSTRAINT employees_pkey;
       main            postgres    false    215            u           2606    16414    teams teams_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY main.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY main.teams DROP CONSTRAINT teams_pkey;
       main            postgres    false    216            s           1259    16433    fki_company_id_ref_id_fk    INDEX     N   CREATE INDEX fki_company_id_ref_id_fk ON main.teams USING btree (company_id);
 *   DROP INDEX main.fki_company_id_ref_id_fk;
       main            postgres    false    216            r           1259    16427    fki_team_id_ref_id_fk    INDEX     L   CREATE INDEX fki_team_id_ref_id_fk ON main.employees USING btree (team_id);
 '   DROP INDEX main.fki_team_id_ref_id_fk;
       main            postgres    false    215            z           2606    16428    teams company_id_ref_id_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY main.teams
    ADD CONSTRAINT company_id_ref_id_fk FOREIGN KEY (company_id) REFERENCES main.companies(id) NOT VALID;
 B   ALTER TABLE ONLY main.teams DROP CONSTRAINT company_id_ref_id_fk;
       main          postgres    false    217    3191    216            x           2606    16422    employees team_id_ref_id_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY main.employees
    ADD CONSTRAINT team_id_ref_id_fk FOREIGN KEY (team_id) REFERENCES main.teams(id) NOT VALID;
 C   ALTER TABLE ONLY main.employees DROP CONSTRAINT team_id_ref_id_fk;
       main          postgres    false    3189    216    215            y           2606    16437 %   employees teams_menag_id_ref_teams_id    FK CONSTRAINT     ?   ALTER TABLE ONLY main.employees
    ADD CONSTRAINT teams_menag_id_ref_teams_id FOREIGN KEY (manager_id) REFERENCES main.teams(id) NOT VALID;
 M   ALTER TABLE ONLY main.employees DROP CONSTRAINT teams_menag_id_ref_teams_id;
       main          postgres    false    3189    215    216               ?   x???M
?0?}O?vUPQpUi??m??W??V	??&Z<?)?nf1??4'?rJ=?y???V?,?1M???sN(?É?2??l5?0A??㥑?з?[??J?ۀ?!???Q??Fcq???[??eMkƑ?=????JT5?_~][???,?ު???Zѱ?r??? ??шI      	   3  x???Qo?0???~c????R&??ю?H{<?+N??i????l????֠???????????&%?:?%9?b??R?ߜkr?]n6?"^%ɏ$]~#???~????y?D??R????=??_???p!rQC?g?<B??$?&1?\??r?W9??????CQ?`???b???????\?LCqp\_???O!1lf?:\?}\c????
TʧӮXP݀%?(U??~ȭp???L??CIf??qM?fc???v4?B??)?pWA?*?	g??7%T??:??]3?߯Ca(??WtF??Bs??yqP?n;s?A?[?:mԶ5???pwJ?Ǌ???ʶq'?'??I?ܐ??[R?v??:??[??(Q???ϩga?=?/?T?BK?47?m3?-?9?.?'-[`?u?.,?дNQk?80??7?]c~?F;7ܽ}?ZI??Ue?B?_T???#=;,?~?Q-????-MN?v??1S_?Ku?]?#Ɨ?ᬱ?ߤQ9?_@?s?<b?N?IE!z?l???N0??)???y????#????vڬ??`???)@      
   y   x???v
Q???W?M???+IM?-V?s
?t??sW?q?Us?	u???
?:
 d???????d???T*??(??kZsy?g?????K?H???L??y?
y??) ??? 1?     