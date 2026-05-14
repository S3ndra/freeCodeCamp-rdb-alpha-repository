--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(255) NOT NULL,
    diameter_in_km integer NOT NULL,
    distance_from_earth numeric NOT NULL,
    composition text,
    is_metallic boolean NOT NULL,
    age_in_millions_of_years integer,
    is_dangerous boolean
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    num_of_stars integer NOT NULL,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean
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
    name character varying(255) NOT NULL,
    planet_id integer NOT NULL,
    diameter_in_km integer NOT NULL,
    age_in_millions_of_years integer,
    is_spherical boolean,
    description text,
    has_water boolean NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    star_id integer NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric NOT NULL,
    is_habitable boolean,
    has_water boolean NOT NULL,
    description text
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_millions_of_years integer,
    temperature numeric NOT NULL,
    has_life boolean,
    is_main_sequence boolean NOT NULL
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 946, 415, 'Rock and ice', false, 4600, false);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 525, 353, 'Silicate rock', false, 4600, true);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 582, 410, 'Silicate rock', false, 4600, false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13600, 100000000, 'The galaxy containing our solar system', true, false);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, 100000000, 'Nearest large galaxy to the Milky Way', false, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 8000, 40000000, 'Third largest galaxy in the local group', false, false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 7500, 100000000, 'A spiral galaxy in Canes Venatici', false, true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 12000, 80000000, 'Galaxy with a prominent dust lane', false, true);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 12500, 200000000, 'Elliptical galaxy with active nucleus', false, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 3474, 4600, true, 'Earth''s natural satellite', false);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22, 4600, false, 'Small moon of Mars', false);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12, 4600, false, 'Smaller moon of Mars', false);
INSERT INTO public.moon VALUES (4, 'Io', 5, 3643, 4600, true, 'Volcanic moon of Jupiter', false);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3122, 4600, true, 'Icy moon of Jupiter', true);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 5268, 4600, true, 'Largest moon in solar system', true);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4821, 4600, true, 'Second largest Galilean moon', false);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 5150, 4600, true, 'Largest moon of Saturn', true);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 504, 4600, true, 'Icy moon of Saturn', true);
INSERT INTO public.moon VALUES (10, 'Mimas', 6, 396, 4600, true, 'Small moon of Saturn', false);
INSERT INTO public.moon VALUES (11, 'Rhea', 6, 1527, 4600, true, 'Large moon of Saturn', false);
INSERT INTO public.moon VALUES (12, 'Iapetus', 6, 1469, 4600, true, 'Two-toned moon of Saturn', false);
INSERT INTO public.moon VALUES (13, 'Titania', 7, 1578, 4600, true, 'Largest moon of Uranus', false);
INSERT INTO public.moon VALUES (14, 'Oberon', 7, 1523, 4600, true, 'Second largest moon of Uranus', false);
INSERT INTO public.moon VALUES (15, 'Umbriel', 7, 1169, 4600, true, 'Dark moon of Uranus', false);
INSERT INTO public.moon VALUES (16, 'Ariel', 7, 1158, 4600, true, 'Brightest moon of Uranus', false);
INSERT INTO public.moon VALUES (17, 'Triton', 8, 2707, 4600, true, 'Largest moon of Neptune', true);
INSERT INTO public.moon VALUES (18, 'Proxima-Moon-1', 11, 2500, 3000, true, 'Moon around Proxima-1', true);
INSERT INTO public.moon VALUES (19, 'Proxima-Moon-2', 11, 1500, 3000, true, 'Second moon of Proxima-1', false);
INSERT INTO public.moon VALUES (20, 'Sirius-Moon-1', 9, 1200, 2000, true, 'Moon around Sirius-B1', false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 4600, 57.9, false, false, 'Smallest planet in solar system');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 4600, 108.2, false, false, 'Hottest planet');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 4600, 0, true, true, 'Our home planet');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 4600, 225, false, true, 'The red planet');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 4600, 778, false, false, 'Largest planet in solar system');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 4600, 1427, false, false, 'Planet with rings');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 4600, 2871, false, false, 'Ice giant');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 4600, 4495, false, false, 'Windy ice giant');
INSERT INTO public.planet VALUES (9, 'Sirius-B1', 2, 2000, 8.6, false, false, 'Planet orbiting Sirius');
INSERT INTO public.planet VALUES (10, 'Sirius-B2', 2, 2500, 8.6, false, true, 'Second planet of Sirius');
INSERT INTO public.planet VALUES (11, 'Proxima-1', 4, 3000, 4.24, true, true, 'Earth-like planet');
INSERT INTO public.planet VALUES (12, 'Proxima-2', 4, 3500, 4.24, false, false, 'Rocky planet near Proxima');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4600, 5778, true, true);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 230, 10000, false, true);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 10000, 3500, false, false);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 1, 4900, 3042, false, true);
INSERT INTO public.star VALUES (5, 'Alpheratz', 2, 300, 13000, false, true);
INSERT INTO public.star VALUES (6, 'Almaaz', 3, 2000, 4500, false, true);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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

