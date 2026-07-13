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
-- Name: civilization; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.civilization (
    civilization_id integer NOT NULL,
    name character varying(30) NOT NULL,
    occupied_planets integer,
    occupied_systems integer,
    description text
);


ALTER TABLE public.civilization OWNER TO freecodecamp;

--
-- Name: civilization_civilization_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.civilization_civilization_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.civilization_civilization_id_seq OWNER TO freecodecamp;

--
-- Name: civilization_civilization_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.civilization_civilization_id_seq OWNED BY public.civilization.civilization_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_count integer,
    planet_count integer,
    age_in_millions_of_years numeric(10,2),
    description text,
    has_life boolean,
    controlled_by_goauld boolean
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
    name character varying(30) NOT NULL,
    radius integer,
    weight integer,
    age_in_millions_of_years numeric(10,2),
    description text,
    has_life boolean,
    controlled_by_goauld boolean,
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
    name character varying(30) NOT NULL,
    weight integer,
    radius integer,
    age_in_millions_of_years numeric(10,2),
    description text,
    has_life boolean,
    controlled_by_goauld boolean,
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
    name character varying(30) NOT NULL,
    radius integer,
    weight integer,
    age_in_millions_of_years numeric(10,2),
    description text,
    has_life boolean,
    controlled_by_goauld boolean,
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
-- Name: civilization civilization_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.civilization ALTER COLUMN civilization_id SET DEFAULT nextval('public.civilization_civilization_id_seq'::regclass);


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
-- Data for Name: civilization; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.civilization VALUES (1, 'Goa''uld', 1000, 500, 'The Goa''uld are an aquatic species of symbiotes from the planet P3X-888 in the Milky Way galaxy. They take over host bodies and control them completely. Most Goa''uld are extremely egomaniacal due to their genetic memory and can live for thousands of years.');
INSERT INTO public.civilization VALUES (2, 'Ancients', 500, 100, 'The Ancients were one of the most advanced civilizations in the universe. They created the Stargate network and later ascended to a higher plane of existence. They originated from the Alterans and inhabited many galaxies including the Milky Way and Pegasus Galaxy.');
INSERT INTO public.civilization VALUES (3, 'Asgard', 100, 50, 'The Asgard were an advanced alien civilization from the Ida Galaxy. They protected humans from the Goa''uld and possessed highly advanced technology including powerful spacecraft, cloning technology, and energy weapons.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'milky_way', 200, 200, 13600.00, 'Home to Earth (Tau''ri), the Goa''uld empire, the Tok''ra, and the Nox. It was the original home of the Alterans (Ancients) before they built the Stargate network.', true, true);
INSERT INTO public.galaxy VALUES (2, 'Ida', 4, 32, 23600.00, ' The home of the highly advanced, Asgard civilization. SG-1 travels here to help the Asgard fight off the relentless Replicator invasion..', true, false);
INSERT INTO public.galaxy VALUES (3, 'Pegasus', 50, 1000, 50600.00, '  Featured extensively in the spin-off Stargate: Atlantis, this galaxy is 3 million light-years from the Milky Way. It was the second home of the Ancients and the birthplace of the Wraith and the Asuran Replicators.', true, false);
INSERT INTO public.galaxy VALUES (4, 'Alteran', 1000, 100000, 60.00, ' The distant, original home of the Alterans and their zealous, ascended counterparts, the Ori. This galaxy is the focal point of the final seasons of SG-1 and the movie Stargate.', true, false);
INSERT INTO public.galaxy VALUES (5, 'Kaliam', 1000, 100000, 60.00, ' Kaliam is a galaxy known by the Tauri on the other side of the known universe.', true, true);
INSERT INTO public.galaxy VALUES (6, 'Andromeda', 300, 1000, 6000.00, ' Andromeda is a galaxy known by the Tauri. It is the largest galaxy in the Local Group, both in size and number of stars, twice as many as the Milky Way. Andromeda has 11 satellite galaxies, including Pegasus.', true, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'edfu', 1, 1, 4500.00, 'Edfu was a moon orbiting a planet in the Abydos system.', false, true, 1);
INSERT INTO public.moon VALUES (2, 'dja''net', 1, 1, 4500.00, 'Dja''Net was a moon orbiting a planet in the Abydos system.', false, true, 1);
INSERT INTO public.moon VALUES (3, 'nuturo', 1, 1, 4500.00, 'Nuturo was a moon orbiting a planet in the Abydos system.', false, true, 1);
INSERT INTO public.moon VALUES (4, 'jerbaas', 1, 1, 5000.00, 'Jerbaas was a moon orbiting the planet Chulak in the Milky Way Galaxy.', false, true, 2);
INSERT INTO public.moon VALUES (5, 'adara_ii_moon', 1, 1, 5000.00, 'A moon orbiting Adara II, the second planet of the Adara system where the Asgard Heimdall operated a hidden research facility.', false, false, 3);
INSERT INTO public.moon VALUES (6, 'archeva_i_moon', 1, 1, 5000.00, 'A moon orbiting Archeva I in the Archeva system of the Milky Way Galaxy.', false, true, 4);
INSERT INTO public.moon VALUES (7, 'ida_i_moon', 1, 1, 8000.00, 'A moon orbiting Ida I in the Ida system, located in the home galaxy of the Asgard civilization.', false, false, 5);
INSERT INTO public.moon VALUES (8, 'ida_ii_moon', 1, 1, 8000.00, 'A moon orbiting Ida II in the Ida system, located in the home galaxy of the Asgard civilization.', false, false, 6);
INSERT INTO public.moon VALUES (9, 'alteran_i_moon', 1, 1, 10000.00, 'A moon orbiting Alteran I in the Alteran Home Galaxy, the original home galaxy of the Ancients and Ori.', false, false, 7);
INSERT INTO public.moon VALUES (10, 'alteran_ii_moon', 1, 1, 10000.00, 'A moon orbiting Alteran II in the Alteran Home Galaxy, connected to the history of the Alterans.', false, false, 8);
INSERT INTO public.moon VALUES (11, 'andromeda_world_1_moon', 1, 1, 8000.00, 'A moon orbiting a planet in the Andromeda Galaxy. No known civilizations or Stargate activity were confirmed on this moon in Stargate SG-1.', false, false, 9);
INSERT INTO public.moon VALUES (12, 'andromeda_world_2_moon', 1, 1, 8000.00, 'A moon orbiting a planet in the Andromeda Galaxy. No known civilizations or Stargate activity were confirmed on this moon in Stargate SG-1.', false, false, 10);
INSERT INTO public.moon VALUES (13, 'kaliam_i_moon', 1, 1, 7000.00, 'A moon orbiting Kaliam I in the Kaliam system. No known life or Stargate activity was confirmed in Stargate SG-1.', false, false, 11);
INSERT INTO public.moon VALUES (14, 'kaliam_ii_moon', 1, 1, 7000.00, 'A moon orbiting Kaliam II in the Kaliam system. No known life or Stargate activity was confirmed in Stargate SG-1.', false, false, 12);
INSERT INTO public.moon VALUES (15, 'pegasus_i_moon', 1, 1, 5000.00, 'A moon orbiting Pegasus I in the Pegasus Galaxy. The moon was part of a system explored by the Ancients and later civilizations.', false, false, 13);
INSERT INTO public.moon VALUES (16, 'pegasus_ii_moon', 1, 1, 5000.00, 'A moon orbiting Pegasus II in the Pegasus Galaxy. The region was affected by the history of the Ancients and the Wraith.', false, false, 14);
INSERT INTO public.moon VALUES (17, 'elysia', 1, 1, 10000.00, 'Elysia was a moon orbiting Alteran I in the Alteran Home Galaxy, part of the ancient worlds connected to the history of the Alterans.', false, false, 7);
INSERT INTO public.moon VALUES (18, 'orionis', 1, 1, 10000.00, 'Orionis was a moon orbiting Alteran I. Its surface contained ancient geological formations dating back to the early history of the Alterans.', false, false, 7);
INSERT INTO public.moon VALUES (19, 'caelora', 1, 1, 10000.00, 'Caelora was a moon of Alteran I located in the Alteran Home Galaxy. No known civilizations inhabited this moon.', false, false, 7);
INSERT INTO public.moon VALUES (20, 'valoria', 1, 1, 10000.00, 'Valoria was a moon orbiting Alteran I. It remained an uninhabited natural satellite of the planet.', false, false, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'abydos', 1, 1, 4500.00, 'Abydos was the first planet reached through Earth''s Stargate program and was considered one of the first worlds the Goa''uld brought humans to. When this desert world was under the domain of Ra, he forced the human inhabitants to mine naquadah for him up until his eventual defeat and death.', true, true, 1);
INSERT INTO public.planet VALUES (2, 'chulak', 1, 1, 5000.00, 'Chulak was a planet in the Chulak system in the Milky Way Galaxy. It was the homeworld of the Jaffa and the domain of the Goa''uld System Lord Apophis.', true, true, 2);
INSERT INTO public.planet VALUES (3, 'adara_ii', 100, 50000, 5000.00, 'The second planet of the Adara system was a gaseous planet used by the Asgard Heimdall as a hidden research facility. Its atmosphere concealed the laboratory from the Goa''uld and kept it away from the path of the Replicators.', false, false, 1);
INSERT INTO public.planet VALUES (4, 'archeva_i', 1, 1, 5000.00, 'Archeva I was a planet in the Archeva star system in the Milky Way Galaxy, where Ba''al was spotted after the Battle of Dakara.', false, true, 3);
INSERT INTO public.planet VALUES (5, 'ida_i', 1, 1, 8000.00, 'Ida I was a planet in the Ida system, located in the home galaxy of the Asgard civilization.', false, false, 5);
INSERT INTO public.planet VALUES (6, 'ida_ii', 1, 1, 8000.00, 'Ida II was a planet in the Ida system, located in the home galaxy of the Asgard civilization.', true, false, 5);
INSERT INTO public.planet VALUES (7, 'alteran_i', 1, 1, 10000.00, 'Alteran I was a planet located in the Alteran Home Galaxy, the original home galaxy of the Ancients and Ori.', false, false, 6);
INSERT INTO public.planet VALUES (8, 'alteran_ii', 1, 1, 10000.00, 'Alteran II was a planet located in the Alteran Home Galaxy, connected to the ancient history of the Alterans before their migration.', true, false, 6);
INSERT INTO public.planet VALUES (9, 'andromeda_world_1', 1, 1, 8000.00, 'A planet located in the Andromeda Galaxy. The galaxy was mentioned in Stargate SG-1 as one of the distant galaxies beyond the Milky Way.', false, false, 7);
INSERT INTO public.planet VALUES (10, 'andromeda_world_2', 1, 1, 8000.00, 'A planet located in the Andromeda Galaxy. No Stargate or known civilizations were confirmed on this world in Stargate SG-1.', false, false, 7);
INSERT INTO public.planet VALUES (11, 'kaliam_i', 1, 1, 7000.00, 'Kaliam I was a planet located in the Kaliam system in the Milky Way region. The system is known from Stargate lore, but no detailed planetary information was revealed in Stargate SG-1.', false, false, 8);
INSERT INTO public.planet VALUES (12, 'kaliam_ii', 1, 1, 7000.00, 'Kaliam II was a planet located in the Kaliam system. No confirmed Stargate, civilizations, or Goa''uld occupation were documented in Stargate SG-1.', false, false, 8);
INSERT INTO public.planet VALUES (13, 'pegasus_i', 1, 1, 5000.00, 'Pegasus I was a planet located in the Pegasus Galaxy. The galaxy was explored by the Atlantis expedition and was once inhabited by the Ancients.', false, false, 9);
INSERT INTO public.planet VALUES (14, 'pegasus_ii', 1, 1, 5000.00, 'Pegasus II was a planet located in the Pegasus Galaxy. The galaxy contained many human worlds seeded by the Ancients and was threatened by the Wraith.', true, false, 9);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'nut', 1, 1, 4600.00, 'Nut was a spectral class G4 main sequence star. It was the sun that the planet Abydos orbited. An Abydonian day lasted 36 hours and a year took 242 days.', true, true, 1);
INSERT INTO public.star VALUES (2, 'chaapori', 1, 1, 5000.00, 'Chaapa''ri was the star orbited by the planet Chulak. It was the home system of the Goa''uld System Lord Apophis and the Jaffa who served him.', true, true, 1);
INSERT INTO public.star VALUES (3, 'adara', 1, 1, 5000.00, 'Adara was the star of the Adara system in the Milky Way. The second planet of this system was used by the Asgard Heimdall as a hidden research facility to study an Asgard ancestor.', false, false, 1);
INSERT INTO public.star VALUES (4, 'archeva', 1, 1, 5000.00, 'Archeva was the star of a star system in the Milky Way Galaxy. The system was where Ba''al was spotted after the Battle of Dakara.', false, true, 1);
INSERT INTO public.star VALUES (5, 'ida_star', 1, 1, 8000.00, 'A star located in the Ida galaxy, home galaxy of the Asgard civilization.', true, false, 2);
INSERT INTO public.star VALUES (6, 'alteran_home_star', 1, 1, 10000.00, 'A star located in the Alteran Home Galaxy, the original home galaxy of the Ancients and Ori before their departure.', true, false, 4);
INSERT INTO public.star VALUES (7, 'andromeda_star', 1, 1, 8000.00, 'A star located in the Andromeda Galaxy, one of the major galaxies of the Local Group.', true, false, 6);
INSERT INTO public.star VALUES (8, 'kaliam_star', 1, 1, 7000.00, 'A star located in the Kaliam Galaxy.', true, false, 5);
INSERT INTO public.star VALUES (9, 'pegasus_star', 1, 1, 6000.00, 'A star located in the Pegasus Galaxy, home of the Ancients and many human civilizations.', true, false, 3);


--
-- Name: civilization_civilization_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.civilization_civilization_id_seq', 3, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: civilization civilization_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.civilization
    ADD CONSTRAINT civilization_name_key UNIQUE (name);


--
-- Name: civilization civilization_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.civilization
    ADD CONSTRAINT civilization_pkey PRIMARY KEY (civilization_id);


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

