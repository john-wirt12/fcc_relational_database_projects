--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE usernames;
--
-- Name: usernames; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE usernames WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE usernames OWNER TO freecodecamp;

\connect usernames

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
-- Name: usernames; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.usernames (
    username character varying(22),
    best_score integer,
    games_played integer
);


ALTER TABLE public.usernames OWNER TO freecodecamp;

--
-- Data for Name: usernames; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.usernames VALUES ('user_1736851802660', 952, 2);
INSERT INTO public.usernames VALUES ('user_1736851802661', 484, 5);
INSERT INTO public.usernames VALUES ('a', 0, 0);
INSERT INTO public.usernames VALUES ('user_1736851950873', 291, 2);
INSERT INTO public.usernames VALUES ('user_1736851950874', 192, 5);
INSERT INTO public.usernames VALUES ('asdf', 1, 3);
INSERT INTO public.usernames VALUES ('user_1736852050749', 1, 2);
INSERT INTO public.usernames VALUES ('user_1736852050750', 69, 5);
INSERT INTO public.usernames VALUES ('user_1736852135464', 600, 2);
INSERT INTO public.usernames VALUES ('user_1736852135465', 52, 5);


--
-- PostgreSQL database dump complete
--


