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
    name character varying(40),
    galaxy_type character varying(100),
    light_travel_time numeric(20,1) NOT NULL,
    num_stars_estimated numeric(30,0)
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
-- Name: greek_gods; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.greek_gods (
    greek_gods_id integer NOT NULL,
    name character varying(40) NOT NULL,
    power_level integer NOT NULL,
    myth text,
    planet_id integer NOT NULL
);


ALTER TABLE public.greek_gods OWNER TO postgres;

--
-- Name: greek_gods_god_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.greek_gods_god_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.greek_gods_god_id_seq OWNER TO postgres;

--
-- Name: greek_gods_god_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.greek_gods_god_id_seq OWNED BY public.greek_gods.greek_gods_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40),
    has_water boolean NOT NULL,
    orbital_period numeric(10,3) NOT NULL,
    planet_id integer
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
    name character varying(40) NOT NULL,
    description text,
    planet_types character varying(20),
    has_life boolean,
    star_id integer
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
    name character varying(40),
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(30,2),
    galaxy_id integer
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
-- Name: greek_gods greek_gods_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.greek_gods ALTER COLUMN greek_gods_id SET DEFAULT nextval('public.greek_gods_god_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Via Lactea', 'Espiral barrada', 0.0, 200000000000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Espiral', 2537000.5, 1000000000000);
INSERT INTO public.galaxy VALUES (3, 'M31', 'Espiral', 2537000.3, 1000000000000);
INSERT INTO public.galaxy VALUES (4, 'NGC 253', 'Espiral', 11400000.7, 200000000000);
INSERT INTO public.galaxy VALUES (5, 'M81', 'Espiral', 11800000.1, 250000000000);
INSERT INTO public.galaxy VALUES (6, 'Centauro A', 'Elíptica', 13000000.6, 100000000000);
INSERT INTO public.galaxy VALUES (7, 'M33', 'Espiral', 2700000.9, 40000000000);


--
-- Data for Name: greek_gods; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.greek_gods VALUES (1, 'Zeus', 100, 'God of the sky, lightning, and thunder. King of the gods.', 5);
INSERT INTO public.greek_gods VALUES (2, 'Ares', 85, 'God of war and bloodshed.', 4);
INSERT INTO public.greek_gods VALUES (4, 'Aphrodite', 90, 'Goddess of love, beauty, and desire.', 2);
INSERT INTO public.greek_gods VALUES (5, 'Hermes', 80, 'God of trade, travelers, and communication. Messenger of the gods.', 1);
INSERT INTO public.greek_gods VALUES (6, 'Eros', 85, 'God of love and desire, son of Aphrodite. Carries arrows that induce love or indifference.', 2);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', true, 29.530, 3);
INSERT INTO public.moon VALUES (2, 'Europa', true, 3.551, 5);
INSERT INTO public.moon VALUES (3, 'Ganymede', false, 7.155, 5);
INSERT INTO public.moon VALUES (4, 'Io', false, 1.769, 5);
INSERT INTO public.moon VALUES (5, 'Callisto', false, 16.689, 5);
INSERT INTO public.moon VALUES (6, 'Enceladus', true, 1.370, 6);
INSERT INTO public.moon VALUES (7, 'Phobos', false, 0.319, 4);
INSERT INTO public.moon VALUES (8, 'Deimos', false, 1.263, 4);
INSERT INTO public.moon VALUES (9, 'Himalia', false, 250.566, 5);
INSERT INTO public.moon VALUES (10, 'Elara', false, 259.652, 5);
INSERT INTO public.moon VALUES (11, 'Carme', false, 692.101, 5);
INSERT INTO public.moon VALUES (12, 'Titan', true, 15.945, 6);
INSERT INTO public.moon VALUES (13, 'Rhea', false, 4.518, 6);
INSERT INTO public.moon VALUES (14, 'Mimas', false, 0.942, 6);
INSERT INTO public.moon VALUES (15, 'Miranda', false, 1.413, 7);
INSERT INTO public.moon VALUES (16, 'Ariel', false, 2.520, 7);
INSERT INTO public.moon VALUES (17, 'Umbriel', false, 4.144, 7);
INSERT INTO public.moon VALUES (18, 'Triton', false, 5.877, 8);
INSERT INTO public.moon VALUES (19, 'Proteus', false, 1.122, 8);
INSERT INTO public.moon VALUES (20, 'Nereid', false, 360.136, 8);
INSERT INTO public.moon VALUES (21, 'Dione', false, 2.737, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Small and rocky planet closest to the sun', 'Terrestrial', false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Hot and dense atmosphere with active volcanoes', 'Terrestrial', false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Blue planet with abundant life and water', 'Terrestrial', true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Red planet with a thin atmosphere', 'Terrestrial', false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Largest planet with a strong magnetic field', 'Gas Giant', false, 2);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Known for its prominent ring system', 'Gas Giant', false, 2);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice giant with a tilted axis of rotation', 'Ice Giant', false, 3);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Blue ice giant with strong winds', 'Ice Giant', false, 3);
INSERT INTO public.planet VALUES (9, 'Proxima b', 'Rocky exoplanet orbiting Proxima Centauri', 'Terrestrial', true, 4);
INSERT INTO public.planet VALUES (10, 'Kepler-22b', 'Potentially habitable exoplanet', 'Super-Earth', true, 5);
INSERT INTO public.planet VALUES (11, 'Gliese 581g', 'Exoplanet in the habitable zone', 'Super-Earth', true, 6);
INSERT INTO public.planet VALUES (12, 'HD 209458 b', 'Hot Jupiter with a short orbital period', 'Gas Giant', false, 7);
INSERT INTO public.planet VALUES (13, '51 Pegasi b', 'First discovered exoplanet orbiting a Sun-like star', 'Gas Giant', false, 8);
INSERT INTO public.planet VALUES (14, 'Trappist-1e', 'Earth-sized planet in the habitable zone', 'Terrestrial', true, 4);
INSERT INTO public.planet VALUES (15, 'LHS 1140 b', 'Rocky super-Earth with dense atmosphere', 'Super-Earth', true, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 242, 8.60, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 10, 643.00, 2);
INSERT INTO public.star VALUES (3, 'Rigel', 8, 860.00, 3);
INSERT INTO public.star VALUES (4, 'Antares', 12, 550.00, 4);
INSERT INTO public.star VALUES (5, 'Vega', 455, 25.00, 5);
INSERT INTO public.star VALUES (6, 'Aldebaran', 6, 65.00, 6);
INSERT INTO public.star VALUES (7, 'Proxima Centauri', 5, 4.24, 1);
INSERT INTO public.star VALUES (8, 'Canopus', 27, 310.00, 7);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: greek_gods_god_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.greek_gods_god_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: greek_gods greek_gods_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.greek_gods
    ADD CONSTRAINT greek_gods_name_key UNIQUE (name);


--
-- Name: greek_gods greek_gods_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.greek_gods
    ADD CONSTRAINT greek_gods_pkey PRIMARY KEY (greek_gods_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: greek_gods fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.greek_gods
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: TABLE greek_gods; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.greek_gods TO freecodecamp;


--
-- Name: SEQUENCE greek_gods_god_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.greek_gods_god_id_seq TO freecodecamp;


--
-- PostgreSQL database dump complete
--

