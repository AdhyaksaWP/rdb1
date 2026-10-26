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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255),
    "Number of stars (bio)" integer,
    "Number of planets (bio)" integer,
    "Distance from earth (ly)" numeric(38,2) NOT NULL,
    "Description" text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: meteor; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.meteor (
    meteor_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text
);


ALTER TABLE public.meteor OWNER TO freecodecamp;

--
-- Name: meteor_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.meteor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.meteor_id_seq OWNER TO freecodecamp;

--
-- Name: meteor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.meteor_id_seq OWNED BY public.meteor.meteor_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255),
    "Has lifeform" boolean,
    "Distance from earth (km)" numeric(38,2) NOT NULL,
    "Description" text,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255),
    "Has lifeform" boolean,
    "Distance from earth (km)" numeric(38,2) NOT NULL,
    "Description" text,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255),
    "Distance from earth (ly)" numeric(38,2) NOT NULL,
    "Is part of constellation" boolean,
    "Description" text,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: meteor meteor_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.meteor ALTER COLUMN meteor_id SET DEFAULT nextval('public.meteor_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 400, 1000, 26000.00, 'Has earth in it');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1000, 1000, 2500000.00, 'Is a big wide open galaxy');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 40, 40, 2700000.00, 'Might actually be a triangle');
INSERT INTO public.galaxy VALUES (4, 'Ursa Major III', NULL, NULL, 33000.00, NULL);
INSERT INTO public.galaxy VALUES (5, 'Canis Major Dwarf Galaxy', NULL, NULL, 25000.00, NULL);
INSERT INTO public.galaxy VALUES (6, 'Draco II', NULL, NULL, 70100.00, NULL);


--
-- Data for Name: meteor; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.meteor VALUES (1, 'Ceres', NULL);
INSERT INTO public.meteor VALUES (2, 'Palas', NULL);
INSERT INTO public.meteor VALUES (3, 'Juno', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (21, 'Luna (The Moon)', NULL, 384400.00, 'Earths only natural satellite.', 3);
INSERT INTO public.moon VALUES (22, 'Phobos', NULL, 77790000.00, 'Larger and inner moon of Mars, heavily cratered.', 4);
INSERT INTO public.moon VALUES (23, 'Deimos', NULL, 77800000.00, 'Smaller and outer moon of Mars, smooth appearance.', 4);
INSERT INTO public.moon VALUES (24, 'Io', NULL, 628300000.00, 'Most volcanically active body in the Solar System.', 5);
INSERT INTO public.moon VALUES (25, 'Europa', NULL, 628300000.00, 'Has a smooth ice surface with a subsurface ocean.', 5);
INSERT INTO public.moon VALUES (26, 'Ganymede', NULL, 628300000.00, 'Largest moon in the Solar System, larger than Mercury.', 5);
INSERT INTO public.moon VALUES (27, 'Callisto', NULL, 628300000.00, 'Heavily cratered, ancient surface of ice and rock.', 5);
INSERT INTO public.moon VALUES (28, 'Amalthea', NULL, 628300000.00, 'Irregularly shaped third moon from Jupiter.', 5);
INSERT INTO public.moon VALUES (29, 'Himalia', NULL, 628300000.00, 'Largest irregular satellite of Jupiter.', 5);
INSERT INTO public.moon VALUES (30, 'Titan', NULL, 1275000000.00, 'Largest moon of Saturn with a thick atmosphere and liquid lakes.', 6);
INSERT INTO public.moon VALUES (31, 'Enceladus', NULL, 1275000000.00, 'Icy moon with active cryovolcanoes spewing water ice.', 6);
INSERT INTO public.moon VALUES (32, 'Mimas', NULL, 1275000000.00, 'Features a massive impact crater named Herschel.', 6);
INSERT INTO public.moon VALUES (33, 'Iapetus', NULL, 1275000000.00, 'Two-toned moon with one dark hemisphere and one bright.', 6);
INSERT INTO public.moon VALUES (34, 'Rhea', NULL, 1275000000.00, 'Second-largest moon of Saturn, heavily cratered.', 6);
INSERT INTO public.moon VALUES (35, 'Dione', NULL, 1275000000.00, 'Icy moon with bright ice cliffs on its surface.', 6);
INSERT INTO public.moon VALUES (36, 'Tethys', NULL, 1275000000.00, 'Composed almost entirely of water ice.', 6);
INSERT INTO public.moon VALUES (37, 'Miranda', NULL, 2723000000.00, 'Features extreme, patchwork geological terrain.', 7);
INSERT INTO public.moon VALUES (38, 'Ariel', NULL, 2723000000.00, 'Brightest and geologically youngest moon of Uranus.', 7);
INSERT INTO public.moon VALUES (39, 'Umbriel', NULL, 2723000000.00, 'Darkest of Uranus major moons.', 7);
INSERT INTO public.moon VALUES (40, 'Titania', NULL, 2723000000.00, 'Largest moon of Uranus with deep canyons.', 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, 91700000.00, 'Smallest and closest planet to the Sun.', 1);
INSERT INTO public.planet VALUES (2, 'Venus', false, 41400000.00, 'Hottest planet with a thick, toxic atmosphere.', 1);
INSERT INTO public.planet VALUES (3, 'Earth', true, 0.00, 'Third planet from the Sun and home to all known life.', 1);
INSERT INTO public.planet VALUES (4, 'Mars', false, 78300000.00, 'Known as the Red Planet due to iron oxide on its surface.', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, 628700000.00, 'Largest planet in the solar system with a Great Red Spot.', 1);
INSERT INTO public.planet VALUES (6, 'Saturn', false, 1275000000.00, 'Famous for its extensive and prominent ring system.', 1);
INSERT INTO public.planet VALUES (7, 'Uranus', false, 2723000000.00, 'Ice giant with a unique sideways tilt.', 1);
INSERT INTO public.planet VALUES (8, 'Neptune', false, 4351000000.00, 'Farthest known major planet with strong winds.', 1);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', false, 40140000000000.00, 'Exoplanet orbiting in the habitable zone of Proxima Centauri.', 2);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', false, 5487000000000000.00, 'Earth-sized exoplanet orbiting an M-dwarf star.', 3);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1e', false, 373700000000000.00, 'Earth-sized exoplanet in the TRAPPIST-1 system.', 4);
INSERT INTO public.planet VALUES (12, 'Gliese 667 Cc', false, 223200000000000.00, 'Super-Earth exoplanet orbiting within the habitable zone.', 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 0.00, false, 'Hot', 1);
INSERT INTO public.star VALUES (2, 'Sirius', 8.60, true, 'Brightest star in the night sky', 1);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 4.24, false, 'Closest known star to the Sun', 1);
INSERT INTO public.star VALUES (4, 'Alpha Centauri', 4.37, true, 'Triple star system', 1);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 642.00, true, 'Red supergiant star', 1);
INSERT INTO public.star VALUES (6, 'Andromeda Star', 2537000.00, false, 'Star located in the Andromeda Galaxy', 2);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 7, true);


--
-- Name: meteor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.meteor_id_seq', 3, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 40, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 16, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: meteor meteor_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.meteor
    ADD CONSTRAINT meteor_name UNIQUE (name);


--
-- Name: meteor meteor_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.meteor
    ADD CONSTRAINT meteor_pkey PRIMARY KEY (meteor_id);


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
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


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

