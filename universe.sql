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
    name character varying(255) NOT NULL,
    galaxy_types text,
    is_visible_to_naked_eye boolean,
    description text
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
    radius_in_km integer,
    has_water boolean,
    planet_id integer NOT NULL
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
    planet_types text,
    has_life boolean,
    star_id integer NOT NULL
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
-- Name: satellite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellite (
    satellite_id integer NOT NULL,
    name character varying(255) NOT NULL,
    year_launched integer,
    distance_from_earth numeric(10,2),
    planet_id integer NOT NULL
);


ALTER TABLE public.satellite OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellite_satellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellite_satellite_id_seq OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellite_satellite_id_seq OWNED BY public.satellite.satellite_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    distance_from_earth numeric(10,2),
    brightness_of_star numeric(10,3),
    galaxy_id integer NOT NULL
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

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: satellite satellite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite ALTER COLUMN satellite_id SET DEFAULT nextval('public.satellite_satellite_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way Galaxy', 'barred spiral galaxy', true, 'This galaxy is our home galaxy and is part of the Local Group of three large galaxies along with smaller galaxies');
INSERT INTO public.galaxy VALUES (2, 'Canis Major Dwarf Galaxy', 'Irregular Galaxy', false, 'It is the closest galaxy from the Milky Way with a distance of about 25,000 light-years from our Solar System.');
INSERT INTO public.galaxy VALUES (3, 'Segue 1', 'dwarf spheroidal galaxy', true, 'This galaxy is noticably elongated is attributed possible tidal forces caused by the Milky Way Galaxy');
INSERT INTO public.galaxy VALUES (4, 'Sag DEG', 'elliptical loop-shaped satellite galaxy', false, 'It has passed through the core of the Milky Way several times in the past.');
INSERT INTO public.galaxy VALUES (5, 'Bardnard''s Galaxy', 'Irregular barred spiral galaxy', true, 'The galaxy is known for being the one where cephid variables were used to know how far away it was from us.');
INSERT INTO public.galaxy VALUES (6, 'Andromeda Galaxy', 'Spiral galaxy', true, 'It is the nearest spiral galaxy to us and is sometimes called M31.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon (Luna)', 1738, true, 3);
INSERT INTO public.moon VALUES (2, 'Titan', 2576, true, 6);
INSERT INTO public.moon VALUES (3, 'Europa', 1561, true, 5);
INSERT INTO public.moon VALUES (4, 'Ganymede', 2634, true, 5);
INSERT INTO public.moon VALUES (5, 'Enceladus', 252, true, 6);
INSERT INTO public.moon VALUES (6, 'Triton', 1353, true, 8);
INSERT INTO public.moon VALUES (7, 'Callisto', 2410, true, 5);
INSERT INTO public.moon VALUES (8, 'Io', 1822, true, 5);
INSERT INTO public.moon VALUES (9, 'Rhea', 764, true, 6);
INSERT INTO public.moon VALUES (10, 'Dione', 561, true, 6);
INSERT INTO public.moon VALUES (11, 'Tethys', 531, true, 6);
INSERT INTO public.moon VALUES (12, 'Charon', 606, true, 11);
INSERT INTO public.moon VALUES (13, 'Ariel', 579, true, 7);
INSERT INTO public.moon VALUES (14, 'Umbriel', 585, true, 7);
INSERT INTO public.moon VALUES (15, 'Miranda', 236, true, 7);
INSERT INTO public.moon VALUES (16, 'Titania', 789, true, 7);
INSERT INTO public.moon VALUES (17, 'Oberon', 761, true, 7);
INSERT INTO public.moon VALUES (18, 'Iapetus', 736, true, 6);
INSERT INTO public.moon VALUES (19, 'Hyperion', 135, false, 6);
INSERT INTO public.moon VALUES (20, 'Phobos', 11, false, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Terrestrial planet', false, 6);
INSERT INTO public.planet VALUES (2, 'Venus', 'Terrestrial planet', false, 6);
INSERT INTO public.planet VALUES (3, 'Earth', 'Terrestrial planet', true, 6);
INSERT INTO public.planet VALUES (4, 'Mars', 'Terrestrial planet', false, 6);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas giant', false, 6);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas giant', false, 6);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice giant', false, 6);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Ice giant', false, 6);
INSERT INTO public.planet VALUES (9, 'Ceres', 'Dwarf planet', false, 6);
INSERT INTO public.planet VALUES (10, 'Orcus', 'Dwarf planet', false, 6);
INSERT INTO public.planet VALUES (11, 'Pluto', 'Dwarf planet', false, 6);
INSERT INTO public.planet VALUES (12, 'Haumea', 'Dwarf planet', false, 6);
INSERT INTO public.planet VALUES (13, 'Quaoar', 'Dwarf planet', false, 6);
INSERT INTO public.planet VALUES (14, 'Makemake', 'Dwarf planet', false, 6);
INSERT INTO public.planet VALUES (15, 'Gonggong', 'Dwarf planet', false, 6);
INSERT INTO public.planet VALUES (16, 'Eris', 'Dwarf planet', false, 6);
INSERT INTO public.planet VALUES (17, 'Sedna', 'Trans-Neptunian object', false, 6);
INSERT INTO public.planet VALUES (18, 'Salacia', 'Trans-Neptunian object', false, 6);
INSERT INTO public.planet VALUES (19, 'Varda', 'Trans-Neptunian object', false, 6);


--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellite VALUES (1, 'Hubble Space Telescope', 1990, 547.00, 3);
INSERT INTO public.satellite VALUES (2, 'International Space Station (ISS)', 1998, 420.00, 3);
INSERT INTO public.satellite VALUES (3, 'Terra', 1999, 705.00, 3);
INSERT INTO public.satellite VALUES (4, 'Aqua', 2002, 705.00, 3);
INSERT INTO public.satellite VALUES (5, 'Landsat 7', 1999, 705.00, 3);
INSERT INTO public.satellite VALUES (6, 'Mars Reconnaissance Orbiter (MRO)', 2005, 400.00, 4);
INSERT INTO public.satellite VALUES (7, 'Juno', 2011, 8000.00, 5);
INSERT INTO public.satellite VALUES (8, 'Cassini', 1997, 1500000.00, 6);
INSERT INTO public.satellite VALUES (9, 'Galileo', 1989, 8000.00, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Proxima Centauri', 4.24, 11.050, 1);
INSERT INTO public.star VALUES (2, 'Kepler-90', 2545.00, 14.000, 1);
INSERT INTO public.star VALUES (3, 'Vega', 25.00, 0.030, 1);
INSERT INTO public.star VALUES (4, 'Barnard''s Star', 5.96, 9.530, 1);
INSERT INTO public.star VALUES (5, 'Sirius', 8.60, 1.460, 1);
INSERT INTO public.star VALUES (6, 'Sun', 0.00, 26.740, 1);
INSERT INTO public.star VALUES (7, 'Sadalsuud', 540.00, 2.870, 1);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 19, true);


--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellite_satellite_id_seq', 9, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: satellite satellite_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_name_key UNIQUE (name);


--
-- Name: satellite satellite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_pkey PRIMARY KEY (satellite_id);


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
-- Name: satellite satellite_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

