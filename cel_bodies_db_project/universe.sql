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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    distance_to_earth integer NOT NULL,
    type character varying NOT NULL,
    age numeric(14,0) NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    planet_id integer NOT NULL,
    description text,
    resource character varying NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    star_id integer NOT NULL,
    num_of_moons numeric(5,0),
    bigger_than_earth boolean NOT NULL,
    habitable boolean NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: spaceship; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.spaceship (
    spaceship_id integer NOT NULL,
    name character varying NOT NULL,
    passengers integer NOT NULL
);


ALTER TABLE public.spaceship OWNER TO freecodecamp;

--
-- Name: spaceships_spaceship_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.spaceships_spaceship_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spaceships_spaceship_id_seq OWNER TO freecodecamp;

--
-- Name: spaceships_spaceship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.spaceships_spaceship_id_seq OWNED BY public.spaceship.spaceship_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    galaxy_id integer NOT NULL,
    distance_to_earth integer NOT NULL,
    type character varying NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: spaceship spaceship_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spaceship ALTER COLUMN spaceship_id SET DEFAULT nextval('public.spaceships_spaceship_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 2537000, 'Spiral', 10000000000);
INSERT INTO public.galaxy VALUES (2, 'Triangulum', 3000000, 'Spiral', 10000000000);
INSERT INTO public.galaxy VALUES (3, 'Messier 81', 11800000, 'Spiral', 10000000000);
INSERT INTO public.galaxy VALUES (4, 'Milky Way', 0, 'Spiral', 13600000000);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 23000000, 'Spiral', 10000000000);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 28000000, 'Spiral', 10000000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'Deimos', 12, 'Irregularly-shaped and smaller than Phobos', 'Water, Minerals, Refueling Station');
INSERT INTO public.moon VALUES (3, 'Io', 13, 'Most volcanically active body in the solar system', 'Sulfur, Silicate, Heat Energy');
INSERT INTO public.moon VALUES (5, 'Ganymede', 13, 'Largest moon in solar system and has a magnetic field', 'Water, Minerals');
INSERT INTO public.moon VALUES (6, 'Callisto', 13, 'Heavily-cratered and one of the oldest surfaces in the solar system', 'Water, Minerals, Potential Base');
INSERT INTO public.moon VALUES (8, 'Himalia', 13, 'One of jupiters largest irregular moons', 'Water, Rock');
INSERT INTO public.moon VALUES (10, 'Metis', 13, 'Jupiters innermost moon', 'Rock');
INSERT INTO public.moon VALUES (7, 'Amalthea', 13, 'Irregularly-shaped moon close to jupiter', 'Water, Rock');
INSERT INTO public.moon VALUES (12, 'Enceladus', 14, 'Small moon with geysers ejecting water', 'Water, Organic Compounds, Astrobiological Research');
INSERT INTO public.moon VALUES (13, 'Rhea', 14, 'Icy moon with cratered surface, rocky core surrounded by ice', 'Water, Rock');
INSERT INTO public.moon VALUES (14, 'Iapetus', 14, 'Two-tone surface (dark, and bright regions), and has unusual equatorial ridge', 'Water, Rock');
INSERT INTO public.moon VALUES (15, 'Mimas', 14, 'Small, heavily-cratered moon resembling death star due to its prominent herschel center', 'Water');
INSERT INTO public.moon VALUES (16, 'Titania', 15, 'Largest moon of uranus. Has canyon and fault lines', 'Water, Rock');
INSERT INTO public.moon VALUES (17, 'Oberon', 15, 'Heavily-cratered, with some craters filled potentially organic compounds', 'Water, Potential Organic Compounds');
INSERT INTO public.moon VALUES (19, 'Proteus', 16, 'Irregularly-shaped moon with heavily cratered surface', 'Water, Rock');
INSERT INTO public.moon VALUES (20, 'Charon', 17, 'Largest moon of pluto. Surface with mix of water ice and ammonia hydrates', 'Water, Ammonia');
INSERT INTO public.moon VALUES (4, 'Europa', 13, 'Icy moon with a subsurface ocean beneath icy surface', 'Water, Astrobiological Research');
INSERT INTO public.moon VALUES (9, 'Thebe', 13, 'Small inner moon with a reddish color', 'Silicate');
INSERT INTO public.moon VALUES (18, 'Triton', 16, 'Geologically active with cryovolcanoes, and has a retrograde orbit', 'Water, Nitrogen');
INSERT INTO public.moon VALUES (11, 'Titan', 14, 'Largest moon of saturn. Had liquid methane and ethane lakes', 'Water, Methane, Ethane, Hydrocarbons');
INSERT INTO public.moon VALUES (1, 'Phobos', 12, 'Large asteroid-like body, with surface grooves likely caused by tidal stress', 'Water, Minerals');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Kepler-90c', 12, 0, true, false);
INSERT INTO public.planet VALUES (1, 'Kepler-90b', 12, 0, true, false);
INSERT INTO public.planet VALUES (3, 'Kepler-90d', 12, 0, true, false);
INSERT INTO public.planet VALUES (4, 'Kepler-90e', 12, 0, true, false);
INSERT INTO public.planet VALUES (5, 'Kepler-90f', 12, 0, false, false);
INSERT INTO public.planet VALUES (6, 'Kepler-90g', 12, 0, true, false);
INSERT INTO public.planet VALUES (7, 'Kepler-90h', 12, 0, false, false);
INSERT INTO public.planet VALUES (8, 'Kepler90i', 12, 0, true, false);
INSERT INTO public.planet VALUES (9, 'Mercury', 7, 0, false, false);
INSERT INTO public.planet VALUES (10, 'Venus', 7, 0, false, false);
INSERT INTO public.planet VALUES (11, 'Earth', 7, 1, false, true);
INSERT INTO public.planet VALUES (12, 'Mars', 7, 2, false, false);
INSERT INTO public.planet VALUES (13, 'Jupiter', 7, 79, true, false);
INSERT INTO public.planet VALUES (14, 'Saturn', 7, 82, true, false);
INSERT INTO public.planet VALUES (15, 'Uranus', 7, 27, true, false);
INSERT INTO public.planet VALUES (16, 'Neptune', 7, 14, true, false);
INSERT INTO public.planet VALUES (17, 'Pluto (dwarf)', 7, 5, false, false);


