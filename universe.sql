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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(255) NOT NULL,
    size_km double precision NOT NULL,
    type text,
    is_hazardous boolean DEFAULT false,
    orbit_period_years integer
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
    type character varying(100),
    age_million_years integer NOT NULL,
    number_of_stars integer,
    is_observable boolean DEFAULT true
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
    planet_id integer,
    type character varying(100),
    diameter_km double precision NOT NULL,
    orbital_period_days integer,
    is_icy boolean DEFAULT false
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
    star_id integer,
    type character varying(100),
    radius_km double precision NOT NULL,
    orbit_period_days integer,
    has_moons boolean DEFAULT false
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
    galaxy_id integer,
    type character varying(100),
    temperature_k integer NOT NULL,
    luminosity numeric(10,2),
    has_planets boolean DEFAULT true
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

INSERT INTO public.asteroid VALUES (1, 'Ceres', 940, 'Dwarf', false, 5);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 525, 'Main Belt', false, 4);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 512, 'Main Belt', false, 5);
INSERT INTO public.asteroid VALUES (4, 'Hygiea', 434, 'Main Belt', false, 6);
INSERT INTO public.asteroid VALUES (5, 'Eros', 16.8, 'Near-Earth', true, 2);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 13000, 100000000, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10000, 1000000000, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 3000, 100000000, true);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Spiral', 8000, 200000000, true);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 1500, 100000000, true);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'Elliptical', 10000, 1000000000, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 'Natural', 3474.8, 27, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 'Natural', 22.4, 0, true);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 'Natural', 12.4, 1, true);
INSERT INTO public.moon VALUES (4, 'Io', 3, 'Natural', 3642, 2, false);
INSERT INTO public.moon VALUES (5, 'Europa', 3, 'Natural', 3121.6, 4, true);
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, 'Natural', 5262.4, 7, true);
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 'Natural', 4820.6, 17, true);
INSERT INTO public.moon VALUES (8, 'Titan', 4, 'Natural', 5150, 16, true);
INSERT INTO public.moon VALUES (9, 'Rhea', 4, 'Natural', 1528.6, 5, true);
INSERT INTO public.moon VALUES (10, 'Dione', 4, 'Natural', 1123.6, 3, true);
INSERT INTO public.moon VALUES (11, 'Tethys', 4, 'Natural', 1062.2, 2, true);
INSERT INTO public.moon VALUES (12, 'Iapetus', 4, 'Natural', 1469.1, 79, true);
INSERT INTO public.moon VALUES (13, 'Enceladus', 4, 'Natural', 504.2, 1, true);
INSERT INTO public.moon VALUES (14, 'Miranda', 6, 'Natural', 471.6, 1, false);
INSERT INTO public.moon VALUES (15, 'Ariel', 6, 'Natural', 1169.6, 3, false);
INSERT INTO public.moon VALUES (16, 'Umbriel', 6, 'Natural', 584.7, 4, false);
INSERT INTO public.moon VALUES (17, 'Titania', 6, 'Natural', 1577.8, 9, false);
INSERT INTO public.moon VALUES (18, 'Oberon', 6, 'Natural', 761.4, 14, false);
INSERT INTO public.moon VALUES (19, 'Proteus', 6, 'Natural', 420, 1, false);
INSERT INTO public.moon VALUES (20, 'Nereid', 6, 'Natural', 340, 360, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 'Terrestrial', 6371, 365, true);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 'Terrestrial', 3389.5, 687, true);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 'Gas Giant', 69911, 4333, true);
INSERT INTO public.planet VALUES (4, 'Saturn', 1, 'Gas Giant', 58232, 10759, true);
INSERT INTO public.planet VALUES (5, 'Venus', 1, 'Terrestrial', 6051.8, 225, false);
INSERT INTO public.planet VALUES (6, 'Mercury', 1, 'Terrestrial', 2439.7, 88, false);
INSERT INTO public.planet VALUES (7, 'Gliese 581g', 4, 'Super-Earth', 1.3, 37, true);
INSERT INTO public.planet VALUES (8, 'Kepler-22b', 5, 'Exoplanet', 2.4, 290, true);
INSERT INTO public.planet VALUES (9, 'HD 209458 b', 4, 'Hot Jupiter', 1.3, 4, true);
INSERT INTO public.planet VALUES (10, 'WASP-12b', 5, 'Hot Jupiter', 1.8, 1, true);
INSERT INTO public.planet VALUES (11, '55 Cancri e', 3, 'Super-Earth', 1.6, 18, true);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1d', 6, 'Terrestrial', 1.1, 13, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 1, 'G-type', 5778, 1.00, true);
INSERT INTO public.star VALUES (2, 'Sirius A', 1, 'A-type', 9940, 25.40, true);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 'M-type', 3500, 10000.00, true);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 1, 'M-type', 3042, 0.00, true);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 1, 'G-type', 5790, 1.50, true);
INSERT INTO public.star VALUES (6, 'Alpha Centauri B', 1, 'K-type', 5260, 0.50, false);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 5, true);


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

