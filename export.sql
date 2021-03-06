PGDMP         '                u           DB_Final_Project    9.6.2    9.6.2 �    '
           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            (
           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            )
           1262    25320    DB_Final_Project    DATABASE     p   CREATE DATABASE "DB_Final_Project" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
 "   DROP DATABASE "DB_Final_Project";
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            *
           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12655    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            +
           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1255    25813    journey_delete_fuction1()    FUNCTION     _  CREATE FUNCTION journey_delete_fuction1() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
    insert into request
    values (old.driver_id, old.passenger_id, true, true, true , current_timestamp, old.cost );
    update driver 
    set driver_credit = driver_credit + old.cost * 0.61
    where driver_id = old.driver_id;
    return new;
end;
$$;
 0   DROP FUNCTION public.journey_delete_fuction1();
       public       postgres    false    1    3            �            1255    25815    journey_delete_fuction2()    FUNCTION     a  CREATE FUNCTION journey_delete_fuction2() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
    insert into request
    values (old.driver_id, old.passenger_id, true, true, false ,  current_timestamp, old.cost );
    update driver 
    set driver_credit = driver_credit + old.cost * 0.61
    where driver_id = old.driver_id;
    return new;
end;
$$;
 0   DROP FUNCTION public.journey_delete_fuction2();
       public       postgres    false    3    1            �            1255    25784 %   log_profile_driver_account_function()    FUNCTION     `  CREATE FUNCTION log_profile_driver_account_function() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
    if(old.account_id <> new.account_id) then
        insert into profileEdit_driver
        values (old.driver_id,'account_id', old.account_id :: text,new.account_id :: text,current_timestamp,current_user);
    end if;
    return new;
end;
$$;
 <   DROP FUNCTION public.log_profile_driver_account_function();
       public       postgres    false    3    1            �            1255    25683    log_profile_driver_function()    FUNCTION     �  CREATE FUNCTION log_profile_driver_function() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
    if(new.driver_name <> old.driver_name) then
      insert into profileEdit_driver
      values (old.driver_id,'driver_name',old.driver_name :: text, new.driver_name :: text, current_timestamp,current_user);
    end if;

    if(new.driver_family <> old.driver_family) then
      insert into profileEdit_driver
      values (old.driver_id,'driver_family',old.driver_family :: text, new.driver_family :: text, current_timestamp,current_user);
    end if;

    if(new.driver_picture <> old.driver_picture) then
      insert into profileEdit_driver
      values (old.driver_id,'driver_picture',old.driver_picture :: text, new.driver_picture :: text, current_timestamp,current_user);
    end if;

    if(new.birth_date <> old.birth_date) then
      insert into profileEdit_driver
      values (old.driver_id,'birth_date',old.birth_date :: text, new.birth_date :: text, current_timestamp,current_user);
    end if;

    if(new.certification_year <> old.certification_year) then
      insert into profileEdit_driver
      values (old.driver_id,'certification_year',old.certification_year :: text, new.certification_year :: text, current_timestamp,current_user);
    end if;

    if(new.isfinishedCooperation <> old.isfinishedCooperation) then
      insert into profileEdit_driver
      values (old.driver_id,'isfinishedCooperation',old.isfinishedCooperation :: text, new.isfinishedCooperation :: text, current_timestamp,current_user);
    end if;

    if(new.status <> old.status) then
      insert into profileEdit_driver
      values (old.driver_id,'status',old.status :: text, new.status :: text, current_timestamp,current_user);
    end if;

    if(new.driver_credit <> old.driver_credit) then
      insert into profileEdit_driver
      values (old.driver_id,'driver_credit',old.driver_credit :: text, new.driver_credit :: text, current_timestamp,current_user);
    end if;

    if(new.register_date <> old.register_date) then
      insert into profileEdit_driver
      values (old.driver_id,'register_date',old.register_date :: text, new.register_date :: text, current_timestamp,current_user);
    end if;

  return new;
end;
$$;
 4   DROP FUNCTION public.log_profile_driver_function();
       public       postgres    false    1    3            �            1255    25782 +   log_profile_driver_landlinephone_function()    FUNCTION     u  CREATE FUNCTION log_profile_driver_landlinephone_function() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
    if(old.landlinephone <> new.landlinephone) then
        insert into profileEdit_driver
        values (old.driver_id,'landlinephone', old.landlinephone :: text,new.landlinephone :: text,current_timestamp,current_user);
    end if;
    return new;
end;
$$;
 B   DROP FUNCTION public.log_profile_driver_landlinephone_function();
       public       postgres    false    3    1            �            1255    25780 )   log_profile_driver_mobilephone_function()    FUNCTION     i  CREATE FUNCTION log_profile_driver_mobilephone_function() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
    if(old.mobilephone <> new.mobilephone) then
        insert into profileEdit_driver
        values (old.driver_id,'mobilephone', old.mobilephone :: text,new.mobilephone :: text,current_timestamp,current_user);
    end if;
    return new;
end;
$$;
 @   DROP FUNCTION public.log_profile_driver_mobilephone_function();
       public       postgres    false    1    3            �            1255    25811 (   log_profile_passenger_address_function()    FUNCTION     Z  CREATE FUNCTION log_profile_passenger_address_function() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
    if(old.address <> new.address) then
        insert into profileEdit_passenger
        values (old.passenger_id,'address', old.address :: text,new.address :: text,current_timestamp,current_user);
    end if;
    return new;
end;
$$;
 ?   DROP FUNCTION public.log_profile_passenger_address_function();
       public       postgres    false    1    3            �            1255    25792     log_profile_passenger_function()    FUNCTION     E  CREATE FUNCTION log_profile_passenger_function() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
    if(new.username <> old.username) then
      insert into profileEdit_passenger
      values (old.passenger_id,'username',old.username :: text, new.username :: text, current_timestamp,current_user);
    end if;

    if(new.driver_picture <> old.driver_picture) then
      insert into profileEdit_passenger
      values (old.passenger_id,'driver_picture',old.driver_picture :: text, new.driver_picture :: text, current_timestamp,current_user);
    end if;

    if(new.passenger_credit <> old.passenger_credit) then
      insert into profileEdit_passenger
      values (old.passenger_id,'passenger_credit',old.passenger_credit :: text, new.passenger_credit :: text, current_timestamp,current_user);
    end if;

  return new;
end;
$$;
 7   DROP FUNCTION public.log_profile_passenger_function();
       public       postgres    false    1    3            �            1255    25794 6   log_profile_passenger_isfinishedcooperation_function()    FUNCTION     �  CREATE FUNCTION log_profile_passenger_isfinishedcooperation_function() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
    if(new.isfinishedCooperation <> old.isfinishedCooperation) then
      insert into profileEdit_passenger
      values (old.passenger_id,'isfinishedCooperation',old.isfinishedCooperation :: text, new.isfinishedCooperation :: text, current_timestamp,current_user);
    end if;

  return new;
end;
$$;
 M   DROP FUNCTION public.log_profile_passenger_isfinishedcooperation_function();
       public       postgres    false    1    3            �            1255    25798 .   log_profile_passenger_landlinephone_function()    FUNCTION     ~  CREATE FUNCTION log_profile_passenger_landlinephone_function() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
    if(old.landlinephone <> new.landlinephone) then
        insert into profileEdit_passenger
        values (old.passenger_id,'landlinephone', old.landlinephone :: text,new.landlinephone :: text,current_timestamp,current_user);
    end if;
    return new;
end;
$$;
 E   DROP FUNCTION public.log_profile_passenger_landlinephone_function();
       public       postgres    false    1    3            �            1255    25796 ,   log_profile_passenger_mobilephone_function()    FUNCTION     r  CREATE FUNCTION log_profile_passenger_mobilephone_function() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
    if(old.mobilephone <> new.mobilephone) then
        insert into profileEdit_passenger
        values (old.passenger_id,'mobilephone', old.mobilephone :: text,new.mobilephone :: text,current_timestamp,current_user);
    end if;
    return new;
end;
$$;
 C   DROP FUNCTION public.log_profile_passenger_mobilephone_function();
       public       postgres    false    1    3            �            1259    25705    account    TABLE     �   CREATE TABLE account (
    account_id integer NOT NULL,
    bank_name character varying(20),
    account_number character varying(20)
);
    DROP TABLE public.account;
       public         postgres    false    3            �            1259    25598 	   complaint    TABLE       CREATE TABLE complaint (
    driver_id integer NOT NULL,
    passenger_id integer NOT NULL,
    supporter_id integer NOT NULL,
    request_time timestamp without time zone NOT NULL,
    answer_time timestamp without time zone,
    text character varying(100)
);
    DROP TABLE public.complaint;
       public         postgres    false    3            �            1259    25488    cruise_driver    TABLE     �   CREATE TABLE cruise_driver (
    driver_id integer NOT NULL,
    source character varying(20),
    destination character varying(20),
    "time" timestamp without time zone NOT NULL
);
 !   DROP TABLE public.cruise_driver;
       public         postgres    false    3            �            1259    25685    delayfollow    TABLE     �   CREATE TABLE delayfollow (
    driver_id integer NOT NULL,
    passenger_id integer NOT NULL,
    supporter_id integer NOT NULL,
    request_time timestamp without time zone NOT NULL
);
    DROP TABLE public.delayfollow;
       public         postgres    false    3            �            1259    25423    driver    TABLE     �  CREATE TABLE driver (
    driver_id integer NOT NULL,
    driver_name character varying(20),
    driver_family character varying(20),
    driver_picture character varying(100),
    birth_date timestamp without time zone,
    certification_year date,
    isfinishedcooperation boolean,
    status character varying(20),
    driver_credit integer,
    register_date timestamp without time zone
);
    DROP TABLE public.driver;
       public         postgres    false    3            �            1259    25710    driver_account    TABLE     a   CREATE TABLE driver_account (
    driver_id integer NOT NULL,
    account_id integer NOT NULL
);
 "   DROP TABLE public.driver_account;
       public         postgres    false    3            �            1259    25421    driver_driver_id_seq    SEQUENCE     v   CREATE SEQUENCE driver_driver_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.driver_driver_id_seq;
       public       postgres    false    186    3            ,
           0    0    driver_driver_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE driver_driver_id_seq OWNED BY driver.driver_id;
            public       postgres    false    185            �            1259    25750    driver_landlinephones    TABLE     p   CREATE TABLE driver_landlinephones (
    driver_id integer NOT NULL,
    landlinephone character varying(20)
);
 )   DROP TABLE public.driver_landlinephones;
       public         postgres    false    3            �            1259    25740    driver_mobilephones    TABLE     l   CREATE TABLE driver_mobilephones (
    driver_id integer NOT NULL,
    mobilephone character varying(20)
);
 '   DROP TABLE public.driver_mobilephones;
       public         postgres    false    3            �            1259    25498    finishedcooperation_date    TABLE     p   CREATE TABLE finishedcooperation_date (
    driver_id integer NOT NULL,
    date timestamp without time zone
);
 ,   DROP TABLE public.finishedcooperation_date;
       public         postgres    false    3            �            1259    25583    journey_withoutsubscription    TABLE     �   CREATE TABLE journey_withoutsubscription (
    driver_id integer NOT NULL,
    passenger_id integer NOT NULL,
    source character varying(20),
    destination character varying(20),
    cost integer
);
 /   DROP TABLE public.journey_withoutsubscription;
       public         postgres    false    3            �            1259    25568    journey_withsubscription    TABLE     �   CREATE TABLE journey_withsubscription (
    driver_id integer NOT NULL,
    passenger_id integer NOT NULL,
    source character varying(20),
    destination character varying(20),
    cost integer,
    payment_method character varying(20)
);
 ,   DROP TABLE public.journey_withsubscription;
       public         postgres    false    3            �            1259    25444 	   passenger    TABLE     a   CREATE TABLE passenger (
    passenger_id integer NOT NULL,
    isfinishedcooperation boolean
);
    DROP TABLE public.passenger;
       public         postgres    false    3            �            1259    25801    passenger_address    TABLE     j   CREATE TABLE passenger_address (
    passenger_id integer NOT NULL,
    address character varying(100)
);
 %   DROP TABLE public.passenger_address;
       public         postgres    false    3            �            1259    25450    passenger_has_subscription    TABLE     �   CREATE TABLE passenger_has_subscription (
    passenger_id integer NOT NULL,
    passenger_picture character varying(100),
    username character varying(20),
    passenger_credit integer
);
 .   DROP TABLE public.passenger_has_subscription;
       public         postgres    false    3            �            1259    25760    passenger_mobilephones    TABLE     r   CREATE TABLE passenger_mobilephones (
    passenger_id integer NOT NULL,
    mobilephone character varying(20)
);
 *   DROP TABLE public.passenger_mobilephones;
       public         postgres    false    3            �            1259    25442    passenger_passenger_id_seq    SEQUENCE     |   CREATE SEQUENCE passenger_passenger_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.passenger_passenger_id_seq;
       public       postgres    false    3    189            -
           0    0    passenger_passenger_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE passenger_passenger_id_seq OWNED BY passenger.passenger_id;
            public       postgres    false    188            �            1259    25460    passenger_without_subscription    TABLE     S   CREATE TABLE passenger_without_subscription (
    passenger_id integer NOT NULL
);
 2   DROP TABLE public.passenger_without_subscription;
       public         postgres    false    3            �            1259    25429    profileedit_driver    TABLE     �   CREATE TABLE profileedit_driver (
    driver_id integer NOT NULL,
    edited_column character varying(20),
    old_amount text,
    new_amount text,
    date timestamp without time zone NOT NULL,
    who character varying(20)
);
 &   DROP TABLE public.profileedit_driver;
       public         postgres    false    3            �            1259    25508    profileedit_passenger    TABLE     �   CREATE TABLE profileedit_passenger (
    passenger_id integer NOT NULL,
    edited_column character varying(20),
    old_amount text,
    new_amount text,
    date timestamp without time zone NOT NULL,
    who character varying(20)
);
 )   DROP TABLE public.profileedit_passenger;
       public         postgres    false    3            �            1259    25725 	   reckoning    TABLE     @  CREATE TABLE reckoning (
    account_id integer NOT NULL,
    supporter_id integer NOT NULL,
    cost integer,
    request_time timestamp without time zone,
    interception_code character varying(20),
    request_cause character varying(100),
    request_number integer,
    payment_time timestamp without time zone
);
    DROP TABLE public.reckoning;
       public         postgres    false    3            �            1259    25522    report    TABLE       CREATE TABLE report (
    driver_id integer NOT NULL,
    passenger_id integer NOT NULL,
    comment character varying(100),
    score integer,
    "time" timestamp without time zone NOT NULL,
    CONSTRAINT report_score_check CHECK (((score >= 0) AND (score <= 20)))
);
    DROP TABLE public.report;
       public         postgres    false    3            �            1259    25817    request    TABLE     �   CREATE TABLE request (
    driver_id integer NOT NULL,
    passenger_id integer NOT NULL,
    driveraccept boolean,
    passengeraccept boolean,
    hassubscription boolean,
    "time" timestamp without time zone NOT NULL,
    cost integer
);
    DROP TABLE public.request;
       public         postgres    false    3            �            1259    25472 	   supporter    TABLE     �   CREATE TABLE supporter (
    supporter_id integer NOT NULL,
    supporter_name character varying(20),
    supporter_family character varying(20),
    supporter_picture character varying(100),
    isonline boolean
);
    DROP TABLE public.supporter;
       public         postgres    false    3            �            1259    25470    supporter_supporter_id_seq    SEQUENCE     |   CREATE SEQUENCE supporter_supporter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.supporter_supporter_id_seq;
       public       postgres    false    193    3            .
           0    0    supporter_supporter_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE supporter_supporter_id_seq OWNED BY supporter.supporter_id;
            public       postgres    false    192            @	           2604    25426    driver driver_id    DEFAULT     f   ALTER TABLE ONLY driver ALTER COLUMN driver_id SET DEFAULT nextval('driver_driver_id_seq'::regclass);
 ?   ALTER TABLE public.driver ALTER COLUMN driver_id DROP DEFAULT;
       public       postgres    false    185    186    186            A	           2604    25447    passenger passenger_id    DEFAULT     r   ALTER TABLE ONLY passenger ALTER COLUMN passenger_id SET DEFAULT nextval('passenger_passenger_id_seq'::regclass);
 E   ALTER TABLE public.passenger ALTER COLUMN passenger_id DROP DEFAULT;
       public       postgres    false    188    189    189            B	           2604    25475    supporter supporter_id    DEFAULT     r   ALTER TABLE ONLY supporter ALTER COLUMN supporter_id SET DEFAULT nextval('supporter_supporter_id_seq'::regclass);
 E   ALTER TABLE public.supporter ALTER COLUMN supporter_id DROP DEFAULT;
       public       postgres    false    192    193    193            
          0    25705    account 
   TABLE DATA               A   COPY account (account_id, bank_name, account_number) FROM stdin;
    public       postgres    false    202   �       
          0    25598 	   complaint 
   TABLE DATA               d   COPY complaint (driver_id, passenger_id, supporter_id, request_time, answer_time, text) FROM stdin;
    public       postgres    false    200   �       
          0    25488    cruise_driver 
   TABLE DATA               H   COPY cruise_driver (driver_id, source, destination, "time") FROM stdin;
    public       postgres    false    194   <�       
          0    25685    delayfollow 
   TABLE DATA               S   COPY delayfollow (driver_id, passenger_id, supporter_id, request_time) FROM stdin;
    public       postgres    false    201   ��       
          0    25423    driver 
   TABLE DATA               �   COPY driver (driver_id, driver_name, driver_family, driver_picture, birth_date, certification_year, isfinishedcooperation, status, driver_credit, register_date) FROM stdin;
    public       postgres    false    186   ��       
          0    25710    driver_account 
   TABLE DATA               8   COPY driver_account (driver_id, account_id) FROM stdin;
    public       postgres    false    203   i�       /
           0    0    driver_driver_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('driver_driver_id_seq', 1, true);
            public       postgres    false    185            !
          0    25750    driver_landlinephones 
   TABLE DATA               B   COPY driver_landlinephones (driver_id, landlinephone) FROM stdin;
    public       postgres    false    206   ��        
          0    25740    driver_mobilephones 
   TABLE DATA               >   COPY driver_mobilephones (driver_id, mobilephone) FROM stdin;
    public       postgres    false    205   ��       
          0    25498    finishedcooperation_date 
   TABLE DATA               <   COPY finishedcooperation_date (driver_id, date) FROM stdin;
    public       postgres    false    195   ��       
          0    25583    journey_withoutsubscription 
   TABLE DATA               b   COPY journey_withoutsubscription (driver_id, passenger_id, source, destination, cost) FROM stdin;
    public       postgres    false    199   ��       
          0    25568    journey_withsubscription 
   TABLE DATA               o   COPY journey_withsubscription (driver_id, passenger_id, source, destination, cost, payment_method) FROM stdin;
    public       postgres    false    198   ��       
          0    25444 	   passenger 
   TABLE DATA               A   COPY passenger (passenger_id, isfinishedcooperation) FROM stdin;
    public       postgres    false    189   6�       #
          0    25801    passenger_address 
   TABLE DATA               ;   COPY passenger_address (passenger_id, address) FROM stdin;
    public       postgres    false    208   ^�       
          0    25450    passenger_has_subscription 
   TABLE DATA               j   COPY passenger_has_subscription (passenger_id, passenger_picture, username, passenger_credit) FROM stdin;
    public       postgres    false    190   {�       "
          0    25760    passenger_mobilephones 
   TABLE DATA               D   COPY passenger_mobilephones (passenger_id, mobilephone) FROM stdin;
    public       postgres    false    207   ��       0
           0    0    passenger_passenger_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('passenger_passenger_id_seq', 1, false);
            public       postgres    false    188            
          0    25460    passenger_without_subscription 
   TABLE DATA               ?   COPY passenger_without_subscription (passenger_id) FROM stdin;
    public       postgres    false    191   �       
          0    25429    profileedit_driver 
   TABLE DATA               b   COPY profileedit_driver (driver_id, edited_column, old_amount, new_amount, date, who) FROM stdin;
    public       postgres    false    187   &�       
          0    25508    profileedit_passenger 
   TABLE DATA               h   COPY profileedit_passenger (passenger_id, edited_column, old_amount, new_amount, date, who) FROM stdin;
    public       postgres    false    196   ��       
          0    25725 	   reckoning 
   TABLE DATA               �   COPY reckoning (account_id, supporter_id, cost, request_time, interception_code, request_cause, request_number, payment_time) FROM stdin;
    public       postgres    false    204   ��       
          0    25522    report 
   TABLE DATA               J   COPY report (driver_id, passenger_id, comment, score, "time") FROM stdin;
    public       postgres    false    197   ��       $
          0    25817    request 
   TABLE DATA               q   COPY request (driver_id, passenger_id, driveraccept, passengeraccept, hassubscription, "time", cost) FROM stdin;
    public       postgres    false    209   N�       
          0    25472 	   supporter 
   TABLE DATA               i   COPY supporter (supporter_id, supporter_name, supporter_family, supporter_picture, isonline) FROM stdin;
    public       postgres    false    193   k�       1
           0    0    supporter_supporter_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('supporter_supporter_id_seq', 1, false);
            public       postgres    false    192            a	           2606    25709    account account_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY account
    ADD CONSTRAINT account_pkey PRIMARY KEY (account_id);
 >   ALTER TABLE ONLY public.account DROP CONSTRAINT account_pkey;
       public         postgres    false    202    202            ]	           2606    25602    complaint complaint_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY complaint
    ADD CONSTRAINT complaint_pkey PRIMARY KEY (driver_id, passenger_id, supporter_id, request_time);
 B   ALTER TABLE ONLY public.complaint DROP CONSTRAINT complaint_pkey;
       public         postgres    false    200    200    200    200    200            Q	           2606    25492     cruise_driver cruise_driver_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY cruise_driver
    ADD CONSTRAINT cruise_driver_pkey PRIMARY KEY ("time", driver_id);
 J   ALTER TABLE ONLY public.cruise_driver DROP CONSTRAINT cruise_driver_pkey;
       public         postgres    false    194    194    194            _	           2606    25689    delayfollow delayfollow_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY delayfollow
    ADD CONSTRAINT delayfollow_pkey PRIMARY KEY (driver_id, passenger_id, supporter_id, request_time);
 F   ALTER TABLE ONLY public.delayfollow DROP CONSTRAINT delayfollow_pkey;
       public         postgres    false    201    201    201    201    201            c	           2606    25714 "   driver_account driver_account_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY driver_account
    ADD CONSTRAINT driver_account_pkey PRIMARY KEY (driver_id, account_id);
 L   ALTER TABLE ONLY public.driver_account DROP CONSTRAINT driver_account_pkey;
       public         postgres    false    203    203    203            i	           2606    25754 0   driver_landlinephones driver_landlinephones_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY driver_landlinephones
    ADD CONSTRAINT driver_landlinephones_pkey PRIMARY KEY (driver_id);
 Z   ALTER TABLE ONLY public.driver_landlinephones DROP CONSTRAINT driver_landlinephones_pkey;
       public         postgres    false    206    206            g	           2606    25744 ,   driver_mobilephones driver_mobilephones_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY driver_mobilephones
    ADD CONSTRAINT driver_mobilephones_pkey PRIMARY KEY (driver_id);
 V   ALTER TABLE ONLY public.driver_mobilephones DROP CONSTRAINT driver_mobilephones_pkey;
       public         postgres    false    205    205            E	           2606    25428    driver driver_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY driver
    ADD CONSTRAINT driver_pkey PRIMARY KEY (driver_id);
 <   ALTER TABLE ONLY public.driver DROP CONSTRAINT driver_pkey;
       public         postgres    false    186    186            S	           2606    25502 6   finishedcooperation_date finishedcooperation_date_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY finishedcooperation_date
    ADD CONSTRAINT finishedcooperation_date_pkey PRIMARY KEY (driver_id);
 `   ALTER TABLE ONLY public.finishedcooperation_date DROP CONSTRAINT finishedcooperation_date_pkey;
       public         postgres    false    195    195            [	           2606    25587 <   journey_withoutsubscription journey_withoutsubscription_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY journey_withoutsubscription
    ADD CONSTRAINT journey_withoutsubscription_pkey PRIMARY KEY (driver_id, passenger_id);
 f   ALTER TABLE ONLY public.journey_withoutsubscription DROP CONSTRAINT journey_withoutsubscription_pkey;
       public         postgres    false    199    199    199            Y	           2606    25572 6   journey_withsubscription journey_withsubscription_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY journey_withsubscription
    ADD CONSTRAINT journey_withsubscription_pkey PRIMARY KEY (driver_id, passenger_id);
 `   ALTER TABLE ONLY public.journey_withsubscription DROP CONSTRAINT journey_withsubscription_pkey;
       public         postgres    false    198    198    198            m	           2606    25805 (   passenger_address passenger_address_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY passenger_address
    ADD CONSTRAINT passenger_address_pkey PRIMARY KEY (passenger_id);
 R   ALTER TABLE ONLY public.passenger_address DROP CONSTRAINT passenger_address_pkey;
       public         postgres    false    208    208            K	           2606    25454 :   passenger_has_subscription passenger_has_subscription_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY passenger_has_subscription
    ADD CONSTRAINT passenger_has_subscription_pkey PRIMARY KEY (passenger_id);
 d   ALTER TABLE ONLY public.passenger_has_subscription DROP CONSTRAINT passenger_has_subscription_pkey;
       public         postgres    false    190    190            k	           2606    25764 2   passenger_mobilephones passenger_mobilephones_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY passenger_mobilephones
    ADD CONSTRAINT passenger_mobilephones_pkey PRIMARY KEY (passenger_id);
 \   ALTER TABLE ONLY public.passenger_mobilephones DROP CONSTRAINT passenger_mobilephones_pkey;
       public         postgres    false    207    207            I	           2606    25449    passenger passenger_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY passenger
    ADD CONSTRAINT passenger_pkey PRIMARY KEY (passenger_id);
 B   ALTER TABLE ONLY public.passenger DROP CONSTRAINT passenger_pkey;
       public         postgres    false    189    189            M	           2606    25464 B   passenger_without_subscription passenger_without_subscription_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY passenger_without_subscription
    ADD CONSTRAINT passenger_without_subscription_pkey PRIMARY KEY (passenger_id);
 l   ALTER TABLE ONLY public.passenger_without_subscription DROP CONSTRAINT passenger_without_subscription_pkey;
       public         postgres    false    191    191            G	           2606    25436 *   profileedit_driver profileedit_driver_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY profileedit_driver
    ADD CONSTRAINT profileedit_driver_pkey PRIMARY KEY (driver_id, date);
 T   ALTER TABLE ONLY public.profileedit_driver DROP CONSTRAINT profileedit_driver_pkey;
       public         postgres    false    187    187    187            U	           2606    25515 0   profileedit_passenger profileedit_passenger_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY profileedit_passenger
    ADD CONSTRAINT profileedit_passenger_pkey PRIMARY KEY (passenger_id, date);
 Z   ALTER TABLE ONLY public.profileedit_passenger DROP CONSTRAINT profileedit_passenger_pkey;
       public         postgres    false    196    196    196            e	           2606    25729    reckoning reckoning_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY reckoning
    ADD CONSTRAINT reckoning_pkey PRIMARY KEY (account_id, supporter_id);
 B   ALTER TABLE ONLY public.reckoning DROP CONSTRAINT reckoning_pkey;
       public         postgres    false    204    204    204            W	           2606    25527    report report_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (driver_id, passenger_id, "time");
 <   ALTER TABLE ONLY public.report DROP CONSTRAINT report_pkey;
       public         postgres    false    197    197    197    197            o	           2606    25821    request request_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY request
    ADD CONSTRAINT request_pkey PRIMARY KEY (driver_id, passenger_id, "time");
 >   ALTER TABLE ONLY public.request DROP CONSTRAINT request_pkey;
       public         postgres    false    209    209    209    209            O	           2606    25477    supporter supporter_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY supporter
    ADD CONSTRAINT supporter_pkey PRIMARY KEY (supporter_id);
 B   ALTER TABLE ONLY public.supporter DROP CONSTRAINT supporter_pkey;
       public         postgres    false    193    193            �	           2620    25814 0   journey_withsubscription journey_delete_trigger1    TRIGGER     �   CREATE TRIGGER journey_delete_trigger1 AFTER DELETE ON journey_withsubscription FOR EACH ROW EXECUTE PROCEDURE journey_delete_fuction1();
 I   DROP TRIGGER journey_delete_trigger1 ON public.journey_withsubscription;
       public       postgres    false    198    230            �	           2620    25816 0   journey_withsubscription journey_delete_trigger2    TRIGGER     �   CREATE TRIGGER journey_delete_trigger2 AFTER DELETE ON journey_withsubscription FOR EACH ROW EXECUTE PROCEDURE journey_delete_fuction2();
 I   DROP TRIGGER journey_delete_trigger2 ON public.journey_withsubscription;
       public       postgres    false    231    198            �	           2620    26120 3   journey_withoutsubscription journey_delete_trigger2    TRIGGER     �   CREATE TRIGGER journey_delete_trigger2 AFTER DELETE ON journey_withoutsubscription FOR EACH ROW EXECUTE PROCEDURE journey_delete_fuction2();
 L   DROP TRIGGER journey_delete_trigger2 ON public.journey_withoutsubscription;
       public       postgres    false    231    199            �	           2620    25791 1   driver_account log_profile_driver_account_trigger    TRIGGER     �   CREATE TRIGGER log_profile_driver_account_trigger AFTER UPDATE ON driver_account FOR EACH ROW EXECUTE PROCEDURE log_profile_driver_account_function();
 J   DROP TRIGGER log_profile_driver_account_trigger ON public.driver_account;
       public       postgres    false    203    224            �	           2620    26123 >   driver_landlinephones log_profile_driver_landlinephone_trigger    TRIGGER     �   CREATE TRIGGER log_profile_driver_landlinephone_trigger AFTER UPDATE ON driver_landlinephones FOR EACH ROW EXECUTE PROCEDURE log_profile_driver_landlinephone_function();
 W   DROP TRIGGER log_profile_driver_landlinephone_trigger ON public.driver_landlinephones;
       public       postgres    false    206    232            �	           2620    25787 :   driver_mobilephones log_profile_driver_mobilephone_trigger    TRIGGER     �   CREATE TRIGGER log_profile_driver_mobilephone_trigger AFTER UPDATE ON driver_mobilephones FOR EACH ROW EXECUTE PROCEDURE log_profile_driver_function();
 S   DROP TRIGGER log_profile_driver_mobilephone_trigger ON public.driver_mobilephones;
       public       postgres    false    211    205            �	           2620    26124 !   driver log_profile_driver_trigger    TRIGGER        CREATE TRIGGER log_profile_driver_trigger AFTER UPDATE ON driver FOR EACH ROW EXECUTE PROCEDURE log_profile_driver_function();
 :   DROP TRIGGER log_profile_driver_trigger ON public.driver;
       public       postgres    false    186    211            �	           2620    25812 7   passenger_address log_profile_passenger_address_trigger    TRIGGER     �   CREATE TRIGGER log_profile_passenger_address_trigger AFTER UPDATE ON passenger_address FOR EACH ROW EXECUTE PROCEDURE log_profile_passenger_address_function();
 P   DROP TRIGGER log_profile_passenger_address_trigger ON public.passenger_address;
       public       postgres    false    229    208            �	           2620    25795 =   passenger log_profile_passenger_isfinishedcooperation_trigger    TRIGGER     �   CREATE TRIGGER log_profile_passenger_isfinishedcooperation_trigger AFTER UPDATE ON passenger FOR EACH ROW EXECUTE PROCEDURE log_profile_passenger_isfinishedcooperation_function();
 V   DROP TRIGGER log_profile_passenger_isfinishedcooperation_trigger ON public.passenger;
       public       postgres    false    226    189            �	           2620    25797 @   passenger_mobilephones log_profile_passenger_mobilephone_trigger    TRIGGER     �   CREATE TRIGGER log_profile_passenger_mobilephone_trigger AFTER UPDATE ON passenger_mobilephones FOR EACH ROW EXECUTE PROCEDURE log_profile_passenger_mobilephone_function();
 Y   DROP TRIGGER log_profile_passenger_mobilephone_trigger ON public.passenger_mobilephones;
       public       postgres    false    227    207            �	           2620    25793 8   passenger_has_subscription log_profile_passenger_trigger    TRIGGER     �   CREATE TRIGGER log_profile_passenger_trigger AFTER UPDATE ON passenger_has_subscription FOR EACH ROW EXECUTE PROCEDURE log_profile_passenger_function();
 Q   DROP TRIGGER log_profile_passenger_trigger ON public.passenger_has_subscription;
       public       postgres    false    225    190            }	           2606    25608 "   complaint complaint_driver_id_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY complaint
    ADD CONSTRAINT complaint_driver_id_fkey FOREIGN KEY (driver_id) REFERENCES driver(driver_id);
 L   ALTER TABLE ONLY public.complaint DROP CONSTRAINT complaint_driver_id_fkey;
       public       postgres    false    2373    200    186            |	           2606    25603 %   complaint complaint_passenger_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY complaint
    ADD CONSTRAINT complaint_passenger_id_fkey FOREIGN KEY (passenger_id) REFERENCES passenger(passenger_id);
 O   ALTER TABLE ONLY public.complaint DROP CONSTRAINT complaint_passenger_id_fkey;
       public       postgres    false    189    200    2377            ~	           2606    25613 %   complaint complaint_supporter_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY complaint
    ADD CONSTRAINT complaint_supporter_id_fkey FOREIGN KEY (supporter_id) REFERENCES supporter(supporter_id);
 O   ALTER TABLE ONLY public.complaint DROP CONSTRAINT complaint_supporter_id_fkey;
       public       postgres    false    2383    193    200            s	           2606    25493 *   cruise_driver cruise_driver_driver_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY cruise_driver
    ADD CONSTRAINT cruise_driver_driver_id_fkey FOREIGN KEY (driver_id) REFERENCES driver(driver_id);
 T   ALTER TABLE ONLY public.cruise_driver DROP CONSTRAINT cruise_driver_driver_id_fkey;
       public       postgres    false    186    2373    194            �	           2606    25695 &   delayfollow delayfollow_driver_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY delayfollow
    ADD CONSTRAINT delayfollow_driver_id_fkey FOREIGN KEY (driver_id) REFERENCES driver(driver_id);
 P   ALTER TABLE ONLY public.delayfollow DROP CONSTRAINT delayfollow_driver_id_fkey;
       public       postgres    false    186    201    2373            	           2606    25690 )   delayfollow delayfollow_passenger_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY delayfollow
    ADD CONSTRAINT delayfollow_passenger_id_fkey FOREIGN KEY (passenger_id) REFERENCES passenger(passenger_id);
 S   ALTER TABLE ONLY public.delayfollow DROP CONSTRAINT delayfollow_passenger_id_fkey;
       public       postgres    false    189    201    2377            �	           2606    25700 )   delayfollow delayfollow_supporter_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY delayfollow
    ADD CONSTRAINT delayfollow_supporter_id_fkey FOREIGN KEY (supporter_id) REFERENCES supporter(supporter_id);
 S   ALTER TABLE ONLY public.delayfollow DROP CONSTRAINT delayfollow_supporter_id_fkey;
       public       postgres    false    193    2383    201            �	           2606    25720 -   driver_account driver_account_account_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY driver_account
    ADD CONSTRAINT driver_account_account_id_fkey FOREIGN KEY (account_id) REFERENCES account(account_id);
 W   ALTER TABLE ONLY public.driver_account DROP CONSTRAINT driver_account_account_id_fkey;
       public       postgres    false    203    2401    202            �	           2606    25715 ,   driver_account driver_account_driver_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY driver_account
    ADD CONSTRAINT driver_account_driver_id_fkey FOREIGN KEY (driver_id) REFERENCES driver(driver_id);
 V   ALTER TABLE ONLY public.driver_account DROP CONSTRAINT driver_account_driver_id_fkey;
       public       postgres    false    2373    203    186            �	           2606    25755 :   driver_landlinephones driver_landlinephones_driver_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY driver_landlinephones
    ADD CONSTRAINT driver_landlinephones_driver_id_fkey FOREIGN KEY (driver_id) REFERENCES driver(driver_id);
 d   ALTER TABLE ONLY public.driver_landlinephones DROP CONSTRAINT driver_landlinephones_driver_id_fkey;
       public       postgres    false    186    2373    206            �	           2606    25745 6   driver_mobilephones driver_mobilephones_driver_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY driver_mobilephones
    ADD CONSTRAINT driver_mobilephones_driver_id_fkey FOREIGN KEY (driver_id) REFERENCES driver(driver_id);
 `   ALTER TABLE ONLY public.driver_mobilephones DROP CONSTRAINT driver_mobilephones_driver_id_fkey;
       public       postgres    false    205    2373    186            t	           2606    25503 @   finishedcooperation_date finishedcooperation_date_driver_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY finishedcooperation_date
    ADD CONSTRAINT finishedcooperation_date_driver_id_fkey FOREIGN KEY (driver_id) REFERENCES driver(driver_id);
 j   ALTER TABLE ONLY public.finishedcooperation_date DROP CONSTRAINT finishedcooperation_date_driver_id_fkey;
       public       postgres    false    186    2373    195            {	           2606    25593 F   journey_withoutsubscription journey_withoutsubscription_driver_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY journey_withoutsubscription
    ADD CONSTRAINT journey_withoutsubscription_driver_id_fkey FOREIGN KEY (driver_id) REFERENCES driver(driver_id);
 p   ALTER TABLE ONLY public.journey_withoutsubscription DROP CONSTRAINT journey_withoutsubscription_driver_id_fkey;
       public       postgres    false    186    199    2373            z	           2606    25588 I   journey_withoutsubscription journey_withoutsubscription_passenger_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY journey_withoutsubscription
    ADD CONSTRAINT journey_withoutsubscription_passenger_id_fkey FOREIGN KEY (passenger_id) REFERENCES passenger_without_subscription(passenger_id);
 s   ALTER TABLE ONLY public.journey_withoutsubscription DROP CONSTRAINT journey_withoutsubscription_passenger_id_fkey;
       public       postgres    false    191    199    2381            y	           2606    25578 @   journey_withsubscription journey_withsubscription_driver_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY journey_withsubscription
    ADD CONSTRAINT journey_withsubscription_driver_id_fkey FOREIGN KEY (driver_id) REFERENCES driver(driver_id);
 j   ALTER TABLE ONLY public.journey_withsubscription DROP CONSTRAINT journey_withsubscription_driver_id_fkey;
       public       postgres    false    186    198    2373            x	           2606    25573 C   journey_withsubscription journey_withsubscription_passenger_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY journey_withsubscription
    ADD CONSTRAINT journey_withsubscription_passenger_id_fkey FOREIGN KEY (passenger_id) REFERENCES passenger_has_subscription(passenger_id);
 m   ALTER TABLE ONLY public.journey_withsubscription DROP CONSTRAINT journey_withsubscription_passenger_id_fkey;
       public       postgres    false    190    2379    198            �	           2606    25806 5   passenger_address passenger_address_passenger_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY passenger_address
    ADD CONSTRAINT passenger_address_passenger_id_fkey FOREIGN KEY (passenger_id) REFERENCES passenger(passenger_id);
 _   ALTER TABLE ONLY public.passenger_address DROP CONSTRAINT passenger_address_passenger_id_fkey;
       public       postgres    false    189    208    2377            q	           2606    25455 G   passenger_has_subscription passenger_has_subscription_passenger_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY passenger_has_subscription
    ADD CONSTRAINT passenger_has_subscription_passenger_id_fkey FOREIGN KEY (passenger_id) REFERENCES passenger(passenger_id);
 q   ALTER TABLE ONLY public.passenger_has_subscription DROP CONSTRAINT passenger_has_subscription_passenger_id_fkey;
       public       postgres    false    2377    190    189            �	           2606    25765 ?   passenger_mobilephones passenger_mobilephones_passenger_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY passenger_mobilephones
    ADD CONSTRAINT passenger_mobilephones_passenger_id_fkey FOREIGN KEY (passenger_id) REFERENCES passenger(passenger_id);
 i   ALTER TABLE ONLY public.passenger_mobilephones DROP CONSTRAINT passenger_mobilephones_passenger_id_fkey;
       public       postgres    false    207    2377    189            r	           2606    25465 O   passenger_without_subscription passenger_without_subscription_passenger_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY passenger_without_subscription
    ADD CONSTRAINT passenger_without_subscription_passenger_id_fkey FOREIGN KEY (passenger_id) REFERENCES passenger(passenger_id);
 y   ALTER TABLE ONLY public.passenger_without_subscription DROP CONSTRAINT passenger_without_subscription_passenger_id_fkey;
       public       postgres    false    191    189    2377            p	           2606    25437 4   profileedit_driver profileedit_driver_driver_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY profileedit_driver
    ADD CONSTRAINT profileedit_driver_driver_id_fkey FOREIGN KEY (driver_id) REFERENCES driver(driver_id);
 ^   ALTER TABLE ONLY public.profileedit_driver DROP CONSTRAINT profileedit_driver_driver_id_fkey;
       public       postgres    false    186    187    2373            u	           2606    25516 =   profileedit_passenger profileedit_passenger_passenger_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY profileedit_passenger
    ADD CONSTRAINT profileedit_passenger_passenger_id_fkey FOREIGN KEY (passenger_id) REFERENCES passenger(passenger_id);
 g   ALTER TABLE ONLY public.profileedit_passenger DROP CONSTRAINT profileedit_passenger_passenger_id_fkey;
       public       postgres    false    2377    189    196            �	           2606    25730 #   reckoning reckoning_account_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY reckoning
    ADD CONSTRAINT reckoning_account_id_fkey FOREIGN KEY (account_id) REFERENCES account(account_id);
 M   ALTER TABLE ONLY public.reckoning DROP CONSTRAINT reckoning_account_id_fkey;
       public       postgres    false    202    2401    204            �	           2606    25735 %   reckoning reckoning_supporter_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY reckoning
    ADD CONSTRAINT reckoning_supporter_id_fkey FOREIGN KEY (supporter_id) REFERENCES supporter(supporter_id);
 O   ALTER TABLE ONLY public.reckoning DROP CONSTRAINT reckoning_supporter_id_fkey;
       public       postgres    false    204    193    2383            w	           2606    25533    report report_driver_id_fkey    FK CONSTRAINT     w   ALTER TABLE ONLY report
    ADD CONSTRAINT report_driver_id_fkey FOREIGN KEY (driver_id) REFERENCES driver(driver_id);
 F   ALTER TABLE ONLY public.report DROP CONSTRAINT report_driver_id_fkey;
       public       postgres    false    197    2373    186            v	           2606    25528    report report_passenger_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY report
    ADD CONSTRAINT report_passenger_id_fkey FOREIGN KEY (passenger_id) REFERENCES passenger(passenger_id);
 I   ALTER TABLE ONLY public.report DROP CONSTRAINT report_passenger_id_fkey;
       public       postgres    false    197    189    2377            �	           2606    25827    request request_driver_id_fkey    FK CONSTRAINT     y   ALTER TABLE ONLY request
    ADD CONSTRAINT request_driver_id_fkey FOREIGN KEY (driver_id) REFERENCES driver(driver_id);
 H   ALTER TABLE ONLY public.request DROP CONSTRAINT request_driver_id_fkey;
       public       postgres    false    209    2373    186            �	           2606    25822 !   request request_passenger_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY request
    ADD CONSTRAINT request_passenger_id_fkey FOREIGN KEY (passenger_id) REFERENCES passenger(passenger_id);
 K   ALTER TABLE ONLY public.request DROP CONSTRAINT request_passenger_id_fkey;
       public       postgres    false    2377    209    189            
      x������ � �      
      x������ � �      
   T   x�3�L�K�H�IL�,K��L,.�4204�50�54P04�2��25�3155�0�2��MM�HIL!F�1gIjFQb^AbQ11�c���� ş$      
      x������ � �      
   �   x���K
�0���^�11mv�G7�N1�jI�BO��%))�j|0�|7�=�;rЅp�&��y揂B�j'b��晤'�C�D��5Z�Yx�!RdR��4��J֪J&�zC*�~N��{l��CK�5On��^��Go;�|R׫�3���i�      
      x������ � �      !
      x������ � �       
      x������ � �      
      x������ � �      
      x������ � �      
   ,   x�3�4�L��THLJL�,I�*�,��420��KL�H����� ��	�      
      x�3�L�2bc 6�=... ''W      #
      x������ � �      
   Y   x�3��())(�������,J�J�JMJ�ɴ4�4450�2B��K,�L����4���%�d�g��q �LP�r32�S3�8�A�b���� �
 |      "
      x������ � �      
      x�3�2�2�2����� �      
   �   x���A
�0�����ә�$6g$�P��$5��Յ=A?�7�1�rzi��qR��Y�,�?зC�6�ġxS�����qI׺f�{�K	}���n��/��Ա,�ZG�O�<K�#�����3c>'�V,      
      x������ � �      
      x������ � �      
   M   x�3�4���H���T����ORH��O�44�4204�50�54P04�22�22�35366�2�4�iIJL�h0ǣ>F��� V2      $
      x������ � �      
   [   x�]�;� D�z�b ~*�b3��  &�z+������C�cQf�֎:Yk��*=������&�4��u���FdMD�ɺG��g#"��'�     