--
-- Data for Name: spaceship; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.spaceship VALUES (1, 'U.S.S. Tesla', 150);
INSERT INTO public.spaceship VALUES (2, 'Sputnik II', 90);
INSERT INTO public.spaceship VALUES (3, 'Le Napolean', 50);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Mira (31)', 1, 2500000, 'Red Giant');
INSERT INTO public.star VALUES (2, 'NGC 206', 1, 2500000, 'Supergiant star cluster');
INSERT INTO public.star VALUES (3, 'Andromeda XI (M31)', 1, 2500000, 'Blue Giant');
INSERT INTO public.star VALUES (4, 'B 107 (M31)', 1, 2500000, 'Blue supergiant');
INSERT INTO public.star VALUES (5, 'HD 91943', 2, 3000000, 'B-type Main Sequence');
INSERT INTO public.star VALUES (6, 'GJ 1061', 2, 3000000, 'Red Dwarf');
INSERT INTO public.star VALUES (7, 'The Sun', 4, 0, 'G2V main-sequence');
INSERT INTO public.star VALUES (8, 'Sirius', 4, 9, 'A1V main-sequence');
INSERT INTO public.star VALUES (9, 'Betekgeuse', 4, 643, 'Red supergiant');
INSERT INTO public.star VALUES (10, 'M104-074', 6, 28000000, 'Elliptical');
INSERT INTO public.star VALUES (11, 'M104-73', 6, 28000000, 'Red giant');
INSERT INTO public.star VALUES (12, 'Kepler-90', 4, 2545, 'G-type main-sequence');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 17, true);


--
-- Name: spaceships_spaceship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.spaceships_spaceship_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: spaceship spaceships_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spaceship
    ADD CONSTRAINT spaceships_name_key UNIQUE (name);


--
-- Name: spaceship spaceships_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spaceship
    ADD CONSTRAINT spaceships_pkey PRIMARY KEY (spaceship_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


