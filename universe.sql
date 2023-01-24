--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: discoverer; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.discoverer (
    name character varying(60) NOT NULL,
    nationality character(60) NOT NULL,
    discoverer_id integer NOT NULL
);


ALTER TABLE public.discoverer OWNER TO freecodecamp;

--
-- Name: discoverer_discoverer_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.discoverer_discoverer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discoverer_discoverer_id_seq OWNER TO freecodecamp;

--
-- Name: discoverer_discoverer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.discoverer_discoverer_id_seq OWNED BY public.discoverer.discoverer_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    diameter_in_light_years integer,
    discoverer text,
    discovering_date date,
    distance_to_earth_light_years numeric,
    galaxy_type text
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
    name character varying(60),
    planet_id integer,
    discoverer character(60) NOT NULL,
    discovery_date date
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
    name character varying(60),
    star_id integer,
    orbital_radius_in_au numeric NOT NULL,
    orbital_period_in_days numeric NOT NULL,
    has_moons boolean,
    existence_of_moons_known boolean
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
    name character varying(60) NOT NULL,
    galaxy_id integer NOT NULL,
    constellation character varying(60) NOT NULL,
    luminosity integer NOT NULL
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
-- Name: discoverer discoverer_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.discoverer ALTER COLUMN discoverer_id SET DEFAULT nextval('public.discoverer_discoverer_id_seq'::regclass);


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
-- Data for Name: discoverer; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.discoverer VALUES ('Galilei, Galileo', 'Italian                                                     ', 1);
INSERT INTO public.discoverer VALUES ('Herschel, William', 'British                                                     ', 2);
INSERT INTO public.discoverer VALUES ('Méchain, Pierre', 'France                                                      ', 3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Sombrero', 50000, 'Pierre Méchain', '1781-05-11', 29000000, 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Eye of Sauron', 85000, 'William Herschel', '1787-03-17', 52000000, 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Whirlpool Galaxy', 76900, 'Charles Messier', '1773-10-13', 31000000, 'Spiral');
INSERT INTO public.galaxy VALUES (4, 'Triangulum Galaxy', 61100, 'Giovanni Battista Hodierna', '1654-01-01', 2730000, 'Spiral');
INSERT INTO public.galaxy VALUES (5, 'Hoag''s Object', 121000, 'Arthur Hoag', '1950-01-01', 612800000, 'Ring');
INSERT INTO public.galaxy VALUES (6, 'Andromeda Galaxy', 152000, 'Abd al-Rahman al-Sufi', '0964-01-01', 2500000, 'Spiral');
INSERT INTO public.galaxy VALUES (7, 'Milky Way', 82700, 'Galileo Galilei', '1610-01-01', 0, 'Spiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Ariel', 7, 'Lassell, William                                            ', '1851-10-24');
INSERT INTO public.moon VALUES (2, 'Belinda', 7, 'Voyager 2                                                   ', '1986-01-13');
INSERT INTO public.moon VALUES (4, 'Bianca', 7, 'Voyager 2                                                   ', '1986-01-23');
INSERT INTO public.moon VALUES (3, 'Caliban', 7, 'Gladman, B./ Nicholson, P./ Burns, J.A./ Kavelaars, J.      ', '1997-09-06');
INSERT INTO public.moon VALUES (5, 'Cordelia', 7, 'Voyager 2                                                   ', '1986-01-20');
INSERT INTO public.moon VALUES (6, 'Cressida', 7, 'Voyager 2                                                   ', '1986-01-09');
INSERT INTO public.moon VALUES (7, 'Cupid', 7, 'Showalter, M.R./ Lissauer, J.J.                             ', '2003-08-25');
INSERT INTO public.moon VALUES (8, 'Desdemona', 7, 'Voyager 2                                                   ', '1986-01-13');
INSERT INTO public.moon VALUES (9, 'Ferdinand', 7, 'Milisalvjevic, D./ Holman, M. J./ Kavelaars, J.J./ Grav, T. ', '2001-08-13');
INSERT INTO public.moon VALUES (10, 'Moon', 10, 'NA                                                          ', '0001-01-01');
INSERT INTO public.moon VALUES (11, 'Triton', 8, 'Lassell, William                                            ', '1846-10-10');
INSERT INTO public.moon VALUES (12, 'Proteus', 8, 'Voyager 2                                                   ', '1989-01-01');
INSERT INTO public.moon VALUES (13, 'Aegaeon', 4, 'Cassini scientists                                          ', '2008-08-15');
INSERT INTO public.moon VALUES (14, 'Enceladus', 4, 'Herschel, William                                           ', '1789-08-28');
INSERT INTO public.moon VALUES (15, 'Titan', 4, 'Huygens, Christiaan                                         ', '1655-03-25');
INSERT INTO public.moon VALUES (16, 'Oberon', 7, 'Herschel, William                                           ', '1787-01-11');
INSERT INTO public.moon VALUES (17, 'Phobos', 9, 'Hall, Asaph                                                 ', '1877-08-17');
INSERT INTO public.moon VALUES (18, 'Deimos', 9, 'Hall, Asaph                                                 ', '1877-08-11');
INSERT INTO public.moon VALUES (19, 'Io', 3, 'Galilei, Galileo                                            ', '1610-12-08');
INSERT INTO public.moon VALUES (20, 'Europa', 3, 'Galilei, Galileo                                            ', '1610-01-01');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, '55 Cancri e', 5, 0.01544, 0.7, false, false);
INSERT INTO public.planet VALUES (3, 'Jupiter', 4, 5.2, 4328.9, true, true);
INSERT INTO public.planet VALUES (4, 'Saturn', 4, 9.5, 10749.25, true, true);
INSERT INTO public.planet VALUES (1, '55 Cancri b', 5, 0.1134, 14.7, false, false);
INSERT INTO public.planet VALUES (5, 'Merkury', 4, 0.4, 32120, false, true);
INSERT INTO public.planet VALUES (6, 'Venus', 4, 0.7, 82125, false, true);
INSERT INTO public.planet VALUES (7, 'Uranus', 4, 19.8, 30660, true, true);
INSERT INTO public.planet VALUES (8, 'Neptune', 4, 30.1, 60155.65, true, true);
INSERT INTO public.planet VALUES (9, 'Mars', 4, 1.5, 686.2, true, true);
INSERT INTO public.planet VALUES (10, 'Earth', 4, 1, 365.25, true, true);
INSERT INTO public.planet VALUES (12, 'Haumea', 4, 43, 104025, true, true);
INSERT INTO public.planet VALUES (11, 'Pluto', 4, 39, 90844.85, true, true);
INSERT INTO public.planet VALUES (13, 'Makemake', 4, 45.8, 111325, true, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Antares', 7, 'Scorpius', 75900);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 7, 'Orion', 126000);
INSERT INTO public.star VALUES (3, 'Pistol Star', 7, 'Sagittarius', 3300000);
INSERT INTO public.star VALUES (4, 'Sun', 7, 'NA', 1);
INSERT INTO public.star VALUES (5, '55 Cancri A', 7, 'Cancer', 0);
INSERT INTO public.star VALUES (6, '55 Cancri B', 7, 'NA', 0);


--
-- Name: discoverer_discoverer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.discoverer_discoverer_id_seq', 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 2, true);


--
-- Name: discoverer discoverer_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.discoverer
    ADD CONSTRAINT discoverer_name_key UNIQUE (name);


--
-- Name: discoverer discoverer_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.discoverer
    ADD CONSTRAINT discoverer_pkey PRIMARY KEY (discoverer_id);


--
-- Name: galaxy galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id UNIQUE (galaxy_id);


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
-- Name: galaxy name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name UNIQUE (name);


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
