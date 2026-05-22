--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE cristiano;
ALTER ROLE cristiano WITH NOSUPERUSER INHERIT NOCREATEROLE CREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'md5775ede999a1f1f5c00971b9f90962066' VALID UNTIL 'infinity';
CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;






--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.18 (Ubuntu 12.18-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.18 (Ubuntu 12.18-0ubuntu0.20.04.1)

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

--
-- PostgreSQL database dump complete
--

--
-- Database "bluebox" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.18 (Ubuntu 12.18-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.18 (Ubuntu 12.18-0ubuntu0.20.04.1)

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

--
-- Name: bluebox; Type: DATABASE; Schema: -; Owner: cristiano
--

CREATE DATABASE bluebox WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'pt_BR.UTF-8' LC_CTYPE = 'pt_BR.UTF-8';


ALTER DATABASE bluebox OWNER TO cristiano;

\connect bluebox

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
-- Name: admin_avaliacao_combinacoes; Type: TABLE; Schema: public; Owner: cristiano
--

CREATE TABLE public.admin_avaliacao_combinacoes (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    grade text NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public.admin_avaliacao_combinacoes OWNER TO cristiano;

--
-- Name: admin_avaliacao_combinacoes_id_seq; Type: SEQUENCE; Schema: public; Owner: cristiano
--

CREATE SEQUENCE public.admin_avaliacao_combinacoes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_avaliacao_combinacoes_id_seq OWNER TO cristiano;

--
-- Name: admin_avaliacao_combinacoes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cristiano
--

ALTER SEQUENCE public.admin_avaliacao_combinacoes_id_seq OWNED BY public.admin_avaliacao_combinacoes.id;


--
-- Name: admin_avaliacao_conhecimentos; Type: TABLE; Schema: public; Owner: cristiano
--

CREATE TABLE public.admin_avaliacao_conhecimentos (
    id integer NOT NULL,
    code integer NOT NULL,
    name character varying(255) NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public.admin_avaliacao_conhecimentos OWNER TO cristiano;

--
-- Name: admin_avaliacao_conhecimentos_id_seq; Type: SEQUENCE; Schema: public; Owner: cristiano
--

CREATE SEQUENCE public.admin_avaliacao_conhecimentos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_avaliacao_conhecimentos_id_seq OWNER TO cristiano;

--
-- Name: admin_avaliacao_conhecimentos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cristiano
--

ALTER SEQUENCE public.admin_avaliacao_conhecimentos_id_seq OWNED BY public.admin_avaliacao_conhecimentos.id;


--
-- Name: admin_avaliacao_familias; Type: TABLE; Schema: public; Owner: cristiano
--

CREATE TABLE public.admin_avaliacao_familias (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    detail text NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public.admin_avaliacao_familias OWNER TO cristiano;

--
-- Name: admin_avaliacao_familias_id_seq; Type: SEQUENCE; Schema: public; Owner: cristiano
--

CREATE SEQUENCE public.admin_avaliacao_familias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_avaliacao_familias_id_seq OWNER TO cristiano;

--
-- Name: admin_avaliacao_familias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cristiano
--

ALTER SEQUENCE public.admin_avaliacao_familias_id_seq OWNED BY public.admin_avaliacao_familias.id;


--
-- Name: admin_avaliacao_fatores; Type: TABLE; Schema: public; Owner: cristiano
--

CREATE TABLE public.admin_avaliacao_fatores (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    detail text NOT NULL,
    is_active boolean NOT NULL,
    code integer NOT NULL
);


ALTER TABLE public.admin_avaliacao_fatores OWNER TO cristiano;

--
-- Name: admin_avaliacao_fatores_id_seq; Type: SEQUENCE; Schema: public; Owner: cristiano
--

CREATE SEQUENCE public.admin_avaliacao_fatores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_avaliacao_fatores_id_seq OWNER TO cristiano;

--
-- Name: admin_avaliacao_fatores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cristiano
--

ALTER SEQUENCE public.admin_avaliacao_fatores_id_seq OWNED BY public.admin_avaliacao_fatores.id;


--
-- Name: admin_avaliacao_grades; Type: TABLE; Schema: public; Owner: cristiano
--

CREATE TABLE public.admin_avaliacao_grades (
    id integer NOT NULL,
    number integer NOT NULL,
    minimum integer,
    average integer,
    maximum integer,
    detail character varying(255) NOT NULL
);


ALTER TABLE public.admin_avaliacao_grades OWNER TO cristiano;

--
-- Name: admin_avaliacao_grades_id_seq; Type: SEQUENCE; Schema: public; Owner: cristiano
--

CREATE SEQUENCE public.admin_avaliacao_grades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_avaliacao_grades_id_seq OWNER TO cristiano;

--
-- Name: admin_avaliacao_grades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cristiano
--

ALTER SEQUENCE public.admin_avaliacao_grades_id_seq OWNED BY public.admin_avaliacao_grades.id;


--
-- Name: admin_avaliacao_matrizes; Type: TABLE; Schema: public; Owner: cristiano
--

CREATE TABLE public.admin_avaliacao_matrizes (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    score integer,
    detail character varying(255) NOT NULL,
    factor_id integer NOT NULL,
    level_id integer NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public.admin_avaliacao_matrizes OWNER TO cristiano;

--
-- Name: admin_avaliacao_matrizes_id_seq; Type: SEQUENCE; Schema: public; Owner: cristiano
--

CREATE SEQUENCE public.admin_avaliacao_matrizes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_avaliacao_matrizes_id_seq OWNER TO cristiano;

--
-- Name: admin_avaliacao_matrizes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cristiano
--

ALTER SEQUENCE public.admin_avaliacao_matrizes_id_seq OWNED BY public.admin_avaliacao_matrizes.id;


--
-- Name: admin_avaliacao_niveis; Type: TABLE; Schema: public; Owner: cristiano
--

CREATE TABLE public.admin_avaliacao_niveis (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    detail text NOT NULL,
    factor_id integer NOT NULL,
    is_active boolean NOT NULL,
    code integer NOT NULL,
    "�0&K^�UY��&c}����qy/6͢~�8GRoC*r�OJ��" character varying(789)
);


ALTER TABLE public.admin_avaliacao_niveis OWNER TO cristiano;

--
-- Name: admin_avaliacao_niveis_id_seq; Type: SEQUENCE; Schema: public; Owner: cristiano
--

CREATE SEQUENCE public.admin_avaliacao_niveis_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_avaliacao_niveis_id_seq OWNER TO cristiano;

--
-- Name: admin_avaliacao_niveis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cristiano
--

ALTER SEQUENCE public.admin_avaliacao_niveis_id_seq OWNED BY public.admin_avaliacao_niveis.id;


--
-- Name: admin_avaliacao_subfamilias; Type: TABLE; Schema: public; Owner: cristiano
--

CREATE TABLE public.admin_avaliacao_subfamilias (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    detail text NOT NULL,
    family_id integer NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public.admin_avaliacao_subfamilias OWNER TO cristiano;

--
-- Name: admin_avaliacao_subfamilias_id_seq; Type: SEQUENCE; Schema: public; Owner: cristiano
--

CREATE SEQUENCE public.admin_avaliacao_subfamilias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_avaliacao_subfamilias_id_seq OWNER TO cristiano;

--
-- Name: admin_avaliacao_subfamilias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cristiano
--

ALTER SEQUENCE public.admin_avaliacao_subfamilias_id_seq OWNED BY public.admin_avaliacao_subfamilias.id;


--
-- Name: admin_descricao_areas; Type: TABLE; Schema: public; Owner: cristiano
--

CREATE TABLE public.admin_descricao_areas (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public.admin_descricao_areas OWNER TO cristiano;

--
-- Name: admin_descricao_areas_id_seq; Type: SEQUENCE; Schema: public; Owner: cristiano
--

CREATE SEQUENCE public.admin_descricao_areas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_descricao_areas_id_seq OWNER TO cristiano;

--
-- Name: admin_descricao_areas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cristiano
--

ALTER SEQUENCE public.admin_descricao_areas_id_seq OWNED BY public.admin_descricao_areas.id;


--
-- Name: admin_descricao_areasespecializacoes; Type: TABLE; Schema: public; Owner: cristiano
--

CREATE TABLE public.admin_descricao_areasespecializacoes (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public.admin_descricao_areasespecializacoes OWNER TO cristiano;

--
-- Name: admin_descricao_areasespecializacoes_id_seq; Type: SEQUENCE; Schema: public; Owner: cristiano
--

CREATE SEQUENCE public.admin_descricao_areasespecializacoes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_descricao_areasespecializacoes_id_seq OWNER TO cristiano;

--
-- Name: admin_descricao_areasespecializacoes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cristiano
--

ALTER SEQUENCE public.admin_descricao_areasespecializacoes_id_seq OWNED BY public.admin_descricao_areasespecializacoes.id;


--
-- Name: admin_descricao_descricoes; Type: TABLE; Schema: public; Owner: cristiano
--

CREATE TABLE public.admin_descricao_descricoes (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    responsibility text,
    area_specialization_id integer,
    areas_id integer,
    experience_id integer,
    formation_id integer,
    qualification_id integer,
    specialization_id integer,
    summary_goal text,
    areas2_id integer,
    areas3_id integer,
    areas4_id integer,
    qualification2_id integer,
    qualification3_id integer,
    qualification4_id integer,
    is_active boolean NOT NULL,
    area_specialization2_id integer,
    area_specialization3_id integer,
    area_specialization4_id integer,
    areas_desired_id integer,
    areas_desired2_id integer,
    areas_desired3_id integer,
    areas_desired4_id integer,
    family_id integer,
    formation_desired_id integer,
    sub_familia_id integer,
    manage_team_id integer
);


ALTER TABLE public.admin_descricao_descricoes OWNER TO cristiano;

--
-- Name: admin_descricao_descricoes_id_seq; Type: SEQUENCE; Schema: public; Owner: cristiano
--

CREATE SEQUENCE public.admin_descricao_descricoes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_descricao_descricoes_id_seq OWNER TO cristiano;

--
-- Name: admin_descricao_descricoes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cristiano
--

ALTER SEQUENCE public.admin_descricao_descricoes_id_seq OWNED BY public.admin_descricao_descricoes.id;


--
-- Name: admin_descricao_especializacoes; Type: TABLE; Schema: public; Owner: cristiano
--

CREATE TABLE public.admin_descricao_especializacoes (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public.admin_descricao_especializacoes OWNER TO cristiano;

--
-- Name: admin_descricao_especializacoes_id_seq; Type: SEQUENCE; Schema: public; Owner: cristiano
--

CREATE SEQUENCE public.admin_descricao_especializacoes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_descricao_especializacoes_id_seq OWNER TO cristiano;

--
-- Name: admin_descricao_especializacoes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cristiano
--

ALTER SEQUENCE public.admin_descricao_especializacoes_id_seq OWNED BY public.admin_descricao_especializacoes.id;


--
-- Name: admin_descricao_experiencias; Type: TABLE; Schema: public; Owner: cristiano
--

CREATE TABLE public.admin_descricao_experiencias (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    is_active boolean
);


ALTER TABLE public.admin_descricao_experiencias OWNER TO cristiano;

--
-- Name: admin_descricao_experiencias_id_seq; Type: SEQUENCE; Schema: public; Owner: cristiano
--

CREATE SEQUENCE public.admin_descricao_experiencias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_descricao_experiencias_id_seq OWNER TO cristiano;

--
-- Name: admin_descricao_experiencias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cristiano
--

ALTER SEQUENCE public.admin_descricao_experiencias_id_seq OWNED BY public.admin_descricao_experiencias.id;


--
-- Name: admin_descricao_formacao; Type: TABLE; Schema: public; Owner: cristiano
--

CREATE TABLE public.admin_descricao_formacao (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    is_active boolean NOT NULL,
    code integer NOT NULL
);


ALTER TABLE public.admin_descricao_formacao OWNER TO cristiano;

--
-- Name: admin_descricao_formacao_id_seq; Type: SEQUENCE; Schema: public; Owner: cristiano
--

CREATE SEQUENCE public.admin_descricao_formacao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_descricao_formacao_id_seq OWNER TO cristiano;

--
-- Name: admin_descricao_formacao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cristiano
--

ALTER SEQUENCE public.admin_descricao_formacao_id_seq OWNED BY public.admin_descricao_formacao.id;


--
-- Name: admin_descricao_gerencia; Type: TABLE; Schema: public; Owner: cristiano
--

CREATE TABLE public.admin_descricao_gerencia (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.admin_descricao_gerencia OWNER TO cristiano;

--
-- Name: admin_descricao_gerencia_id_seq; Type: SEQUENCE; Schema: public; Owner: cristiano
--

CREATE SEQUENCE public.admin_descricao_gerencia_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_descricao_gerencia_id_seq OWNER TO cristiano;

--
-- Name: admin_descricao_gerencia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cristiano
--

ALTER SEQUENCE public.admin_descricao_gerencia_id_seq OWNED BY public.admin_descricao_gerencia.id;


--
-- Name: admin_descricao_habilitacoes; Type: TABLE; Schema: public; Owner: cristiano
--

CREATE TABLE public.admin_descricao_habilitacoes (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public.admin_descricao_habilitacoes OWNER TO cristiano;

--
-- Name: admin_descricao_habilitacoes_id_seq; Type: SEQUENCE; Schema: public; Owner: cristiano
--

CREATE SEQUENCE public.admin_descricao_habilitacoes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_descricao_habilitacoes_id_seq OWNER TO cristiano;

--
-- Name: admin_descricao_habilitacoes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cristiano
--

ALTER SEQUENCE public.admin_descricao_habilitacoes_id_seq OWNED BY public.admin_descricao_habilitacoes.id;


--
-- Name: admin_descricao_idiomas; Type: TABLE; Schema: public; Owner: cristiano
--

CREATE TABLE public.admin_descricao_idiomas (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public.admin_descricao_idiomas OWNER TO cristiano;

--
-- Name: admin_descricao_idiomas_id_seq; Type: SEQUENCE; Schema: public; Owner: cristiano
--

CREATE SEQUENCE public.admin_descricao_idiomas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_descricao_idiomas_id_seq OWNER TO cristiano;

--
-- Name: admin_descricao_idiomas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cristiano
--

ALTER SEQUENCE public.admin_descricao_idiomas_id_seq OWNED BY public.admin_descricao_idiomas.id;


--
-- Name: admin_descricao_niveis; Type: TABLE; Schema: public; Owner: cristiano
--

CREATE TABLE public.admin_descricao_niveis (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public.admin_descricao_niveis OWNER TO cristiano;

--
-- Name: admin_descricao_niveis_id_seq; Type: SEQUENCE; Schema: public; Owner: cristiano
--

ALTER TABLE public.admin_descricao_niveis ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.admin_descricao_niveis_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: admin_descricao_proficiencias; Type: TABLE; Schema: public; Owner: cristiano
--

CREATE TABLE public.admin_descricao_proficiencias (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public.admin_descricao_proficiencias OWNER TO cristiano;

--
-- Name: admin_descricao_proficiencias_id_seq; Type: SEQUENCE; Schema: public; Owner: cristiano
--

CREATE SEQUENCE public.admin_descricao_proficiencias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_descricao_proficiencias_id_seq OWNER TO cristiano;

--
-- Name: admin_descricao_proficiencias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cristiano
--

ALTER SEQUENCE public.admin_descricao_proficiencias_id_seq OWNED BY public.admin_descricao_proficiencias.id;


--
-- Name: admin_descricao_status; Type: TABLE; Schema: public; Owner: cristiano
--

CREATE TABLE public.admin_descricao_status (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.admin_descricao_status OWNER TO cristiano;

--
-- Name: admin_descricao_status_id_seq; Type: SEQUENCE; Schema: public; Owner: cristiano
--

CREATE SEQUENCE public.admin_descricao_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_descricao_status_id_seq OWNER TO cristiano;

--
-- Name: admin_descricao_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cristiano
--

ALTER SEQUENCE public.admin_descricao_status_id_seq OWNED BY public.admin_descricao_status.id;


--
-- Name: admin_geral_core; Type: TABLE; Schema: public; Owner: cristiano
--

CREATE TABLE public.admin_geral_core (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.admin_geral_core OWNER TO cristiano;

--
-- Name: admin_geral_core_id_seq; Type: SEQUENCE; Schema: public; Owner: cristiano
--

CREATE SEQUENCE public.admin_geral_core_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_geral_core_id_seq OWNER TO cristiano;

--
-- Name: admin_geral_core_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cristiano
--

ALTER SEQUENCE public.admin_geral_core_id_seq OWNED BY public.admin_geral_core.id;


--
-- Name: admin_geral_dimensao; Type: TABLE; Schema: public; Owner: cristiano
--

CREATE TABLE public.admin_geral_dimensao (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.admin_geral_dimensao OWNER TO cristiano;

--
-- Name: admin_geral_dimensao_id_seq; Type: SEQUENCE; Schema: public; Owner: cristiano
--

CREATE SEQUENCE public.admin_geral_dimensao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_geral_dimensao_id_seq OWNER TO cristiano;

--
-- Name: admin_geral_dimensao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cristiano
--

ALTER SEQUENCE public.admin_geral_dimensao_id_seq OWNED BY public.admin_geral_dimensao.id;


--
-- Name: admin_geral_governanca; Type: TABLE; Schema: public; Owner: cristiano
--

CREATE TABLE public.admin_geral_governanca (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.admin_geral_governanca OWNER TO cristiano;

--
-- Name: admin_geral_governanca_id_seq; Type: SEQUENCE; Schema: public; Owner: cristiano
--

CREATE SEQUENCE public.admin_geral_governanca_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_geral_governanca_id_seq OWNER TO cristiano;

--
-- Name: admin_geral_governanca_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cristiano
--

ALTER SEQUENCE public.admin_geral_governanca_id_seq OWNED BY public.admin_geral_governanca.id;


--
-- Name: admin_geral_nivelcargo; Type: TABLE; Schema: public; Owner: cristiano
--

CREATE TABLE public.admin_geral_nivelcargo (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public.admin_geral_nivelcargo OWNER TO cristiano;

--
-- Name: admin_geral_nivelcargo_id_seq; Type: SEQUENCE; Schema: public; Owner: cristiano
--

CREATE SEQUENCE public.admin_geral_nivelcargo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_geral_nivelcargo_id_seq OWNER TO cristiano;

--
-- Name: admin_geral_nivelcargo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cristiano
--

ALTER SEQUENCE public.admin_geral_nivelcargo_id_seq OWNED BY public.admin_geral_nivelcargo.id;


--
-- Name: admin_geral_origemcapital; Type: TABLE; Schema: public; Owner: cristiano
--

CREATE TABLE public.admin_geral_origemcapital (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.admin_geral_origemcapital OWNER TO cristiano;

--
-- Name: admin_geral_origemcapital_id_seq; Type: SEQUENCE; Schema: public; Owner: cristiano
--

CREATE SEQUENCE public.admin_geral_origemcapital_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_geral_origemcapital_id_seq OWNER TO cristiano;

--
-- Name: admin_geral_origemcapital_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cristiano
--

ALTER SEQUENCE public.admin_geral_origemcapital_id_seq OWNED BY public.admin_geral_origemcapital.id;


--
-- Name: admin_geral_plans; Type: TABLE; Schema: public; Owner: cristiano
--

CREATE TABLE public.admin_geral_plans (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    detail character varying(255) NOT NULL,
    value numeric(8,0) NOT NULL,
    discount character varying(255) NOT NULL,
    percent integer,
    is_active boolean NOT NULL
);


ALTER TABLE public.admin_geral_plans OWNER TO cristiano;

--
-- Name: admin_geral_plans_id_seq; Type: SEQUENCE; Schema: public; Owner: cristiano
--

CREATE SEQUENCE public.admin_geral_plans_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_geral_plans_id_seq OWNER TO cristiano;

--
-- Name: admin_geral_plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cristiano
--

ALTER SEQUENCE public.admin_geral_plans_id_seq OWNED BY public.admin_geral_plans.id;


--
-- Name: admin_geral_plansavaliacao; Type: TABLE; Schema: public; Owner: cristiano
--

CREATE TABLE public.admin_geral_plansavaliacao (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    detail character varying(255) NOT NULL,
    value numeric(8,0) NOT NULL,
    discount character varying(255) NOT NULL,
    percent integer,
    is_active boolean NOT NULL
);


ALTER TABLE public.admin_geral_plansavaliacao OWNER TO cristiano;

--
-- Name: admin_geral_plansavaliacao_id_seq; Type: SEQUENCE; Schema: public; Owner: cristiano
--

ALTER TABLE public.admin_geral_plansavaliacao ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.admin_geral_plansavaliacao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: admin_geral_sector; Type: TABLE; Schema: public; Owner: cristiano
--

CREATE TABLE public.admin_geral_sector (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public.admin_geral_sector OWNER TO cristiano;

--
-- Name: admin_geral_sector_id_seq; Type: SEQUENCE; Schema: public; Owner: cristiano
--

CREATE SEQUENCE public.admin_geral_sector_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_geral_sector_id_seq OWNER TO cristiano;

--
-- Name: admin_geral_sector_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cristiano
--

ALTER SEQUENCE public.admin_geral_sector_id_seq OWNED BY public.admin_geral_sector.id;


--
-- Name: admin_geral_tipoempresa; Type: TABLE; Schema: public; Owner: cristiano
--

CREATE TABLE public.admin_geral_tipoempresa (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.admin_geral_tipoempresa OWNER TO cristiano;

--
-- Name: admin_geral_tipoempresa_id_seq; Type: SEQUENCE; Schema: public; Owner: cristiano
--

CREATE SEQUENCE public.admin_geral_tipoempresa_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_geral_tipoempresa_id_seq OWNER TO cristiano;

--
-- Name: admin_geral_tipoempresa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cristiano
--

ALTER SEQUENCE public.admin_geral_tipoempresa_id_seq OWNED BY public.admin_geral_tipoempresa.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: cristiano
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO cristiano;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: cristiano
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO cristiano;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cristiano
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: cristiano
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO cristiano;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: cristiano
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO cristiano;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cristiano
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: cristiano
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO cristiano;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: cristiano
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO cristiano;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cristiano
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: avaliacao_avaliacao; Type: TABLE; Schema: public; Owner: cristiano
--

CREATE TABLE public.avaliacao_avaliacao (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    area_id integer NOT NULL,
    board_id integer NOT NULL,
    tenant_id bigint NOT NULL,
    ceo boolean NOT NULL,
    company_id integer,
    factor1_id integer NOT NULL,
    factor2_id integer NOT NULL,
    factor3_id integer NOT NULL,
    factor4_id integer NOT NULL,
    factor5_id integer NOT NULL,
    factor6_id integer NOT NULL,
    factor7_id integer NOT NULL,
    factor8_id integer NOT NULL,
    family_id integer,
    formation_id integer,
    governanca_id integer,
    level1_id integer NOT NULL,
    level2_id integer NOT NULL,
    level3_id integer NOT NULL,
    level4_id integer NOT NULL,
    level5_id integer NOT NULL,
    level6_id integer NOT NULL,
    level7_id integer NOT NULL,
    level8_id integer NOT NULL,
    manage_team_id integer NOT NULL,
    origin_id integer,
    size_id integer,
    sub_familia_id integer,
    title_super_id bigint,
    grade_id integer NOT NULL,
    point integer,
    description integer
);


ALTER TABLE public.avaliacao_avaliacao OWNER TO cristiano;

--
-- Name: avaliacao_avaliacao_id_seq; Type: SEQUENCE; Schema: public; Owner: cristiano
--

CREATE SEQUENCE public.avaliacao_avaliacao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.avaliacao_avaliacao_id_seq OWNER TO cristiano;

--
-- Name: avaliacao_avaliacao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cristiano
--

ALTER SEQUENCE public.avaliacao_avaliacao_id_seq OWNED BY public.avaliacao_avaliacao.id;


--
-- Name: avaliacao_superior; Type: TABLE; Schema: public; Owner: cristiano
--

CREATE TABLE public.avaliacao_superior (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    tenant_id bigint NOT NULL,
    evaluation_id integer NOT NULL
);


ALTER TABLE public.avaliacao_superior OWNER TO cristiano;

--
-- Name: avaliacao_superior_id_seq; Type: SEQUENCE; Schema: public; Owner: cristiano
--

CREATE SEQUENCE public.avaliacao_superior_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.avaliacao_superior_id_seq OWNER TO cristiano;

--
-- Name: avaliacao_superior_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cristiano
--

ALTER SEQUENCE public.avaliacao_superior_id_seq OWNED BY public.avaliacao_superior.id;


--
-- Name: background_task; Type: TABLE; Schema: public; Owner: cristiano
--

CREATE TABLE public.background_task (
    id integer NOT NULL,
    task_name character varying(190) NOT NULL,
    task_params text NOT NULL,
    task_hash character varying(40) NOT NULL,
    verbose_name character varying(255),
    priority integer NOT NULL,
    run_at timestamp with time zone NOT NULL,
    repeat bigint NOT NULL,
    repeat_until timestamp with time zone,
    queue character varying(190),
    attempts integer NOT NULL,
    failed_at timestamp with time zone,
    last_error text NOT NULL,
    locked_by character varying(64),
    locked_at timestamp with time zone,
    creator_object_id integer,
    creator_content_type_id integer,
    CONSTRAINT background_task_creator_object_id_check CHECK ((creator_object_id >= 0))
);


ALTER TABLE public.background_task OWNER TO cristiano;

--
-- Name: background_task_completedtask; Type: TABLE; Schema: public; Owner: cristiano
--

CREATE TABLE public.background_task_completedtask (
    id integer NOT NULL,
    task_name character varying(190) NOT NULL,
    task_params text NOT NULL,
    task_hash character varying(40) NOT NULL,
    verbose_name character varying(255),
    priority integer NOT NULL,
    run_at timestamp with time zone NOT NULL,
    repeat bigint NOT NULL,
    repeat_until timestamp with time zone,
    queue character varying(190),
    attempts integer NOT NULL,
    failed_at timestamp with time zone,
    last_error text NOT NULL,
    locked_by character varying(64),
    locked_at timestamp with time zone,
    creator_object_id integer,
    creator_content_type_id integer,
    CONSTRAINT background_task_completedtask_creator_object_id_check CHECK ((creator_object_id >= 0))
);


ALTER TABLE public.background_task_completedtask OWNER TO cristiano;

--
-- Name: background_task_completedtask_id_seq; Type: SEQUENCE; Schema: public; Owner: cristiano
--

ALTER TABLE public.background_task_completedtask ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.background_task_completedtask_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: background_task_id_seq; Type: SEQUENCE; Schema: public; Owner: cristiano
--

ALTER TABLE public.background_task ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.background_task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: descricao_descricao; Type: TABLE; Schema: public; Owner: cristiano
--

CREATE TABLE public.descricao_descricao (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    cbo character varying(255),
    summary_goal text,
    responsibility text,
    area_specialization_id integer,
    title_super character varying(255),
    manage_team_id integer NOT NULL,
    position_team text,
    proficiency_id integer,
    knowledge text NOT NULL,
    information text NOT NULL,
    date_approval timestamp with time zone,
    approver_id integer,
    area_id integer,
    areas_id integer,
    areas_desired_id integer,
    board_id integer,
    experience_id integer NOT NULL,
    family_id integer,
    formation_id integer,
    formation_desired_id integer,
    idioma_id integer,
    specialization_id integer,
    sub_familia_id integer,
    tenant_id bigint NOT NULL,
    status_id integer NOT NULL,
    date_conclusion timestamp with time zone,
    user_id_id integer,
    function character varying(255),
    is_active boolean NOT NULL,
    areas2_id integer,
    areas3_id integer,
    areas4_id integer,
    qualification2_id integer,
    qualification3_id integer,
    qualification_id integer,
    area_specialization2_id integer,
    area_specialization3_id integer,
    area_specialization4_id integer,
    idioma2_id integer,
    idioma3_id integer,
    proficiency2_id integer,
    proficiency3_id integer,
    areas_desired2_id integer,
    areas_desired3_id integer,
    areas_desired4_id integer,
    level_id integer,
    sector_id integer,
    adicional text NOT NULL
);


ALTER TABLE public.descricao_descricao OWNER TO cristiano;

--
-- Name: descricao_descricao_id_seq; Type: SEQUENCE; Schema: public; Owner: cristiano
--

CREATE SEQUENCE public.descricao_descricao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.descricao_descricao_id_seq OWNER TO cristiano;

--
-- Name: descricao_descricao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cristiano
--

ALTER SEQUENCE public.descricao_descricao_id_seq OWNED BY public.descricao_descricao.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: cristiano
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO cristiano;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: cristiano
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO cristiano;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cristiano
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: cristiano
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO cristiano;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: cristiano
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO cristiano;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cristiano
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: cristiano
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO cristiano;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: cristiano
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO cristiano;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cristiano
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: cristiano
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO cristiano;

--
-- Name: master_area; Type: TABLE; Schema: public; Owner: cristiano
--

CREATE TABLE public.master_area (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    board_id integer NOT NULL,
    tenant_id bigint NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public.master_area OWNER TO cristiano;

--
-- Name: master_area_id_seq; Type: SEQUENCE; Schema: public; Owner: cristiano
--

CREATE SEQUENCE public.master_area_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.master_area_id_seq OWNER TO cristiano;

--
-- Name: master_area_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cristiano
--

ALTER SEQUENCE public.master_area_id_seq OWNED BY public.master_area.id;


--
-- Name: master_diretoria; Type: TABLE; Schema: public; Owner: cristiano
--

CREATE TABLE public.master_diretoria (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    tenant_id bigint NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public.master_diretoria OWNER TO cristiano;

--
-- Name: master_diretoria_id_seq; Type: SEQUENCE; Schema: public; Owner: cristiano
--

CREATE SEQUENCE public.master_diretoria_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.master_diretoria_id_seq OWNER TO cristiano;

--
-- Name: master_diretoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cristiano
--

ALTER SEQUENCE public.master_diretoria_id_seq OWNED BY public.master_diretoria.id;


--
-- Name: person_person; Type: TABLE; Schema: public; Owner: cristiano
--

CREATE TABLE public.person_person (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    birth_date date NOT NULL,
    city character varying(40) NOT NULL,
    civil_status character varying(10) NOT NULL,
    complement character varying(200) NOT NULL,
    cpf character varying(14) NOT NULL,
    number character varying(4) NOT NULL,
    phone character varying(19) NOT NULL,
    sex character varying(10) NOT NULL,
    states character varying(15) NOT NULL,
    address character varying(150) NOT NULL,
    tenant_id bigint NOT NULL
);


ALTER TABLE public.person_person OWNER TO cristiano;

--
-- Name: person_person_id_seq; Type: SEQUENCE; Schema: public; Owner: cristiano
--

CREATE SEQUENCE public.person_person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_person_id_seq OWNER TO cristiano;

--
-- Name: person_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cristiano
--

ALTER SEQUENCE public.person_person_id_seq OWNED BY public.person_person.id;


--
-- Name: tenants_tenant; Type: TABLE; Schema: public; Owner: cristiano
--

CREATE TABLE public.tenants_tenant (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    address character varying(150) NOT NULL,
    city character varying(40) NOT NULL,
    cnpj character varying(18) NOT NULL,
    complement character varying(200),
    employees integer NOT NULL,
    number character varying(4) NOT NULL,
    outsource integer NOT NULL,
    phone character varying(19) NOT NULL,
    sector_id integer NOT NULL,
    states character varying(15) NOT NULL,
    governanca_id integer NOT NULL,
    origin_id integer NOT NULL,
    size_id integer NOT NULL,
    company_id integer NOT NULL,
    core_id integer,
    plano_id integer,
    planoaval_id integer
);


ALTER TABLE public.tenants_tenant OWNER TO cristiano;

--
-- Name: tenants_tenant_id_seq; Type: SEQUENCE; Schema: public; Owner: cristiano
--

CREATE SEQUENCE public.tenants_tenant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tenants_tenant_id_seq OWNER TO cristiano;

--
-- Name: tenants_tenant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cristiano
--

ALTER SEQUENCE public.tenants_tenant_id_seq OWNED BY public.tenants_tenant.id;


--
-- Name: user_account_customuser; Type: TABLE; Schema: public; Owner: cristiano
--

CREATE TABLE public.user_account_customuser (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    email character varying(254) NOT NULL,
    name character varying(255) NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    person_id integer,
    default_tenant_id bigint NOT NULL,
    kind character varying(20) NOT NULL
);


ALTER TABLE public.user_account_customuser OWNER TO cristiano;

--
-- Name: user_account_customuser_groups; Type: TABLE; Schema: public; Owner: cristiano
--

CREATE TABLE public.user_account_customuser_groups (
    id integer NOT NULL,
    customuser_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.user_account_customuser_groups OWNER TO cristiano;

--
-- Name: user_account_customuser_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: cristiano
--

CREATE SEQUENCE public.user_account_customuser_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_account_customuser_groups_id_seq OWNER TO cristiano;

--
-- Name: user_account_customuser_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cristiano
--

ALTER SEQUENCE public.user_account_customuser_groups_id_seq OWNED BY public.user_account_customuser_groups.id;


--
-- Name: user_account_customuser_id_seq; Type: SEQUENCE; Schema: public; Owner: cristiano
--

CREATE SEQUENCE public.user_account_customuser_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_account_customuser_id_seq OWNER TO cristiano;

--
-- Name: user_account_customuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cristiano
--

ALTER SEQUENCE public.user_account_customuser_id_seq OWNED BY public.user_account_customuser.id;


--
-- Name: user_account_customuser_tenants; Type: TABLE; Schema: public; Owner: cristiano
--

CREATE TABLE public.user_account_customuser_tenants (
    id integer NOT NULL,
    customuser_id integer NOT NULL,
    tenant_id bigint NOT NULL
);


ALTER TABLE public.user_account_customuser_tenants OWNER TO cristiano;

--
-- Name: user_account_customuser_tenants_id_seq; Type: SEQUENCE; Schema: public; Owner: cristiano
--

CREATE SEQUENCE public.user_account_customuser_tenants_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_account_customuser_tenants_id_seq OWNER TO cristiano;

--
-- Name: user_account_customuser_tenants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cristiano
--

ALTER SEQUENCE public.user_account_customuser_tenants_id_seq OWNED BY public.user_account_customuser_tenants.id;


--
-- Name: user_account_customuser_user_permissions; Type: TABLE; Schema: public; Owner: cristiano
--

CREATE TABLE public.user_account_customuser_user_permissions (
    id integer NOT NULL,
    customuser_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.user_account_customuser_user_permissions OWNER TO cristiano;

--
-- Name: user_account_customuser_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: cristiano
--

CREATE SEQUENCE public.user_account_customuser_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_account_customuser_user_permissions_id_seq OWNER TO cristiano;

--
-- Name: user_account_customuser_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cristiano
--

ALTER SEQUENCE public.user_account_customuser_user_permissions_id_seq OWNED BY public.user_account_customuser_user_permissions.id;


--
-- Name: admin_avaliacao_combinacoes id; Type: DEFAULT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_avaliacao_combinacoes ALTER COLUMN id SET DEFAULT nextval('public.admin_avaliacao_combinacoes_id_seq'::regclass);


--
-- Name: admin_avaliacao_conhecimentos id; Type: DEFAULT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_avaliacao_conhecimentos ALTER COLUMN id SET DEFAULT nextval('public.admin_avaliacao_conhecimentos_id_seq'::regclass);


--
-- Name: admin_avaliacao_familias id; Type: DEFAULT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_avaliacao_familias ALTER COLUMN id SET DEFAULT nextval('public.admin_avaliacao_familias_id_seq'::regclass);


--
-- Name: admin_avaliacao_fatores id; Type: DEFAULT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_avaliacao_fatores ALTER COLUMN id SET DEFAULT nextval('public.admin_avaliacao_fatores_id_seq'::regclass);


--
-- Name: admin_avaliacao_grades id; Type: DEFAULT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_avaliacao_grades ALTER COLUMN id SET DEFAULT nextval('public.admin_avaliacao_grades_id_seq'::regclass);


--
-- Name: admin_avaliacao_matrizes id; Type: DEFAULT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_avaliacao_matrizes ALTER COLUMN id SET DEFAULT nextval('public.admin_avaliacao_matrizes_id_seq'::regclass);


--
-- Name: admin_avaliacao_niveis id; Type: DEFAULT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_avaliacao_niveis ALTER COLUMN id SET DEFAULT nextval('public.admin_avaliacao_niveis_id_seq'::regclass);


--
-- Name: admin_avaliacao_subfamilias id; Type: DEFAULT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_avaliacao_subfamilias ALTER COLUMN id SET DEFAULT nextval('public.admin_avaliacao_subfamilias_id_seq'::regclass);


--
-- Name: admin_descricao_areas id; Type: DEFAULT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_areas ALTER COLUMN id SET DEFAULT nextval('public.admin_descricao_areas_id_seq'::regclass);


--
-- Name: admin_descricao_areasespecializacoes id; Type: DEFAULT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_areasespecializacoes ALTER COLUMN id SET DEFAULT nextval('public.admin_descricao_areasespecializacoes_id_seq'::regclass);


--
-- Name: admin_descricao_descricoes id; Type: DEFAULT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_descricoes ALTER COLUMN id SET DEFAULT nextval('public.admin_descricao_descricoes_id_seq'::regclass);


--
-- Name: admin_descricao_especializacoes id; Type: DEFAULT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_especializacoes ALTER COLUMN id SET DEFAULT nextval('public.admin_descricao_especializacoes_id_seq'::regclass);


--
-- Name: admin_descricao_experiencias id; Type: DEFAULT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_experiencias ALTER COLUMN id SET DEFAULT nextval('public.admin_descricao_experiencias_id_seq'::regclass);


--
-- Name: admin_descricao_formacao id; Type: DEFAULT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_formacao ALTER COLUMN id SET DEFAULT nextval('public.admin_descricao_formacao_id_seq'::regclass);


--
-- Name: admin_descricao_gerencia id; Type: DEFAULT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_gerencia ALTER COLUMN id SET DEFAULT nextval('public.admin_descricao_gerencia_id_seq'::regclass);


--
-- Name: admin_descricao_habilitacoes id; Type: DEFAULT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_habilitacoes ALTER COLUMN id SET DEFAULT nextval('public.admin_descricao_habilitacoes_id_seq'::regclass);


--
-- Name: admin_descricao_idiomas id; Type: DEFAULT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_idiomas ALTER COLUMN id SET DEFAULT nextval('public.admin_descricao_idiomas_id_seq'::regclass);


--
-- Name: admin_descricao_proficiencias id; Type: DEFAULT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_proficiencias ALTER COLUMN id SET DEFAULT nextval('public.admin_descricao_proficiencias_id_seq'::regclass);


--
-- Name: admin_descricao_status id; Type: DEFAULT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_status ALTER COLUMN id SET DEFAULT nextval('public.admin_descricao_status_id_seq'::regclass);


--
-- Name: admin_geral_core id; Type: DEFAULT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_geral_core ALTER COLUMN id SET DEFAULT nextval('public.admin_geral_core_id_seq'::regclass);


--
-- Name: admin_geral_dimensao id; Type: DEFAULT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_geral_dimensao ALTER COLUMN id SET DEFAULT nextval('public.admin_geral_dimensao_id_seq'::regclass);


--
-- Name: admin_geral_governanca id; Type: DEFAULT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_geral_governanca ALTER COLUMN id SET DEFAULT nextval('public.admin_geral_governanca_id_seq'::regclass);


--
-- Name: admin_geral_nivelcargo id; Type: DEFAULT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_geral_nivelcargo ALTER COLUMN id SET DEFAULT nextval('public.admin_geral_nivelcargo_id_seq'::regclass);


--
-- Name: admin_geral_origemcapital id; Type: DEFAULT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_geral_origemcapital ALTER COLUMN id SET DEFAULT nextval('public.admin_geral_origemcapital_id_seq'::regclass);


--
-- Name: admin_geral_plans id; Type: DEFAULT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_geral_plans ALTER COLUMN id SET DEFAULT nextval('public.admin_geral_plans_id_seq'::regclass);


--
-- Name: admin_geral_sector id; Type: DEFAULT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_geral_sector ALTER COLUMN id SET DEFAULT nextval('public.admin_geral_sector_id_seq'::regclass);


--
-- Name: admin_geral_tipoempresa id; Type: DEFAULT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_geral_tipoempresa ALTER COLUMN id SET DEFAULT nextval('public.admin_geral_tipoempresa_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: avaliacao_avaliacao id; Type: DEFAULT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.avaliacao_avaliacao ALTER COLUMN id SET DEFAULT nextval('public.avaliacao_avaliacao_id_seq'::regclass);


--
-- Name: avaliacao_superior id; Type: DEFAULT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.avaliacao_superior ALTER COLUMN id SET DEFAULT nextval('public.avaliacao_superior_id_seq'::regclass);


--
-- Name: descricao_descricao id; Type: DEFAULT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.descricao_descricao ALTER COLUMN id SET DEFAULT nextval('public.descricao_descricao_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: master_area id; Type: DEFAULT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.master_area ALTER COLUMN id SET DEFAULT nextval('public.master_area_id_seq'::regclass);


--
-- Name: master_diretoria id; Type: DEFAULT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.master_diretoria ALTER COLUMN id SET DEFAULT nextval('public.master_diretoria_id_seq'::regclass);


--
-- Name: person_person id; Type: DEFAULT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.person_person ALTER COLUMN id SET DEFAULT nextval('public.person_person_id_seq'::regclass);


--
-- Name: tenants_tenant id; Type: DEFAULT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.tenants_tenant ALTER COLUMN id SET DEFAULT nextval('public.tenants_tenant_id_seq'::regclass);


--
-- Name: user_account_customuser id; Type: DEFAULT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.user_account_customuser ALTER COLUMN id SET DEFAULT nextval('public.user_account_customuser_id_seq'::regclass);


--
-- Name: user_account_customuser_groups id; Type: DEFAULT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.user_account_customuser_groups ALTER COLUMN id SET DEFAULT nextval('public.user_account_customuser_groups_id_seq'::regclass);


--
-- Name: user_account_customuser_tenants id; Type: DEFAULT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.user_account_customuser_tenants ALTER COLUMN id SET DEFAULT nextval('public.user_account_customuser_tenants_id_seq'::regclass);


--
-- Name: user_account_customuser_user_permissions id; Type: DEFAULT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.user_account_customuser_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.user_account_customuser_user_permissions_id_seq'::regclass);


--
-- Data for Name: admin_avaliacao_combinacoes; Type: TABLE DATA; Schema: public; Owner: cristiano
--

COPY public.admin_avaliacao_combinacoes (id, name, grade, is_active) FROM stdin;
1	1;1;1;1;1;1;1;1	BX21	t
2	1;2;2;1;1;1;1;1	BX22	t
3	1;3;3;1;1;2;1;1	BX23	t
4	1;3;3;1;1;2;2;3	BX23	t
5	1;3;4;2;2;2;1;1	BX24	t
6	1;3;4;2;2;2;2;3	BX24	t
7	1;4;3;1;1;2;1;1	BX24	t
8	1;4;3;1;1;2;2;3	BX24	t
9	1;3;4;3;2;2;1;1	BX25	t
10	1;3;4;3;2;2;2;3	BX25	t
11	1;4;4;2;2;2;1;1	BX25	t
12	1;4;4;2;2;2;2;3	BX25	t
13	1;5;3;1;1;2;1;2	BX25	t
14	1;5;3;1;1;2;1;3	BX25	t
15	1;5;3;1;1;2;2;3	BX25	t
16	1;3;4;4;2;2;1;1	BX26	t
17	1;3;4;4;2;2;2;3	BX26	t
18	1;3;4;4;3;2;1;1	BX26	t
19	1;3;4;4;3;2;2;3	BX26	t
20	1;4;4;3;2;2;1;1	BX26	t
21	1;4;4;3;2;2;2;3	BX26	t
22	1;5;4;2;2;2;1;2	BX26	t
23	1;5;4;2;2;2;1;3	BX26	t
24	1;5;4;2;2;2;2;3	BX26	t
25	1;4;4;4;2;2;1;1	BX27	t
26	1;4;4;4;2;2;2;3	BX27	t
27	1;4;4;4;3;2;1;1	BX27	t
28	1;4;4;4;3;2;2;3	BX27	t
29	1;5;4;3;2;2;1;2	BX27	t
30	1;5;4;3;2;2;1;3	BX27	t
31	1;5;4;3;2;2;2;3	BX27	t
32	2;6;5;2;2;3;1;2	BX27	t
33	2;6;5;2;2;3;1;3	BX27	t
34	2;6;5;2;2;3;2;3	BX27	t
35	2;6;5;2;2;3;3;3	BX27	t
36	1;5;4;4;2;2;1;2	BX28	t
37	1;5;4;4;2;2;1;3	BX28	t
38	1;5;4;4;2;2;2;3	BX28	t
39	1;5;4;4;3;2;1;2	BX28	t
40	1;5;4;4;3;2;1;3	BX28	t
41	1;5;4;4;3;2;2;3	BX28	t
42	2;6;5;3;2;3;1;2	BX28	t
43	2;6;5;3;2;3;1;3	BX28	t
44	2;6;5;3;2;3;2;3	BX28	t
45	2;6;5;3;2;3;3;3	BX28	t
46	2;7;5;2;2;3;1;2	BX28	t
47	2;7;5;2;2;3;1;3	BX28	t
48	2;7;5;2;2;3;2;3	BX28	t
49	2;7;5;2;2;3;3;3	BX28	t
50	2;6;5;4;2;3;1;2	BX29	t
51	2;6;5;4;2;3;1;3	BX29	t
52	2;6;5;4;2;3;2;3	BX29	t
53	2;6;5;4;2;3;3;3	BX29	t
54	2;6;5;4;3;3;1;2	BX29	t
55	2;6;5;4;3;3;1;3	BX29	t
56	2;6;5;4;3;3;2;3	BX29	t
57	2;6;5;4;3;3;3;3	BX29	t
58	2;7;5;3;2;3;1;2	BX29	t
59	2;7;5;3;2;3;1;3	BX29	t
60	2;7;5;3;2;3;2;3	BX29	t
61	2;7;5;3;2;3;3;3	BX29	t
62	2;7;6;2;2;4;1;2	BX29	t
63	2;7;6;2;2;4;1;3	BX29	t
64	2;7;6;2;2;4;2;3	BX29	t
65	2;7;6;2;2;4;3;3	BX29	t
66	2;8;5;2;2;3;1;2	BX29	t
67	2;8;5;2;2;3;1;3	BX29	t
68	2;8;5;2;2;3;2;3	BX29	t
69	2;8;5;2;2;3;3;3	BX29	t
70	2;7;5;4;2;3;1;2	BX30	t
71	2;7;5;4;2;3;1;3	BX30	t
72	2;7;5;4;2;3;2;3	BX30	t
73	2;7;5;4;2;3;3;3	BX30	t
74	2;7;5;4;3;3;1;2	BX30	t
75	2;7;5;4;3;3;1;3	BX30	t
76	2;7;5;4;3;3;2;3	BX30	t
77	2;7;5;4;3;3;3;3	BX30	t
78	2;7;6;3;2;4;1;2	BX30	t
79	2;7;6;3;2;4;1;3	BX30	t
80	2;7;6;3;2;4;2;3	BX30	t
81	2;7;6;3;2;4;3;3	BX30	t
82	2;8;5;3;2;3;1;2	BX30	t
83	2;8;5;3;2;3;1;3	BX30	t
84	2;8;5;3;2;3;2;3	BX30	t
85	2;8;5;3;2;3;3;3	BX30	t
86	2;8;6;2;2;4;1;2	BX30	t
87	2;8;6;2;2;4;1;3	BX30	t
88	2;8;6;2;2;4;2;3	BX30	t
89	2;8;6;2;2;4;3;3	BX30	t
90	2;9;5;2;2;3;1;2	BX30	t
91	2;9;5;2;2;3;1;3	BX30	t
92	2;9;5;2;2;3;2;3	BX30	t
93	2;9;5;2;2;3;3;3	BX30	t
94	2;10;5;2;2;3;1;2	BX31	t
95	2;10;5;2;2;3;1;3	BX31	t
96	2;10;5;2;2;3;2;3	BX31	t
97	2;10;5;2;2;3;3;3	BX31	t
98	2;7;6;4;2;4;1;2	BX31	t
99	2;7;6;4;2;4;1;3	BX31	t
100	2;7;6;4;2;4;2;3	BX31	t
101	2;7;6;4;2;4;3;3	BX31	t
102	2;7;6;4;3;4;1;2	BX31	t
103	2;7;6;4;3;4;1;3	BX31	t
104	2;7;6;4;3;4;2;3	BX31	t
105	2;7;6;4;3;4;3;3	BX31	t
106	2;8;5;4;2;3;1;2	BX31	t
107	2;8;5;4;2;3;1;3	BX31	t
108	2;8;5;4;2;3;2;3	BX31	t
109	2;8;5;4;2;3;3;3	BX31	t
110	2;8;5;4;3;3;1;2	BX31	t
111	2;8;5;4;3;3;1;3	BX31	t
112	2;8;5;4;3;3;2;3	BX31	t
113	2;8;5;4;3;3;3;3	BX31	t
114	2;8;6;3;2;4;1;2	BX31	t
115	2;8;6;3;2;4;1;3	BX31	t
116	2;8;6;3;2;4;2;3	BX31	t
117	2;8;6;3;2;4;3;3	BX31	t
118	2;9;5;3;2;3;1;2	BX31	t
119	2;9;5;3;2;3;1;3	BX31	t
120	2;9;5;3;2;3;2;3	BX31	t
121	2;9;5;3;2;3;3;3	BX31	t
122	2;9;6;2;2;4;2;3	BX31	t
123	2;9;6;2;2;4;3;3	BX31	t
124	2;10;5;3;2;3;1;2	BX32	t
125	2;10;5;3;2;3;1;3	BX32	t
126	2;10;5;3;2;3;2;3	BX32	t
127	2;10;5;3;2;3;3;3	BX32	t
128	2;10;6;2;2;4;2;3	BX32	t
129	2;10;6;2;2;4;3;3	BX32	t
130	2;8;6;4;2;4;1;2	BX32	t
131	2;8;6;4;2;4;1;3	BX32	t
132	2;8;6;4;2;4;2;3	BX32	t
133	2;8;6;4;2;4;3;3	BX32	t
134	2;8;6;4;3;4;1;2	BX32	t
135	2;8;6;4;3;4;1;3	BX32	t
136	2;8;6;4;3;4;2;3	BX32	t
137	2;8;6;4;3;4;3;3	BX32	t
138	2;9;5;4;2;3;1;2	BX32	t
139	2;9;5;4;2;3;1;3	BX32	t
140	2;9;5;4;2;3;2;3	BX32	t
141	2;9;5;4;2;3;3;3	BX32	t
142	2;9;5;4;3;3;1;2	BX32	t
143	2;9;5;4;3;3;1;3	BX32	t
144	2;9;5;4;3;3;2;3	BX32	t
145	2;9;5;4;3;3;3;3	BX32	t
146	2;9;6;3;2;4;1;2	BX32	t
147	2;9;6;3;2;4;1;3	BX32	t
148	2;9;6;3;2;4;2;3	BX32	t
149	2;9;6;3;2;4;3;3	BX32	t
150	3;10;7;2;4;4;2;3	BX32	t
151	3;10;7;2;4;4;3;3	BX32	t
152	3;9;7;2;4;4;2;3	BX32	t
153	3;9;7;2;4;4;3;3	BX32	t
154	2;10;5;4;2;3;1;2	BX33	t
155	2;10;5;4;2;3;1;3	BX33	t
156	2;10;5;4;2;3;2;3	BX33	t
157	2;10;5;4;2;3;3;3	BX33	t
158	2;10;5;4;3;3;1;2	BX33	t
159	2;10;5;4;3;3;1;3	BX33	t
160	2;10;5;4;3;3;2;3	BX33	t
161	2;10;5;4;3;3;3;3	BX33	t
162	2;10;6;3;2;4;1;2	BX33	t
163	2;10;6;3;2;4;1;3	BX33	t
164	2;10;6;3;2;4;2;3	BX33	t
165	2;10;6;3;2;4;3;3	BX33	t
166	2;9;6;4;2;4;1;2	BX33	t
167	2;9;6;4;2;4;1;3	BX33	t
168	2;9;6;4;2;4;2;3	BX33	t
169	2;9;6;4;2;4;3;3	BX33	t
170	2;9;6;4;3;4;1;2	BX33	t
171	2;9;6;4;3;4;1;3	BX33	t
172	2;9;6;4;3;4;2;3	BX33	t
173	2;9;6;4;3;4;3;3	BX33	t
174	3;10;7;3;4;4;1;2	BX33	t
175	3;10;7;3;4;4;1;3	BX33	t
176	3;10;7;3;4;4;2;3	BX33	t
177	3;10;7;3;4;4;3;3	BX33	t
178	3;11;7;2;4;4;2;3	BX33	t
179	3;11;7;2;4;4;3;3	BX33	t
180	3;9;7;3;4;4;1;2	BX33	t
181	3;9;7;3;4;4;1;3	BX33	t
182	3;9;7;3;4;4;2;3	BX33	t
183	3;9;7;3;4;4;3;3	BX33	t
184	3;9;8;2;4;4;2;3	BX33	t
185	3;9;8;2;4;4;3;3	BX33	t
186	4;10;8;2;4;4;2;3	BX33	t
187	4;10;8;2;4;4;3;3	BX33	t
188	2;10;6;4;2;4;1;2	BX34	t
189	2;10;6;4;2;4;1;3	BX34	t
190	2;10;6;4;2;4;2;3	BX34	t
191	2;10;6;4;2;4;3;3	BX34	t
192	2;10;6;4;3;4;1;2	BX34	t
193	2;10;6;4;3;4;1;3	BX34	t
194	2;10;6;4;3;4;2;3	BX34	t
195	2;10;6;4;3;4;3;3	BX34	t
196	3;10;7;4;4;4;1;2	BX34	t
197	3;10;7;4;4;4;1;3	BX34	t
198	3;10;7;4;4;4;2;3	BX34	t
199	3;10;7;4;4;4;3;3	BX34	t
200	3;10;7;4;5;4;1;2	BX34	t
201	3;10;7;4;5;4;1;3	BX34	t
202	3;10;7;4;5;4;2;3	BX34	t
203	3;10;7;4;5;4;3;3	BX34	t
204	3;11;7;3;4;4;1;2	BX34	t
205	3;11;7;3;4;4;1;3	BX34	t
206	3;11;7;3;4;4;2;3	BX34	t
207	3;11;7;3;4;4;3;3	BX34	t
208	3;12;7;2;4;4;2;3	BX34	t
209	3;12;7;2;4;4;3;3	BX34	t
210	3;9;7;4;4;4;1;2	BX34	t
211	3;9;7;4;4;4;1;3	BX34	t
212	3;9;7;4;4;4;2;3	BX34	t
213	3;9;7;4;4;4;3;3	BX34	t
214	3;9;7;4;5;4;1;2	BX34	t
215	3;9;7;4;5;4;1;3	BX34	t
216	3;9;7;4;5;4;2;3	BX34	t
217	3;9;7;4;5;4;3;3	BX34	t
218	3;9;8;3;4;4;1;2	BX34	t
219	3;9;8;3;4;4;1;3	BX34	t
220	3;9;8;3;4;4;2;3	BX34	t
221	3;9;8;3;4;4;3;3	BX34	t
222	4;10;8;3;4;4;1;2	BX34	t
223	4;10;8;3;4;4;1;3	BX34	t
224	4;10;8;3;4;4;2;3	BX34	t
225	4;10;8;3;4;4;3;3	BX34	t
226	4;11;8;2;4;4;2;3	BX34	t
227	4;11;8;2;4;4;3;3	BX34	t
228	3;11;7;4;4;4;1;2	BX35	t
229	3;11;7;4;4;4;1;3	BX35	t
230	3;11;7;4;4;4;2;3	BX35	t
231	3;11;7;4;4;4;3;3	BX35	t
232	3;11;7;4;5;4;1;2	BX35	t
233	3;11;7;4;5;4;1;3	BX35	t
234	3;11;7;4;5;4;2;3	BX35	t
235	3;11;7;4;5;4;3;3	BX35	t
236	3;12;7;3;4;4;1;2	BX35	t
237	3;12;7;3;4;4;1;3	BX35	t
238	3;12;7;3;4;4;2;3	BX35	t
239	3;12;7;3;4;4;3;3	BX35	t
240	3;9;8;4;4;4;1;2	BX35	t
241	3;9;8;4;4;4;1;3	BX35	t
242	3;9;8;4;4;4;2;3	BX35	t
243	3;9;8;4;4;4;3;3	BX35	t
244	3;9;8;4;5;4;1;2	BX35	t
245	3;9;8;4;5;4;1;3	BX35	t
246	3;9;8;4;5;4;2;3	BX35	t
247	3;9;8;4;5;4;3;3	BX35	t
248	4;10;8;4;4;4;1;2	BX35	t
249	4;10;8;4;4;4;1;3	BX35	t
250	4;10;8;4;4;4;2;3	BX35	t
251	4;10;8;4;4;4;3;3	BX35	t
252	4;10;8;4;5;4;1;2	BX35	t
253	4;10;8;4;5;4;1;3	BX35	t
254	4;10;8;4;5;4;2;3	BX35	t
255	4;10;8;4;5;4;3;3	BX35	t
256	4;10;9;5;4;4;1;2	BX35	t
257	4;10;9;5;4;4;1;3	BX35	t
258	4;10;9;5;4;4;2;3	BX35	t
259	4;10;9;5;4;4;3;3	BX35	t
260	4;11;8;3;4;4;1;2	BX35	t
261	4;11;8;3;4;4;1;3	BX35	t
262	4;11;8;3;4;4;2;3	BX35	t
263	4;11;8;3;4;4;3;3	BX35	t
264	4;12;8;2;4;4;2;3	BX35	t
265	4;12;8;2;4;4;3;3	BX35	t
266	4;8;10;7;6;5;3;3	BX35	t
267	4;8;10;7;6;6;3;3	BX35	t
268	4;8;10;8;6;5;3;3	BX35	t
269	4;8;11;7;6;5;3;3	BX35	t
270	3;12;7;4;4;4;1;2	BX36	t
271	3;12;7;4;4;4;1;3	BX36	t
272	3;12;7;4;4;4;2;3	BX36	t
273	3;12;7;4;4;4;3;3	BX36	t
274	3;12;7;4;5;4;1;2	BX36	t
275	3;12;7;4;5;4;1;3	BX36	t
276	3;12;7;4;5;4;2;3	BX36	t
277	3;12;7;4;5;4;3;3	BX36	t
278	4;10;10;5;4;4;1;2	BX36	t
279	4;10;10;5;4;4;1;3	BX36	t
280	4;10;10;5;4;4;2;3	BX36	t
281	4;10;10;5;4;4;3;3	BX36	t
282	4;10;9;5;5;4;1;2	BX36	t
283	4;10;9;5;5;4;1;3	BX36	t
284	4;10;9;5;5;4;2;3	BX36	t
285	4;10;9;5;5;4;3;3	BX36	t
286	4;10;9;6;4;4;1;2	BX36	t
287	4;10;9;6;4;4;1;3	BX36	t
288	4;10;9;6;4;4;2;3	BX36	t
289	4;10;9;6;4;4;3;3	BX36	t
290	4;11;8;4;4;4;1;2	BX36	t
291	4;11;8;4;4;4;1;3	BX36	t
292	4;11;8;4;4;4;3;3	BX36	t
293	4;11;8;4;5;4;1;2	BX36	t
294	4;11;8;4;5;4;1;3	BX36	t
295	4;11;8;4;5;4;2;3	BX36	t
296	4;11;8;4;5;4;3;3	BX36	t
297	4;11;8;4;v;4;2;3	BX36	t
298	4;11;9;5;4;4;1;2	BX36	t
299	4;11;9;5;4;4;1;3	BX36	t
300	4;11;9;5;4;4;2;3	BX36	t
301	4;11;9;5;4;4;3;3	BX36	t
302	4;12;8;3;4;4;1;2	BX36	t
303	4;12;8;3;4;4;1;3	BX36	t
304	4;12;8;3;4;4;2;3	BX36	t
305	4;12;8;3;4;4;3;3	BX36	t
306	4;8;10;8;6;6;3;3	BX36	t
307	4;8;11;7;6;6;3;3	BX36	t
308	4;8;11;8;6;5;3;3	BX36	t
309	4;9;10;7;6;5;3;3	BX36	t
310	4;9;10;7;6;6;3;3	BX36	t
311	4;9;10;8;6;5;3;3	BX36	t
312	4;9;11;7;6;5;3;3	BX36	t
313	4;10;10;5;5;4;1;2	BX37	t
314	4;10;10;5;5;4;1;3	BX37	t
315	4;10;10;5;5;4;2;3	BX37	t
316	4;10;10;5;5;4;3;3	BX37	t
317	4;10;10;6;4;4;1;2	BX37	t
318	4;10;10;6;4;4;1;3	BX37	t
319	4;10;10;6;4;4;2;3	BX37	t
320	4;10;10;6;4;4;3;3	BX37	t
321	4;10;10;7;6;5;3;3	BX37	t
322	4;10;10;7;6;6;3;3	BX37	t
323	4;10;10;8;6;5;3;3	BX37	t
324	4;10;11;7;6;5;3;3	BX37	t
325	4;10;9;6;5;4;1;2	BX37	t
326	4;10;9;6;5;4;1;3	BX37	t
327	4;10;9;6;5;4;2;3	BX37	t
328	4;10;9;6;5;4;3;3	BX37	t
329	4;11;10;5;4;4;1;2	BX37	t
330	4;11;10;5;4;4;1;3	BX37	t
331	4;11;10;5;4;4;2;3	BX37	t
332	4;11;10;5;4;4;3;3	BX37	t
333	4;11;9;5;5;4;1;2	BX37	t
334	4;11;9;5;5;4;1;3	BX37	t
335	4;11;9;5;5;4;2;3	BX37	t
336	4;11;9;5;5;4;3;3	BX37	t
337	4;11;9;6;4;4;1;2	BX37	t
338	4;11;9;6;4;4;1;3	BX37	t
339	4;11;9;6;4;4;2;3	BX37	t
340	4;11;9;6;4;4;3;3	BX37	t
341	4;12;8;4;4;4;1;2	BX37	t
342	4;12;8;4;4;4;1;3	BX37	t
343	4;12;8;4;4;4;2;3	BX37	t
344	4;12;8;4;4;4;3;3	BX37	t
345	4;12;8;4;5;4;1;2	BX37	t
346	4;12;8;4;5;4;1;3	BX37	t
347	4;12;8;4;5;4;2;3	BX37	t
348	4;12;8;4;5;4;3;3	BX37	t
349	4;12;9;5;4;4;1;2	BX37	t
350	4;12;9;5;4;4;1;3	BX37	t
351	4;12;9;5;4;4;2;3	BX37	t
352	4;12;9;5;4;4;3;3	BX37	t
353	4;8;11;8;6;6;3;3	BX37	t
354	4;9;10;8;6;6;3;3	BX37	t
355	4;9;11;7;6;6;3;3	BX37	t
356	4;9;11;8;6;5;3;3	BX37	t
357	4;10;10;6;5;4;1;2	BX38	t
358	4;10;10;6;5;4;1;3	BX38	t
359	4;10;10;6;5;4;2;3	BX38	t
360	4;10;10;6;5;4;3;3	BX38	t
361	4;10;10;8;6;6;3;3	BX38	t
362	4;10;11;7;6;6;3;3	BX38	t
363	4;10;11;8;6;5;3;3	BX38	t
364	4;11;10;5;5;4;1;2	BX38	t
365	4;11;10;5;5;4;1;3	BX38	t
366	4;11;10;5;5;4;2;3	BX38	t
367	4;11;10;5;5;4;3;3	BX38	t
368	4;11;10;6;4;4;1;2	BX38	t
369	4;11;10;6;4;4;1;3	BX38	t
370	4;11;10;6;4;4;2;3	BX38	t
371	4;11;10;6;4;4;3;3	BX38	t
372	4;11;10;7;6;5;3;3	BX38	t
373	4;11;10;7;6;6;3;3	BX38	t
374	4;11;10;8;6;5;3;3	BX38	t
375	4;11;11;7;6;5;3;3	BX38	t
376	4;11;9;6;5;4;1;2	BX38	t
377	4;11;9;6;5;4;1;3	BX38	t
378	4;11;9;6;5;4;2;3	BX38	t
379	4;11;9;6;5;4;3;3	BX38	t
380	4;12;10;5;4;4;1;2	BX38	t
381	4;12;10;5;4;4;1;3	BX38	t
382	4;12;10;5;4;4;2;3	BX38	t
383	4;12;10;5;4;4;3;3	BX38	t
384	4;12;9;5;5;4;1;2	BX38	t
385	4;12;9;5;5;4;1;3	BX38	t
386	4;12;9;5;5;4;2;3	BX38	t
387	4;12;9;5;5;4;3;3	BX38	t
388	4;12;9;6;4;4;1;2	BX38	t
389	4;12;9;6;4;4;1;3	BX38	t
390	4;12;9;6;4;4;2;3	BX38	t
391	4;12;9;6;4;4;3;3	BX38	t
392	4;9;11;8;6;6;3;3	BX38	t
393	4;10;11;8;6;6;3;3	BX39	t
394	4;11;10;6;5;4;1;2	BX39	t
395	4;11;10;6;5;4;1;3	BX39	t
396	4;11;10;6;5;4;2;3	BX39	t
397	4;11;10;6;5;4;3;3	BX39	t
398	4;11;10;8;6;6;3;3	BX39	t
399	4;11;11;7;6;6;3;3	BX39	t
400	4;11;11;8;6;5;3;3	BX39	t
401	4;12;10;5;5;4;1;2	BX39	t
402	4;12;10;5;5;4;1;3	BX39	t
403	4;12;10;5;5;4;2;3	BX39	t
404	4;12;10;5;5;4;3;3	BX39	t
405	4;12;10;6;4;4;1;2	BX39	t
406	4;12;10;6;4;4;1;3	BX39	t
407	4;12;10;6;4;4;2;3	BX39	t
408	4;12;10;6;4;4;3;3	BX39	t
409	4;12;10;7;6;5;3;3	BX39	t
410	4;12;10;7;6;6;3;3	BX39	t
411	4;12;10;8;6;5;3;3	BX39	t
412	4;12;11;7;6;5;3;3	BX39	t
413	4;12;9;6;5;4;1;2	BX39	t
414	4;12;9;6;5;4;1;3	BX39	t
415	4;12;9;6;5;4;2;3	BX39	t
416	4;12;9;6;5;4;3;3	BX39	t
417	4;11;11;8;6;6;3;3	BX40	t
418	4;12;10;6;5;4;1;2	BX40	t
419	4;12;10;6;5;4;1;3	BX40	t
420	4;12;10;6;5;4;2;3	BX40	t
421	4;12;10;6;5;4;3;3	BX40	t
422	4;12;10;8;6;6;3;3	BX40	t
423	4;12;11;7;6;6;3;3	BX40	t
424	4;12;11;8;6;5;3;3	BX40	t
425	4;13;10;7;6;5;3;3	BX40	t
426	4;13;10;7;6;6;3;3	BX40	t
427	4;13;10;8;6;5;3;3	BX40	t
428	4;13;11;7;6;5;3;3	BX40	t
429	4;12;11;8;6;6;3;3	BX41	t
430	4;13;10;8;6;6;3;3	BX41	t
431	4;13;11;7;6;6;3;3	BX41	t
432	4;13;11;8;6;5;3;3	BX41	t
433	4;13;11;8;6;6;3;3	BX42	t
\.


--
-- Data for Name: admin_avaliacao_conhecimentos; Type: TABLE DATA; Schema: public; Owner: cristiano
--

COPY public.admin_avaliacao_conhecimentos (id, code, name, is_active) FROM stdin;
1	1	Inicial ou Mínimo	t
2	2	Restrito ou Limitado	t
3	3	Elementar ou Básico	t
4	4	Técnico iniciante	t
5	5	Técnico elementar	t
6	6	Técnico especializado	t
7	7	Técnico altamente especializado	t
8	8	Profissional iniciante	t
9	9	Profissional elementar	t
10	10	Profissional especializado	t
11	11	Profissional altamente especializado	t
12	12	Especializado maduro	t
13	13	Especializado profundo	t
14	14	Especializado proeminente	t
15	15	Notório	t
\.


--
-- Data for Name: admin_avaliacao_familias; Type: TABLE DATA; Schema: public; Owner: cristiano
--

COPY public.admin_avaliacao_familias (id, name, detail, is_active) FROM stdin;
1	Administrativo	detail	t
2	Auditoria	detail	t
3	Comercial	detail	t
4	Comunicação	detail	t
5	Controladoria	detail	t
6	Engenharia	detail	t
7	Financeiro	detail	t
8	Gerenciamento de Riscos	detail	t
9	Importação e Exportação	detail	t
10	Jurídico	detail	t
11	Logística	detail	t
12	M&A	detail	t
13	Manutenção	detail	t
14	Marketing	detail	t
15	Novos Negócios	detail	t
16	Operação	detail	t
17	Projetos	detail	t
18	Qualidade	detail	t
20	Saúde e Segurança do Trabalho	detail	t
21	Suprimentos	detail	t
22	Sustentabilidade	detail	t
23	Tecnologia da Informação	detail	t
24	Gestão	detail	t
25	Meio Ambiente	detail	t
26	Mineração	detail	t
19	Recursos Humanos	detail	t
27	teste id		t
\.


--
-- Data for Name: admin_avaliacao_fatores; Type: TABLE DATA; Schema: public; Owner: cristiano
--

COPY public.admin_avaliacao_fatores (id, name, detail, is_active, code) FROM stdin;
3	Escopo	Este fator trata do desdobramento do Nível organizacional, relacionado à estratégia e sua execução.\nÉ um fator hierárquico (sempre será menor que o Escopo de atuação do gestor imediato)	t	3
1	Nível Organizacional	Este fator define a hierarquia dentro da organização, relacionado à tomada de decisão, definição e implementação da estratégia.	t	1
2	Conhecimento	Esse fator trata da formação necessário seja ela formal ou equivalente, do nível de profundidade do conhecimento  e a experiência traduzida na aplicação prática do conhecimento desejado para o desempenho esperado. Trata-se do conhecimento adquirido na prática.	t	2
4	Abrangência	Este fator refere-se à área de atuação em relação à natureza das atividades (amplitude e natureza)	t	4
5	Contribuição para o resultado	Este fator refere-se ao tipo de contribuição que o cargo tem no resultado do negócio.	t	5
6	Gestão Recebida	Este fator refere-se ao tipo de supervisão recebida do gestor imediato do cargo avaliado.	t	6
7	Liderança	Este fator refere-se ao tipo de atuação em relação a gestão de pessoas e a formatação da equipe diretamente subordinada.	t	7
8	Comunicação	Este fator refere-se a natureza da comunicação exigido em função da natureza da atividade ou nível de gestão do cargo.	t	8
\.


--
-- Data for Name: admin_avaliacao_grades; Type: TABLE DATA; Schema: public; Owner: cristiano
--

COPY public.admin_avaliacao_grades (id, number, minimum, average, maximum, detail) FROM stdin;
1	1	0	10	20	
2	2	11	15	20	
3	3	21	25	30	
4	4	31	35	40	
5	5	41	45	50	
6	6	51	55	60	
7	7	61	65	70	
8	8	71	75	80	
9	9	81	85	90	
10	10	91	95	100	
\.


--
-- Data for Name: admin_avaliacao_matrizes; Type: TABLE DATA; Schema: public; Owner: cristiano
--

COPY public.admin_avaliacao_matrizes (id, name, score, detail, factor_id, level_id, is_active) FROM stdin;
\.


--
-- Data for Name: admin_avaliacao_niveis; Type: TABLE DATA; Schema: public; Owner: cristiano
--

COPY public.admin_avaliacao_niveis (id, name, detail, factor_id, is_active, code, "�0&K^�UY��&c}����qy/6͢~�8GRoC*r�OJ��") FROM stdin;
1	Operacional	Atua de acordo com os padrões definido. Execução individual do trabalho e na sua maioria trabalha em grupos para o alcance dos resultados, ou execução dos planos operacionais em grupo.	1	t	1	\N
2	Profissional	Implementa ou facilita a implementação dos planos táticos, desenvolve os planos operacionais e o desenvolvimento das atividades.	1	t	2	\N
3	Tático	Realiza o desdobramento da estratégia do negócio; define os planos operacionais; visão de médio prazo; desdobra a estratégia em plano tático.	1	t	3	\N
4	Estratégico	Define e implementa a estratégia do negócio; visão de longo prazo. Foco na Visão, Missão, Filosofia e Valores da empresa; Olhar ao ambiente externo.	1	t	4	\N
5	Inicial ou Mínimo	Não é exigida experiência prévia do ocupante do cargo, o conhecimento será adquirido através de orientações breves	2	t	1	\N
6	Restrito ou Limitado	Formação equivalente à nível Fundamental ou Ensino Médio, com experiência em tarefas básicas e repetitivas, necessita de treinamento no local de trabalho.	2	t	2	\N
7	Elementar ou Básico	Formação equivalente ao Ensino Médio com alguma formação de nível profissionalizante, com experiência em tarefas básicas e repetitivas e que requeiram a aplicação de métodos ou técnicas específicas, necessita de treinamento especializado.	2	t	3	\N
8	Específico iniciante	Formação equivalente ao Ensino Médio com formação técnica específica, e/ou  experiência inicial para apoiar na execução de trabalhos de natureza técnica; ou formação equivalente ao nível profissional/nível superior em andamento.	2	t	4	\N
9	Específico maduro	Formação equivalente ao Ensino Médio com formação técnica específica, e/ou experiência para executar trabalhos de natureza técnica; ou formação equivalente ao nível profissional/nível superior em andamento.	2	t	5	\N
10	Específico especializado ou Profissional iniciante	Formação equivalente ao Ensino Médio com formação técnica específica, e/ou experiência para executar e responder por trabalhos de natureza técnica especializado; ou formação equivalente ao nível Superior específico em uma disciplina, e experiência inicial para apoiar na execução de trabalhos de natureza analítica.	2	t	6	\N
11	Profissional maduro ou Específico altamente especializado	Formação equivalente ao nível Superior específico em uma disciplina, e experiência para executar trabalhos de natureza analítica; ou Formação equivalente ao Ensino Médio com formação técnica específica, e/ou experiência para executar e responder por trabalhos de natureza técnica altamente especializado.	2	t	7	\N
12	Profissional especializado	Formação equivalente ao nível Superior específico em uma disciplina, e experiência para executar e responder por trabalhos de natureza analítica e para o desenvolvimento de melhorias.	2	t	8	\N
13	Profissional altamente especializado	Formação equivalente ao nível Superior específico em uma disciplina com especialização comprovada (Pós graduação, MBA ou equivalente), e experiência para executar e responder por trabalhos de natureza analítica e para o desenvolvimento de melhorias, de soluções e/ou aperfeiçoamento de processos, e possível Mentoria de profissionais seniores.	2	t	9	\N
14	Especializado maduro	Formação equivalente ao nível Superior específico em uma disciplina com especialização comprovada (Pós graduação, MBA ou equivalente), e experiência para executar e responder por trabalhos de natureza analítica e para o desenvolvimento de melhorias, de soluções e/ou aperfeiçoamento de técnicas, e possível Mentoria de profissionais seniores e outros especialistas.	2	t	10	\N
15	Especializado profundo	Formação equivalente ao nível Superior específico em uma disciplina com especialização comprovada (Pós graduação, MBA e Mestrado ou equivalente), e experiência para executar e responder por trabalhos de natureza analítica e para o desenvolvimento de melhorias, de soluções e/ou aperfeiçoamento de produtos ou serviços da empresa, e possível Mentoria de outros especialistas.	2	t	11	\N
16	Especializado proeminente	Formação equivalente ao nível Superior específico em uma disciplina com especialização comprovada (Pós graduação, MBA e Mestrado ou equivalente), e experiência para executar e responder por trabalhos de natureza analítica e para o desenvolvimento de melhorias, de soluções e/ou aperfeiçoamento do negócio, e possível Mentoria de outros especialistas.	2	t	12	\N
17	Notório	Formação equivalente ao nível Superior específico em uma disciplina com especialização comprovada (Doutorado ou equivalente), e experiência para executar e responder por trabalhos de natureza analítica e para o desenvolvimento de melhorias, de soluções e/ou aperfeiçoamento do negócio, e possível Mentoria de outros especialistas.	2	t	13	\N
18	Execução/Tarefa	Atua no âmbito de normas e instruções, devendo segui-los irrestritamente para obtenção dos resultados esperados.\nHorizonte de atuação: diário	3	t	1	\N
19	Aplicação Conhecimento	Atua no âmbito de normas e instruções, devendo segui-los irrestritamente para obtenção dos resultados esperados. Aplicando determinado nível de conhecimento a partir de conhecimento adquirido na realização da atividade.\nHorizonte de atuação: diário/semanal	3	t	2	\N
20	Aplicação Procedimentos	Atua no âmbito de normas e instruções, embora envolva execução de tarefas específicas, é permitida adaptações simples e eventuais mudanças nas condições de trabalho. Atua na execução dos planos diários.\nHorizonte de atuação: semanal	3	t	3	\N
21	Execução Qualificada	Atua guiado por procedimentos restritos,  normas técnicas e/ou precedentes específicos, envolve execução de tarefas com conteúdo qualificado/técnico, sendo permitida adaptações e eventuais mudanças nas condições de trabalho. Execução dos planos operacionais.\nHorizonte de atuação: semanal/mensal	3	t	4	\N
22	Análise e Desenvolvimento	Executa as atribuições regulado pelos procedimentos. Envolve análise, desenvolvimento de alternativas, ou soluções com opção de escolha sobre os meios e caminhos de realizá-los.\nHorizonte de atuação de curto prazo: semestral-anual	3	t	5	\N
23	Implementação Tática	Aplica procedimentos e planos traçados. Executa suas atribuições escolhendo entre variáveis amplas os meios e caminhos de realizá-los. Se necessário pode criar procedimentos que viabilizam a aplicação das políticas definidas. Realiza a implementação dos planos táticos.\nHorizonte de atuação de curto prazo: até 1 ano	3	t	6	\N
24	Desenvolvimento de Plano Tático	Desenvolvimento de planos táticos entre várias áreas (integrado) ou para uma área específica.  \nTraduz políticas, tangibilizando sua aplicação.\nHorizonte de atuação de curto prazo: até 1 ano	3	t	7	\N
25	Desenvolve e propõe a estratégia funcional de uma área específica	Desenvolve e propõe a estratégia funcional para uma área funcional específica. seu escopo é direcionado para estratégia e política específica para uma área de negócio, o foco é estabelecer planos, processos e prioridades, para atingir objetivos traçados.\nHorizonte de de atuação de curto-médio prazo: 2 a 3 anos.	3	t	8	\N
26	Desenvolve e propõe a estratégia funcional de forma abrangente	Desenvolve e propõe a estratégia funcional para as áreas de abrangência sob sua responsabilidade; seu escopo é direcionado para estratégias segmentadas e/ou políticas específicas de áreas de negócio, o foco é estabelecer planos, processos e prioridades, para atingir objetivos traçados.\nHorizonte de de atuação de curto-médio prazo: 2 a 3 anos.	3	t	9	\N
27	Desenvolve e propõe a estratégia de negócio	Desenvolve e propõe a estratégia funcional para as áreas de abrangência sob sua responsabilidade; seu Desenvolve e propõe a estratégia de negócio para uma B.U. (business unit); seu escopo é direcionado por estratégias funcionais ou políticas amplas de negócio, o foco é estabelecer planos, processos e prioridades, para atingir objetivos traçados. Tem liberdade para propor ações estratégicas para decisão do Conselho da empresa.\nHorizonte de atuação de médio prazo: 3 a 5 anos.	3	t	10	\N
28	Define a estratégia de negócio	Define a estratégia local e desdobra as estratégias regionais ou globais; seu escopo e ações são direcionados por objetivos gerais do negócio/organização, tendo a liberdade para definir as estratégias.\nHorizonte de atuação de longo prazo: acima de 5 anos	3	t	11	\N
29	Operacional	Atuação em uma área específica com atividades replicáveis (de nível técnico ou não), intensamente reguladas por procedimentos e normas que são tipicamente observadas na operação de equipamentos da cadeia de valor do negócio, ou ainda na realização de serviços de apoio ou periféricos.	4	t	1	\N
30	Especifica Transacional	Atuação em uma área com atividades típicas de natureza administrativa operacional,  em processos de baixa complexidade, manuais, repetitivas.\nO Impacto é indireto nos resultados do negócio.	4	t	2	\N
31	Específica Qualificada	Atuação em áreas de apoio e suporte ao negócio.\nA posição é responsável por processos que suportam as áreas core para o alcance da estratégia do negócio já definida. Atuação corporativa ou local.\nO Impacto é indireto nos resultados do negócio.	4	t	3	\N
32	Específica Core ou Especializada	Atuação em área específica de conhecimento core da organização, ou\natuação em área específica de serviços especializados de aconselhamento para o negócio.\nA posição é responsável por aconselhamento dentro da sua área que irá influenciar na tomada de decisão da organização. Atuação corporativa ou local.	4	t	4	\N
33	Diversa e convergente	Atuação em parte de uma organização contemplando várias áreas de mesma natureza ((processos que são relacionados na sua natureza)	4	t	5	\N
34	Diversa e divergente	Atuação em parte de uma organização contemplando várias áreas de natureza divergente (processos que são diferentes na sua natureza)	4	t	6	\N
35	Parcial	Atuação em algumas áreas da organização, envolvendo Administrativo Financeiro e/ou Comercialização/Prestação de serviços e/ou Produção e/ou Aplicação de Soluções.	4	t	7	\N
36	Amplo	Atuação em todas as áreas da organização, envolvendo Administrativo Financeiro, Comercialização e/ou Prestação de serviços, Produção e Aplicação de Soluções.	4	t	8	\N
37	Metas Rígidas	Atua dentro de limites claros e regras rígidas, o impacto nos resultados gerais  pode ser identificado mais efetivamente pela ação de uma equipe/grupo (do que individualmente), sendo esta contribuição tipicamente indireta.	5	t	1	\N
38	Metas Definidas com impacto indireto	Atua de acordo com regras, deve segui-las para que os resultados ocorram dentro dos parâmetros, tipicamente pode gerar uma performance individual destacada, a contribuição é indireta aos resultados do negócio.	5	t	2	\N
39	Metas Definidas com impacto direto	Atua de acordo com regras, deve segui-las para que os resultados ocorram dentro dos parâmetros, tipicamente pode gerar uma performance individual destacada, a contribuição é direta aos resultados do negócio.	5	t	3	\N
40	Plano Negócios com impacto indireto	Segue um plano de negócios com caminhos estabelecidos, porém tem liberdade para realocação de ações que otimizam a performance e os resultados, a contribuição causa impacto indireto no resultado do negócio.	5	t	4	\N
41	Plano Negócios com impacto direto	Segue um plano de negócios com caminhos estabelecidos, porém tem liberdade para realocação de ações que otimizam a performance e os resultados, a contribuição causa impacto direto no resultado do negócio.	5	t	5	\N
42	Plano Geral	Responde pelo resultado do negócio.\nÉ a principal contribuição para o alcance dos resultados do negócio.	5	t	6	\N
43	Por resultado da tarefa	É cobrado pelo resultado de um tarefa ou conjunto de tarefas que compõem uma atividade;  o resultado é medido diariamente.\nAs tarefas são as ações previstas para a realização de um objetivo ou meta.	6	t	1	\N
44	Por resultado da atividade	É cobrado pelo resultado de um conjunto de atividades que compõem um processo;  o resultado pode ser medido semanalmente ou diariamente, a depender da duração e frequência do processo.\nAtividades são as ações que envolvem o como entregar um determinado resultado ou alcançar um determinado objetivo ou meta; é composto por um conjunto de tarefas.	6	t	2	\N
45	Por resultado do processo	É cobrado pelo resultado do processo sob sua responsabilidades;  o resultado pode ser medido mensalmente, semanalmente ou diariamente, a depender da duração e frequência do processo.\nProcesso é o conjunto de atividades e tarefas que compõem uma responsabilidade por um resultado.	6	t	3	\N
46	Por Resultado da Area	É cobrado pelo resultado geral da área; geralmente o resultado da área é medido mensalmente.	6	t	4	\N
47	Por Resultado Geral	É cobrado pelo resultado geral da empresa; geralmente o resultado anual.	6	t	5	\N
48	Independente	Não tem seu trabalho supervisionado, apresenta independência nas definições e nos resultados. Acompanha e requer os resultados pré-estabelecidos.	6	t	6	\N
49	Sem Equipe	Atua sem uma equipe subordinada, responsável por realizar suas atividades, podendo atuar com uma equipe para orientação técnica apenas.	7	t	1	\N
50	Gestor de Equipe	Atuação com uma equipe de pelo menos duas pessoas.\nPlanejamento e direcionamento do fluxo de trabalho da equipe, delegação de tarefas e acompanhamento das atividades, além de responder pela avaliação de desempenho, decisões de promoção, contratações e desligamentos dos seus subordinados diretos.	7	t	2	\N
51	Gestor de Gestores	Atuação com uma equipe de gestores de outras equipes.\nPlanejamento abrangente com visão estratégica do negócio e análise dos resultados, respondendo também pela avaliação de desempenho, decisões de promoção, contratações e desligamentos dos seus subordinados diretos.	7	t	3	\N
52	Informativa	Contato com clientes internos para troca de informações.	8	t	1	\N
53	Influenciadora	Contato com clientes internos e/ou externos para troca de informações, colaboração, e de influência nos processos.	8	t	2	\N
54	Negociação	Negociação e tomada de decisões com clientes, fornecedores, parceiros externos ou clientes internos; gestão de uma equipe ou de gestores, atuando na mobilização de comportamentos e influência de atuação.	8	t	3	\N
\.


--
-- Data for Name: admin_avaliacao_subfamilias; Type: TABLE DATA; Schema: public; Owner: cristiano
--

COPY public.admin_avaliacao_subfamilias (id, name, detail, family_id, is_active) FROM stdin;
1	Administrativo		1	t
2	Cadastro		1	t
3	Controles Internos		1	t
4	Facilities		1	t
5	Gestão de Indicadores		1	t
6	Secretária		1	t
7	Segurança Patrimonial		1	t
8	Serviços de Copa		1	t
9	Serviços de Limpeza		1	t
10	Sistema de Gestão		1	t
11	Auditoria		2	t
12	Administração de Vendas		3	t
13	Assistência Técnica		3	t
14	Atendimento ao cliente		3	t
16	Comercial		3	t
17	Customer Service		3	t
18	Exportação		3	t
19	Gestão de Contratos		3	t
20	Licitação		3	t
22	Merchandising		3	t
23	Pré Vendas		3	t
24	Precificação		3	t
25	Projetos Logísticos		3	t
26	Trade Marketing		3	t
27	Vendas		3	t
28	Comunicação		4	t
29	Comunicação Externa		4	t
30	Comunicação Interna		4	t
31	Redação		4	t
32	Contabilidade		5	t
33	Controladoria		5	t
34	Custos		5	t
35	Fiscal		5	t
36	Fiscal Tributário		5	t
37	Recebimento Fiscal		5	t
38	Automação		6	t
40	Engenharia		6	t
41	Engenharia de Processos		6	t
42	Cobrança		7	t
43	Contas a Pagar		7	t
44	Contas a Receber		7	t
45	Crédito		7	t
46	Crédito e Cobrança		7	t
47	Faturamento		7	t
48	Financeiro		7	t
49	Planejamento Estratégico		7	t
50	Planejamento Financeiro		7	t
51	Planejamento Tributário		7	t
52	Relação com Investidores		7	t
53	Seguros		7	t
54	Tesouraria		7	t
55	Gerenciamento de Riscos		8	t
56	Comércio Exterior		9	t
57	Importação e Exportação		9	t
58	Segurança Aduaneira		9	t
59	Assuntos Regulatórios		10	t
60	Compliance		10	t
61	Contencioso Civel		10	t
62	Contencioso Tributário		10	t
63	Empresarial		10	t
64	Imobiliário		10	t
65	Jurídico		10	t
66	Regulatório-EXCLUIDO		10	t
67	Trabalhista		10	t
68	Armazenagem		11	t
69	Controle de Tráfego		11	t
70	Distribuição		11	t
71	Expedição de Carga		11	t
72	Gestão de Frota		11	t
73	Implantação Projetos Logísticos		11	t
74	Logística		11	t
75	Movimentação de Carga		11	t
76	Movimentação de Materiais		11	t
77	Transporte		11	t
78	M&A (Mergers and Acquisitions)		12	t
79	Abastecimento		13	t
80	Apoio à Manutenção		13	t
81	Automotiva		13	t
82	Borracheiro		13	t
83	Confiabilidade		13	t
84	Elétrica		13	t
85	Eletrônico		13	t
86	Engenharia de Manutenção		13	t
87	Ferramentaria		13	t
88	Industrial		13	t
89	Jardinagem		13	t
90	Lavagem Veicular		13	t
91	Limpeza e Conservação		13	t
92	Manutenção		13	t
93	Mecânica		13	t
94	Montagem de Máquina		13	t
95	PCM		13	t
96	Pintura Veicular		13	t
97	Predial		13	t
98	Projetos de Manutenção		13	t
99	Desenvolvimento de Produto		3	t
100	Designer		14	t
101	Marketing		14	t
102	Marketing Digital		14	t
103	Novos Negócios		15	t
104	Apoio à Operação		16	t
105	Energia		16	t
106	Operação		16	t
107	Operação de Equipamentos Móveis		16	t
108	Operação de Máquinas		16	t
109	PCP		16	t
110	Pesquisa Operacional		16	t
111	Processos		16	t
112	Produção		16	t
113	Tratamento de Resíduos		16	t
114	Utilidades		16	t
115	Arquitetura		17	t
116	Projetos de Engenharia		17	t
117	Gestão de Projetos		17	t
118	Projetos		17	t
119	Controle da Qualidade		18	t
120	Controle Farmacêutico		18	t
121	Garantia da Qualidade		18	t
122	Laboratório		18	t
123	Melhoria Continua		18	t
124	Qualidade		18	t
125	Qualidade Operacional		18	t
126	Administração de Pessoal		19	t
127	Assistência Social		19	t
128	Benefícios		19	t
129	Business Partner em RH		19	t
130	Cargos e Salários		19	t
131	Desenvolvimento de Pessoas		19	t
132	Estruturação Organizacional		19	t
133	Orçamento de Pessoal		19	t
134	Projetos Sociais		19	t
135	Recrutamento e Seleção		19	t
136	Recursos Humanos		19	t
137	Relações Trabalhistas e Sindicais		19	t
138	Remuneração e Benefícios		19	t
139	Responsabilidade Social		19	t
140	Treinamento		19	t
141	Treinamento Operacional		19	t
142	Cultura		19	t
143	Medicina do Trabalho		20	t
144	Meio Ambiente		25	t
145	Saúde Ocupacional		20	t
146	Segurança do Trabalho		20	t
147	Saúde e Segurança do Trabalho		20	t
148	Almoxarifado		21	t
149	Compras		21	t
150	Compras - mercado externo		21	t
151	Compras - mercado interno		21	t
152	Controle de Materiais		21	t
153	Estoque		21	t
154	Expedição		21	t
155	S&OP		21	t
156	Suprimentos		21	t
157	Sustentabilidade		22	t
158	Arquiteto de Dados		23	t
159	Arquitetura de Software		23	t
160	Banco de Dados		23	t
161	Business Inteligence		23	t
162	Business Partner em TI		23	t
163	Cientista de Dados		23	t
164	Desenvolvedor BI		23	t
165	Desenvolvimento		23	t
166	Engenharia de Dados		23	t
167	Funcional		23	t
168	Infraestrutura de TI		23	t
169	Inovação		23	t
170	Programação		23	t
171	Projetos de TI		23	t
172	Rede		23	t
173	Segurança da Informação		23	t
174	Sistemas		23	t
175	Soluções em Tecnologia		23	t
176	Suporte de Sistemas		23	t
177	Suporte Técnico		23	t
178	Tecnologia da Informação		23	t
179	Testes de Sistemas		23	t
180	ESG		22	t
181	Gestão		24	t
182	Treinamento e Desenvolvimento		19	t
183	Inteligência de Mercado		3	t
184	Digital		23	t
185	Retenção de Cliente		3	t
186	e-commerce		3	t
187	Planejamento de Mina		26	t
188	Exploração Mineral		26	t
189	Sondagem		26	t
190	Lavra / Operação de Mina		26	t
191	Operação equipamentos de perfuração		26	t
192	Operação equipamentos de transporte de minério		26	t
193	Operação equipamentos de carregamento de minério		26	t
194	Engenharia de Mina		26	t
195	Geologia		26	t
196	Mineração		26	t
197	Eletromecânica		26	t
198	Enfermagem		20	t
199	Segurança Empresarial		24	t
200	Eletromecânica		13	t
201	Operação Mantenedora		16	t
202	Automação		13	t
203	Instrumentação		13	t
204	Planejamento de Manutenção		13	t
205	Programação de Manutenção		13	t
\.


--
-- Data for Name: admin_descricao_areas; Type: TABLE DATA; Schema: public; Owner: cristiano
--

COPY public.admin_descricao_areas (id, name, is_active) FROM stdin;
1	Administração de empresa	t
2	Antropologia	t
3	Área de Exatas	t
4	Área de Humanas	t
5	Arqueologia	t
6	Arquitetura e Urbanismo	t
7	Artes	t
8	Artes Cênicas	t
9	Astronomia	t
10	Biblioteconomia	t
11	Biofísica	t
12	Biologia	t
13	Bioquímica	t
14	Botânica	t
15	Ciência da Computação	t
16	Ciência da Informação	t
17	Ciência Política	t
18	Ciências Contábeis	t
19	Cinema	t
20	Comércio exterior	t
21	Comunicação	t
22	Comunicação Social	t
23	Dança	t
24	Direito	t
25	Ecologia	t
26	Economia	t
27	Educação Artística	t
28	Educação Física	t
29	Enfermagem	t
30	Engenharia	t
31	Engenharia Aeroespacial	t
32	Engenharia Agronômica	t
33	Engenharia Ambiental	t
34	Engenharia Biomédica	t
35	Engenharia Civil	t
36	Engenharia de Alimentos	t
37	Engenharia de Minas	t
38	Engenharia de Produção	t
39	Engenharia Elétrica	t
40	Engenharia Florestal	t
41	Engenharia Mecânica	t
42	Engenharia Mecatrônica	t
43	Engenharia Naval	t
44	Engenharia Nuclear	t
45	Engenharia Química	t
46	Engenharia Sanitária	t
47	Estatística	t
48	Farmácia	t
49	Física	t
50	Fisioterapia	t
51	Filosofia	t
52	Fonoaudiologia	t
53	Fotografia	t
54	Geografia	t
55	História	t
56	Letras	t
57	Logística	t
58	Marketing	t
59	Matemática	t
60	Medicina	t
61	Medicina Veterinária	t
62	Música	t
63	Nutrição	t
64	Odontologia	t
65	Pedagogia	t
66	Propaganda e Publicidade	t
67	Psicologia	t
68	Química	t
69	Serviço Social	t
70	Sociologia	t
71	Tecnologia da Informação	t
72	Teologia	t
73	Terapia Ocupacional	t
74	Turismo	t
75	Zoologia	t
76	Zootecnia	t
77	Geologia	t
78	Gestão de Negócio	t
79	Gestão Financeira	t
80	Segurança do Trabalho	t
81	Afins	t
82	Gestão de RH	t
83	Gestão de Projetos	t
84	Recursos Humanos	t
85	Mecânica	t
86	Elétrica	t
87	Automotiva	t
88	Jornalismo	t
89	Relações Públicas	t
90	Área técnica de atuação	t
91	Marketing Digital	t
92	Engenharia de Rede	t
93	Gestão Ambiental	t
94	Não se Aplica	t
\.


--
-- Data for Name: admin_descricao_areasespecializacoes; Type: TABLE DATA; Schema: public; Owner: cristiano
--

COPY public.admin_descricao_areasespecializacoes (id, name, is_active) FROM stdin;
1	Area Complementar	t
\.


--
-- Data for Name: admin_descricao_descricoes; Type: TABLE DATA; Schema: public; Owner: cristiano
--

COPY public.admin_descricao_descricoes (id, title, responsibility, area_specialization_id, areas_id, experience_id, formation_id, qualification_id, specialization_id, summary_goal, areas2_id, areas3_id, areas4_id, qualification2_id, qualification3_id, qualification4_id, is_active, area_specialization2_id, area_specialization3_id, area_specialization4_id, areas_desired_id, areas_desired2_id, areas_desired3_id, areas_desired4_id, family_id, formation_desired_id, sub_familia_id, manage_team_id) FROM stdin;
\.


--
-- Data for Name: admin_descricao_especializacoes; Type: TABLE DATA; Schema: public; Owner: cristiano
--

COPY public.admin_descricao_especializacoes (id, name, is_active) FROM stdin;
2	Especialização	t
3	Pós Graduação ou MBA	t
4	Mestrado	t
5	Doutorado	t
6	Pós Doutorado	t
1	Nao Aplicavel	t
\.


--
-- Data for Name: admin_descricao_experiencias; Type: TABLE DATA; Schema: public; Owner: cristiano
--

COPY public.admin_descricao_experiencias (id, name, is_active) FROM stdin;
1	Sem experiência	t
2	até 2 anos 	t
3	de 2 até 4 anos 	t
4	de 4 até 6 anos	t
5	de 6 até 8 anos 	t
6	de 8 até 10 anos	t
7	de 10 até 15 anos 	t
8	acima de 15 anos	t
\.


--
-- Data for Name: admin_descricao_formacao; Type: TABLE DATA; Schema: public; Owner: cristiano
--

COPY public.admin_descricao_formacao (id, name, is_active, code) FROM stdin;
1	Alfabetizado	t	1
2	Ensino Fundamental Completo	t	2
3	Ensino Medio Completo	t	3
4	Ensino Medio Profissionalizante	t	4
5	Ensino Medio Tecnico - Cursando	t	5
6	Ensino Medio Tecnico - Completo	t	6
7	Superior Tecnólogo - Cursando	t	7
8	Superior Tecnólogo - Completo	t	8
9	Superior - Cursando	t	9
10	Superior - Completo	t	10
11	Superior Completo com Especialização	t	11
\.


--
-- Data for Name: admin_descricao_gerencia; Type: TABLE DATA; Schema: public; Owner: cristiano
--

COPY public.admin_descricao_gerencia (id, name) FROM stdin;
1	Não
2	Sim
\.


--
-- Data for Name: admin_descricao_habilitacoes; Type: TABLE DATA; Schema: public; Owner: cristiano
--

COPY public.admin_descricao_habilitacoes (id, name, is_active) FROM stdin;
1	CAU (Conselho Regional de Arquitetura e Urbanismo)	t
2	CNH Categoria A	t
3	CNH Categoria B	t
4	CNH Categoria C	t
5	CNH Categoria D	t
6	CNH Categoria E	t
7	CONRE (Conselho Regional de Estatística)	t
8	CONRERP(Conselho Regional de Relações Públicas)	t
9	CORE (Conselho Regional dos Representantes Comerciais)	t
10	CORECON (Conselho Regional de Economia)	t
11	COREM (Conselho Regional de Museologia)	t
12	COREN (Conselho Regional de Enfermeiros e Obstetrizes)	t
13	CRA (Conselho Regional de Administração)	t
14	CRB (Conselho Regional de Biblioteconomia)	t
15	CRBIO (Conselho Regional de Biologia)	t
16	CRBM (Conselho Regional de Biomedicina)	t
17	CRC (Conselho Regional de Contabilidade)	t
18	CREA (Conselho Regional Engenharia)	t
19	CRECI (Conselho Regional de Corretores de Imóveis)	t
20	CREF (Conselho Regional de Educação Física)	t
21	CREFITO (Conselho Regional de Fisioterapia e Terapia Ocupacional)	t
22	CREFONO (Conselho Regional de Fonoaudiologia)	t
23	CREP (Conselho Regional de Educadores e Pedagogos)	t
24	CRESS (Conselho Regional de Serviço Social)	t
25	CRF (Conselho Regional de Farmacêuticos)	t
26	CRM (Conselho Regional Medicina)	t
27	CRMV (Conselho Regional de Medicina Veterinária)	t
28	CRN (Conselho Regional de Nutrição)	t
29	CRO (Conselho Regional de Odontologia)	t
30	CRP (Conselho Regional de Psicologia)	t
31	CRQ (Conselho Regional de Química)	t
32	CRT (Conselho Regional de Técnicos Industriais)	t
33	CRTA (Conselho Regional de Técnicos Agrícolas)	t
34	CRTR (Conselho Regional de Técnicos de Radiologia)	t
35	Não aplicável	t
36	OAB (Ordem dos Advogados do Brasil	t
37	OMB (Ordem dos Músicos do Brasil)	t
38	Operação de Empilhadeira	t
39	Segurança do Trabalho	t
40	Operação de Empilhadeira Excluir	t
41	Segurança do Trabalho Ecluir	t
\.


--
-- Data for Name: admin_descricao_idiomas; Type: TABLE DATA; Schema: public; Owner: cristiano
--

COPY public.admin_descricao_idiomas (id, name, is_active) FROM stdin;
1	Ingles	t
2	Italiano	t
\.


--
-- Data for Name: admin_descricao_niveis; Type: TABLE DATA; Schema: public; Owner: cristiano
--

COPY public.admin_descricao_niveis (id, name, is_active) FROM stdin;
1	Profissional de Nível Superior Junior	t
2	Profissional de Nível Superior Pleno	t
3	Profissional de Nível Superior Sênior	t
4	Assistente	t
5	Auxiliar	t
6	Coordenador	t
7	Diretor	t
8	Encarregado	t
9	Especialista	t
10	Gerente	t
11	Líder	t
12	Operador	t
13	Presidente	t
14	Superintendente	t
15	Supervisor	t
16	Técnico Junior	t
17	Técnico Pleno	t
18	Técnico Sênior	t
19	Vice Presidente	t
20	Gerente Geral	t
21	Técnico Especialista	t
\.


--
-- Data for Name: admin_descricao_proficiencias; Type: TABLE DATA; Schema: public; Owner: cristiano
--

COPY public.admin_descricao_proficiencias (id, name, is_active) FROM stdin;
1	5 anos	t
2	1 ano	t
3	2 anos	t
\.


--
-- Data for Name: admin_descricao_status; Type: TABLE DATA; Schema: public; Owner: cristiano
--

COPY public.admin_descricao_status (id, name) FROM stdin;
1	Em Preenchimento - 1/5
2	Definir Aprovador  - 2/5
3	Aguardando Aprovação  - 3/5
5	Aprovação Final  - 5/5
4	Aprovado pelo Gestor - 4/5
\.


--
-- Data for Name: admin_geral_core; Type: TABLE DATA; Schema: public; Owner: cristiano
--

COPY public.admin_geral_core (id, name) FROM stdin;
1	Comercialização e/ou Prestação de Serviços
2	Produção e Aplicação de Soluções
3	Ambos
4	----------
\.


--
-- Data for Name: admin_geral_dimensao; Type: TABLE DATA; Schema: public; Owner: cristiano
--

COPY public.admin_geral_dimensao (id, name) FROM stdin;
5	de R$ 4 MM à R$ 12 MM
6	de R$ 12 MM à R$ 40 MM
7	de R$ 40 MM à R$ 120 MM
8	de R$ 120 MM à R$ 400 MM
9	de R$ 400 MM à R$ 1,2 Bi
10	de R$ 1,2 Bi à R$ 4,0 Bi
11	de R$ 4,0 Bi à R$ 12,0 Bi
12	de R$ 12,0 Bi à R$ 40,0 Bi
3	de R$ 400 mil a R$ 1,2 MM
2	até R$ 400 mil
4	de R$ 1,2 MM a R$ 4 MM
13	acima de R$ 40,0 Bi
1	----------
\.


--
-- Data for Name: admin_geral_governanca; Type: TABLE DATA; Schema: public; Owner: cristiano
--

COPY public.admin_geral_governanca (id, name) FROM stdin;
1	Sem Conselho de Adm ou Consultivo
2	Com Conselho Consultivo deliberativo
3	Com Conselho de Adm
4	----------
\.


--
-- Data for Name: admin_geral_nivelcargo; Type: TABLE DATA; Schema: public; Owner: cristiano
--

COPY public.admin_geral_nivelcargo (id, name, is_active) FROM stdin;
1	Profissional de Nível Superior Junior	t
2	Profissional de Nível Superior Pleno	t
3	Profissional de Nível Superior Sênior	t
4	Assistente	t
5	Auxiliar	t
6	Coordenador	t
7	Diretor	t
8	Encarregado	t
9	Especialista	t
10	Gerente	t
11	Líder	t
12	Operador	t
13	Presidente	t
14	Superintendente	t
15	Supervisor	t
16	Técnico Junior	t
17	Técnico Pleno	t
18	Técnico Sênior	t
19	Vice Presidente	t
20	Gerente Geral	t
21	Técnico Especialista	t
\.


--
-- Data for Name: admin_geral_origemcapital; Type: TABLE DATA; Schema: public; Owner: cristiano
--

COPY public.admin_geral_origemcapital (id, name) FROM stdin;
1	Nacional
2	Estrangeiro
3	----------
\.


--
-- Data for Name: admin_geral_plans; Type: TABLE DATA; Schema: public; Owner: cristiano
--

COPY public.admin_geral_plans (id, name, detail, value, discount, percent, is_active) FROM stdin;
2	Plano 2	Plano com 50 Descrições e 50 Avaliações	50		0	t
1	Plano até 25	Plano com 25 Descrições.	77		20	t
\.


--
-- Data for Name: admin_geral_plansavaliacao; Type: TABLE DATA; Schema: public; Owner: cristiano
--

COPY public.admin_geral_plansavaliacao (id, name, detail, value, discount, percent, is_active) FROM stdin;
1	Plano 1	Plano com 25 Avaliações	25		0	t
\.


--
-- Data for Name: admin_geral_sector; Type: TABLE DATA; Schema: public; Owner: cristiano
--

COPY public.admin_geral_sector (id, name, is_active) FROM stdin;
1	Mineração	t
2	Agronegócio	t
3	Alimentos e Bebidas	t
4	Alta Tecnologia	t
5	Assistência Médica	t
6	Atacado	t
7	Atacarejo	t
8	Automotivo	t
9	Autopeças	t
10	Bancos e Serviços financeiros	t
11	Comunicação	t
12	Construção Civil - Materiais	t
13	Construção Civil Leve	t
14	Construção Civil Pesada	t
15	Consumo Durável	t
16	Consumo Não Durável	t
17	Educação	t
18	Energia	t
19	Farmacêutico	t
20	Financeiro	t
21	Hospital	t
22	Imobiliário	t
23	Lazer (Bares, Restaurantes, Hoteis e Entretenimento	t
24	Legal	t
25	Logística (transporte e armazenagem)	t
26	Material de Construção	t
27	Metalurgia	t
28	Mineração e Metalurgia	t
29	Mineração e Siderurgia	t
30	Óleo e Gás	t
31	Organização sem fim lucrativo	t
32	Outras Manufaturas	t
33	Outras Não Manufatura	t
34	Papel e Celulose	t
35	Petroquímico	t
36	Publicidade e Midia	t
37	Químico	t
38	Seguros	t
39	Serviços	t
40	Setor Público	t
41	Siderurgia	t
42	Telecomunicação	t
43	Transporte (aéreo, rodoviário, ferroviário, marítimo)	t
44	Utilidades	t
45	Varejo	t
46	Varejo e Atacado	t
47	Negocios não Financeiros	t
48	teste id	t
\.


--
-- Data for Name: admin_geral_tipoempresa; Type: TABLE DATA; Schema: public; Owner: cristiano
--

COPY public.admin_geral_tipoempresa (id, name) FROM stdin;
1	Capital Nacional
2	Subsidiaria
3	----------
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: cristiano
--

COPY public.auth_group (id, name) FROM stdin;
1	Master
2	Comum
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: cristiano
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
1	2	3
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: cristiano
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add custom user	6	add_customuser
22	Can change custom user	6	change_customuser
23	Can delete custom user	6	delete_customuser
24	Can view custom user	6	view_customuser
25	Can add Pessoa	7	add_person
26	Can change Pessoa	7	change_person
27	Can delete Pessoa	7	delete_person
28	Can view Pessoa	7	view_person
29	Can add Plano	8	add_plans
30	Can change Plano	8	change_plans
31	Can delete Plano	8	delete_plans
32	Can view Plano	8	view_plans
33	Can add Setor	9	add_sector
34	Can change Setor	9	change_sector
35	Can delete Setor	9	delete_sector
36	Can view Setor	9	view_sector
37	Can add Area Formação	10	add_areas
38	Can change Area Formação	10	change_areas
39	Can delete Area Formação	10	delete_areas
40	Can view Area Formação	10	view_areas
41	Can add Formação	11	add_formacao
42	Can change Formação	11	change_formacao
43	Can delete Formação	11	delete_formacao
44	Can view Formação	11	view_formacao
45	Can add Habilitação/Certificação	12	add_habilitacoes
46	Can change Habilitação/Certificação	12	change_habilitacoes
47	Can delete Habilitação/Certificação	12	delete_habilitacoes
48	Can view Habilitação/Certificação	12	view_habilitacoes
49	Can add Idioma	13	add_idiomas
50	Can change Idioma	13	change_idiomas
51	Can delete Idioma	13	delete_idiomas
52	Can view Idioma	13	view_idiomas
53	Can add Grade	14	add_grades
54	Can change Grade	14	change_grades
55	Can delete Grade	14	delete_grades
56	Can view Grade	14	view_grades
57	Can add Familia	15	add_familias
58	Can change Familia	15	change_familias
59	Can delete Familia	15	delete_familias
60	Can view Familia	15	view_familias
61	Can add SubFamilia	16	add_subfamilias
62	Can change SubFamilia	16	change_subfamilias
63	Can delete SubFamilia	16	delete_subfamilias
64	Can view SubFamilia	16	view_subfamilias
65	Can add Nivel	17	add_niveis
66	Can change Nivel	17	change_niveis
67	Can delete Nivel	17	delete_niveis
68	Can view Nivel	17	view_niveis
69	Can add Fator	18	add_fatores
70	Can change Fator	18	change_fatores
71	Can delete Fator	18	delete_fatores
72	Can view Fator	18	view_fatores
73	Can add Matriz	19	add_matrizes
74	Can change Matriz	19	change_matrizes
75	Can delete Matriz	19	delete_matrizes
76	Can view Matriz	19	view_matrizes
77	Can add Descricao	20	add_descricoes
78	Can change Descricao	20	change_descricoes
79	Can delete Descricao	20	delete_descricoes
80	Can view Descricao	20	view_descricoes
81	Can add Especializacao	21	add_especializacoes
82	Can change Especializacao	21	change_especializacoes
83	Can delete Especializacao	21	delete_especializacoes
84	Can view Especializacao	21	view_especializacoes
85	Can add Experiencia	22	add_experiencias
86	Can change Experiencia	22	change_experiencias
87	Can delete Experiencia	22	delete_experiencias
88	Can view Experiencia	22	view_experiencias
89	Can add my model	23	add_mymodel
90	Can change my model	23	change_mymodel
91	Can delete my model	23	delete_mymodel
92	Can view my model	23	view_mymodel
93	Can add tenant	24	add_tenant
94	Can change tenant	24	change_tenant
95	Can delete tenant	24	delete_tenant
96	Can view tenant	24	view_tenant
97	Can add Diretoria	25	add_diretoria
98	Can change Diretoria	25	change_diretoria
99	Can delete Diretoria	25	delete_diretoria
100	Can view Diretoria	25	view_diretoria
101	Can add Area da Diretoria	26	add_area
102	Can change Area da Diretoria	26	change_area
103	Can delete Area da Diretoria	26	delete_area
104	Can view Area da Diretoria	26	view_area
105	Can add Descricao	27	add_descricao
106	Can change Descricao	27	change_descricao
107	Can delete Descricao	27	delete_descricao
108	Can view Descricao	27	view_descricao
109	Can add Avaliacao	28	add_avaliacao
110	Can change Avaliacao	28	change_avaliacao
111	Can delete Avaliacao	28	delete_avaliacao
112	Can view Avaliacao	28	view_avaliacao
113	Can add Nivel do Cargo	29	add_nivelcargo
114	Can change Nivel do Cargo	29	change_nivelcargo
115	Can delete Nivel do Cargo	29	delete_nivelcargo
116	Can view Nivel do Cargo	29	view_nivelcargo
117	Can add Status	30	add_status
118	Can change Status	30	change_status
119	Can delete Status	30	delete_status
120	Can view Status	30	view_status
121	Can add Dimensão	31	add_dimensao
122	Can change Dimensão	31	change_dimensao
123	Can delete Dimensão	31	delete_dimensao
124	Can view Dimensão	31	view_dimensao
125	Can add Governança	32	add_governanca
126	Can change Governança	32	change_governanca
127	Can delete Governança	32	delete_governanca
128	Can view Governança	32	view_governanca
129	Can add Origem do Capital	33	add_origemcapital
130	Can change Origem do Capital	33	change_origemcapital
131	Can delete Origem do Capital	33	delete_origemcapital
132	Can view Origem do Capital	33	view_origemcapital
133	Can add Tipo de Empresa	34	add_tipoempresa
134	Can change Tipo de Empresa	34	change_tipoempresa
135	Can delete Tipo de Empresa	34	delete_tipoempresa
136	Can view Tipo de Empresa	34	view_tipoempresa
137	Can add Gerencia	35	add_gerencia
138	Can change Gerencia	35	change_gerencia
139	Can delete Gerencia	35	delete_gerencia
140	Can view Gerencia	35	view_gerencia
141	Can add Superior	36	add_superior
142	Can change Superior	36	change_superior
143	Can delete Superior	36	delete_superior
144	Can view Superior	36	view_superior
145	Can add Core da Empresa	37	add_core
146	Can change Core da Empresa	37	change_core
147	Can delete Core da Empresa	37	delete_core
148	Can view Core da Empresa	37	view_core
149	Can add Proficiencia	38	add_proficiencias
150	Can change Proficiencia	38	change_proficiencias
151	Can delete Proficiencia	38	delete_proficiencias
152	Can view Proficiencia	38	view_proficiencias
153	Can add Area de Formação Complementar	39	add_areasespecializacoes
154	Can change Area de Formação Complementar	39	change_areasespecializacoes
155	Can delete Area de Formação Complementar	39	delete_areasespecializacoes
156	Can view Area de Formação Complementar	39	view_areasespecializacoes
157	Can add Conhecimento	40	add_conhecimentos
158	Can change Conhecimento	40	change_conhecimentos
159	Can delete Conhecimento	40	delete_conhecimentos
160	Can view Conhecimento	40	view_conhecimentos
161	Can add Combinação de Fatores e Niveis	41	add_combinacoes
162	Can change Combinação de Fatores e Niveis	41	change_combinacoes
163	Can delete Combinação de Fatores e Niveis	41	delete_combinacoes
164	Can view Combinação de Fatores e Niveis	41	view_combinacoes
165	Can add Niveis	42	add_niveis
166	Can change Niveis	42	change_niveis
167	Can delete Niveis	42	delete_niveis
168	Can view Niveis	42	view_niveis
169	Can add Plano Avaliaçãoo	43	add_plansavaliacao
170	Can change Plano Avaliaçãoo	43	change_plansavaliacao
171	Can delete Plano Avaliaçãoo	43	delete_plansavaliacao
172	Can view Plano Avaliaçãoo	43	view_plansavaliacao
173	Can add completed task	44	add_completedtask
174	Can change completed task	44	change_completedtask
175	Can delete completed task	44	delete_completedtask
176	Can view completed task	44	view_completedtask
177	Can add task	45	add_task
178	Can change task	45	change_task
179	Can delete task	45	delete_task
180	Can view task	45	view_task
\.


--
-- Data for Name: avaliacao_avaliacao; Type: TABLE DATA; Schema: public; Owner: cristiano
--

COPY public.avaliacao_avaliacao (id, title, area_id, board_id, tenant_id, ceo, company_id, factor1_id, factor2_id, factor3_id, factor4_id, factor5_id, factor6_id, factor7_id, factor8_id, family_id, formation_id, governanca_id, level1_id, level2_id, level3_id, level4_id, level5_id, level6_id, level7_id, level8_id, manage_team_id, origin_id, size_id, sub_familia_id, title_super_id, grade_id, point, description) FROM stdin;
\.


--
-- Data for Name: avaliacao_superior; Type: TABLE DATA; Schema: public; Owner: cristiano
--

COPY public.avaliacao_superior (id, title, tenant_id, evaluation_id) FROM stdin;
\.


--
-- Data for Name: background_task; Type: TABLE DATA; Schema: public; Owner: cristiano
--

COPY public.background_task (id, task_name, task_params, task_hash, verbose_name, priority, run_at, repeat, repeat_until, queue, attempts, failed_at, last_error, locked_by, locked_at, creator_object_id, creator_content_type_id) FROM stdin;
1	descricao.tasks.processar_planilha_task	[["temp/descricao_lote_imp(19).xlsx", 99, "Transporte (a\\u00e9reo, rodovi\\u00e1rio, ferrovi\\u00e1rio, mar\\u00edtimo)", 43, 100], {}]	c0d5d6a5f2cbea29badb3b991cb98b2494739917	\N	0	2026-05-15 19:49:33.37397-03	0	\N	\N	8	\N	Traceback (most recent call last):\n  File "/home/cristiano/bluebox/my_django_environment/lib/python3.10/site-packages/background_task/tasks.py", line 43, in bg_runner\n    func(*args, **kwargs)\nTypeError: processar_planilha_task() missing 1 required positional argument: 'user'\n	\N	\N	\N	\N
4	descricao.tasks.processar_planilha_task	[["temp/descricao_lote_imp(19).xlsx"], {}]	b3e6169b2cd1af640743c544068129b1c2193d5c	\N	0	2026-05-15 19:49:33.463209-03	0	\N	\N	8	\N	Traceback (most recent call last):\n  File "/home/cristiano/bluebox/my_django_environment/lib/python3.10/site-packages/background_task/tasks.py", line 43, in bg_runner\n    func(*args, **kwargs)\nTypeError: processar_planilha_task() missing 5 required positional arguments: 'last_id', 'sector_name', 'sector_id', 'tenant_id', and 'user'\n	\N	\N	\N	\N
5	descricao.tasks.processar_planilha_task	[["temp/descricao_lote_imp(19).xlsx"], {}]	b3e6169b2cd1af640743c544068129b1c2193d5c	\N	0	2026-05-15 19:49:33.523979-03	0	\N	\N	8	\N	Traceback (most recent call last):\n  File "/home/cristiano/bluebox/my_django_environment/lib/python3.10/site-packages/background_task/tasks.py", line 43, in bg_runner\n    func(*args, **kwargs)\nTypeError: processar_planilha_task() missing 5 required positional arguments: 'last_id', 'sector_name', 'sector_id', 'tenant_id', and 'user'\n	\N	\N	\N	\N
6	descricao.tasks.processar_planilha_task	[["temp/descricao_lote_imp(19).xlsx"], {}]	b3e6169b2cd1af640743c544068129b1c2193d5c	\N	0	2026-05-15 19:49:33.607668-03	0	\N	\N	8	\N	Traceback (most recent call last):\n  File "/home/cristiano/bluebox/my_django_environment/lib/python3.10/site-packages/background_task/tasks.py", line 43, in bg_runner\n    func(*args, **kwargs)\nTypeError: processar_planilha_task() missing 5 required positional arguments: 'last_id', 'sector_name', 'sector_id', 'tenant_id', and 'user'\n	\N	\N	\N	\N
\.


--
-- Data for Name: background_task_completedtask; Type: TABLE DATA; Schema: public; Owner: cristiano
--

COPY public.background_task_completedtask (id, task_name, task_params, task_hash, verbose_name, priority, run_at, repeat, repeat_until, queue, attempts, failed_at, last_error, locked_by, locked_at, creator_object_id, creator_content_type_id) FROM stdin;
1	descricao.tasks.processar_planilha_task	[["temp/descricao_lote_imp(19).xlsx", 99, "Transporte (a\\u00e9reo, rodovi\\u00e1rio, ferrovi\\u00e1rio, mar\\u00edtimo)", 43, 100, 29], {}]	9e9ba65149b71b9e7b135c0f34a3318f6333bce9	\N	0	2026-05-14 20:49:40.585966-03	0	\N	\N	1	\N		10220	2026-05-14 20:49:09.199458-03	\N	\N
2	descricao.tasks.processar_planilha_task	[["temp/descricao_lote_imp(19).xlsx", 99, "Transporte (a\\u00e9reo, rodovi\\u00e1rio, ferrovi\\u00e1rio, mar\\u00edtimo)", 43, 100, 29], {}]	9e9ba65149b71b9e7b135c0f34a3318f6333bce9	\N	0	2026-05-14 20:50:03.642093-03	0	\N	\N	1	\N		10220	2026-05-14 20:49:40.694754-03	\N	\N
3	descricao.tasks.processar_planilha_task	[["temp/descricao_lote_imp(19).xlsx", 99, "Transporte (a\\u00e9reo, rodovi\\u00e1rio, ferrovi\\u00e1rio, mar\\u00edtimo)", 43, 100, 29], {}]	9e9ba65149b71b9e7b135c0f34a3318f6333bce9	\N	0	2026-05-14 20:50:19.689685-03	0	\N	\N	1	\N		10220	2026-05-14 20:50:04.068737-03	\N	\N
4	descricao.tasks.processar_planilha_task	[["temp/descricao_lote_imp(19)_vazia.xlsx", 99, "Transporte (a\\u00e9reo, rodovi\\u00e1rio, ferrovi\\u00e1rio, mar\\u00edtimo)", 43, 100, 29], {}]	cb5cee06129f3d040956698b89afd2e89e0e2532	\N	0	2026-05-14 20:57:28.945031-03	0	\N	\N	1	\N		11379	2026-05-14 20:57:01.551126-03	\N	\N
5	descricao.tasks.processar_planilha_task	[["temp/descricao_lote_imp(19)_vazia.xlsx", 99, "Transporte (a\\u00e9reo, rodovi\\u00e1rio, ferrovi\\u00e1rio, mar\\u00edtimo)", 43, 100, 29], {}]	cb5cee06129f3d040956698b89afd2e89e0e2532	\N	0	2026-05-14 21:06:18.906978-03	0	\N	\N	1	\N		12034	2026-05-14 21:05:55.981582-03	\N	\N
6	descricao.tasks.processar_planilha_task	[["temp/descricao_lote_imp(19)_vazia.xlsx", 99, "Transporte (a\\u00e9reo, rodovi\\u00e1rio, ferrovi\\u00e1rio, mar\\u00edtimo)", 43, 100, 29], {}]	cb5cee06129f3d040956698b89afd2e89e0e2532	\N	0	2026-05-15 12:33:19.2578-03	0	\N	\N	1	\N		12457	2026-05-15 12:32:41.247511-03	\N	\N
7	descricao.tasks.processar_planilha_task	[["temp/descricao_lote_imp(19)_vazia.xlsx", 99, "Transporte (a\\u00e9reo, rodovi\\u00e1rio, ferrovi\\u00e1rio, mar\\u00edtimo)", 43, 100, 29], {}]	cb5cee06129f3d040956698b89afd2e89e0e2532	\N	0	2026-05-15 12:37:46.542554-03	0	\N	\N	1	\N		12856	2026-05-15 12:37:03.520903-03	\N	\N
\.


--
-- Data for Name: descricao_descricao; Type: TABLE DATA; Schema: public; Owner: cristiano
--

COPY public.descricao_descricao (id, title, cbo, summary_goal, responsibility, area_specialization_id, title_super, manage_team_id, position_team, proficiency_id, knowledge, information, date_approval, approver_id, area_id, areas_id, areas_desired_id, board_id, experience_id, family_id, formation_id, formation_desired_id, idioma_id, specialization_id, sub_familia_id, tenant_id, status_id, date_conclusion, user_id_id, function, is_active, areas2_id, areas3_id, areas4_id, qualification2_id, qualification3_id, qualification_id, area_specialization2_id, area_specialization3_id, area_specialization4_id, idioma2_id, idioma3_id, proficiency2_id, proficiency3_id, areas_desired2_id, areas_desired3_id, areas_desired4_id, level_id, sector_id, adicional) FROM stdin;
98	DIRETOR DE REC HUMANOS PC		Liderar e definir a estratégia de gestão de pessoas, assegurando o desenvolvimento, engajamento e desempenho dos colaboradores, alinhando as práticas de RH aos objetivos estratégicos da organização no setor de transporte.	Implementar políticas e programas de RH, supervisionar processos de recrutamento e seleção, gerenciar programas de treinamento e desenvolvimento, conduzir avaliações de desempenho, garantir a conformidade com as leis trabalhistas, liderar a equipe de RH, promover a cultura organizacional, gerenciar o orçamento da área e representar a empresa em questões de RH.	\N	CEO	2		\N		'Liderança estratégica', 'Visão sistêmica', 'Gestão de equipes', 'Comunicação eficaz', 'Negociação', 'Tomada de decisão', 'Conhecimento das leis trabalhistas', 'Gestão de conflitos', 'Orientação para resultados', 'Inovação em RH'	\N	\N	16	\N	\N	24	7	19	\N	11	\N	3	136	100	1	\N	29		t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7	43	
2	DIRETOR TI	\N	Liderar a estratégia e execução das soluções de tecnologia da informação, alinhando-as aos objetivos de negócios da empresa de transporte, garantindo a inovação, segurança e eficiência dos sistemas e infraestrutura de TI.	'Definir e implementar a estratégia de TI, alinhada aos objetivos estratégicos da empresa.', 'Gerenciar o orçamento de TI, garantindo o uso eficiente dos recursos.', 'Supervisionar a infraestrutura de TI, assegurando a disponibilidade, segurança e desempenho dos sistemas.', 'Liderar a equipe de TI, promovendo o desenvolvimento profissional e o alto desempenho.', 'Avaliar e implementar novas tecnologias para otimizar processos e impulsionar a inovação.', 'Garantir a conformidade com as políticas de segurança da informação e regulamentações do setor de transporte.', 'Gerenciar projetos de TI, desde o planejamento até a implementação e acompanhamento.', 'Negociar com fornecedores e parceiros de TI, buscando as melhores soluções e custos.', 'Analisar e mitigar riscos relacionados à segurança da informação e continuidade dos negócios.', 'Estabelecer e monitorar indicadores de desempenho (KPIs) de TI, visando a melhoria contínua.'	1	CEO	2	TESTE	\N		'Liderança estratégica', 'Gestão de projetos', 'Conhecimento técnico em TI', 'Visão de negócios', 'Comunicação eficaz', 'Negociação', 'Gestão de equipes', 'Análise de riscos', 'Inovação', 'Orientação para resultados'	\N	\N	16	\N	94	24	6	1	\N	11	\N	3	1	100	1	\N	29	\N	t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	43	
100	Analista de Sistemas 1		Liderar a estratégia, gestão e implementação da segurança da informação em todos os projetos de TI do setor de transporte, garantindo a proteção dos ativos digitais, a conformidade regulatória e a mitigação de riscos cibernéticos para a continuidade operacional e a reputação da organização.	Definir e desenvolver a estratégia de segurança da informação e arquiteturas de segurança para os projetos de TI.\nGerenciar o ciclo de vida completo de projetos de segurança da informação, do planejamento à execução e monitoramento pós-implementação.\nCoordenar equipes multifuncionais de projetos, incluindo especialistas em segurança, desenvolvedores e engenheiros de rede.\nAvaliar, implementar e supervisionar o uso de tecnologias e ferramentas de segurança, como firewalls, IDS/IPS, SIEM e soluções de criptografia.\nRealizar a gestão de riscos, identificando vulnerabilidades, ameaças e propondo planos de remediação e contingência.\nGarantir a conformidade com leis e regulamentações de proteção de dados (ex: LGPD) e padrões de segurança (ex: ISO 27001) aplicáveis ao setor de transporte.\nMonitorar e responder a incidentes de segurança, liderando investigações, planos de resposta e comunicação com stakeholders.\nDesenvolver e promover programas de conscientização e treinamento em segurança da informação para todos os colaboradores.\nReportar o status da segurança da informação e dos projetos de TI para a alta gerência e conselho, quando aplicável.	\N	Diretor de TI	2		\N		'Liderança estratégica e de equipes', 'Gestão de Projetos (metodologias ágeis e tradicionais)', 'Conhecimento avançado em Segurança da Informação (redes, sistemas, aplicações, nuvem)', 'Gerenciamento de Riscos e Auditoria de TI', 'Habilidade de comunicação e negociação', 'Pensamento analítico e resolução de problemas complexos', 'Conformidade regulatória e ética profissional', 'Inovação e adaptabilidade tecnológica'	\N	\N	20	\N	1	25	6	23	\N	11	\N	3	171	100	1	\N	29		t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	43	Profissional especializado em segurança da informação
3	Diretor de RH		Assegurar a execução das atividades de Recursos Humanos, supervisionando a equipe e garantindo o cumprimento dos processos e políticas estabelecidas, visando o desenvolvimento e bem-estar dos colaboradores no setor de transporte.	'Supervisionar as atividades da equipe de RH, distribuindo tarefas e orientando na execução dos processos.', 'Acompanhar os indicadores de desempenho da área de RH, identificando oportunidades de melhoria e propondo soluções.', 'Monitorar o cumprimento das políticas e procedimentos de RH, garantindo a conformidade com a legislação trabalhista.', 'Controlar os processos de recrutamento e seleção, treinamento e desenvolvimento, avaliação de desempenho e gestão de carreira.', 'Orientar os gestores e colaboradores em questões relacionadas a RH, fornecendo suporte técnico e informações relevantes.', 'Assegurar a qualidade dos serviços prestados pela área de RH, buscando a satisfação dos clientes internos e externos.'	\N	nan	2		\N		'Liderança de Equipes', 'Conhecimento em Legislação Trabalhista', 'Gestão de Processos de RH', 'Comunicação Eficaz', 'Visão Estratégica', 'Orientação para Resultados'	\N	\N	16	\N	94	24	5	19	\N	6	\N	1	136	100	1	\N	\N		t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	43	
4	DIRETOR COMERCIAL	\N	TESTE	TESTE	\N	CEO	2	TESTE	\N			\N	\N	16	\N	\N	24	8	2	\N	1	\N	\N	11	100	1	\N	29	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7	43	
6	Diretor de RH2		Assegurar o cumprimento dos processos de Recursos Humanos no setor de transporte, supervisionando as atividades diárias da equipe e garantindo a eficiência e a qualidade dos serviços prestados.	'Supervisionar as atividades da equipe de RH, distribuindo tarefas e acompanhando o desempenho.', 'Orientar a equipe na execução dos processos de recrutamento e seleção, treinamento e desenvolvimento, folha de pagamento e benefícios.', 'Monitorar os indicadores de desempenho da área de RH, identificando oportunidades de melhoria e propondo soluções.', 'Controlar o cumprimento das normas e procedimentos internos da área de RH.', 'Assegurar a conformidade com a legislação trabalhista e previdenciária.'	\N	nan	2		\N		'Liderança de equipe', 'Conhecimento técnico em RH', 'Visão sistêmica', 'Comunicação eficaz', 'Orientação para resultados', 'Organização e planejamento', 'Conhecimento da legislação trabalhista', 'Adaptabilidade', 'Inteligência Emocional', 'Resiliência', 'Pensamento Crítico', 'Negociação', 'Gestão de Conflitos'	\N	\N	16	\N	94	24	5	19	\N	6	\N	1	136	100	1	\N	\N		t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	43	
7	DIRETOR TI 2	\N	teste	teste	\N	ceo	2	teste	\N			\N	\N	15	\N	\N	23	8	1	\N	1	\N	\N	1	100	1	\N	29	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	43	
1	CEO	\N	Cristiano	Cristiano	\N	CEO	2	teste	\N			2026-02-23 18:08:01.554548-03	29	15	\N	\N	23	8	1	\N	1	\N	\N	1	100	4	\N	29	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	43	
8	Diretor de RH3		Assegurar a execução dos processos de RH, supervisionando as atividades da equipe e garantindo o cumprimento das políticas e procedimentos estabelecidos para a área de Recursos Humanos na empresa de transporte.	'Supervisionar a equipe de RH, distribuindo tarefas e orientando o desenvolvimento profissional.', 'Acompanhar os indicadores de desempenho da área de RH, identificando oportunidades de melhoria e propondo planos de ação.', 'Monitorar o cumprimento das políticas e procedimentos de RH, assegurando a conformidade com a legislação trabalhista e as normas internas da empresa.', 'Controlar o processo de recrutamento e seleção, garantindo a identificação e contratação de profissionais qualificados.', 'Orientar os gestores em questões relacionadas à gestão de pessoas, como avaliação de desempenho, plano de carreira e desenvolvimento de lideranças.', 'Assegurar a qualidade dos serviços prestados pela área de RH, buscando a satisfação dos colaboradores e o alinhamento com os objetivos estratégicos da empresa.'	\N	nan	2		\N		'Liderança de equipe', 'Comunicação eficaz', 'Visão sistêmica', 'Conhecimento da legislação trabalhista', 'Orientação para resultados', 'Negociação', 'Gestão de conflitos'	\N	\N	16	\N	94	24	5	19	\N	6	\N	1	136	100	1	\N	\N		t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	43	
99	DIRETOR DE REC HUMANOS PC1		Liderar a estratégia de Recursos Humanos, assegurando o alinhamento com os objetivos organizacionais, promovendo um ambiente de trabalho positivo e impulsionando o desenvolvimento dos colaboradores na empresa do setor de transporte.	Definir e implementar a estratégia de RH, alinhada aos objetivos de negócio da empresa.\nSupervisionar os processos de recrutamento, seleção, treinamento e desenvolvimento de talentos.\nGerenciar o orçamento da área de RH, garantindo a alocação eficiente de recursos.\nAssegurar o cumprimento das políticas e procedimentos de RH, em conformidade com a legislação trabalhista.\nLiderar a equipe de RH, promovendo o desenvolvimento profissional e o engajamento dos colaboradores.\nMonitorar o clima organizacional e implementar ações para promover um ambiente de trabalho positivo.\nConduzir negociações sindicais e representar a empresa em questões trabalhistas.\nAvaliar e propor melhorias nos programas de remuneração e benefícios.\nImplementar e gerenciar sistemas de avaliação de desempenho.\nGarantir a efetividade dos programas de diversidade e inclusão.	\N	CEO	2		\N		'Visão estratégica', 'Liderança', 'Gestão de pessoas', 'Negociação', 'Comunicação', 'Tomada de decisão', 'Conhecimento da legislação trabalhista', 'Gestão de orçamento', 'Orientação para resultados', 'Inovação'	\N	\N	16	\N	\N	24	7	19	\N	11	\N	3	136	100	1	\N	29		t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7	43	Beneficios
9	DIRETOR TI 3	\N	Implementar e monitorar a estratégia de tecnologia da informação, alinhada aos objetivos organizacionais, assegurando a otimização dos recursos e a inovação nos processos de transporte.	'Supervisionar a implementação e manutenção de sistemas de informação, garantindo a segurança e integridade dos dados.', 'Coordenar projetos de tecnologia, desde o planejamento até a execução, assegurando o cumprimento de prazos e orçamentos.', 'Analisar as necessidades de tecnologia da informação da empresa, propondo soluções inovadoras e eficientes.', 'Monitorar o desempenho dos sistemas de informação, identificando e resolvendo problemas de forma proativa.', 'Participar da elaboração do orçamento da área de tecnologia da informação, controlando os custos e otimizando os investimentos.', 'Gerenciar a equipe de tecnologia da informação, promovendo o desenvolvimento profissional e o bom desempenho.', 'Assegurar a conformidade com as normas e regulamentos de segurança da informação.', 'Acompanhar as tendências do mercado de tecnologia da informação, propondo a adoção de novas tecnologias que possam agregar valor à empresa.'	1	ceio	1		\N		'Visão estratégica', 'Liderança de equipe', 'Gerenciamento de projetos', 'Conhecimento técnico em tecnologia da informação', 'Comunicação eficaz', 'Negociação', 'Pensamento analítico', 'Tomada de decisão', 'Orientação para resultados', 'Inovação'	\N	\N	15	\N	94	23	2	1	\N	8	\N	5	1	100	1	\N	29	\N	t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	43	
101	Analista de Sistemas 2		Estrategizar e liderar a concepção, implementação e gestão de projetos de Tecnologia da Informação com foco em segurança cibernética para o setor de transporte. Ocupa-se em salvaguardar os ativos de informação, assegurar a conformidade regulatória e impulsionar a inovação tecnológica, garantindo a resiliência operacional e a continuidade dos serviços críticos de transporte.	Definir e desenvolver a arquitetura de segurança para novos projetos e sistemas de TI no ambiente de transporte, alinhando-se às melhores práticas e regulamentações.\nGerenciar o portfólio de projetos de segurança da informação, assegurando a entrega dentro do prazo, orçamento e escopo definidos, com foco na qualidade e nos resultados esperados.\nAvaliar e mitigar proativamente os riscos de segurança cibernética em toda a cadeia de valor do transporte, implementando controles e políticas robustas para proteger dados e infraestruturas.\nGarantir a conformidade com as leis, regulamentos e padrões de segurança da informação aplicáveis ao setor de transporte (ex: LGPD, NIS 2, regulamentações específicas de órgãos reguladores do transporte).\nLiderar e capacitar equipes multidisciplinares de segurança da informação e de projetos, promovendo um ambiente de alta performance, inovação contínua e desenvolvimento profissional.\nEstabelecer e manter relacionamentos estratégicos com fornecedores de tecnologia, parceiros e stakeholders internos e externos para aprimorar as soluções de segurança e a execução dos projetos.\nReportar regularmente à diretoria e demais partes interessadas sobre o status da segurança da informação, riscos identificados, progresso dos projetos e métricas de desempenho.\nPromover a conscientização e a cultura de segurança da informação em toda a organização, através de treinamentos e campanhas internas.	\N	Diretor de TI	2		\N		'Gestão de Projetos e Programas (PMI, metodologias ágeis como Scrum/Kanban)', 'Arquitetura e Engenharia de Segurança da Informação', 'Governança, Risco e Conformidade (GRC) em Segurança Cibernética', 'Conhecimento aprofundado em frameworks de segurança (ISO 27001, NIST) e regulamentações (LGPD, GDPR, NIS 2)', 'Experiência com segurança de infraestruturas críticas e sistemas de controle operacional (OT/ICS)', 'Liderança estratégica e gestão de equipes de alta performance', 'Habilidade de comunicação, negociação e influência com stakeholders de diferentes níveis', 'Pensamento analítico, resolução de problemas complexos e tomada de decisão', 'Visão de negócios e do setor de transporte (aéreo, rodoviário, ferroviário, marítimo)', 'Certificações relevantes (ex: CISSP, CISM, PMP, ISO 27001 Lead Implementer)'	\N	\N	20	\N	1	25	6	23	\N	11	\N	3	171	100	1	\N	29		t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	43	Profissional especializado em segurança da informação
12	DIRETOR TI 4	\N	Liderar a estratégia de tecnologia da informação, assegurando a inovação, segurança e alinhamento com os objetivos de negócio da empresa no setor de transporte, promovendo a otimização de processos e a excelência operacional.	'Definir e implementar a estratégia de TI alinhada aos objetivos de negócio da organização.', 'Gerenciar o orçamento e os recursos da área de TI, garantindo a eficiência e a otimização dos investimentos.', 'Supervisionar a implementação e manutenção de sistemas e infraestrutura de TI, assegurando a disponibilidade e o desempenho.', 'Garantir a segurança da informação e a proteção de dados da empresa, implementando políticas e procedimentos adequados.', 'Liderar a equipe de TI, promovendo o desenvolvimento profissional e o engajamento.', 'Avaliar e selecionar novas tecnologias e soluções de TI, buscando a inovação e a melhoria contínua dos processos.', 'Estabelecer parcerias estratégicas com fornecedores de TI, garantindo a qualidade dos serviços e a negociação de contratos vantajosos.', 'Monitorar e analisar os indicadores de desempenho da área de TI, identificando oportunidades de melhoria e implementando ações corretivas.', 'Assegurar a conformidade com as normas e regulamentações do setor de transporte e de TI.', 'Representar a empresa em eventos e fóruns de TI, buscando a atualização constante e a troca de conhecimentos.'	1	ceo	2	teste	\N		'Visão estratégica', 'Liderança', 'Gestão de projetos', 'Gestão de orçamento', 'Conhecimento técnico em TI', 'Comunicação', 'Negociação', 'Tomada de decisão', 'Resolução de problemas', 'Orientação para resultados'	\N	\N	15	\N	94	23	7	1	\N	11	\N	3	1	100	2	\N	29	\N	t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7	43	
14	DIRETOR COMERCIAL 2	\N	Liderar a estratégia comercial, impulsionando o crescimento da receita e a expansão da participação de mercado no setor de transporte, assegurando a excelência no relacionamento com clientes e o alinhamento com os objetivos organizacionais.	'Desenvolver e implementar estratégias comerciais abrangentes para atingir as metas de receita e participação de mercado.', 'Gerir e orientar a equipe comercial, promovendo o desenvolvimento de talentos e a alta performance.', 'Cultivar relacionamentos estratégicos com clientes-chave, identificando oportunidades de negócios e assegurando a satisfação.', 'Monitorar e analisar as tendências do mercado e a concorrência, adaptando as estratégias comerciais para otimizar os resultados.', 'Negociar contratos e acordos comerciais complexos, garantindo a rentabilidade e a sustentabilidade dos negócios.', 'Colaborar com outras áreas da empresa para garantir a integração das estratégias comerciais com os objetivos organizacionais.', 'Apresentar relatórios e análises regulares sobre o desempenho comercial, identificando áreas de melhoria e oportunidades de crescimento.', 'Garantir o cumprimento das políticas e procedimentos internos, bem como as regulamentações do setor de transporte.'	1	CEO	2	teste	\N		'Liderança estratégica', 'Visão de negócios', 'Negociação', 'Comunicação', 'Gestão de equipes', 'Orientação para resultados', 'Análise de mercado', 'Relacionamento com clientes', 'Pensamento crítico', 'Inovação'	\N	29	15	\N	94	23	4	1	\N	3	\N	5	1	100	4	\N	29	\N	t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11	43	
74	DIRETOR COMERCIAL FILIAL39		Supervisionar as atividades comerciais da filial, assegurando o cumprimento das metas estabelecidas e a expansão da participação de mercado no setor de transporte.	Coordenar e supervisionar a equipe de vendas da filial.\nImplementar estratégias comerciais para alcançar os objetivos de receita e lucratividade.\nAnalisar o desempenho das vendas e identificar oportunidades de melhoria.\nDesenvolver e manter relacionamento com clientes estratégicos.\nMonitorar as tendências do mercado e a concorrência.\nGarantir o cumprimento das políticas e procedimentos comerciais da empresa.	\N	CEO	2		\N		'Liderança de equipe', 'Visão estratégica', 'Negociação', 'Orientação para resultados', 'Comunicação', 'Conhecimento do mercado de transporte'	\N	\N	16	\N	\N	24	5	19	\N	6	\N	1	136	100	1	\N	29		t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	43	
75	DIRETOR COMERCIAL MATRIZ49		Supervisionar as estratégias comerciais, assegurando o alcance das metas de vendas e a satisfação do cliente, impulsionando o crescimento da empresa no setor de transporte.	Acompanhar o desempenho da equipe comercial, fornecendo suporte e orientação para o atingimento dos objetivos.\nElaborar relatórios de vendas e indicadores de performance, analisando os resultados e propondo ações de melhoria.\nImplementar as políticas e diretrizes comerciais, garantindo o cumprimento dos procedimentos e normas estabelecidas.\nContribuir para o desenvolvimento de novos produtos e serviços, identificando oportunidades de mercado e necessidades dos clientes.\nManter relacionamento com clientes estratégicos, buscando a fidelização e a expansão dos negócios.\nMonitorar o mercado e a concorrência, identificando tendências e oportunidades para a empresa.\nApoiar a gestão do orçamento da área comercial, controlando os custos e buscando a otimização dos recursos.	\N	CEO	2		\N		'Liderança de equipe', 'Visão estratégica', 'Negociação', 'Orientação para resultados', 'Comunicação', 'Análise de dados', 'Conhecimento do mercado de transporte'	\N	\N	16	\N	\N	24	5	19	\N	6	\N	1	136	100	1	\N	29		t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	43	
76	DIRETOR COMERCIAL FILIAL49		Liderar a estratégia comercial da Filial 49, assegurando o alcance das metas de vendas e o crescimento da participação de mercado no setor de transporte, através da gestão eficiente da equipe e da implementação de ações inovadoras.	Desenvolver e implementar o plano estratégico de vendas da Filial 49, alinhado com as diretrizes da empresa.\nGerenciar a equipe comercial, definindo metas, acompanhando o desempenho e oferecendo o suporte necessário para o desenvolvimento profissional.\nProspectar novos clientes e mercados, identificando oportunidades de negócio e expandindo a atuação da empresa no setor de transporte.\nNegociar contratos e acordos comerciais, buscando as melhores condições para a empresa e garantindo a satisfação dos clientes.\nAnalisar os indicadores de desempenho de vendas, identificando tendências e propondo ações corretivas para o alcance dos resultados.\nMonitorar a concorrência, identificando as melhores práticas do mercado e propondo ações para diferenciar a empresa.\nRepresentar a empresa em eventos e feiras do setor, fortalecendo a imagem da marca e ampliando o networking.\nGarantir o cumprimento das normas e políticas internas da empresa, bem como as legislações do setor de transporte.\nElaborar relatórios gerenciais, apresentando os resultados da área comercial e as projeções para o futuro.	\N	CEO	2		\N		'Liderança', 'Visão estratégica', 'Negociação', 'Comunicação', 'Foco em resultados', 'Orientação para o cliente', 'Análise de mercado', 'Gestão de equipes', 'Inovação'	\N	\N	16	\N	\N	24	5	19	\N	6	\N	1	136	100	1	\N	29		t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	43	
77	COORDENADOR DE REC HUMANOS 2		Coordenar as atividades de recursos humanos, assegurando a implementação de políticas e programas eficazes para o desenvolvimento e gestão de pessoas na organização do setor de transporte.	Liderar a equipe de recursos humanos, orientando e desenvolvendo os membros.\nGerenciar os processos de recrutamento e seleção, garantindo a atração e retenção de talentos.\nImplementar e monitorar os programas de treinamento e desenvolvimento, alinhados às necessidades da empresa.\nAdministrar os processos de avaliação de desempenho, promovendo o feedback e o reconhecimento.\nAssegurar a conformidade com a legislação trabalhista e as normas internas.\nCoordenar as ações de comunicação interna, promovendo o engajamento dos colaboradores.\nAnalisar os indicadores de RH, propondo melhorias e ações corretivas.\nGerir o orçamento da área de recursos humanos, otimizando os recursos disponíveis.\nConduzir projetos de melhoria nos processos de RH, visando a eficiência e a qualidade.	\N	CEO	2		\N		'Liderança', 'Gestão de Equipes', 'Comunicação', 'Negociação', 'Visão Estratégica', 'Conhecimento em Legislação Trabalhista', 'Gestão de Projetos', 'Orientação para Resultados', 'Capacidade Analítica'	\N	\N	16	\N	\N	24	5	19	\N	11	\N	3	136	100	1	\N	29		t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	43	
16	DIRETOR COMERCIAL 3	\N	Liderar a estratégia comercial da empresa, assegurando o crescimento da receita, a expansão da participação de mercado e a excelência no relacionamento com clientes no setor de transporte.	'Definir e implementar a estratégia comercial da empresa, alinhada aos objetivos estratégicos gerais.', 'Prospectar e desenvolver novos mercados e clientes, identificando oportunidades de crescimento no setor de transporte.', 'Gerenciar e motivar a equipe comercial, garantindo o cumprimento das metas de vendas e a alta performance.', 'Monitorar e analisar o desempenho das vendas, identificando tendências e oportunidades de melhoria.', 'Negociar e fechar contratos com clientes estratégicos, assegurando a rentabilidade e a satisfação do cliente.', 'Desenvolver e manter relacionamentos de longo prazo com clientes-chave, buscando a fidelização e o crescimento da receita.', 'Representar a empresa em eventos e feiras do setor, promovendo a marca e os produtos/serviços.', 'Colaborar com outras áreas da empresa, como marketing, operações e finanças, para garantir a excelência na entrega dos produtos/serviços e a satisfação do cliente.'	14	ceo	1		\N		'Liderança estratégica', 'Visão de negócios', 'Gestão de equipes', 'Negociação', 'Comunicação', 'Orientação para resultados', 'Foco no cliente', 'Análise de mercado', 'Planejamento estratégico'	\N	30	15	\N	94	23	5	1	\N	11	\N	3	1	100	4	\N	30	\N	t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	43	
18	DIRETOR COMERCIAL 5	\N	Liderar a estratégia comercial da empresa, assegurando o crescimento da receita, a expansão da participação de mercado e a otimização dos resultados financeiros no setor de transporte.	'Definir e implementar a estratégia comercial da empresa, alinhada aos objetivos de crescimento e rentabilidade.', 'Prospectar e desenvolver novos mercados e clientes, identificando oportunidades de negócio e expandindo a atuação da empresa.', 'Gerenciar a equipe comercial, estabelecendo metas, acompanhando o desempenho e promovendo o desenvolvimento profissional dos colaboradores.', 'Negociar contratos e acordos comerciais estratégicos, visando garantir condições vantajosas para a empresa.', 'Monitorar o mercado e a concorrência, identificando tendências e oportunidades para aprimorar a oferta de produtos e serviços.', 'Representar a empresa em eventos e negociações comerciais, fortalecendo a imagem e o relacionamento com clientes e parceiros.', 'Garantir o cumprimento das políticas e procedimentos internos, assegurando a ética e a transparência nas operações comerciais.'	1	CEO	2	teste	\N		'Visão estratégica', 'Liderança', 'Negociação', 'Orientação para resultados', 'Comunicação', 'Gestão de equipes', 'Análise de mercado', 'Inteligência emocional', 'Adaptabilidade'	\N	30	15	\N	94	23	7	2	\N	11	\N	3	11	100	4	\N	31	\N	t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7	43	
19	DIRETOR COMERCIAL 6	\N	Liderar a estratégia comercial da empresa, impulsionando o crescimento e garantindo a excelência no atendimento ao cliente no setor de transporte.	'Definir e implementar a estratégia comercial da empresa, alinhada aos objetivos estratégicos.', 'Gerir a equipe comercial, promovendo o desenvolvimento e o alto desempenho.', 'Prospectar e desenvolver novos negócios, identificando oportunidades de mercado e expandindo a base de clientes.', 'Negociar e fechar contratos com clientes estratégicos, garantindo a rentabilidade e a sustentabilidade dos negócios.', 'Monitorar e analisar o desempenho comercial, identificando oportunidades de melhoria e implementando ações corretivas.', 'Representar a empresa em eventos e negociações comerciais, fortalecendo a imagem e o relacionamento com o mercado.', 'Estabelecer e manter relacionamento com os principais clientes e parceiros estratégicos.'	1	CEO	2	teste	\N		'Liderança', 'Visão estratégica', 'Negociação', 'Comunicação', 'Orientação para resultados', 'Gestão de equipes', 'Análise de mercado'	\N	29	15	\N	94	23	7	1	\N	11	\N	3	1	100	4	\N	29	\N	t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7	43	
22	CEO1	\N	Liderar a empresa no setor de transporte, assegurando a conformidade com regulamentos de auditoria, impulsionando o crescimento sustentável e maximizando o valor para os stakeholders.	'Definir a estratégia global da empresa, alinhada com as melhores práticas de auditoria e as tendências do setor de transporte.', 'Supervisionar a execução de auditorias internas e externas, garantindo a integridade dos processos financeiros e operacionais.', 'Gerenciar a relação com órgãos reguladores e outras partes interessadas, assegurando a conformidade com as normas e legislações aplicáveis.', 'Promover uma cultura de ética, transparência e responsabilidade em toda a organização.', 'Liderar a equipe executiva, fomentando o desenvolvimento de talentos e a criação de um ambiente de trabalho colaborativo e de alto desempenho.', 'Avaliar e mitigar riscos, implementando controles internos eficazes para proteger os ativos da empresa.', 'Identificar oportunidades de melhoria e inovação nos processos de auditoria e nas operações da empresa.', 'Monitorar o desempenho financeiro e operacional da empresa, tomando decisões estratégicas para otimizar os resultados.', 'Representar a empresa em eventos e fóruns do setor, fortalecendo a imagem e a reputação da organização.', 'Assegurar a sustentabilidade financeira da empresa, através de uma gestão eficiente dos recursos e investimentos.'	1	CEO	2	TEste d	\N	teste	'Liderança estratégica', 'Visão de negócios', 'Conhecimento em auditoria', 'Conhecimento do setor de transporte', 'Gestão de riscos', 'Tomada de decisões', 'Comunicação', 'Negociação', 'Gestão de pessoas', 'Ética e integridade'	\N	30	16	\N	94	24	7	2	\N	11	\N	3	11	100	5	\N	30	\N	f	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7	43	
17	DIRETOR COMERCIAL 4	\N	Liderar e definir a estratégia comercial da empresa no setor de transporte, impulsionando o crescimento da receita, otimizando a performance da equipe e garantindo a excelência no relacionamento com clientes e parceiros.	'Desenvolver e implementar a estratégia comercial da empresa, alinhada aos objetivos de negócio e às tendências do mercado de transporte.', 'Gerenciar e otimizar o orçamento da área comercial, garantindo o cumprimento das metas de receita e rentabilidade.', 'Liderar e motivar a equipe comercial, promovendo o desenvolvimento profissional e o alto desempenho.', 'Prospectar e desenvolver novos negócios, expandindo a presença da empresa no mercado de transporte.', 'Negociar e fechar contratos com clientes e parceiros estratégicos, garantindo condições comerciais favoráveis à empresa.', 'Monitorar e analisar o desempenho da área comercial, identificando oportunidades de melhoria e implementando ações corretivas.', 'Representar a empresa em eventos e feiras do setor de transporte, fortalecendo o relacionamento com clientes e parceiros.', 'Garantir o cumprimento das normas e regulamentos do setor de transporte, assegurando a conformidade legal da empresa.', 'Colaborar com as demais áreas da empresa, garantindo a integração e o alinhamento das estratégias de negócio.', 'Implementar e gerenciar políticas de vendas e incentivos, visando o alcance das metas e o reconhecimento do desempenho da equipe.'	14	CEO	2	teste	\N		'Visão estratégica', 'Liderança', 'Negociação', 'Comunicação', 'Orientação para resultados', 'Gestão de equipes', 'Análise de mercado', 'Planejamento estratégico', 'Conhecimento do setor de transporte', 'Relacionamento interpessoal'	\N	31	15	\N	94	23	7	1	\N	11	\N	3	1	100	4	\N	30	\N	t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7	43	
26	Diretor Marketing 2		Assegurar a execução das estratégias de marketing no setor de transporte, garantindo o cumprimento dos processos definidos e a otimização das campanhas para atingir os objetivos estabelecidos.	'Supervisionar a implementação das ações de marketing planejadas para o setor de transporte.', 'Acompanhar o desempenho das campanhas de marketing, monitorando os indicadores-chave de performance (KPIs).', 'Controlar o orçamento de marketing, garantindo a alocação eficiente dos recursos.', 'Orientar a equipe de marketing na execução das atividades, assegurando a qualidade e a consistência das entregas.', 'Assegurar a conformidade das ações de marketing com as normas e regulamentos do setor de transporte.'	\N	 	2		\N		'Visão estratégica', 'Liderança de equipe', 'Conhecimento do setor de transporte', 'Gestão de projetos', 'Comunicação eficaz', 'Pensamento analítico', 'Orientação para resultados'	\N	\N	16	\N	\N	24	5	19	\N	6	\N	1	136	100	2	\N	29		t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	43	
27	Diretor Marketing 3		Assegurar a execução das estratégias de marketing, supervisionando as atividades da equipe e garantindo o cumprimento dos objetivos definidos para o setor de transporte.	'Supervisionar a implementação de campanhas de marketing, garantindo a sua execução conforme o planejado.', 'Acompanhar o desempenho das ações de marketing, monitorando os resultados e propondo ajustes quando necessário.', 'Controlar o orçamento da área de marketing, assegurando a sua utilização eficiente.', 'Orientar a equipe de marketing, fornecendo suporte técnico e estratégico para o desenvolvimento das suas atividades.', 'Assegurar a qualidade dos materiais de marketing, revisando e aprovando peças e campanhas.'	\N	CEO	2		\N		'Liderança', 'Visão Estratégica', 'Orientação para Resultados', 'Comunicação', 'Negociação', 'Conhecimento do Mercado de Transporte', 'Gestão de Equipes', 'Pensamento Analítico'	\N	\N	16	\N	\N	24	5	19	\N	6	\N	1	136	100	1	\N	29		t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	43	
25	Diretor de Operacao 1	\N	teste	teste	18	CEO	2	teste	\N		teste	\N	29	16	\N	\N	24	8	2	\N	1	\N	5	11	100	4	\N	29	\N	t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7	43	
28	DIRETOR COMERCIAL 8	\N	teste	teste	1	teste	2	teste	\N			\N	\N	15	\N	\N	23	8	\N	\N	1	\N	2	\N	100	1	\N	29	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	43	
29	DIRETOR COMERCIAL 9		Assegurar o cumprimento dos processos comerciais definidos, supervisionando as atividades da equipe e monitorando os indicadores de desempenho para garantir o alcance das metas estabelecidas no setor de transporte.	'Supervisionar a execução das estratégias comerciais.', 'Acompanhar o desempenho da equipe comercial, fornecendo orientação e suporte.', 'Monitorar os indicadores de vendas e identificar oportunidades de melhoria.', 'Controlar o cumprimento das metas estabelecidas para a equipe.', 'Orientar a equipe em relação às melhores práticas de vendas e negociação.', 'Assegurar a qualidade do atendimento aos clientes e a satisfação dos mesmos.'	\N	CEO	2		\N		'Liderança de equipe', 'Negociação', 'Visão estratégica', 'Orientação para resultados', 'Comunicação', 'Conhecimento do setor de transporte'	\N	\N	16	\N	\N	24	5	19	\N	6	\N	1	136	100	1	\N	29		t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	43	
5	Coordenador de TI	\N	Liderar a estratégia e a execução das atividades de tecnologia da informação, garantindo a disponibilidade, segurança e eficiência dos sistemas e infraestrutura de TI, alinhados aos objetivos de negócio da empresa no setor de transporte.	'Coordenar a equipe de TI, definindo prioridades, distribuindo tarefas e acompanhando o desempenho.', 'Planejar e implementar projetos de infraestrutura e sistemas de TI, assegurando o cumprimento de prazos e orçamentos.', 'Gerenciar a segurança da informação, definindo políticas e procedimentos para proteger os dados e sistemas da empresa.', 'Garantir a disponibilidade e o bom funcionamento dos sistemas de TI, realizando monitoramento, manutenção e suporte técnico.', 'Negociar com fornecedores de TI, buscando as melhores soluções e condições para a empresa.', 'Assegurar a conformidade com as normas e regulamentações do setor de transporte e de tecnologia da informação.', 'Promover a inovação tecnológica, buscando soluções que melhorem a eficiência e a competitividade da empresa.'	13	CEO	2	teste	\N		'Liderança de equipe', 'Planejamento estratégico', 'Gerenciamento de projetos', 'Conhecimento técnico em infraestrutura e sistemas de TI', 'Segurança da informação', 'Negociação', 'Visão de negócio', 'Comunicação', 'Resolução de problemas'	\N	29	15	\N	88	23	4	1	\N	3	\N	5	1	100	4	\N	29	\N	t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11	43	
30	DIRETOR COMERCIAL 10	\N	Liderar a estratégia comercial da empresa no setor de transporte, assegurando o crescimento da receita, a expansão da participação de mercado e a otimização da rentabilidade.	'Definir e implementar a estratégia comercial da empresa, alinhada com os objetivos estratégicos globais.', 'Gerenciar e desenvolver a equipe comercial, garantindo o alto desempenho e o alcance das metas estabelecidas.', 'Prospectar e desenvolver novos negócios, identificando oportunidades de crescimento e expansão no mercado.', 'Analisar o mercado e a concorrência, identificando tendências e oportunidades para a empresa.', 'Estabelecer e manter relacionamentos estratégicos com clientes-chave e parceiros de negócios.', 'Monitorar e controlar o orçamento da área comercial, garantindo a utilização eficiente dos recursos.', 'Reportar os resultados da área comercial à alta gestão, apresentando análises e recomendações.'	1	CEO	2	TESTE	\N		'Visão estratégica', 'Liderança', 'Negociação', 'Orientação para resultados', 'Comunicação', 'Conhecimento do mercado de transporte', 'Gestão de equipes', 'Análise de dados', 'Pensamento analítico', 'Adaptabilidade'	\N	\N	15	\N	1	23	7	1	\N	11	\N	3	1	100	1	\N	29	\N	t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7	43	
31	DIRETOR COMERCIAL 11		Assegurar o cumprimento dos processos comerciais no dia a dia, supervisionando as atividades da equipe e garantindo a excelência na execução das estratégias estabelecidas para o setor de transporte.	'Supervisionar a execução das estratégias comerciais, garantindo o alinhamento com os objetivos da empresa.', 'Acompanhar o desempenho da equipe comercial, monitorando os indicadores e propondo ações de melhoria.', 'Orientar a equipe na aplicação das melhores práticas comerciais, visando o aumento da eficiência e da qualidade dos serviços prestados.', 'Controlar o cumprimento das metas estabelecidas, analisando os resultados e identificando oportunidades de crescimento.', 'Assegurar a qualidade do atendimento aos clientes, monitorando a satisfação e propondo soluções para eventuais problemas.'	\N	CEO	2		\N		'Liderança', 'Visão estratégica', 'Orientação para resultados', 'Negociação', 'Comunicação', 'Gestão de equipes', 'Conhecimento do setor de transporte', 'Análise de mercado', 'Foco no cliente'	\N	\N	16	\N	\N	24	5	19	\N	6	\N	1	136	100	1	\N	29		t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	43	
32	DIRETOR COMERCIAL 12		Assegurar o cumprimento dos processos comerciais definidos, supervisionando a equipe e garantindo a excelência no atendimento e a satisfação do cliente no setor de transporte.	'Supervisionar as atividades da equipe comercial, orientando e acompanhando o desempenho individual e coletivo.', 'Monitorar os indicadores de performance da área comercial, identificando oportunidades de melhoria e implementando ações corretivas.', 'Controlar o cumprimento das metas de vendas estabelecidas, analisando os resultados e propondo estratégias para otimizar o desempenho.', 'Orientar a equipe na aplicação das políticas comerciais da empresa, garantindo a padronização dos processos e a conformidade com as normas internas.', 'Assegurar a qualidade do atendimento ao cliente, supervisionando o cumprimento dos padrões de excelência e solucionando eventuais problemas ou reclamações.'	\N	CEO	2		\N		'Liderança de equipe', 'Orientação para resultados', 'Comunicação eficaz', 'Negociação', 'Visão estratégica', 'Conhecimento do setor de transporte', 'Gestão de processos comerciais', 'Análise de dados e indicadores', 'Foco no cliente', 'Capacidade de resolução de problemas'	\N	\N	16	\N	\N	24	5	19	\N	6	\N	1	136	100	1	\N	29		t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	43	
33	DIRETOR COMERCIAL 13	\N	Liderar a estratégia comercial da empresa, impulsionando o crescimento da receita e expandindo a participação de mercado no setor de transporte (aéreo, rodoviário, ferroviário, marítimo), garantindo a excelência no relacionamento com clientes e o desenvolvimento de novas oportunidades de negócio.	'Desenhar e implementar a estratégia comercial da empresa, alinhada aos objetivos estratégicos e financeiros.', 'Prospectar e desenvolver novos mercados e canais de distribuição, visando expandir a presença da empresa no setor de transporte.', 'Gerenciar a equipe comercial, definindo metas, acompanhando o desempenho e promovendo o desenvolvimento profissional.', 'Negociar e fechar contratos de grande porte com clientes estratégicos, garantindo a rentabilidade e a satisfação do cliente.', 'Analisar o mercado e a concorrência, identificando oportunidades e ameaças, e propondo ações para otimizar a performance comercial.', 'Monitorar e controlar o orçamento da área comercial, garantindo a eficiência e a otimização dos recursos.', 'Representar a empresa em eventos e feiras do setor, fortalecendo o relacionamento com stakeholders e promovendo a marca.'	1	CEO	2	teste	\N		'Visão estratégica', 'Liderança de equipes', 'Negociação', 'Comunicação', 'Orientação para resultados', 'Conhecimento do mercado de transporte', 'Gestão de orçamento', 'Relacionamento interpessoal'	\N	\N	15	\N	1	23	7	1	\N	11	\N	3	1	100	1	\N	29	\N	t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7	43	
23	Coordenador de RH	\N	Liderar a estratégia de gestão de pessoas, assegurando o alinhamento com os objetivos organizacionais e promovendo um ambiente de trabalho positivo e produtivo no setor de transporte.	'Coordenar as atividades de recrutamento e seleção, treinamento e desenvolvimento, avaliação de desempenho e gestão de carreira.', 'Implementar políticas e programas de RH que promovam o engajamento e a retenção de talentos.', 'Garantir o cumprimento das leis trabalhistas e normas regulamentadoras do setor de transporte.', 'Gerenciar o orçamento da área de RH, otimizando os recursos e garantindo a eficiência dos processos.', 'Atuar como consultor interno, prestando suporte aos gestores em questões relacionadas à gestão de pessoas.', 'Monitorar os indicadores de desempenho da área de RH, propondo ações de melhoria contínua.', 'Conduzir negociações sindicais e representar a empresa em questões trabalhistas.', 'Promover a cultura organizacional, disseminando os valores e princípios da empresa.'	\N	CEO	2	Coordenação	\N		'Liderança', 'Visão estratégica', 'Comunicação', 'Negociação', 'Gestão de projetos', 'Orientação para resultados', 'Conhecimento técnico em RH', 'Conhecimento da legislação trabalhista', 'Habilidade em gestão de conflitos', 'Capacidade de análise e tomada de decisão'	\N	31	16	\N	94	24	4	1	\N	3	\N	\N	1	100	5	\N	29	\N	t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11	43	
15	Diretor Geral	\N	Assegurar o cumprimento dos processos e a excelência operacional do setor de Recursos Humanos na área de transporte, supervisionando as atividades diárias e garantindo o alinhamento com os objetivos estratégicos da organização.	'Supervisionar as atividades da equipe de Recursos Humanos, garantindo a execução dos processos de recrutamento, seleção, treinamento e desenvolvimento.', 'Acompanhar o desempenho dos colaboradores, fornecendo feedback e orientações para o aprimoramento contínuo.', 'Monitorar os indicadores de desempenho da área de Recursos Humanos, identificando oportunidades de melhoria e implementando ações corretivas.', 'Controlar o cumprimento das normas e regulamentos trabalhistas, assegurando a conformidade legal e a mitigação de riscos.', 'Orientar a equipe na resolução de problemas e tomada de decisões, promovendo um ambiente de trabalho colaborativo e eficiente.'	1	nan	2	teste	\N		'Liderança', 'Gestão de Equipes', 'Comunicação', 'Visão Estratégica', 'Orientação para Resultados', 'Conhecimento em Legislação Trabalhista', 'Processos de RH'	\N	\N	16	\N	94	24	5	19	\N	6	\N	1	136	100	5	\N	29	\N	t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	43	
35	Coordenador TI 2	\N	Liderar e supervisionar a equipe de TI, assegurando a eficiência e a eficácia das soluções tecnológicas implementadas, alinhando-as às estratégias e necessidades do setor de transporte.	'Coordenar a implementação e manutenção de sistemas de informação para otimizar as operações de transporte.', 'Gerenciar projetos de tecnologia, desde o planejamento até a execução, garantindo o cumprimento de prazos e orçamentos.', 'Supervisionar a infraestrutura de TI, assegurando a disponibilidade e a segurança dos dados.', 'Colaborar com as diferentes áreas da empresa para identificar oportunidades de melhoria através da tecnologia.', 'Avaliar e selecionar novas tecnologias, propondo soluções inovadoras para os desafios do setor de transporte.', 'Garantir a conformidade com as políticas de segurança da informação e as regulamentações do setor.', 'Realizar a gestão de fornecedores de TI, negociando contratos e acompanhando a qualidade dos serviços prestados.'	1	CEO	2	tecnico	\N		'Liderança de equipe', 'Gestão de projetos', 'Conhecimento em infraestrutura de TI', 'Visão estratégica', 'Comunicação eficaz', 'Negociação', 'Conhecimento do setor de transporte'	\N	\N	15	\N	1	23	5	1	\N	11	\N	3	1	100	1	\N	29	\N	t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	43	
11	Coordenador TI 2	\N	Liderar e coordenar as atividades da equipe de TI, assegurando a eficiência, segurança e inovação dos sistemas e infraestrutura de tecnologia da informação da organização no setor de transporte, alinhando as estratégias de TI aos objetivos de negócio e promovendo a melhoria contínua dos processos.	'Gerenciar a equipe de TI, distribuindo tarefas, orientando e desenvolvendo os colaboradores.', 'Planejar, implementar e monitorar projetos de TI, garantindo o cumprimento de prazos, orçamentos e qualidade.', 'Definir e implementar políticas de segurança da informação, assegurando a proteção dos dados e sistemas da empresa.', 'Gerenciar a infraestrutura de TI, incluindo servidores, redes, sistemas operacionais e equipamentos, garantindo a disponibilidade e performance.', 'Avaliar e selecionar novas tecnologias e soluções de TI, buscando inovação e otimização dos processos da empresa.', 'Negociar com fornecedores de TI, buscando as melhores condições de preço, qualidade e serviço.', 'Acompanhar as tendências do mercado de TI, buscando novas soluções e tecnologias para a empresa.', 'Elaborar e gerenciar o orçamento de TI, garantindo a alocação eficiente dos recursos.', 'Garantir o alinhamento das atividades de TI com as normas e regulamentos do setor de transporte.', 'Promover a cultura de inovação e melhoria contínua na área de TI.'	14	CEO	2	teste	\N		'Liderança de Equipes', 'Gestão de Projetos', 'Segurança da Informação', 'Infraestrutura de TI', 'Inovação', 'Negociação', 'Visão Estratégica', 'Orçamento', 'Conhecimento do Setor de Transporte', 'Melhoria Contínua'	\N	\N	15	\N	94	23	6	1	\N	11	\N	3	1	100	1	\N	\N	\N	f	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	43	
10	Diretor de RH4	\N	Assegurar o cumprimento das políticas e processos de Recursos Humanos, supervisionando as atividades da equipe e garantindo a eficiência e a conformidade das operações de RH no setor de transporte.	'Supervisionar a execução dos processos de recrutamento e seleção, treinamento e desenvolvimento, avaliação de desempenho e gestão de carreira.', 'Acompanhar os indicadores de desempenho da área de Recursos Humanos, identificando oportunidades de melhoria e implementando ações corretivas.', 'Orientar a equipe na aplicação das políticas e procedimentos de RH, garantindo a uniformidade e a qualidade dos serviços prestados.', 'Controlar o cumprimento das normas trabalhistas e previdenciárias, assegurando a conformidade legal da empresa.', 'Monitorar o clima organizacional, propondo ações para promover o engajamento e a satisfação dos colaboradores.'	1	nan	2	teste	\N		'Liderança de Equipes', 'Conhecimento em Legislação Trabalhista', 'Gestão de Processos de RH', 'Comunicação Eficaz', 'Visão Estratégica', 'Orientação para Resultados', 'Negociação', 'Tomada de Decisão', 'Resiliência', 'Inteligência Emocional'	\N	\N	16	\N	94	24	5	19	\N	6	\N	1	136	100	5	\N	29	\N	t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	43	
36	GERENTE DE TI	\N	None	None	\N	CEO	1		\N		None	\N	\N	15	\N	\N	23	4	1	\N	1	\N	1	1	100	1	\N	29	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	43	
37	GERENTE	\N	None	None	\N	CEO	1		\N		None	\N	\N	15	\N	\N	23	8	1	\N	1	\N	1	1	100	1	\N	29	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	43	
38	teste	\N	None	None	\N	TEste	1		\N		None	\N	\N	15	\N	\N	23	2	1	\N	1	\N	1	1	100	1	\N	29	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	43	
24	Diretor Marketing	\N	Assegurar o cumprimento das estratégias de marketing estabelecidas, supervisionando a execução das ações e campanhas para garantir o alcance dos objetivos de promoção e vendas no setor de transporte.	'Supervisionar a implementação do plano de marketing, garantindo a execução das ações promocionais e campanhas publicitárias.', 'Acompanhar o desempenho das campanhas de marketing, monitorando os indicadores de performance e propondo ajustes para otimizar os resultados.', 'Controlar o orçamento da área de marketing, assegurando a alocação eficiente dos recursos e o cumprimento das metas financeiras.', 'Orientar a equipe de marketing na execução das tarefas, garantindo o alinhamento com as estratégias da empresa e o desenvolvimento profissional dos colaboradores.', 'Assegurar a qualidade dos materiais de marketing, revisando e aprovando peças publicitárias, conteúdos digitais e outros materiais de comunicação.'	\N	CEO	2	teste	\N		'Visão estratégica de marketing', 'Liderança de equipe', 'Gestão de projetos', 'Análise de dados e indicadores', 'Comunicação eficaz', 'Conhecimento do setor de transportes'	2026-02-24 18:13:43.458914-03	29	16	\N	94	24	5	19	\N	6	\N	1	136	100	4	\N	29	\N	t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	43	
40	GERENTE DE TI 2	\N	Liderar e supervisionar a implementação e manutenção de políticas e procedimentos de segurança da informação, assegurando a proteção dos ativos de dados e sistemas da organização no setor de transporte, em conformidade com as melhores práticas e regulamentações.	Gerenciar a equipe de TI, definindo metas, acompanhando o desempenho e promovendo o desenvolvimento profissional.\r\nPlanejar e implementar políticas de segurança da informação, garantindo a proteção dos dados e sistemas da empresa.\r\nSupervisionar a infraestrutura de TI, incluindo redes, servidores, bancos de dados e sistemas de comunicação.\r\nAnalisar as necessidades de negócio e propor soluções de TI inovadoras que agreguem valor à empresa.\r\nGarantir a disponibilidade e o desempenho dos sistemas críticos de TI, minimizando interrupções e impactos nas operações.\r\nAdministrar o orçamento de TI, controlando os custos e otimizando os investimentos.\r\nNegociar com fornecedores de TI, buscando as melhores condições e tecnologias para a empresa.\r\nAssegurar a conformidade com as normas e regulamentações do setor de transporte e de segurança da informação.\r\nMonitorar e avaliar continuamente os riscos de TI, propondo medidas preventivas e corretivas.\r\nPromover a cultura de inovação e melhoria contínua na área de TI.	\N	CEO	1		\N		'Liderança de equipe', 'Conhecimento em segurança da informação', 'Gerenciamento de riscos', 'Conhecimento em normas e regulamentações de segurança', 'Comunicação', 'Visão estratégica', 'Tomada de decisão', 'Resolução de problemas', 'Negociação', 'Gerenciamento de projetos'	\N	\N	15	\N	\N	23	3	23	\N	1	\N	1	173	100	2	\N	29	\N	t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	43	
42	GERENTE DE TI3	\N	Liderar e otimizar a infraestrutura de TI e as estratégias de segurança da informação, garantindo a disponibilidade, integridade e confidencialidade dos sistemas e dados da organização no setor de transporte.	Gerenciar a equipe de TI, definindo metas, alocando recursos e monitorando o desempenho.\r\nDesenvolver e implementar políticas e procedimentos de segurança da informação, garantindo a conformidade com as regulamentações e padrões do setor.\r\nPlanejar e coordenar projetos de infraestrutura de TI, desde a concepção até a implementação e o suporte contínuo.\r\nAvaliar e selecionar novas tecnologias e soluções de TI para otimizar a eficiência e a segurança dos sistemas.\r\nMonitorar e analisar as tendências do setor de transporte e as ameaças de segurança cibernética, adaptando as estratégias de TI e segurança da informação.\r\nGarantir a continuidade dos negócios, desenvolvendo e implementando planos de recuperação de desastres e de contingência.\r\nGerenciar o orçamento de TI, controlando os custos e garantindo o retorno sobre o investimento.\r\nEstabelecer e manter relacionamentos com fornecedores de TI, negociando contratos e garantindo a qualidade dos serviços prestados.	\N	CEO	1		\N		Liderança de equipe, Gestão de projetos, Conhecimento em infraestrutura de TI, Conhecimento em segurança da informação, Visão estratégica, Comunicação, Negociação, Gerenciamento de orçamento	\N	\N	16	\N	\N	24	6	1	\N	1	\N	\N	1	100	1	\N	29	\N	t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	43	
43	DIRETOR COMERCIAL MATRIZ0		Liderar as estratégias comerciais da matriz, assegurando o alcance das metas de vendas e o crescimento sustentável no setor de transporte.	Definir e implementar as estratégias comerciais da empresa, alinhadas aos objetivos organizacionais.\nSupervisionar a equipe de vendas, fornecendo orientação e suporte para o alcance de resultados.\nAnalisar o mercado e a concorrência, identificando oportunidades de expansão e melhoria.\nDesenvolver e manter relacionamentos estratégicos com clientes-chave.\nMonitorar o desempenho das vendas, propondo ações corretivas e preventivas.\nElaborar e gerenciar o orçamento da área comercial.\nAssegurar o cumprimento das políticas e procedimentos comerciais da empresa.\nParticipar de negociações complexas, buscando os melhores resultados para a organização.\nPromover a integração entre as áreas comercial e de marketing, visando a otimização das estratégias.\nApresentar relatórios gerenciais sobre o desempenho da área comercial à alta administração.	\N	CEO	2		\N		'Liderança', 'Visão estratégica', 'Negociação', 'Comunicação', 'Orientação para resultados', 'Análise de mercado', 'Gestão de equipes', 'Tomada de decisão', 'Planejamento e organização', 'Relacionamento interpessoal'	\N	\N	16	\N	\N	24	5	19	\N	6	\N	1	136	100	1	\N	29		t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	43	
44	DIRETOR COMERCIAL FILIAL0		Liderar a implementação das estratégias comerciais na filial, assegurando o alcance das metas de vendas, o crescimento da carteira de clientes e a rentabilidade do negócio no setor de transporte.	Definir e implementar as estratégias de vendas da filial, alinhadas com as diretrizes da empresa.\nGerenciar a equipe comercial, promovendo o desenvolvimento de seus membros e garantindo o alto desempenho.\nAnalisar o mercado e a concorrência, identificando oportunidades de negócio e propondo ações para aumentar a participação da empresa.\nMonitorar os indicadores de desempenho da filial, propondo planos de ação para corrigir desvios e otimizar os resultados.\nProspectar novos clientes e fortalecer o relacionamento com os clientes existentes.\nAssegurar o cumprimento das políticas e procedimentos comerciais da empresa.\nRepresentar a empresa em eventos e negociações comerciais.\nElaborar e acompanhar o orçamento da área comercial da filial.	\N	CEO	2		\N		'Liderança', 'Visão estratégica', 'Orientação para resultados', 'Negociação', 'Comunicação', 'Gestão de equipes', 'Análise de mercado', 'Planejamento e organização'	\N	\N	16	\N	\N	24	5	19	\N	6	\N	1	136	100	1	\N	29		t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	43	
45	DIRETOR COMERCIAL MATRIZ1		Liderar a implementação das estratégias comerciais da matriz, assegurando o alcance dos objetivos de crescimento e rentabilidade no setor de transporte.	Definir e monitorar as metas e indicadores de desempenho da área comercial.\nDesenvolver e implementar planos de ação para expansão da carteira de clientes e aumento da participação de mercado.\nGerenciar a equipe de vendas, promovendo o desenvolvimento profissional e o alcance de resultados.\nAnalisar o mercado e a concorrência, identificando oportunidades e ameaças para o negócio.\nNegociar contratos e parcerias estratégicas com clientes e fornecedores.\nGarantir a qualidade dos serviços prestados e a satisfação dos clientes.\nAcompanhar o desempenho financeiro da área comercial, controlando custos e maximizando o retorno sobre o investimento.	\N	CEO	2		\N		'Liderança', 'Visão estratégica', 'Negociação', 'Gestão de equipes', 'Orientação para resultados', 'Análise de mercado', 'Comunicação', 'Inteligência emocional'	\N	\N	16	\N	\N	24	5	19	\N	6	\N	1	136	100	1	\N	29		t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	43	
46	DIRETOR COMERCIAL FILIAL1		Liderar e direcionar as atividades comerciais da filial, visando o alcance das metas estabelecidas e o crescimento da participação de mercado no setor de transporte.	Definir e implementar as estratégias comerciais da filial, alinhadas com as diretrizes da empresa.\nAnalisar o mercado e identificar oportunidades de negócio, buscando o desenvolvimento de novos clientes e a expansão da carteira existente.\nGerenciar a equipe de vendas, acompanhando o desempenho individual e coletivo, e promovendo o desenvolvimento profissional.\nMonitorar os indicadores de desempenho comercial, como vendas, margem de contribuição e satisfação do cliente, propondo ações de melhoria.\nNegociar contratos e acordos comerciais com clientes estratégicos, visando o estabelecimento de parcerias de longo prazo.\nRepresentar a empresa em eventos e feiras do setor, promovendo a imagem da marca e o relacionamento com stakeholders.\nAssegurar o cumprimento das políticas e procedimentos internos, garantindo a conformidade das atividades comerciais.	\N	CEO	2		\N		'Liderança', 'Visão estratégica', 'Orientação para resultados', 'Negociação', 'Comunicação', 'Gestão de equipes', 'Análise de mercado'	\N	\N	16	\N	\N	24	5	19	\N	6	\N	1	136	100	1	\N	29		t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	43	
47	DIRETOR COMERCIAL MATRIZ2		Liderar a estratégia comercial da Matriz2, supervisionando a implementação de planos de ação para alcançar metas de vendas e expandir a participação no mercado de transporte, garantindo o alinhamento com os objetivos organizacionais e promovendo a excelência no atendimento ao cliente.	Supervisionar a equipe comercial, fornecendo orientação e treinamento para garantir o alcance das metas de vendas.\nMonitorar o desempenho das vendas e identificar oportunidades de melhoria.\nImplementar estratégias de vendas para aumentar a receita e a participação de mercado.\nRealizar análises de mercado para identificar tendências e oportunidades de crescimento.\nGarantir o cumprimento das políticas e procedimentos da empresa.\nColaborar com outras áreas da empresa para garantir a satisfação do cliente.\nManter-se atualizado sobre as tendências do mercado e as melhores práticas do setor.	\N	CEO	2		\N		'Liderança de equipe', 'Planejamento estratégico', 'Visão de negócios', 'Orientação para resultados', 'Comunicação eficaz', 'Negociação', 'Análise de mercado', 'Gestão de desempenho'	\N	\N	16	\N	\N	24	5	19	\N	6	\N	1	136	100	1	\N	29		t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	43	
48	DIRETOR COMERCIAL MATRIZ3		Liderar as estratégias comerciais da empresa, assegurando o alcance das metas de receita e o crescimento da participação no mercado de transporte, através da gestão eficiente da equipe de vendas e da prospecção de novas oportunidades de negócio.	Definir e implementar as estratégias de vendas da empresa, alinhadas com os objetivos de crescimento e rentabilidade.\nProspectar e desenvolver novos mercados e clientes, identificando oportunidades de expansão dos negócios.\nGerenciar e motivar a equipe de vendas, definindo metas, acompanhando o desempenho e oferecendo treinamento e suporte.\nAnalisar o mercado e a concorrência, identificando tendências e oportunidades para ajustar as estratégias de vendas.\nMonitorar e analisar os indicadores de desempenho de vendas, propondo ações corretivas para garantir o cumprimento das metas.\nNegociar contratos com clientes estratégicos, buscando as melhores condições comerciais para a empresa.\nRepresentar a empresa em eventos e feiras do setor, promovendo a marca e os produtos.\nColaborar com as áreas de marketing e produto, fornecendo informações e insights para o desenvolvimento de novas soluções e serviços.\nAssegurar o cumprimento das políticas e procedimentos internos, garantindo a ética e a transparência nas operações comerciais.	\N	CEO	2		\N		'Liderança', 'Visão estratégica', 'Negociação', 'Comunicação', 'Orientação para resultados', 'Gestão de equipes', 'Análise de mercado', 'Planejamento estratégico', 'Conhecimento do setor de transporte'	\N	\N	16	\N	\N	24	5	19	\N	6	\N	1	136	100	1	\N	29		t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	43	
49	DIRETOR COMERCIAL FILIAL3		Liderar as estratégias comerciais da Filial 3, assegurando o alcance das metas de receita e a expansão da participação de mercado no setor de transporte, alinhando as ações com a diretoria e impulsionando o crescimento sustentável da filial.	Definir e implementar planos de ação comerciais para a Filial 3, em consonância com as diretrizes estratégicas da empresa.\nSupervisionar e orientar a equipe comercial da filial, promovendo o desenvolvimento de suas habilidades e o alcance de seus objetivos individuais e coletivos.\nAnalisar o desempenho das vendas e identificar oportunidades de melhoria nos processos e abordagens comerciais.\nProspectar novos clientes e mercados, visando a expansão da base de clientes da filial e o aumento da receita.\nGerenciar o relacionamento com os principais clientes da filial, buscando a fidelização e a identificação de novas oportunidades de negócio.\nMonitorar a concorrência e as tendências do mercado, adaptando as estratégias comerciais da filial para garantir a sua competitividade.\nElaborar e apresentar relatórios de desempenho comercial para a diretoria, com análises e recomendações para a tomada de decisão.\nGarantir o cumprimento das políticas e procedimentos comerciais da empresa na filial.\nColaborar com as demais áreas da empresa para garantir a integração e o alinhamento das ações comerciais.	\N	CEO	2		\N		'Liderança', 'Visão estratégica', 'Orientação para resultados', 'Negociação', 'Comunicação', 'Gestão de equipes', 'Análise de mercado', 'Planejamento comercial', 'Foco no cliente', 'Adaptabilidade'	\N	\N	16	\N	\N	24	5	19	\N	6	\N	1	136	100	1	\N	29		t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	43	
50	DIRETOR COMERCIAL MATRIZ4		Liderar a estratégia comercial da MATRIZ4, supervisionando a implementação de planos e iniciativas para alcançar metas de crescimento e rentabilidade no setor de transporte, assegurando a excelência na execução e a otimização dos recursos.	Supervisionar a elaboração e implementação de planos estratégicos de vendas, alinhados com os objetivos da empresa.\nAnalisar o desempenho das equipes comerciais, identificando oportunidades de melhoria e implementando ações corretivas.\nDesenvolver e manter relacionamentos estratégicos com clientes-chave, visando a fidelização e expansão dos negócios.\nAcompanhar as tendências do mercado de transporte, identificando novas oportunidades e ameaças para o negócio.\nSupervisionar a gestão do orçamento da área comercial, garantindo a eficiência e a otimização dos recursos.\nGarantir o cumprimento das políticas e procedimentos da empresa, bem como as normas regulatórias do setor de transporte.\nLiderar e desenvolver as equipes comerciais, promovendo um ambiente de alto desempenho e engajamento.\nSupervisionar a negociação de contratos comerciais, assegurando a rentabilidade e a mitigação de riscos.	\N	CEO	2		\N		'Liderança', 'Visão estratégica', 'Negociação', 'Orientação para resultados', 'Comunicação', 'Análise de mercado', 'Gestão de equipes', 'Pensamento analítico', 'Foco no cliente', 'Resiliência'	\N	\N	16	\N	\N	24	5	19	\N	6	\N	1	136	100	1	\N	29		t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	43	
51	DIRETOR COMERCIAL FILIAL4		Dirigir as estratégias comerciais da filial, assegurando o alcance das metas de receita e a expansão da participação de mercado, através da gestão eficaz da equipe e da implementação de planos de ação inovadores.	Liderar a equipe comercial da filial, definindo metas e acompanhando o desempenho individual e coletivo.\nDesenvolver e implementar planos estratégicos de vendas, alinhados com os objetivos gerais da empresa.\nMonitorar o mercado e a concorrência, identificando oportunidades de crescimento e ajustando as estratégias conforme necessário.\nGarantir a satisfação dos clientes, através da oferta de soluções personalizadas e de um atendimento de excelência.\nGerenciar o orçamento da área comercial da filial, controlando os custos e maximizando o retorno sobre o investimento.\nNegociar contratos com clientes estratégicos, buscando as melhores condições comerciais para a empresa.\nElaborar relatórios gerenciais, apresentando os resultados da área comercial e propondo ações de melhoria.\nPromover a capacitação e o desenvolvimento da equipe comercial, através de treinamentos e programas de incentivo.	\N	CEO	2		\N		'Liderança', 'Visão estratégica', 'Orientação para resultados', 'Negociação', 'Comunicação', 'Gestão de pessoas', 'Análise de mercado', 'Planejamento estratégico'	\N	\N	16	\N	\N	24	5	19	\N	6	\N	1	136	100	1	\N	29		t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	43	
52	DIRETOR COMERCIAL MATRIZ25		Dirigir as estratégias comerciais da empresa, garantindo o alcance das metas de vendas e o crescimento da participação de mercado no setor de transporte. Assegurar a implementação de planos de ação eficazes, promovendo a excelência no atendimento ao cliente e o desenvolvimento de novos negócios.	Definir e implementar as estratégias de vendas da empresa, alinhadas aos objetivos de crescimento e rentabilidade.\nAnalisar o mercado e a concorrência, identificando oportunidades de novos negócios e tendências do setor de transporte.\nGerenciar a equipe de vendas, orientando, capacitando e avaliando o desempenho dos colaboradores.\nEstabelecer e manter relacionamentos estratégicos com clientes-chave, buscando a fidelização e o aumento da receita.\nAcompanhar os indicadores de performance da área comercial, propondo ações corretivas para garantir o cumprimento das metas.\nDesenvolver e implementar políticas e processos comerciais, visando a otimização dos resultados e a melhoria contínua.\nNegociar contratos e acordos comerciais, assegurando as melhores condições para a empresa.\nRepresentar a empresa em eventos e feiras do setor, promovendo a marca e fortalecendo o relacionamento com stakeholders.\nElaborar e apresentar relatórios gerenciais, fornecendo informações relevantes para a tomada de decisão.	\N	CEO	2		\N		'Visão estratégica', 'Liderança de equipes', 'Negociação', 'Orientação para resultados', 'Comunicação', 'Análise de mercado', 'Gestão de projetos', 'Foco no cliente', 'Tomada de decisão', 'Pensamento crítico'	\N	\N	16	\N	\N	24	5	19	\N	6	\N	1	136	100	1	\N	29		t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	43	
53	DIRETOR COMERCIAL FILIAL5		Liderar e otimizar as estratégias comerciais da filial, assegurando o alcance das metas de receita, a expansão da carteira de clientes e o fortalecimento da presença da empresa no mercado de transporte.	Desenvolver e implementar planos estratégicos de vendas alinhados aos objetivos globais da empresa.\nMonitorar e analisar o desempenho comercial da filial, identificando oportunidades de melhoria e propondo ações corretivas.\nGerenciar a equipe de vendas, fornecendo orientação, treinamento e suporte para o alcance dos resultados.\nProspectar e conquistar novos clientes, estabelecendo relacionamentos de longo prazo e identificando suas necessidades.\nNegociar contratos e condições comerciais, garantindo a rentabilidade das operações e a satisfação dos clientes.\nRepresentar a empresa em eventos e feiras do setor, promovendo a marca e ampliando o networking.\nElaborar relatórios gerenciais com indicadores de desempenho, apresentando os resultados e as análises para a diretoria.\nAssegurar o cumprimento das políticas e procedimentos internos, garantindo a conformidade legal e ética das atividades comerciais.	\N	CEO	2		\N		'Liderança', 'Visão estratégica', 'Negociação', 'Comunicação', 'Orientação para resultados', 'Gestão de pessoas', 'Análise de mercado', 'Planejamento', 'Prospecção de clientes', 'Foco no cliente'	\N	\N	16	\N	\N	24	5	19	\N	6	\N	1	136	100	1	\N	29		t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	43	
54	DIRETOR COMERCIAL MATRIZ6		Liderar e otimizar as estratégias comerciais da Matriz6, assegurando o alcance de metas e o crescimento sustentável no setor de transporte, através da gestão eficaz da equipe e do desenvolvimento de novos negócios.	Desenvolver e implementar estratégias comerciais alinhadas aos objetivos da Matriz6.\nMonitorar e analisar o desempenho das vendas, identificando oportunidades de melhoria e crescimento.\nGerenciar a equipe comercial, promovendo o desenvolvimento de habilidades e a alta performance.\nProspectar e negociar com clientes estratégicos, fortalecendo o relacionamento e a fidelização.\nElaborar e controlar o orçamento da área comercial, garantindo a eficiência na alocação de recursos.\nRepresentar a empresa em eventos e feiras do setor, promovendo a marca e o networking.\nRealizar estudos de mercado e análise da concorrência, identificando tendências e oportunidades.\nAssegurar o cumprimento das políticas e procedimentos da empresa, garantindo a ética e a conformidade.	\N	CEO	2		\N		'Liderança', 'Visão estratégica', 'Negociação', 'Gestão de equipes', 'Orientação para resultados', 'Comunicação', 'Análise de mercado', 'Planejamento estratégico'	\N	\N	16	\N	\N	24	5	19	\N	6	\N	1	136	100	1	\N	29		t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	43	
55	DIRETOR COMERCIAL FILIAL36		Liderar a estratégia comercial da Filial 36, assegurando o alcance das metas de vendas e o crescimento sustentável da empresa no setor de transporte, através da gestão eficiente da equipe e do desenvolvimento de novas oportunidades de negócio.	Desenvolver e implementar estratégias comerciais alinhadas aos objetivos da empresa.\nGerenciar a equipe de vendas, motivando e capacitando os colaboradores para o alcance de resultados.\nAnalisar o mercado e identificar oportunidades de crescimento e expansão.\nMonitorar e controlar o desempenho das vendas, propondo ações corretivas quando necessário.\nEstabelecer e manter relacionamentos estratégicos com clientes-chave.\nAssegurar o cumprimento das políticas e procedimentos da empresa.\nElaborar e acompanhar o orçamento da área comercial.\nProspectar novos clientes e mercados.\nRepresentar a empresa em eventos e feiras do setor.\nNegociar contratos e acordos comerciais.	\N	CEO	2		\N		'Liderança', 'Visão estratégica', 'Orientação para resultados', 'Negociação', 'Comunicação', 'Gestão de equipes', 'Análise de mercado', 'Planejamento', 'Organização', 'Tomada de decisão'	\N	\N	16	\N	\N	24	5	19	\N	6	\N	1	136	100	1	\N	29		t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	43	
56	DIRETOR COMERCIAL MATRIZ46		Liderar e otimizar as estratégias comerciais da empresa no setor de transporte, visando o crescimento sustentável e a maximização da receita, alinhado com os objetivos organizacionais e as melhores práticas do mercado.	Desenvolver e implementar planos estratégicos de vendas, definindo metas e indicadores de desempenho para a equipe comercial.\nAnalisar o mercado, identificar oportunidades de negócio e avaliar a concorrência, propondo ações para fortalecer a posição da empresa.\nGerenciar e motivar a equipe comercial, promovendo o desenvolvimento profissional e o alto desempenho.\nNegociar contratos e acordos comerciais com clientes estratégicos, buscando condições favoráveis para a empresa.\nMonitorar e controlar o orçamento da área comercial, garantindo a eficiência e a rentabilidade das operações.\nEstabelecer e manter relacionamentos duradouros com clientes, parceiros e fornecedores, visando a fidelização e a expansão dos negócios.\nAssegurar o cumprimento das políticas e normas internas, bem como das regulamentações do setor de transporte.\nImplementar e acompanhar a utilização de ferramentas de CRM para otimizar o processo de vendas e o relacionamento com os clientes.\nApresentar relatórios gerenciais com os resultados da área comercial, propondo melhorias e ajustes nas estratégias.	\N	CEO	2		\N		'Liderança', 'Visão estratégica', 'Negociação', 'Comunicação', 'Orientação para resultados', 'Gestão de equipes', 'Análise de mercado', 'Planejamento estratégico', 'Conhecimento do setor de transporte', 'Foco no cliente'	\N	\N	16	\N	\N	24	5	19	\N	6	\N	1	136	100	1	\N	29		t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	43	
57	DIRETOR COMERCIAL FILIAL46		Liderar as estratégias comerciais da filial, assegurando o alcance das metas de receita e o desenvolvimento de novos negócios no setor de transporte.	Estabelecer e implementar planos de ação para atingir os objetivos de vendas da filial.\nAnalisar o mercado e identificar oportunidades de crescimento e expansão da carteira de clientes.\nSupervisionar a equipe comercial, garantindo a motivação, o treinamento e o desenvolvimento profissional.\nMonitorar o desempenho individual e coletivo da equipe, propondo ações corretivas quando necessário.\nProspectar novos clientes e fortalecer o relacionamento com os clientes existentes.\nNegociar contratos e condições comerciais, buscando sempre a melhor rentabilidade para a empresa.\nElaborar relatórios gerenciais com indicadores de desempenho, apresentando resultados e propondo melhorias.\nRepresentar a empresa em eventos e feiras do setor, promovendo a marca e os serviços oferecidos.\nGarantir o cumprimento das políticas e procedimentos internos da empresa.\nColaborar com as demais áreas da empresa para garantir a excelência no atendimento ao cliente.	\N	CEO	2		\N		'Liderança', 'Visão estratégica', 'Negociação', 'Comunicação', 'Orientação para resultados', 'Gestão de equipes', 'Análise de mercado', 'Planejamento estratégico', 'Foco no cliente', 'Tomada de decisão'	\N	\N	16	\N	\N	24	5	19	\N	6	\N	1	136	100	1	\N	29		t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	43	
58	DIRETOR COMERCIAL MATRIZ256		Direcionar as estratégias comerciais da empresa, assegurando o crescimento da receita, a expansão da participação de mercado e o fortalecimento da marca no setor de transporte. Monitorar o desempenho da equipe comercial e promover o desenvolvimento de novas oportunidades de negócio.	Definir e implementar as estratégias comerciais da empresa, alinhadas aos objetivos gerais da organização.\nSupervisionar a equipe comercial, oferecendo orientação, treinamento e suporte para o alcance das metas estabelecidas.\nAnalisar o mercado e a concorrência, identificando oportunidades de crescimento e ameaças potenciais.\nGerenciar o orçamento da área comercial, controlando os custos e maximizando o retorno sobre o investimento.\nDesenvolver e manter relacionamentos estratégicos com clientes-chave e parceiros de negócio.\nMonitorar e avaliar o desempenho das vendas, propondo ações corretivas para garantir o cumprimento das metas.\nParticipar de eventos e feiras do setor, promovendo a marca da empresa e estabelecendo novos contatos.\nElaborar relatórios e apresentações sobre o desempenho da área comercial para a alta direção.\nGarantir o cumprimento das políticas e procedimentos internos da empresa, bem como as normas regulatórias do setor de transporte.\nPromover a cultura de excelência em vendas, incentivando a inovação e a busca constante por melhores resultados.	\N	CEO	2		\N		'Liderança', 'Visão estratégica', 'Orientação para resultados', 'Negociação', 'Comunicação', 'Análise de mercado', 'Gestão de pessoas', 'Planejamento', 'Organização', 'Tomada de decisão'	\N	\N	16	\N	\N	24	5	19	\N	6	\N	1	136	100	1	\N	29		t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	43	
59	DIRETOR COMERCIAL FILIAL56		Liderar e impulsionar o desempenho comercial da Filial 56, assegurando o alcance das metas e o crescimento sustentável da empresa no setor de transporte, através do desenvolvimento de estratégias eficazes e da gestão de equipes de alta performance.	Definir e implementar estratégias comerciais alinhadas aos objetivos da empresa, visando a expansão da participação de mercado na região da Filial 56.\nMonitorar e analisar o desempenho das equipes de vendas, identificando oportunidades de melhoria e implementando ações corretivas para otimizar os resultados.\nProspectar e desenvolver novos clientes, fortalecendo o relacionamento com os clientes existentes e identificando oportunidades de novos negócios.\nGerenciar o orçamento da área comercial da Filial 56, controlando os custos e garantindo a rentabilidade das operações.\nRepresentar a empresa em eventos e negociações comerciais, promovendo a imagem e os valores da organização.\nGarantir a conformidade com as políticas e procedimentos da empresa, assegurando a ética e a transparência nas práticas comerciais.\nDesenvolver e motivar a equipe comercial, oferecendo treinamento e suporte para o desenvolvimento de suas habilidades e competências.	\N	CEO	2		\N		'Visão estratégica', 'Liderança de equipes', 'Negociação', 'Comunicação', 'Orientação para resultados', 'Foco no cliente', 'Análise de mercado', 'Gestão de orçamento'	\N	\N	16	\N	\N	24	5	19	\N	6	\N	1	136	100	1	\N	29		t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	43	
60	DIRETOR COMERCIAL MATRIZ66		Supervisionar as estratégias comerciais da empresa no setor de transporte, assegurando o alcance das metas de receita e o crescimento sustentável do negócio, coordenando a equipe e otimizando os processos comerciais.	Coordenar a implementação de planos e estratégias comerciais alinhadas com os objetivos da empresa.\nAcompanhar e analisar o desempenho da equipe de vendas, identificando oportunidades de melhoria e implementando ações corretivas.\nSupervisionar a gestão de contratos e negociações comerciais, garantindo o cumprimento das políticas internas e a satisfação dos clientes.\nMonitorar o mercado e a concorrência, identificando tendências e oportunidades para o desenvolvimento de novos produtos e serviços.\nElaborar relatórios gerenciais sobre o desempenho comercial, apresentando resultados e propondo ações para otimizar a performance da área.\nGarantir o cumprimento das metas de vendas e a rentabilidade dos negócios, monitorando os indicadores de desempenho e propondo ações para melhorar os resultados.\nParticipar da definição de políticas de preços e condições de pagamento, assegurando a competitividade da empresa e a maximização da receita.	\N	CEO	2		\N		'Liderança de equipe', 'Visão estratégica', 'Negociação', 'Análise de mercado', 'Gestão de resultados', 'Comunicação', 'Orientação para o cliente'	\N	\N	16	\N	\N	24	5	19	\N	6	\N	1	136	100	1	\N	29		t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	43	
61	DIRETOR DE REC HUMANOS 1		Liderar e supervisionar a estratégia de gestão de pessoas, assegurando o alinhamento com os objetivos organizacionais e promovendo um ambiente de trabalho engajador e produtivo no setor de transporte.	Desenvolver e implementar políticas e programas de Recursos Humanos alinhados com a estratégia da empresa.\nSupervisionar os processos de recrutamento, seleção, treinamento e desenvolvimento de talentos.\nGarantir a conformidade com as leis trabalhistas e regulamentações do setor de transporte.\nGerenciar o orçamento da área de Recursos Humanos, otimizando recursos e garantindo o retorno sobre o investimento.\nLiderar a equipe de RH, promovendo o desenvolvimento profissional e o alto desempenho.\nImplementar e monitorar programas de avaliação de desempenho, feedback e reconhecimento.\nPromover a cultura organizacional, incentivando a comunicação transparente e o trabalho em equipe.\nGerenciar as relações sindicais, buscando soluções de conflitos e acordos que beneficiem ambas as partes.\nAnalisar e propor melhorias nos processos de RH, visando a eficiência e a qualidade dos serviços prestados.\nAssegurar a implementação de programas de saúde e segurança no trabalho, visando o bem-estar dos colaboradores.	\N	CEO	2		\N		'Liderança estratégica', 'Visão sistêmica', 'Gestão de pessoas', 'Comunicação eficaz', 'Negociação', 'Conhecimento das leis trabalhistas', 'Orientação para resultados', 'Tomada de decisão', 'Pensamento analítico', 'Inteligência emocional'	\N	\N	16	\N	\N	24	7	19	\N	11	\N	3	136	100	1	\N	29		t	\N	\N	\N	\N	\N	13	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7	43	
62	DIRETOR COMERCIAL FILIAL369		Supervisionar as atividades comerciais da filial, garantindo o alcance das metas de vendas e a satisfação dos clientes, em conformidade com as estratégias da empresa.	Supervisionar a equipe de vendas da filial, orientando e capacitando os colaboradores para o alcance dos resultados.\nAcompanhar os indicadores de desempenho da filial, identificando oportunidades de melhoria e implementando ações corretivas.\nGerenciar o relacionamento com os clientes estratégicos da filial, buscando a fidelização e o desenvolvimento de novos negócios.\nMonitorar o mercado e a concorrência, identificando tendências e oportunidades para o crescimento da filial.\nGarantir o cumprimento das políticas e procedimentos comerciais da empresa na filial.\nElaborar relatórios gerenciais sobre o desempenho da filial, apresentando os resultados para a diretoria.	\N	CEO	2		\N		'Liderança de Equipes', 'Visão Estratégica', 'Orientação para Resultados', 'Negociação', 'Comunicação', 'Foco no Cliente', 'Planejamento e Organização', 'Conhecimento do Setor de Transporte', 'Gestão de Pessoas'	\N	\N	16	\N	\N	24	5	19	\N	6	\N	1	136	100	1	\N	29		t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	43	
63	DIRETOR COMERCIAL MATRIZ469		Liderar a estratégia comercial da empresa no setor de transporte, supervisionando a execução dos planos de vendas e buscando o crescimento da participação de mercado.	Supervisionar a equipe de vendas, orientando e desenvolvendo os colaboradores.\nMonitorar o desempenho das vendas, analisando os resultados e propondo ações de melhoria.\nImplementar estratégias de prospecção de novos clientes e fidelização dos clientes existentes.\nAnalisar as tendências do mercado e identificar oportunidades de negócio.\nGerenciar o orçamento da área comercial, controlando os custos e maximizando o retorno sobre o investimento.\nNegociar contratos com clientes estratégicos, buscando as melhores condições para a empresa.\nGarantir o cumprimento das metas de vendas estabelecidas pela diretoria.\nRepresentar a empresa em eventos e feiras do setor, promovendo a marca e os produtos/serviços.\nColaborar com as demais áreas da empresa para garantir a integração das estratégias e o alcance dos objetivos organizacionais.	\N	CEO	2		\N		'Liderança', 'Visão estratégica', 'Negociação', 'Comunicação', 'Orientação para resultados', 'Análise de mercado', 'Gestão de equipes', 'Planejamento', 'Organização'	\N	\N	16	\N	\N	24	5	19	\N	6	\N	1	136	100	1	\N	29		t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	43	
64	DIRETOR COMERCIAL FILIAL469		Supervisionar e coordenar as atividades comerciais da filial, visando atingir as metas estabelecidas e garantir a satisfação dos clientes no setor de transporte.	Supervisionar o desempenho da equipe de vendas e representantes comerciais.\nImplementar e monitorar estratégias de vendas para atingir os objetivos da filial.\nAnalisar o mercado e identificar oportunidades de negócio.\nGarantir a qualidade do atendimento e a satisfação dos clientes.\nElaborar relatórios de desempenho e apresentar resultados à diretoria.\nCoordenar ações de marketing e promoção de vendas.\nAssegurar o cumprimento das políticas e procedimentos da empresa.\nAcompanhar o desenvolvimento de novos produtos e serviços.\nProspectar novos clientes e parceiros estratégicos.\nNegociar contratos e acordos comerciais.	\N	CEO	2		\N		'Liderança de equipe', 'Visão estratégica', 'Orientação para resultados', 'Negociação', 'Comunicação eficaz', 'Análise de mercado', 'Gestão de clientes', 'Planejamento e organização', 'Tomada de decisão', 'Conhecimento do setor de transporte'	\N	\N	16	\N	\N	24	5	19	\N	6	\N	1	136	100	1	\N	29		t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	43	
65	DIRETOR COMERCIAL MATRIZ2569		Liderar as estratégias comerciais da empresa no setor de transporte, assegurando o alcance das metas de receita, expansão de mercado e satisfação do cliente, por meio do desenvolvimento de planos de negócios inovadores, da gestão de equipes de alta performance e da otimização contínua dos processos de vendas.	Definir e implementar a estratégia comercial da empresa, alinhada aos objetivos de crescimento e rentabilidade.\nGerenciar e desenvolver a equipe comercial, promovendo um ambiente de alta performance e excelência no atendimento ao cliente.\nAnalisar o mercado e a concorrência, identificando oportunidades de novos negócios e tendências do setor de transporte.\nDesenvolver e implementar planos de ação para o alcance das metas de vendas, incluindo a definição de targets, indicadores de desempenho e estratégias de pricing.\nProspectar e negociar com clientes estratégicos, visando a expansão da carteira e o aumento da receita.\nMonitorar e analisar os resultados de vendas, identificando desvios e propondo ações corretivas.\nGarantir a qualidade dos serviços prestados aos clientes, assegurando a sua satisfação e fidelização.\nRepresentar a empresa em eventos e feiras do setor, fortalecendo a imagem e o relacionamento com o mercado.\nGerenciar o orçamento da área comercial, otimizando os recursos e garantindo o retorno sobre o investimento.\nAssegurar o cumprimento das normas e regulamentos do setor de transporte, bem como das políticas internas da empresa.	\N	CEO	2		\N		'Visão estratégica', 'Liderança de equipes', 'Negociação', 'Orientação para resultados', 'Foco no cliente', 'Análise de mercado', 'Comunicação', 'Gestão de projetos', 'Pensamento analítico', 'Inovação'	\N	\N	16	\N	\N	24	5	19	\N	11	\N	3	136	100	1	\N	29		t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	43	
66	COORDENADOR DE REC HUMANOS 1		Coordenar as atividades de Recursos Humanos, assegurando a implementação de políticas e práticas eficazes para atrair, desenvolver e reter talentos, alinhadas com as estratégias de negócio da empresa no setor de transporte.	Liderar e orientar a equipe de Recursos Humanos, promovendo um ambiente de trabalho colaborativo e de alto desempenho.\nImplementar e monitorar as políticas de recrutamento e seleção, garantindo a atração de profissionais qualificados para as diversas áreas da empresa.\nCoordenar os programas de treinamento e desenvolvimento, visando o aprimoramento contínuo das competências dos colaboradores.\nAdministrar os processos de avaliação de desempenho, identificando oportunidades de melhoria e reconhecendo o desempenho de destaque.\nGerenciar os processos de folha de pagamento, benefícios e administração de pessoal, assegurando a conformidade com a legislação trabalhista.\nDesenvolver e implementar estratégias de comunicação interna, promovendo o engajamento dos colaboradores com os objetivos da empresa.\nMonitorar os indicadores de RH, analisando dados e propondo ações para otimizar os resultados da área.\nAtuar como consultor interno, fornecendo suporte e orientação aos gestores em questões relacionadas a Recursos Humanos.	\N	CEO	2		\N		'Liderança de Equipes', 'Gestão de Pessoas', 'Comunicação', 'Negociação', 'Visão Estratégica', 'Orientação para Resultados', 'Conhecimento da Legislação Trabalhista', 'Resolução de Problemas'	\N	\N	16	\N	\N	24	5	19	\N	11	\N	3	136	100	1	\N	29		t	\N	\N	\N	\N	\N	13	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	43	
67	DIRETOR COMERCIAL MATRIZ669		Supervisionar as estratégias comerciais da empresa no setor de transporte, garantindo o alcance das metas estabelecidas e a otimização dos resultados.	Acompanhar o desempenho da equipe comercial, identificando oportunidades de melhoria e implementando ações corretivas.\nSupervisionar o desenvolvimento de planos de ação para atingir os objetivos de vendas e participação de mercado.\nAnalisar relatórios de vendas e indicadores de desempenho, propondo soluções para otimizar os resultados.\nAssegurar o cumprimento das políticas e procedimentos comerciais da empresa.\nContribuir para a elaboração do orçamento anual da área comercial.\nAcompanhar as tendências do mercado de transporte, identificando oportunidades de novos negócios.\nSupervisionar a negociação de contratos e acordos comerciais com clientes estratégicos.\nAvaliar a satisfação dos clientes, propondo ações para fidelização e melhoria do relacionamento.	\N	CEO	2		\N		'Liderança de equipe', 'Visão estratégica', 'Orientação para resultados', 'Negociação', 'Análise de mercado', 'Comunicação', 'Planejamento', 'Gestão de tempo'	\N	\N	16	\N	\N	24	5	19	\N	6	\N	1	136	100	1	\N	29		t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	43	
71	DIRETOR DE REC HUMANOS 2		Liderar a estratégia de Recursos Humanos da organização, assegurando o alinhamento com os objetivos de negócio no setor de transporte, promovendo um ambiente de trabalho engajador e de alta performance, e garantindo a atração, desenvolvimento e retenção de talentos.	Definir e implementar a estratégia de RH, alinhada com os objetivos de negócio da empresa no setor de transporte.\nSupervisionar a gestão de desempenho, programas de treinamento e desenvolvimento, políticas de remuneração e benefícios.\nAssegurar a conformidade com as leis trabalhistas e regulamentações do setor de transporte.\nLiderar a equipe de RH, promovendo um ambiente de trabalho colaborativo e de alto desempenho.\nGerenciar o orçamento de RH, garantindo a alocação eficiente de recursos.\nConduzir negociações com sindicatos e representantes dos trabalhadores.\nMonitorar e analisar indicadores de RH, propondo ações de melhoria contínua.\nImplementar programas de diversidade e inclusão, promovendo um ambiente de trabalho equitativo.\nCoordenar processos de recrutamento e seleção para cargos estratégicos na organização.\nAvaliar e implementar tecnologias e ferramentas de RH para otimizar processos e melhorar a experiência do colaborador.	\N	CEO	2		\N		'Visão estratégica', 'Liderança de equipes', 'Negociação', 'Comunicação eficaz', 'Gestão de conflitos', 'Conhecimento das leis trabalhistas', 'Experiência em gestão de RH no setor de transporte', 'Habilidade em gestão orçamentária', 'Foco em resultados', 'Orientação para o cliente interno'	\N	\N	16	\N	\N	24	7	19	\N	11	\N	3	136	100	1	\N	29		t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7	43	
72	DIRETOR COMERCIAL FILIAL569		Liderar e otimizar as estratégias comerciais da Filial 569, assegurando o alcance das metas de receita e a expansão da participação de mercado no setor de transporte, através da gestão eficaz da equipe e do desenvolvimento de novos negócios.	Supervisionar a elaboração e implementação do plano estratégico comercial da filial, alinhado com os objetivos da organização.\nGerenciar a equipe de vendas, incluindo recrutamento, treinamento e acompanhamento de desempenho, visando o cumprimento das metas estabelecidas.\nAnalisar o mercado e a concorrência, identificando oportunidades de crescimento e propondo ações para fortalecer a posição da empresa.\nMonitorar os indicadores de performance da filial, como volume de vendas, receita e margem de lucro, implementando ações corretivas quando necessário.\nNegociar contratos e acordos comerciais com clientes estratégicos, buscando maximizar o valor para a empresa.\nGarantir a satisfação dos clientes, através do acompanhamento constante e da resolução de eventuais problemas.\nRepresentar a empresa em eventos e feiras do setor, promovendo a marca e buscando novas oportunidades de negócio.\nAssegurar o cumprimento das políticas e procedimentos internos, bem como as normas regulatórias do setor de transporte.	\N	CEO	2		\N		'Liderança', 'Visão estratégica', 'Negociação', 'Comunicação', 'Orientação para resultados', 'Gestão de equipes', 'Análise de mercado', 'Tomada de decisão', 'Foco no cliente'	\N	\N	16	\N	\N	24	5	19	\N	6	\N	1	136	100	1	\N	29		t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	43	
73	DIRETOR COMERCIAL MATRIZ39		Supervisionar e coordenar as atividades da equipe comercial, assegurando o cumprimento das metas e o desenvolvimento de estratégias eficazes para expansão e consolidação da participação de mercado da empresa no setor de transporte.	Supervisionar a implementação de planos e estratégias comerciais alinhados com os objetivos da empresa.\nCoordenar a equipe comercial, distribuindo tarefas, monitorando o desempenho e fornecendo o suporte necessário.\nAnalisar o mercado, identificando tendências, oportunidades e ameaças, e propor ações para otimizar os resultados.\nMonitorar os indicadores de desempenho da área comercial, elaborando relatórios e apresentando os resultados à diretoria.\nParticipar do desenvolvimento de novos produtos e serviços, fornecendo informações sobre as necessidades e expectativas dos clientes.\nAssegurar a qualidade do atendimento aos clientes, garantindo a satisfação e a fidelização.\nGarantir o cumprimento das políticas e procedimentos da empresa na área comercial.\nProspectar novos clientes e mercados, buscando oportunidades de expansão dos negócios.	\N	CEO	2		\N		'Liderança', 'Visão estratégica', 'Orientação para resultados', 'Negociação', 'Comunicação', 'Gestão de equipes', 'Análise de mercado', 'Planejamento comercial'	\N	\N	16	\N	\N	24	5	19	\N	6	\N	1	136	100	1	\N	29		t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	43	
78	DIRETOR COMERCIAL FILIAL59		Liderar a estratégia comercial da Filial 59, assegurando o alcance das metas de vendas, a expansão da carteira de clientes e o posicionamento da empresa no setor de transporte, otimizando a performance da equipe comercial sob sua supervisão.	Implementar e monitorar as estratégias comerciais da Filial 59, alinhadas com as diretrizes da empresa.\nSupervisionar e orientar a equipe comercial, garantindo o cumprimento das metas de vendas e a excelência no atendimento aos clientes.\nAnalisar o mercado e a concorrência, identificando oportunidades de negócios e propondo ações para aumentar a participação da empresa no setor de transporte.\nGerenciar o relacionamento com os principais clientes, buscando a fidelização e a expansão dos negócios.\nElaborar e acompanhar o orçamento da área comercial, controlando os custos e otimizando os recursos.\nApresentar relatórios gerenciais sobre o desempenho da área comercial, identificando os pontos fortes e as oportunidades de melhoria.\nAssegurar o cumprimento das normas e procedimentos da empresa, garantindo a qualidade dos serviços prestados.	\N	CEO	2		\N		'Liderança', 'Visão estratégica', 'Orientação para resultados', 'Negociação', 'Comunicação', 'Gestão de equipes', 'Análise de mercado', 'Planejamento comercial'	\N	\N	16	\N	\N	24	5	19	\N	6	\N	1	136	100	1	\N	29		t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	43	
79	DIRETOR COMERCIAL MATRIZ69		Liderar e coordenar as estratégias comerciais da empresa no setor de transporte, visando o crescimento da receita, a expansão da carteira de clientes e o fortalecimento da marca no mercado.	Definir e implementar as diretrizes comerciais da empresa, alinhadas aos objetivos estratégicos.\nGerenciar a equipe de vendas, estabelecendo metas, acompanhando o desempenho e promovendo o desenvolvimento profissional.\nProspectar e desenvolver novos clientes e mercados, identificando oportunidades de negócios e elaborando propostas comerciais.\nMonitorar o mercado e a concorrência, analisando tendências e identificando oportunidades de melhoria.\nNegociar contratos e acordos comerciais, garantindo a rentabilidade e a satisfação dos clientes.\nElaborar e gerenciar o orçamento da área comercial, controlando os custos e otimizando os investimentos.\nRepresentar a empresa em eventos e feiras do setor, promovendo a marca e fortalecendo o relacionamento com os clientes e parceiros.\nAssegurar o cumprimento das políticas e procedimentos da empresa, garantindo a qualidade dos serviços e a segurança das operações.	\N	CEO	2		\N		'Visão estratégica', 'Liderança de equipes', 'Negociação', 'Orientação para resultados', 'Comunicação', 'Análise de mercado', 'Planejamento e organização', 'Foco no cliente', 'Inovação', 'Resiliência'	\N	\N	16	\N	\N	24	5	19	\N	6	\N	1	136	100	1	\N	29		t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	43	
84	DIRETOR DE REC HUMANOS 3		Liderar e otimizar as estratégias de Recursos Humanos, assegurando o alinhamento com os objetivos organizacionais no setor de transporte, promovendo um ambiente de trabalho engajador, desenvolvimento contínuo e excelência na gestão de pessoas.	Definir e implementar políticas e programas de RH alinhados com a estratégia da empresa.\nSupervisionar e otimizar os processos de recrutamento, seleção, treinamento e desenvolvimento de talentos.\nGerenciar o orçamento da área de RH, garantindo a eficiência e o retorno sobre o investimento.\nAssegurar a conformidade com a legislação trabalhista e as normas internas da empresa.\nLiderar a equipe de RH, promovendo o desenvolvimento profissional e o alto desempenho.\nConduzir negociações sindicais e gerenciar as relações trabalhistas.\nImplementar e monitorar indicadores de desempenho de RH, propondo ações de melhoria contínua.\nPromover a cultura organizacional e o engajamento dos colaboradores.\nGerenciar programas de remuneração e benefícios, assegurando a competitividade e a equidade interna.\nCoordenar projetos de gestão de mudanças e transformação organizacional.	\N	CEO	2		\N		'Visão estratégica', 'Liderança', 'Gestão de pessoas', 'Comunicação', 'Negociação', 'Tomada de decisão', 'Orientação para resultados', 'Conhecimento da legislação trabalhista', 'Gestão de orçamento', 'Inovação'	\N	\N	16	\N	\N	24	7	19	\N	11	\N	3	136	100	1	\N	29		t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7	43	
91	COORDENADOR DE REC HUMANOS 4		Liderar e coordenar as estratégias e operações de Recursos Humanos, assegurando o alinhamento com os objetivos organizacionais e a legislação trabalhista, visando um ambiente de trabalho produtivo e engajador no setor de transporte.	Desenvolver e implementar políticas e programas de RH, abrangendo recrutamento e seleção, treinamento e desenvolvimento, gestão de desempenho, remuneração e benefícios.\nSupervisionar os processos de administração de pessoal, folha de pagamento, encargos sociais e relações trabalhistas, garantindo a conformidade legal e a eficiência operacional.\nCoordenar projetos de melhoria contínua nos processos de RH, visando a otimização de custos, a padronização de procedimentos e a modernização das práticas de gestão de pessoas.\nAtuar como consultor interno, prestando suporte técnico aos gestores e colaboradores em questões relacionadas a RH, tais como gestão de conflitos, avaliação de desempenho e desenvolvimento de carreira.\nMonitorar os indicadores de RH, analisando dados e elaborando relatórios gerenciais para subsidiar a tomada de decisões estratégicas e a identificação de oportunidades de melhoria.\nGerenciar o orçamento da área de RH, controlando os gastos e buscando alternativas para otimizar os recursos disponíveis.\nRepresentar a empresa em negociações sindicais e audiências trabalhistas, defendendo os interesses da organização e buscando soluções conciliatórias.\nAssegurar o cumprimento das normas de segurança e saúde no trabalho, promovendo a conscientização dos colaboradores e a prevenção de acidentes.	\N	CEO	2		\N		'Liderança', 'Visão estratégica', 'Gestão de projetos', 'Comunicação', 'Negociação', 'Orientação para resultados', 'Conhecimento técnico em RH', 'Legislação trabalhista', 'Visão sistêmica', 'Adaptabilidade', 'Inteligência Emocional'	\N	\N	16	\N	\N	24	5	19	\N	11	\N	3	136	100	1	\N	29		t	\N	\N	\N	\N	\N	13	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	43	
95	DIRETOR DE REC HUMANOS		Liderar e orientar as estratégias e operações de Recursos Humanos, assegurando o alinhamento com os objetivos organizacionais e promovendo um ambiente de trabalho positivo e produtivo no setor de transporte.	Supervisionar a implementação de políticas e práticas de RH, incluindo recrutamento e seleção, treinamento e desenvolvimento, gestão de desempenho e remuneração.\nGarantir a conformidade com as leis e regulamentos trabalhistas, minimizando riscos e assegurando a equidade nas relações de trabalho.\nDesenvolver e implementar programas de desenvolvimento de liderança e gestão de talentos, visando o crescimento profissional dos colaboradores.\nMonitorar e analisar indicadores de RH, identificando oportunidades de melhoria e propondo soluções para otimizar processos e resultados.\nAtuar como consultor interno para as lideranças, oferecendo suporte e orientação em questões relacionadas à gestão de pessoas e clima organizacional.\nConduzir negociações com sindicatos e representantes dos trabalhadores, buscando acordos que promovam a harmonia e o bem-estar no ambiente de trabalho.\nGerenciar o orçamento da área de RH, controlando os custos e garantindo o uso eficiente dos recursos disponíveis.\nPromover a cultura de segurança e saúde no trabalho, implementando programas de prevenção de acidentes e doenças ocupacionais.	\N	CEO	2		\N		'Liderança', 'Visão estratégica', 'Comunicação', 'Negociação', 'Gestão de pessoas', 'Orientação para resultados', 'Conhecimento técnico em RH', 'Pensamento analítico'	\N	\N	16	\N	\N	24	5	19	\N	6	\N	1	136	100	1	\N	29		t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	43	
96	COORDENADOR DE REC HUMANOS 3		Liderar e desenvolver as estratégias de Recursos Humanos, assegurando o alinhamento com os objetivos organizacionais e a legislação trabalhista, promovendo um ambiente de trabalho positivo e produtivo no setor de transporte.	Coordenar os processos de recrutamento e seleção, garantindo a atração de talentos qualificados para a organização.\nImplementar e monitorar programas de treinamento e desenvolvimento, visando o aprimoramento contínuo das competências dos colaboradores.\nGerenciar o sistema de avaliação de desempenho, identificando oportunidades de melhoria e reconhecendo o desempenho de excelência.\nAssegurar o cumprimento das políticas de remuneração e benefícios, garantindo a equidade e a competitividade no mercado.\nSupervisionar as atividades de administração de pessoal, assegurando o cumprimento da legislação trabalhista e as normas internas.\nConduzir negociações sindicais e representar a empresa em questões trabalhistas, buscando soluções que atendam aos interesses de ambas as partes.\nDesenvolver e implementar programas de qualidade de vida e bem-estar no trabalho, promovendo um ambiente saudável e motivador.	\N	CEO	2		\N		'Liderança', 'Visão estratégica', 'Negociação', 'Comunicação', 'Gestão de equipes', 'Conhecimento da legislação trabalhista', 'Orientação para resultados'	\N	\N	16	\N	\N	24	5	19	\N	11	\N	3	136	100	1	\N	29		t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	43	
97	COORDENADOR DE TECNOLOGIA	\N	Coordenar a estratégia de tecnologia da informação, garantindo a segurança dos dados e a eficiência dos sistemas para suportar as operações do setor de transporte.	Planejar e implementar políticas de segurança da informação, assegurando a proteção dos dados da empresa.\r\nCoordenar a equipe de suporte técnico, garantindo a resolução de incidentes e a manutenção dos sistemas.\r\nGerenciar projetos de tecnologia, desde a definição de escopo até a implementação e acompanhamento.\r\nMonitorar e avaliar o desempenho dos sistemas, propondo melhorias para otimizar a infraestrutura de TI.\r\nColaborar com outras áreas da empresa para identificar necessidades e propor soluções tecnológicas inovadoras.\r\nGarantir a conformidade com as normas e regulamentações do setor de transporte e segurança da informação.	1	CEO	2	TECNICO DE SUPORTE	\N		Liderança de equipe, Visão estratégica, Gerenciamento de projetos, Conhecimento em segurança da informação, Comunicação eficaz, Resolução de problemas, Conhecimento em infraestrutura de TI, Orientação para resultados, Adaptabilidade	\N	\N	15	\N	1	23	5	23	\N	11	\N	3	177	100	2	\N	29	\N	t	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	43	SEGURANCA DA INFORMAÇÃO
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: cristiano
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
3230	2025-02-28 16:34:42.809631-03	29	Cristiano Fonseca de Castro	2	[{"changed": {"fields": ["Nome", "Tipo de Usu\\u00e1rio", "Tenants"]}}]	6	29
3231	2025-02-28 16:35:15.490078-03	17	Pcline Computadores LTDA	2	[{"changed": {"fields": ["Endere\\u00e7o", "N\\u00famero", "Estado", "Faturamento Bruto"]}}]	24	29
3232	2025-11-03 15:06:09.090168-03	27	teste id	1	[{"added": {}}]	15	29
3233	2025-11-03 15:09:31.620838-03	48	teste id	1	[{"added": {}}]	9	29
3234	2025-11-03 15:21:35.243608-03	2	Italiano	1	[{"added": {}}]	13	29
3235	2025-11-17 18:22:26.787547-03	29	Cristiano Fonseca de Castro	2	[{"changed": {"fields": ["Tipo de Usu\\u00e1rio"]}}]	6	29
3236	2025-11-17 18:23:56.107345-03	29	Cristiano Fonseca de Castro	2	[{"changed": {"fields": ["Tipo de Usu\\u00e1rio"]}}]	6	29
3237	2026-04-14 15:20:16.442452-03	1	Plano 1	1	[{"added": {}}]	8	29
3238	2026-04-14 15:21:42.639799-03	2	Plano 2	1	[{"added": {}}]	8	29
3239	2026-04-14 16:01:53.708824-03	1	Plano 1	2	[{"changed": {"fields": ["Descri\\u00e7\\u00e3o", "Qtde Avalia\\u00e7\\u00f5es"]}}]	8	29
3240	2026-04-14 16:02:13.391202-03	2	Plano 2	2	[{"changed": {"fields": ["Descri\\u00e7\\u00e3o", "Qtde Avalia\\u00e7\\u00f5es"]}}]	8	29
3241	2026-04-14 16:03:01.608265-03	2	Pcline Computadores TEste	2	[{"changed": {"fields": ["Plano"]}}]	24	29
3242	2026-04-14 16:03:12.04117-03	1	ClIENTE SB ACS2	2	[{"changed": {"fields": ["Plano"]}}]	24	29
3243	2026-04-22 21:56:16.661024-03	1	Plano 1	2	[{"changed": {"fields": ["Percentual"]}}]	8	29
3244	2026-04-28 09:30:59.355809-03	1	Plano 1	1	[{"added": {}}]	43	29
3245	2026-04-28 09:31:15.576248-03	17	Pcline Computadores LTDA	2	[{"changed": {"fields": ["Plano Avalia\\u00e7\\u00e3o"]}}]	24	29
3246	2026-04-28 19:21:50.593028-03	1	Plano 1	2	[{"changed": {"fields": ["Qtde Descri\\u00e7\\u00f5es"]}}]	8	29
3247	2026-04-28 19:22:10.035158-03	1	Plano 1	2	[]	43	29
3248	2026-04-29 21:41:17.137001-03	1	Plano 1	2	[{"changed": {"fields": ["Qtde Descri\\u00e7\\u00f5es"]}}]	8	29
3249	2026-04-30 08:59:20.318944-03	1	Plano 1	2	[{"changed": {"fields": ["Descri\\u00e7\\u00e3o"]}}]	8	29
3250	2026-04-30 08:59:55.436141-03	1	Plano até 25	2	[{"changed": {"fields": ["Nome*", "Descri\\u00e7\\u00e3o", "Qtde Descri\\u00e7\\u00f5es"]}}]	8	29
3251	2026-04-30 09:06:43.158306-03	1	Plano até 25	2	[{"changed": {"fields": ["Qtde Descri\\u00e7\\u00f5es"]}}]	8	29
3252	2026-04-30 09:07:12.831997-03	1	Plano 1	2	[]	43	29
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: cristiano
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	user_account	customuser
7	person	person
8	admin_geral	plans
9	admin_geral	sector
10	admin_descricao	areas
11	admin_descricao	formacao
12	admin_descricao	habilitacoes
13	admin_descricao	idiomas
14	admin_avaliacao	grades
15	admin_avaliacao	familias
16	admin_avaliacao	subfamilias
17	admin_avaliacao	niveis
18	admin_avaliacao	fatores
19	admin_avaliacao	matrizes
20	admin_descricao	descricoes
21	admin_descricao	especializacoes
22	admin_descricao	experiencias
23	cpf_field	mymodel
24	tenants	tenant
25	master	diretoria
26	master	area
27	descricao	descricao
28	avaliacao	avaliacao
29	admin_geral	nivelcargo
30	admin_descricao	status
31	admin_geral	dimensao
32	admin_geral	governanca
33	admin_geral	origemcapital
34	admin_geral	tipoempresa
35	admin_descricao	gerencia
36	avaliacao	superior
37	admin_geral	core
38	admin_descricao	proficiencias
39	admin_descricao	areasespecializacoes
40	admin_avaliacao	conhecimentos
41	admin_avaliacao	combinacoes
42	admin_descricao	niveis
43	admin_geral	plansavaliacao
44	background_task	completedtask
45	background_task	task
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: cristiano
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-02-17 11:04:35.012412-03
2	contenttypes	0002_remove_content_type_name	2021-02-17 11:04:35.032474-03
3	auth	0001_initial	2021-02-17 11:04:35.105553-03
4	auth	0002_alter_permission_name_max_length	2021-02-17 11:04:35.157214-03
5	auth	0003_alter_user_email_max_length	2021-02-17 11:04:35.174552-03
6	auth	0004_alter_user_username_opts	2021-02-17 11:04:35.226173-03
7	auth	0005_alter_user_last_login_null	2021-02-17 11:04:35.235482-03
8	auth	0006_require_contenttypes_0002	2021-02-17 11:04:35.246-03
9	auth	0007_alter_validators_add_error_messages	2021-02-17 11:04:35.279008-03
10	auth	0008_alter_user_username_max_length	2021-02-17 11:04:35.302725-03
11	auth	0009_alter_user_last_name_max_length	2021-02-17 11:04:35.314401-03
12	auth	0010_alter_group_name_max_length	2021-02-17 11:04:35.333376-03
13	auth	0011_update_proxy_permissions	2021-02-17 11:04:35.345742-03
14	auth	0012_alter_user_first_name_max_length	2021-02-17 11:04:35.379476-03
15	user_account	0001_initial	2021-02-17 11:04:35.447281-03
16	admin	0001_initial	2021-02-17 11:04:35.538989-03
17	admin	0002_logentry_remove_auto_add	2021-02-17 11:04:35.588491-03
18	admin	0003_logentry_add_action_flag_choices	2021-02-17 11:04:35.610743-03
19	sessions	0001_initial	2021-02-17 11:04:35.631129-03
20	user_account	0002_auto_20210217_1125	2021-02-17 11:26:20.154342-03
21	person	0001_initial	2021-03-07 11:24:34.907188-03
22	user_account	0003_customuser_person	2021-03-07 11:24:34.940878-03
23	person	0002_person_address	2021-03-25 16:02:44.597481-03
24	admin_geral	0001_initial	2021-03-31 21:02:37.706269-03
25	admin_descricao	0001_initial	2021-03-31 21:25:47.065259-03
26	admin_avaliacao	0001_initial	2021-03-31 21:52:21.738911-03
27	admin_avaliacao	0002_auto_20210402_1139	2021-04-02 11:39:57.416237-03
28	admin_avaliacao	0003_auto_20210402_1145	2021-04-02 11:45:30.096687-03
29	admin_descricao	0002_descricoes_especializacoes_experiencias	2021-04-02 12:46:18.151595-03
30	admin_descricao	0003_auto_20210402_1904	2021-04-02 19:04:56.638911-03
31	person	0002_auto_20210429_2107	2021-04-29 21:22:54.912633-03
32	person	0003_person_address	2021-04-29 21:27:16.232942-03
33	person	0004_auto_20210505_1937	2021-05-05 19:37:34.239719-03
34	tenants	0001_initial	2021-06-19 19:44:18.141545-03
35	person	0005_auto_20210619_1941	2021-06-19 19:44:18.335275-03
36	user_account	0004_customuser_tenants	2021-06-19 19:44:18.403409-03
37	user_account	0005_customuser_default_tenant	2021-06-20 00:57:13.954511-03
38	user_account	0006_alter_customuser_default_tenant	2021-06-20 06:47:58.997075-03
39	user_account	0007_alter_customuser_default_tenant	2021-06-20 18:15:37.520441-03
40	master	0001_initial	2021-06-21 20:25:28.604897-03
41	user_account	0008_alter_customuser_default_tenant	2021-06-21 20:25:28.662243-03
42	master	0002_area	2021-06-23 16:09:37.091768-03
43	user_account	0009_alter_customuser_default_tenant	2021-06-23 18:15:18.966442-03
44	user_account	0010_alter_customuser_default_tenant	2021-06-23 18:26:54.463269-03
45	user_account	0011_alter_customuser_default_tenant	2021-06-23 18:33:56.752098-03
46	user_account	0012_alter_customuser_default_tenant	2021-06-23 18:45:25.574218-03
47	master	0003_alter_area_name	2021-07-05 10:01:41.939386-03
48	tenants	0002_auto_20210705_1001	2021-07-05 10:01:42.310763-03
49	user_account	0013_alter_customuser_default_tenant	2021-07-05 10:01:42.331186-03
50	admin_descricao	0004_auto_20210708_1547	2021-07-08 16:03:30.753212-03
51	tenants	0003_auto_20210708_1547	2021-07-08 16:03:30.926944-03
52	descricao	0001_initial	2021-07-08 16:03:31.255389-03
53	descricao	0002_auto_20210712_1912	2021-07-12 19:12:24.082957-03
54	descricao	0003_alter_descricao_areas	2021-07-12 19:16:29.787857-03
55	descricao	0004_auto_20210712_1931	2021-07-12 19:31:15.739365-03
56	descricao	0005_auto_20210712_2018	2021-07-12 20:19:00.22064-03
57	descricao	0006_auto_20210723_1029	2021-07-23 10:29:23.368259-03
58	descricao	0007_auto_20210723_1117	2021-07-23 11:17:34.931402-03
59	descricao	0008_auto_20210726_2008	2021-07-26 20:08:27.309723-03
60	admin_avaliacao	0004_niveis_factor	2021-08-10 18:36:26.136084-03
61	admin_avaliacao	0005_auto_20210824_2010	2021-08-24 20:10:57.835161-03
62	admin_descricao	0005_auto_20210824_2010	2021-08-24 20:10:58.108177-03
63	avaliacao	0001_initial	2021-08-24 20:10:58.315753-03
64	admin_avaliacao	0006_auto_20210825_1048	2021-08-25 10:48:47.390087-03
65	admin_descricao	0006_auto_20210825_1048	2021-08-25 10:48:47.785142-03
66	admin_geral	0002_auto_20210825_1048	2021-08-25 10:48:47.904831-03
67	admin_geral	0003_nivelcargo	2021-08-25 19:30:43.519158-03
68	user_account	0014_customuser_kind	2021-08-25 20:03:42.745767-03
69	master	0004_auto_20210825_2028	2021-08-25 20:28:40.014602-03
70	user_account	0015_alter_customuser_kind	2021-08-25 20:28:40.046515-03
71	admin_avaliacao	0007_auto_20210915_1117	2021-09-15 11:18:24.04454-03
72	master	0005_auto_20210915_1117	2021-09-15 11:18:24.094441-03
73	tenants	0004_auto_20210915_1117	2021-09-15 11:18:24.195532-03
74	admin_avaliacao	0008_auto_20211004_1617	2021-10-04 16:17:54.375323-03
75	admin_descricao	0007_status	2021-10-04 16:17:54.537783-03
76	descricao	0009_alter_descricao_status	2021-10-04 16:29:31.147514-03
77	admin_geral	0004_dimensao_governanca_origemcapital_tipoempresa	2021-10-26 09:02:35.928338-03
78	admin_descricao	0008_gerencia	2021-10-27 12:41:43.585772-03
79	admin_geral	0005_auto_20211027_1241	2021-10-27 12:41:43.605445-03
80	descricao	0010_alter_descricao_manage_team	2021-10-27 12:41:43.79491-03
81	tenants	0005_auto_20211027_2018	2021-11-08 19:17:40.343973-03
82	tenants	0006_auto_20211027_2024	2021-11-08 19:17:40.542759-03
83	avaliacao	0002_auto_20211108_2039	2021-11-08 20:40:18.055907-03
84	admin_avaliacao	0009_auto_20211116_1035	2021-11-16 10:40:13.323785-03
85	admin_descricao	0009_formacao_code	2021-11-16 10:40:13.374295-03
86	avaliacao	0003_auto_20211116_1035	2021-11-16 10:40:14.862919-03
87	admin_avaliacao	0010_alter_fatores_code	2021-11-16 11:04:42.614885-03
88	admin_avaliacao	0011_auto_20211116_1108	2021-11-16 11:08:58.871692-03
89	avaliacao	0004_auto_20211118_1506	2021-11-18 15:06:36.784507-03
90	avaliacao	0005_alter_avaliacao_title_super	2021-11-26 18:42:13.883104-03
91	avaliacao	0006_alter_avaliacao_title_super	2021-12-09 17:17:19.676196-03
92	avaliacao	0007_superior	2022-01-21 15:58:04.156877-03
93	avaliacao	0008_alter_avaliacao_title_super	2022-01-21 16:08:53.391072-03
94	admin_descricao	0010_auto_20220126_1632	2022-01-26 16:32:56.761287-03
95	admin_descricao	0011_auto_20220126_1648	2022-01-26 16:48:34.560124-03
96	admin_descricao	0012_auto_20220126_1714	2022-01-26 17:14:10.165076-03
97	admin_descricao	0013_auto_20220126_1718	2022-01-26 17:18:11.201228-03
98	admin_avaliacao	0012_auto_20220127_1219	2022-01-27 12:19:16.267299-03
99	admin_descricao	0014_auto_20220127_1219	2022-01-27 12:19:16.419087-03
100	descricao	0011_alter_descricao_summary	2022-01-27 16:11:04.945574-03
101	descricao	0012_alter_descricao_responsibility	2022-01-27 16:19:59.262858-03
102	descricao	0013_auto_20220127_1719	2022-01-27 17:19:49.152305-03
103	descricao	0014_alter_descricao_qualification	2022-01-27 19:45:00.795838-03
104	descricao	0015_alter_descricao_qualification	2022-01-27 19:50:15.386912-03
105	admin_descricao	0015_alter_gerencia_name	2022-02-07 18:48:21.508693-03
106	admin_avaliacao	0013_auto_20220321_1509	2022-03-21 15:09:54.685048-03
107	admin_descricao	0016_auto_20220321_1509	2022-03-21 15:09:54.996888-03
108	avaliacao	0009_auto_20220321_1509	2022-03-21 15:09:55.223086-03
109	tenants	0007_alter_tenant_size	2022-03-21 15:09:55.26783-03
110	admin_descricao	0017_auto_20220321_1515	2022-03-21 15:15:24.338612-03
111	admin_descricao	0018_auto_20220321_1536	2022-03-21 15:36:11.429965-03
112	admin_geral	0006_auto_20220328_1906	2022-03-28 19:06:41.619984-03
113	tenants	0008_auto_20220328_1906	2022-03-28 19:19:19.245196-03
114	tenants	0009_auto_20220328_1907	2022-03-28 19:19:19.335984-03
115	tenants	0010_auto_20220328_1910	2022-03-28 19:19:19.432573-03
116	tenants	0011_auto_20220328_1911	2022-03-28 19:19:19.531049-03
117	tenants	0012_auto_20220328_1918	2022-03-28 19:19:19.63658-03
118	admin_geral	0007_core	2022-03-28 19:27:17.284606-03
119	tenants	0013_tenant_core	2022-03-28 19:37:05.239489-03
120	tenants	0014_alter_tenant_core	2022-03-28 19:37:05.293078-03
121	master	0006_auto_20220328_1949	2022-03-28 19:49:10.092838-03
122	admin_descricao	0019_auto_20220328_2004	2022-03-28 20:04:58.68501-03
123	master	0007_auto_20220328_2004	2022-03-28 20:04:58.768427-03
124	admin_avaliacao	0014_auto_20220331_1459	2022-03-31 15:00:09.642558-03
125	admin_descricao	0020_auto_20220331_1459	2022-03-31 15:00:10.229558-03
126	admin_geral	0008_auto_20220331_1459	2022-03-31 15:00:10.412772-03
127	master	0008_auto_20220331_1459	2022-03-31 15:00:10.649486-03
128	tenants	0015_alter_tenant_core	2022-03-31 15:00:10.744822-03
129	descricao	0014_alter_descricao_proficiency	2022-03-31 15:02:33.707287-03
130	descricao	0015_auto_20220331_1507	2022-03-31 15:07:57.585171-03
131	descricao	0016_auto_20220412_0804	2022-04-12 08:04:34.847035-03
132	admin_descricao	0021_auto_20220412_0813	2022-04-12 08:13:34.133546-03
133	descricao	0017_auto_20220420_1700	2022-04-20 17:00:40.83459-03
134	descricao	0018_auto_20220427_1609	2022-04-27 16:09:16.106566-03
135	descricao	0019_auto_20220427_1633	2022-04-27 16:33:54.811028-03
136	admin_descricao	0022_areasespecializacoes	2022-04-27 16:54:36.729764-03
137	descricao	0020_alter_descricao_specialization	2022-04-27 16:54:36.824245-03
138	descricao	0021_auto_20220427_1708	2022-04-27 17:11:32.009227-03
139	descricao	0022_auto_20220428_1151	2022-04-28 11:51:19.658819-03
140	descricao	0023_auto_20220428_1206	2022-04-28 12:06:39.590748-03
141	admin_descricao	0023_auto_20220509_0913	2022-05-09 09:13:54.820082-03
142	descricao	0024_auto_20220509_0913	2022-05-09 09:13:55.538965-03
143	descricao	0025_remove_descricao_qualification4	2022-05-09 09:16:32.561818-03
144	admin_descricao	0024_auto_20220509_1217	2022-05-09 12:27:22.097866-03
145	descricao	0026_auto_20220509_1217	2022-05-09 12:30:15.717001-03
146	admin_descricao	0025_descricoes_manage_team	2022-05-12 16:29:30.849481-03
147	admin_descricao	0026_alter_descricoes_manage_team	2022-05-12 18:21:45.725953-03
148	descricao	0027_auto_20220512_1821	2022-05-12 18:21:45.843576-03
149	avaliacao	0010_alter_avaliacao_ceo	2022-05-17 07:34:32.564681-03
150	descricao	0028_auto_20220517_0734	2022-05-17 07:34:32.772024-03
151	avaliacao	0011_alter_avaliacao_ceo	2022-05-17 07:36:02.640546-03
152	avaliacao	0012_auto_20220518_0821	2022-05-18 08:21:48.241961-03
153	descricao	0029_alter_descricao_position_team	2022-05-18 08:21:48.289677-03
154	admin_avaliacao	0015_conhecimentos	2022-09-12 21:00:21.466261-03
155	descricao	0030_alter_descricao_position_team	2022-09-12 21:00:21.519208-03
156	user_account	0016_alter_customuser_kind	2022-09-12 21:00:21.561055-03
157	avaliacao	0013_superior_evaluation_id	2022-09-19 19:47:46.177834-03
158	avaliacao	0014_alter_avaliacao_manage_team	2022-09-29 19:12:16.053484-03
159	admin_avaliacao	0016_combinacoes	2022-09-29 20:27:14.455988-03
160	admin_avaliacao	0017_alter_combinacoes_grade	2022-09-30 08:02:32.072941-03
161	avaliacao	0015_alter_avaliacao_grade	2022-10-03 09:51:02.046446-03
162	avaliacao	0016_alter_avaliacao_grade	2022-10-03 10:21:21.724626-03
163	admin_avaliacao	0018_alter_combinacoes_grade	2022-10-03 11:28:34.706908-03
164	avaliacao	0017_auto_20221017_2028	2022-10-17 20:28:14.707745-03
165	admin_descricao	0027_auto_20230313_1039	2023-03-13 10:40:08.45643-03
166	admin_geral	0009_alter_dimensao_options	2023-03-13 10:40:08.474276-03
167	descricao	0031_auto_20230313_1039	2023-03-13 10:40:08.713513-03
168	tenants	0016_alter_tenant_size	2023-03-13 10:40:08.837574-03
169	admin_descricao	0028_auto_20230313_1505	2023-03-13 15:05:42.342304-03
170	descricao	0032_auto_20230324_0930	2023-03-24 09:31:06.320173-03
171	admin_descricao	0029_auto_20230324_0959	2023-03-24 09:59:27.560154-03
172	admin_descricao	0030_auto_20230403_1728	2023-04-03 17:28:45.227847-03
173	admin_avaliacao	0019_auto_20230403_1905	2023-04-03 19:06:11.441038-03
174	admin_descricao	0031_auto_20230403_1905	2023-04-03 19:06:11.517251-03
175	descricao	0033_auto_20230511_1733	2023-05-11 17:33:29.923304-03
176	admin_descricao	0032_alter_formacao_options	2023-05-25 09:14:04.862806-03
177	descricao	0034_alter_descricao_experience	2023-05-25 09:27:11.287847-03
178	descricao	0035_alter_descricao_experience	2023-05-25 09:27:11.383681-03
179	admin_geral	0010_alter_dimensao_options	2023-11-13 23:34:42.657634-03
180	avaliacao	0018_auto_20231113_2334	2023-11-13 23:34:42.891343-03
181	master	0009_auto_20231113_2334	2023-11-13 23:34:42.916087-03
182	avaliacao	0019_auto_20240117_1750	2024-01-17 17:50:34.761643-03
183	descricao	0036_alter_descricao_experience	2024-01-17 17:50:34.805655-03
184	avaliacao	0020_alter_avaliacao_manage_team	2024-02-16 09:10:57.647192-03
185	admin_geral	0011_alter_dimensao_options	2024-03-05 09:24:20.524796-03
186	tenants	0017_alter_tenant_states	2024-03-05 09:24:20.573629-03
187	avaliacao	0021_avaliacao_description	2024-03-18 15:54:25.933646-03
188	avaliacao	0022_alter_avaliacao_title	2024-04-08 18:42:57.391971-03
189	avaliacao	0023_alter_avaliacao_unique_together	2024-04-08 18:52:37.188369-03
190	avaliacao	0024_alter_superior_title_alter_superior_unique_together	2024-04-09 14:29:21.620987-03
191	avaliacao	0025_alter_avaliacao_grade	2024-08-06 08:30:50.469701-03
192	descricao	0037_alter_descricao_formation	2024-08-06 08:30:50.629722-03
193	admin_descricao	0033_niveis	2025-02-21 17:20:20.385271-03
194	admin_geral	0012_alter_dimensao_options	2025-02-21 17:20:20.399583-03
195	descricao	0038_descricao_level_descricao_setor	2025-02-21 17:42:43.883745-03
196	descricao	0039_remove_descricao_setor_descricao_sector	2025-02-24 16:04:22.972882-03
197	admin_descricao	0034_alter_experiencias_options_alter_niveis_options	2025-11-17 18:42:18.267902-03
198	master	0010_alter_area_unique_together	2025-11-17 18:42:18.379649-03
199	descricao	0040_descricao_adicional	2026-03-16 16:14:32.732824-03
200	admin_geral	0013_plans_value_aval_alter_plans_value	2026-04-14 15:36:23.909655-03
201	tenants	0018_remove_tenant_core_tenant_plano	2026-04-14 15:43:03.917751-03
202	admin_geral	0014_plansavaliacao_remove_plans_value_aval	2026-04-28 09:26:44.157219-03
203	tenants	0019_tenant_planoaval_alter_tenant_plano	2026-04-28 09:29:16.883584-03
204	background_task	0001_initial	2026-05-10 20:06:08.797864-03
205	background_task	0002_auto_20170927_1109	2026-05-10 20:06:08.84506-03
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: cristiano
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
cg0av15re7t6jfdm78jo3eyrrtnkdfp2	.eJxVjMEOwiAQRP-FsyErW2TXo_d-A1kKkaqBpLQn479Lkx70NJl5M_NWXrY1-62lxc9RXdVZnX6zINMzlR3Eh5R71VMt6zIHvVf0QZsea0yv29H9O8jScl8PkiJfIuBg2VlJTlAoYgAAy4a6CCEyA7EDxhBADFhCMka6GdTnC71MNms:1lGnQW:CCnc2URFTyTJHkam6Byg54vfri0aMkoRn3FGfLe_uVo	2021-03-15 15:37:52.157553-03
jdpvflmqh6rrnufiaa3s2t5bxsujtrgl	.eJxVjEEOwiAQAP_C2RC6QAGP3vsGssAiVQNJaU_GvxuSHvQ6M5k383jsxR-dNr8mdmUg2eUXBoxPqsOkB9Z747HVfVsDHwk_bedLS_S6ne3foGAv44vKCJBmcskYckErkDNEYx0qQJdzFlrKGBShC0EQislmINBCzFZnyT5f6FQ3cQ:1ntpS7:YXFmjm7uq9-UL9D_xRTnsACbvq-IwMi8_TD206WPFOg	2022-06-08 08:45:23.863915-03
udyxfi8ixwvc5simdjgq6qa3v0hpanw1	.eJxVjMsOwiAQRf-FtSGU97h07zcQZgCpGkhKuzL-uzbpQrf3nHNfLMRtrWEbeQlzYmcm2el3w0iP3HaQ7rHdOqfe1mVGviv8oINfe8rPy-H-HdQ46rc2MaOMlDHpgtZPxoMVShZIQmkk4YwGEEoRQS4TArhiyFivpZOIHtn7A_JhN-M:1oQwNE:EjyJqqY6XgcjDTMVlxz8kyK_ZQHV14qcZID3hkhj-h4	2022-09-07 16:49:12.37147-03
tdecdf7yoqn7mrpnnwy8drn7mi18epzd	.eJxVjMsOwiAQRf-FtSG8BsGl-34DGWCQqoGktCvjv2uTLnR7zzn3xQJuaw3boCXMmV2YZKffLWJ6UNtBvmO7dZ56W5c58l3hBx186pme18P9O6g46rd2EJONUpDOxhfIGhCdUl5I5VXUUJIStniDRFJGYRwBgMhoz1orR4a9P9VPNzU:1lItI9:4lmVo8YXmcsTHVUyyX7F9X8ENEjybTbwnt43knm5APU	2021-03-21 10:17:53.886645-03
zztmcp9fo8o5zixxtizpgrbdkc4agqxj	.eJxVjMsOwiAQRf-FtSG8BsGl-34DGWCQqoGktCvjv2uTLnR7zzn3xQJuaw3boCXMmV2YZKffLWJ6UNtBvmO7dZ56W5c58l3hBx186pme18P9O6g46rd2EJONUpDOxhfIGhCdUl5I5VXUUJIStniDRFJGYRwBgMhoz1orR4a9P9VPNzU:1lSLCt:SQRCmfmxclqIZ65RLVhUbjO03pL3NmJIfSAnj7wISPw	2021-04-16 11:55:31.274892-03
qztzewf48ztmzswac7elz9fljj033kxa	.eJxVjMsOwiAQRf-FtSGU97h07zcQZgCpGkhKuzL-uzbpQrf3nHNfLMRtrWEbeQlzYmcm2el3w0iP3HaQ7rHdOqfe1mVGviv8oINfe8rPy-H-HdQ46rc2MaOMlDHpgtZPxoMVShZIQmkk4YwGEEoRQS4TArhiyFivpZOIHtn7A_JhN-M:1oQxTQ:I4Qf4xCYhOis6ztidx7H3tq1RtwhIjYu4hDDKDsoI-w	2022-09-07 17:59:40.441014-03
hdwecjuj71nhcn20xjps6f4pww032w1l	.eJxVjMsOwiAQRf-FtSGU97h07zcQZgCpGkhKuzL-uzbpQrf3nHNfLMRtrWEbeQlzYmcm2el3w0iP3HaQ7rHdOqfe1mVGviv8oINfe8rPy-H-HdQ46rc2MaOMlDHpgtZPxoMVShZIQmkk4YwGEEoRQS4TArhiyFivpZOIHtn7A_JhN-M:1oklRE:Wiqo5XQ9AAxroV54F1l1tkOHwMsk0zgFNWEMR3H0Qo4	2022-11-01 09:11:16.453422-03
tb44ai8vxuzmc5bwtbzk02vrw8stzw5k	.eJxVjMsOwiAQRf-FtSGU97h07zcQZgCpGkhKuzL-uzbpQrf3nHNfLMRtrWEbeQlzYmcm2el3w0iP3HaQ7rHdOqfe1mVGviv8oINfe8rPy-H-HdQ46rc2MaOMlDHpgtZPxoMVShZIQmkk4YwGEEoRQS4TArhiyFivpZOIHtn7A_JhN-M:1osMLn:Hkzm2g3gAQiTbSIRgM3iGwq0JP1eY8dknAmo8mZJoiA	2022-11-22 08:01:03.097336-03
etd5fl6o9bvsdctlxpacfjbwn1qi8kmg	.eJxVjMsOwiAQRf-FtSGU97h07zcQZgCpGkhKuzL-uzbpQrf3nHNfLMRtrWEbeQlzYmcm2el3w0iP3HaQ7rHdOqfe1mVGviv8oINfe8rPy-H-HdQ46rc2MaOMlDHpgtZPxoMVShZIQmkk4YwGEEoRQS4TArhiyFivpZOIHtn7A_JhN-M:1pRuVQ:-PeVnbBjMTDsp6Nxd1nevql5r5izT7dCrhs8R34Gt08	2023-02-28 09:33:56.258677-03
s1z62f341wrmh45ehnp120hfsjiwwhq8	.eJxVjMsOwiAQRf-FtSGU97h07zcQZgCpGkhKuzL-uzbpQrf3nHNfLMRtrWEbeQlzYmcm2el3w0iP3HaQ7rHdOqfe1mVGviv8oINfe8rPy-H-HdQ46rc2MaOMlDHpgtZPxoMVShZIQmkk4YwGEEoRQS4TArhiyFivpZOIHtn7A_JhN-M:1mSK7g:79S96sEbKGwcKQSwHXl-kQCOMEz7AWrQvJX3hxIHZ5U	2021-10-04 11:18:20.442437-03
orlvy9zfwk298l8602defyx1smdaosk3	.eJxVjMsOwiAQRf-FtSGU97h07zcQZgCpGkhKuzL-uzbpQrf3nHNfLMRtrWEbeQlzYmcm2el3w0iP3HaQ7rHdOqfe1mVGviv8oINfe8rPy-H-HdQ46rc2MaOMlDHpgtZPxoMVShZIQmkk4YwGEEoRQS4TArhiyFivpZOIHtn7A_JhN-M:1mSKBz:sWGxI_2ZZF1XhiB2TfmI-Z8yYKADRBrR9PUubA-lR10	2021-10-04 11:22:47.396461-03
3twhj07hm5ftodk15ajhrgibh5h8arfj	.eJxVjMsOwiAQRf-FtSGU97h07zcQZgCpGkhKuzL-uzbpQrf3nHNfLMRtrWEbeQlzYmcm2el3w0iP3HaQ7rHdOqfe1mVGviv8oINfe8rPy-H-HdQ46rc2MaOMlDHpgtZPxoMVShZIQmkk4YwGEEoRQS4TArhiyFivpZOIHtn7A_JhN-M:1mSKvn:l9JOlQ_b7Tnpl204WsTDR0yXIXnUNcpKif8f1lAqgCw	2021-10-04 12:10:07.520292-03
gjctvvrb5j96zs1eczm7s7e373karlp1	.eJxVjMsOwiAQRf-FtSGU97h07zcQZgCpGkhKuzL-uzbpQrf3nHNfLMRtrWEbeQlzYmcm2el3w0iP3HaQ7rHdOqfe1mVGviv8oINfe8rPy-H-HdQ46rc2MaOMlDHpgtZPxoMVShZIQmkk4YwGEEoRQS4TArhiyFivpZOIHtn7A_JhN-M:1pmCrT:elVsvU0Tifh1tqqZdrrjYndfD68DfVWrC7CKUeCLM_g	2023-04-25 09:12:35.255349-03
0pb2dusa6bp3ga9sxgx0tmxt6n93q2c7	.eJxVjMsOwiAQRf-FtSGU97h07zcQZgCpGkhKuzL-uzbpQrf3nHNfLMRtrWEbeQlzYmcm2el3w0iP3HaQ7rHdOqfe1mVGviv8oINfe8rPy-H-HdQ46rc2MaOMlDHpgtZPxoMVShZIQmkk4YwGEEoRQS4TArhiyFivpZOIHtn7A_JhN-M:1mdwPa:Wbixj7o7yt5UmZo_ioc3oJlRMDen1jcZeKLB6KUL87U	2021-11-05 12:24:50.508364-03
jh0rm4pxc03urx97sqr32k594jlyqinw	.eJxVjMsOwiAQRf-FtSGU97h07zcQZgCpGkhKuzL-uzbpQrf3nHNfLMRtrWEbeQlzYmcm2el3w0iP3HaQ7rHdOqfe1mVGviv8oINfe8rPy-H-HdQ46rc2MaOMlDHpgtZPxoMVShZIQmkk4YwGEEoRQS4TArhiyFivpZOIHtn7A_JhN-M:1q29G6:FJ9uOIK9cvTJknVs-_dxAIIWur64CKEXXnkJqAVpAyM	2023-06-08 08:35:54.867986-03
dzi0nyxu53gisjwjjkd4981vd1i5yrvd	.eJxVjMsOwiAQRf-FtSGU97h07zcQZgCpGkhKuzL-uzbpQrf3nHNfLMRtrWEbeQlzYmcm2el3w0iP3HaQ7rHdOqfe1mVGviv8oINfe8rPy-H-HdQ46rc2MaOMlDHpgtZPxoMVShZIQmkk4YwGEEoRQS4TArhiyFivpZOIHtn7A_JhN-M:1qxms8:KV4xRIrY8FssAyxructgz8i-82gAHsKMpabE8Eg6BfU	2023-11-14 08:25:24.6024-03
g6s6uila1ek62vxj6v4kguohihdzlasq	.eJxVjMsOwiAQRf-FtSGU97h07zcQZgCpGkhKuzL-uzbpQrf3nHNfLMRtrWEbeQlzYmcm2el3w0iP3HaQ7rHdOqfe1mVGviv8oINfe8rPy-H-HdQ46rc2MaOMlDHpgtZPxoMVShZIQmkk4YwGEEoRQS4TArhiyFivpZOIHtn7A_JhN-M:1r2ray:73gSK-gUFsD5jjTEA8VN-HhMt5YKJPKozvuhvNuJu4w	2023-11-28 08:28:40.982822-03
ikrldnwqs5pah4te6bbvbsg2jgvi0004	.eJxVjMsOwiAQRf-FtSGU97h07zcQZgCpGkhKuzL-uzbpQrf3nHNfLMRtrWEbeQlzYmcm2el3w0iP3HaQ7rHdOqfe1mVGviv8oINfe8rPy-H-HdQ46rc2MaOMlDHpgtZPxoMVShZIQmkk4YwGEEoRQS4TArhiyFivpZOIHtn7A_JhN-M:1rEUl4:BunZ4MKzme7YGIq6E_8IuRHD90unfBiuQnVVFqRObLk	2023-12-30 10:31:10.538688-03
dmrkvb0jsiwevorxtbjzbh5yqf3m96px	.eJxVjMsOwiAQRf-FtSGU97h07zcQZgCpGkhKuzL-uzbpQrf3nHNfLMRtrWEbeQlzYmcm2el3w0iP3HaQ7rHdOqfe1mVGviv8oINfe8rPy-H-HdQ46rc2MaOMlDHpgtZPxoMVShZIQmkk4YwGEEoRQS4TArhiyFivpZOIHtn7A_JhN-M:1rLN2Z:u2sXIqV43RmwnpvpZIGkzejnUbEmB9GMoacWw_ilsAQ	2024-01-18 09:41:39.886178-03
s518gyfycmnm67ia2qdk74ty2avo1j6s	.eJxVjMsOwiAQRf-FtSGU97h07zcQZgCpGkhKuzL-uzbpQrf3nHNfLMRtrWEbeQlzYmcm2el3w0iP3HaQ7rHdOqfe1mVGviv8oINfe8rPy-H-HdQ46rc2MaOMlDHpgtZPxoMVShZIQmkk4YwGEEoRQS4TArhiyFivpZOIHtn7A_JhN-M:1rQoRM:l2JuF-tj5WnUF8fvvVEjb6au-MxJXUKPDl-fvc9FlkA	2024-02-02 09:57:44.739407-03
gj25g7et8ifja9b24nqj66v2lil48bo4	.eJxVjMsOwiAQRf-FtSGU97h07zcQZgCpGkhKuzL-uzbpQrf3nHNfLMRtrWEbeQlzYmcm2el3w0iP3HaQ7rHdOqfe1mVGviv8oINfe8rPy-H-HdQ46rc2MaOMlDHpgtZPxoMVShZIQmkk4YwGEEoRQS4TArhiyFivpZOIHtn7A_JhN-M:1moWWo:K6Ql-0_KMGtAsm5U3UTrsp0b_yET4dSxAX52Ph4pl6A	2021-12-04 17:00:02.471226-03
p3pwh5ec3v9o6a5p6cml79zbmrxs6udu	.eJxVjMsOwiAQRf-FtSGU97h07zcQZgCpGkhKuzL-uzbpQrf3nHNfLMRtrWEbeQlzYmcm2el3w0iP3HaQ7rHdOqfe1mVGviv8oINfe8rPy-H-HdQ46rc2MaOMlDHpgtZPxoMVShZIQmkk4YwGEEoRQS4TArhiyFivpZOIHtn7A_JhN-M:1moWeJ:IdwqJIbNcWGv8MF-qHptOSO9qlL8b7TfxN76fpefFDw	2021-12-04 17:07:47.924586-03
88gagoenvhbb2vh19i3ygybutp5lf575	.eJxVjMsOwiAQRf-FtSGU97h07zcQZgCpGkhKuzL-uzbpQrf3nHNfLMRtrWEbeQlzYmcm2el3w0iP3HaQ7rHdOqfe1mVGviv8oINfe8rPy-H-HdQ46rc2MaOMlDHpgtZPxoMVShZIQmkk4YwGEEoRQS4TArhiyFivpZOIHtn7A_JhN-M:1mvPot:ZVBWjdm3-CM8td4ssT_U-r0XKHoDW5RAOFOIhQOQB8E	2021-12-23 17:15:11.642824-03
gwgzysub8087pz5y52xui59bfow7meso	.eJxVjMsOwiAQRf-FtSGU97h07zcQZgCpGkhKuzL-uzbpQrf3nHNfLMRtrWEbeQlzYmcm2el3w0iP3HaQ7rHdOqfe1mVGviv8oINfe8rPy-H-HdQ46rc2MaOMlDHpgtZPxoMVShZIQmkk4YwGEEoRQS4TArhiyFivpZOIHtn7A_JhN-M:1nNDKC:VPctc-mYmbGaXCbrHqlAkAIZQDjmaQbD-mcfEQuJ99k	2022-03-10 09:34:24.941594-03
rpakdlegl90463v8j0e36wlyvprbuuxx	.eJxVjMsOwiAQRf-FtSGADA-X7v0GMjBTqRqalHZl_HfbpAvd3nPOfYuE61LT2nlOI4mLMFGcfseM5cltJ_TAdp9kmdoyj1nuijxol7eJ-HU93L-Dir1utVLBgMahqMKRnfWeijXEqGKA6CyhGkBZAG10phDONgQCcobNlngQny_7vzd8:1v8dPv:i7iypbpE81-3PVXnL2okjBJmhdueGS5_R3Aid9j0VCA	2025-10-28 08:42:11.371254-03
8pf7atx0s0s3fo7gn91dmz7hiy7rfx41	.eJxVjEEOwiAQRe_C2hCgLQMu3XsGMsMMUjVtUtqV8e7apAvd_vfef6mE21rT1mRJI6uzcur0uxHmh0w74DtOt1nneVqXkfSu6IM2fZ1ZnpfD_Tuo2Oq3RggSyUX26Dwj-E4CoORIFqIloAG57_riBUopObABa6IBMEh2MKTeH_qMOD4:1rxrtD:H3SHt9ZU5pQXzIgyF_1sPoNvsupY9uA6I8ub8lGgOWI	2024-05-03 14:19:07.981152-03
dkf9z7f7nhhwdce1c4nzl6tea3ayuuv3	.eJxVjEEOwiAQRe_C2hCgLQMu3XsGMsMMUjVtUtqV8e7apAvd_vfef6mE21rT1mRJI6uzcur0uxHmh0w74DtOt1nneVqXkfSu6IM2fZ1ZnpfD_Tuo2Oq3RggSyUX26Dwj-E4CoORIFqIloAG57_riBUopObABa6IBMEh2MKTeH_qMOD4:1rz30f:i_Z18wv08ozxWZt5GYCnKBziopFSL1lOxoWyhwy5YgE	2024-05-06 20:23:41.255921-03
02ijwknupnazep5sqom9tn764ah87z9j	.eJxVjMsOwiAQRf-FtSGADA-X7v0GMjBTqRqalHZl_HfbpAvd3nPOfYuE61LT2nlOI4mLMFGcfseM5cltJ_TAdp9kmdoyj1nuijxol7eJ-HU93L-Dir1utVLBgMahqMKRnfWeijXEqGKA6CyhGkBZAG10phDONgQCcobNlngQny_7vzd8:1vL981:VH_QFdiSy7aoFfKkDPmXMcXiJjCmmAxCtLGGOm18ad0	2025-12-01 20:59:25.246613-03
ajlxa2w1jx6z2o1ip4vdm2bojrs8wcnf	.eJxVjEEOwiAQRe_C2hCgLQMu3XsGMsMMUjVtUtqV8e7apAvd_vfef6mE21rT1mRJI6uzcur0uxHmh0w74DtOt1nneVqXkfSu6IM2fZ1ZnpfD_Tuo2Oq3RggSyUX26Dwj-E4CoORIFqIloAG57_riBUopObABa6IBMEh2MKTeH_qMOD4:1s9TOk:KUEtDP8uK4uXEHekpLBZcfP7KzVgcU9RN9evx4yV1ZA	2024-06-04 14:35:38.620072-03
2f9y53xsioqwpy4fcr8u0ahs622m3mty	.eJxVjEEOwiAQRe_C2hCgLQMu3XsGMsMMUjVtUtqV8e7apAvd_vfef6mE21rT1mRJI6uzcur0uxHmh0w74DtOt1nneVqXkfSu6IM2fZ1ZnpfD_Tuo2Oq3RggSyUX26Dwj-E4CoORIFqIloAG57_riBUopObABa6IBMEh2MKTeH_qMOD4:1sTP25:5YDYGpzv8dcqf6QTuwQZvPi2cdKsO9ewWJeuPOJlsB8	2024-07-29 13:58:37.105764-03
87ujg6q9lp6dcco8gkuyi5syirzwbmgs	.eJxVjEEOwiAQRe_C2hCgLQMu3XsGMsMMUjVtUtqV8e7apAvd_vfef6mE21rT1mRJI6uzcur0uxHmh0w74DtOt1nneVqXkfSu6IM2fZ1ZnpfD_Tuo2Oq3RggSyUX26Dwj-E4CoORIFqIloAG57_riBUopObABa6IBMEh2MKTeH_qMOD4:1sZGll:h-evp9KyAH3_XsVQwX9SnuWlAFNmLZoC_LEFBQ05WEU	2024-08-14 18:22:01.416493-03
l8ak9a0ss79vzjiv5s7abb4rt68zkpxi	.eJxVjEEOwiAQRe_C2hCgLQMu3XsGMsMMUjVtUtqV8e7apAvd_vfef6mE21rT1mRJI6uzcur0uxHmh0w74DtOt1nneVqXkfSu6IM2fZ1ZnpfD_Tuo2Oq3RggSyUX26Dwj-E4CoORIFqIloAG57_riBUopObABa6IBMEh2MKTeH_qMOD4:1shbxq:xufZeag3WKu6WTyf15b8Ut2TXrg4w6YnuflgkNRkbks	2024-09-06 18:36:58.228049-03
oba68lhw5d4qkar5ioh32oa11ufvqdvq	.eJxVjEEOwiAQRe_C2hCgLQMu3XsGMsMMUjVtUtqV8e7apAvd_vfef6mE21rT1mRJI6uzcur0uxHmh0w74DtOt1nneVqXkfSu6IM2fZ1ZnpfD_Tuo2Oq3RggSyUX26Dwj-E4CoORIFqIloAG57_riBUopObABa6IBMEh2MKTeH_qMOD4:1soWW1:tl7slZvMDv9clA8wwW9c_RbcolpUC7V8IMUps5hz1Zk	2024-09-25 20:12:49.970775-03
af3vf8oaz5f6t3upbqv81r5x4q98td6w	.eJxVjEEOwiAQRe_C2hCgLQMu3XsGMsMMUjVtUtqV8e7apAvd_vfef6mE21rT1mRJI6uzcur0uxHmh0w74DtOt1nneVqXkfSu6IM2fZ1ZnpfD_Tuo2Oq3RggSyUX26Dwj-E4CoORIFqIloAG57_riBUopObABa6IBMEh2MKTeH_qMOD4:1ssqoo:5ONzvCjOHOvR9bE2NR5BNaWOsXKh5FOXD-Jdu0yTCEI	2024-10-07 18:42:06.652727-03
mbrg8og9wedcc7sxkgrta335p31eulvm	.eJxVjDsOwjAQBe_iGlnG2chrSnrOEO0vOIAcKZ8q4u4QKQW0b2be5jpal9Kts03doO7iwJ1-NyZ5Wt2BPqjeRy9jXaaB_a74g87-Nqq9rof7d1BoLt86oKTYJszGEUMUFhXAPiSARiljD2oYwZozBWMGIA4Zo3KbUUWTe38A4zw4PQ:1st4hu:0JCO7BqC8sH8VoOfKTsbi50jkV26SKYriTywYv5Lvh0	2024-10-08 09:31:54.960648-03
m77yuuto21df746h695763zlf6qi968e	.eJxVjEEOwiAQRe_C2hCgLQMu3XsGMsMMUjVtUtqV8e7apAvd_vfef6mE21rT1mRJI6uzcur0uxHmh0w74DtOt1nneVqXkfSu6IM2fZ1ZnpfD_Tuo2Oq3RggSyUX26Dwj-E4CoORIFqIloAG57_riBUopObABa6IBMEh2MKTeH_qMOD4:1t0N3n:t_jK4p6vmpf2Mki5fyzMKT-oPFESszuY6lOkS_52CAc	2024-10-28 12:32:39.271324-03
4llk4837cdla9drrcwp3fif9q7prj9lg	.eJxVjEEOwiAQRe_C2hCgLQMu3XsGMsMMUjVtUtqV8e7apAvd_vfef6mE21rT1mRJI6uzcur0uxHmh0w74DtOt1nneVqXkfSu6IM2fZ1ZnpfD_Tuo2Oq3RggSyUX26Dwj-E4CoORIFqIloAG57_riBUopObABa6IBMEh2MKTeH_qMOD4:1t5kvp:NpkNLlEES8ZxtjIwtsHqTtV5rKQRnvHvYZ7JqPZowTw	2024-11-12 09:02:41.456919-03
lem5rpiry88r6m0u5ut1mw2g1b8ag0tv	.eJxVjEEOwiAQRe_C2hCgLQMu3XsGMsMMUjVtUtqV8e7apAvd_vfef6mE21rT1mRJI6uzcur0uxHmh0w74DtOt1nneVqXkfSu6IM2fZ1ZnpfD_Tuo2Oq3RggSyUX26Dwj-E4CoORIFqIloAG57_riBUopObABa6IBMEh2MKTeH_qMOD4:1tEt6I:VAwue7hh76ohQ84qgPOnKKnemcjHd1_4-dZ2Mh7BFzo	2024-12-07 13:35:14.647001-03
jfdxfhh0h7xnkxoj5jnj1pmsighg2nrx	.eJxVjMsOwiAQRf-FtSGADA-X7v0GMjBTqRqalHZl_HfbpAvd3nPOfYuE61LT2nlOI4mLMFGcfseM5cltJ_TAdp9kmdoyj1nuijxol7eJ-HU93L-Dir1utVLBgMahqMKRnfWeijXEqGKA6CyhGkBZAG10phDONgQCcobNlngQny_7vzd8:1tqHxt:fzrrWDXEvC58n06_dbDxQzbnMjlvV64fm0qqGDUfqdc	2025-03-20 17:37:09.18648-03
d0nfzpkl8n7ltjy2zcrzp1qcs0ssij0y	.eJxVjMsOwiAQRf-FtSGADA-X7v0GMjBTqRqalHZl_HfbpAvd3nPOfYuE61LT2nlOI4mLMFGcfseM5cltJ_TAdp9kmdoyj1nuijxol7eJ-HU93L-Dir1utVLBgMahqMKRnfWeijXEqGKA6CyhGkBZAG10phDONgQCcobNlngQny_7vzd8:1tqHyj:yIGgFHNyRfMfx5cHYCdb5Bi49DwCYviJhLrhlY0j2Ec	2025-03-20 17:38:01.082067-03
yks7bjqar9zy0gvu07l8h62yuy8i8v5f	.eJxVjMsOwiAQRf-FtSGADA-X7v0GMjBTqRqalHZl_HfbpAvd3nPOfYuE61LT2nlOI4mLMFGcfseM5cltJ_TAdp9kmdoyj1nuijxol7eJ-HU93L-Dir1utVLBgMahqMKRnfWeijXEqGKA6CyhGkBZAG10phDONgQCcobNlngQny_7vzd8:1tryTZ:H4oZ6LJxojBJViTyGbJJfHcqJiLbvy8-sMb0w1GWzcc	2025-03-25 09:12:49.50735-03
wjndeey9lbiqp302vnkpnqzclsk86y8f	.eJxVjMsOwiAQRf-FtSGADA-X7v0GMjBTqRqalHZl_HfbpAvd3nPOfYuE61LT2nlOI4mLMFGcfseM5cltJ_TAdp9kmdoyj1nuijxol7eJ-HU93L-Dir1utVLBgMahqMKRnfWeijXEqGKA6CyhGkBZAG10phDONgQCcobNlngQny_7vzd8:1tvzmN:o_DzR17-4xKM0YZs2fXRtcGYJVGYAoM2-x0cVosYfnM	2025-04-05 11:24:51.302483-03
bke27zgoq1krbfh69awug2xwo47impul	.eJxVjMsOwiAQRf-FtSGADA-X7v0GMjBTqRqalHZl_HfbpAvd3nPOfYuE61LT2nlOI4mLMFGcfseM5cltJ_TAdp9kmdoyj1nuijxol7eJ-HU93L-Dir1utVLBgMahqMKRnfWeijXEqGKA6CyhGkBZAG10phDONgQCcobNlngQny_7vzd8:1tx2lh:bYzRp-qBMHw-7J8r_A_tH3_e8vGLLDRy7lz4yCiZu54	2025-04-08 08:48:29.980748-03
o99gxo4e8qqrw67rxu2w07btalmerlc6	.eJxVjMsOwiAQRf-FtSGADA-X7v0GMjBTqRqalHZl_HfbpAvd3nPOfYuE61LT2nlOI4mLMFGcfseM5cltJ_TAdp9kmdoyj1nuijxol7eJ-HU93L-Dir1utVLBgMahqMKRnfWeijXEqGKA6CyhGkBZAG10phDONgQCcobNlngQny_7vzd8:1txsxp:3lZ5E_tHRoGkXeSY2ZoKVbyPD0ojN93N7EqUm3rgD5Y	2025-04-10 16:32:29.596092-03
obp74cnz41sayd73e2agq9b6widvf4tq	.eJxVjMsOwiAQRf-FtSGADA-X7v0GMjBTqRqalHZl_HfbpAvd3nPOfYuE61LT2nlOI4mLMFGcfseM5cltJ_TAdp9kmdoyj1nuijxol7eJ-HU93L-Dir1utVLBgMahqMKRnfWeijXEqGKA6CyhGkBZAG10phDONgQCcobNlngQny_7vzd8:1uHL44:WBxtEgLcoxz16bde891qodXs8MBV7mFnNktw5VqqwX0	2025-06-03 08:23:20.042712-03
irefrt1a4u4pt75ebnx4l72zdboqjn1g	.eJxVjMsOwiAQRf-FtSGADA-X7v0GMjBTqRqalHZl_HfbpAvd3nPOfYuE61LT2nlOI4mLMFGcfseM5cltJ_TAdp9kmdoyj1nuijxol7eJ-HU93L-Dir1utVLBgMahqMKRnfWeijXEqGKA6CyhGkBZAG10phDONgQCcobNlngQny_7vzd8:1ucNAh:DLAY0NVpcXfcoJ7YCujboa7bQpPVWnQGc75PSHYTvzY	2025-07-31 08:53:07.757143-03
b4r5pufoz1ye3iek1k6vi4frwruk4cy1	.eJxVjMsOwiAQRf-FtSGADA-X7v0GMjBTqRqalHZl_HfbpAvd3nPOfYuE61LT2nlOI4mLMFGcfseM5cltJ_TAdp9kmdoyj1nuijxol7eJ-HU93L-Dir1utVLBgMahqMKRnfWeijXEqGKA6CyhGkBZAG10phDONgQCcobNlngQny_7vzd8:1uoT3G:M0EhOYf4uBxgW13WTYDhv-oqip9g4i5qZuHeJ_tqDMk	2025-09-02 17:35:26.014128-03
xh5e14q58rdsqewayxg6k67k4jrsau9b	.eJxVjMsOwiAQRf-FtSGADA-X7v0GMjBTqRqalHZl_HfbpAvd3nPOfYuE61LT2nlOI4mLMFGcfseM5cltJ_TAdp9kmdoyj1nuijxol7eJ-HU93L-Dir1utVLBgMahqMKRnfWeijXEqGKA6CyhGkBZAG10phDONgQCcobNlngQny_7vzd8:1v0ohL:tJ7_bb7IoVmlo6tklewcc-A1qKyzKltRpwmfGCCRlxk	2025-10-06 19:07:51.91704-03
1y3hd5280d0seaeqfoqw9czcbiq1hv5u	.eJxVjMsOwiAQRf-FtSGADA-X7v0GMjBTqRqalHZl_HfbpAvd3nPOfYuE61LT2nlOI4mLMFGcfseM5cltJ_TAdp9kmdoyj1nuijxol7eJ-HU93L-Dir1utVLBgMahqMKRnfWeijXEqGKA6CyhGkBZAG10phDONgQCcobNlngQny_7vzd8:1vSkFg:gIrvSyQvyikBl0W3Go773TsYqR8phdNPQ-GHeFugMso	2025-12-22 20:02:44.343037-03
zkbi3j4j3jalve1set0vm7o52dhwacvt	.eJxVjMsOwiAQRf-FtSGADA-X7v0GMjBTqRqalHZl_HfbpAvd3nPOfYuE61LT2nlOI4mLMFGcfseM5cltJ_TAdp9kmdoyj1nuijxol7eJ-HU93L-Dir1utVLBgMahqMKRnfWeijXEqGKA6CyhGkBZAG10phDONgQCcobNlngQny_7vzd8:1vcs8T:GC4fsxQf5hOdbr3KI6isLdUWOoEItzCRsDl4npBGw20	2026-01-19 18:29:09.720635-03
96va5tfinviz8hansdqmulbh703mp8fi	.eJxVjMsOwiAQRf-FtSGADA-X7v0GMjBTqRqalHZl_HfbpAvd3nPOfYuE61LT2nlOI4mLMFGcfseM5cltJ_TAdp9kmdoyj1nuijxol7eJ-HU93L-Dir1utVLBgMahqMKRnfWeijXEqGKA6CyhGkBZAG10phDONgQCcobNlngQny_7vzd8:1vnE7n:z_kV_VEsBzktD-d-q1QGige9cZewniwUWkQo1AnPElM	2026-02-17 07:59:15.099594-03
8en3eabui41yuo79h16rehcupabtqhzm	.eJxVjMsOwiAQRf-FtSGADA-X7v0GMjBTqRqalHZl_HfbpAvd3nPOfYuE61LT2nlOI4mLMFGcfseM5cltJ_TAdp9kmdoyj1nuijxol7eJ-HU93L-Dir1utVLBgMahqMKRnfWeijXEqGKA6CyhGkBZAG10phDONgQCcobNlngQny_7vzd8:1vucm1:qgHIqgcd0d6-hqdBcvhOvb4JhtJlDh9dfdxxKT-RUfA	2026-03-09 17:43:21.730506-03
34hl6me00ui45z9auljey8gh206cd0be	.eJxVjMsOwiAQRf-FtSGADA-X7v0GMjBTqRqalHZl_HfbpAvd3nPOfYuE61LT2nlOI4mLMFGcfseM5cltJ_TAdp9kmdoyj1nuijxol7eJ-HU93L-Dir1utVLBgMahqMKRnfWeijXEqGKA6CyhGkBZAG10phDONgQCcobNlngQny_7vzd8:1w2CRs:78MJY3hFHOVGN-eHS3-D7WVt5UGvzThxbuoVKmO-I5A	2026-03-30 15:13:52.822543-03
2uo9c74ot2tp1tpy81irf9vcy527oadm	.eJxVjMsOwiAQRf-FtSGADA-X7v0GMjBTqRqalHZl_HfbpAvd3nPOfYuE61LT2nlOI4mLMFGcfseM5cltJ_TAdp9kmdoyj1nuijxol7eJ-HU93L-Dir1utVLBgMahqMKRnfWeijXEqGKA6CyhGkBZAG10phDONgQCcobNlngQny_7vzd8:1wP691:nVdxVL6mxYDJBPpZMo72o-sVNhdDhoF7LD1KgDtMJ5s	2026-06-01 19:09:03.192245-03
up1kwi6pl2zf6ru9od6tbsuo6sx3k5kg	.eJxVjMsOwiAQRf-FtSGADA-X7v0GMjBTqRqalHZl_HfbpAvd3nPOfYuE61LT2nlOI4mLMFGcfseM5cltJ_TAdp9kmdoyj1nuijxol7eJ-HU93L-Dir1utVLBgMahqMKRnfWeijXEqGKA6CyhGkBZAG10phDONgQCcobNlngQny_7vzd8:1wIQBU:nhE6WTQM1dVKQLkJlhygeHe0L4imvF6BLY0JcGqMd6Q	2026-05-14 09:08:00.575427-03
\.


--
-- Data for Name: master_area; Type: TABLE DATA; Schema: public; Owner: cristiano
--

COPY public.master_area (id, name, board_id, tenant_id, is_active) FROM stdin;
232	Despesas Administrativas	199	166	t
237	Area Central-Bovina	200	166	t
238	Caldeira-Suina	201	166	t
239	Caldeira/Efluente-Bovina	202	166	t
241	Laboratório-Bovina	203	166	t
242	Laboratorio-Suina	203	166	t
243	ETE e ETA Bovina	204	166	t
245	Contr Qualid Suína	203	166	t
246	ETE e ETA Suína	204	166	t
247	Manutenção-Bovina	205	166	t
248	Manutenção-Suina	205	166	t
249	Microbiologia-Bovina	206	166	t
250	Moinho-Bovina	207	166	t
251	Picador-Produção-Suina	208	166	t
252	Produção-Bovina	209	166	t
253	Produção-Suina	209	166	t
254	Projetos-Bovina	210	166	t
255	Projetos-Suina	210	166	t
258	Segurança do Trabalho	211	166	t
259	Controle de Qualidade Regulatório - Bovina	212	166	t
260	Controle de Qualidade Regulatório - Suína	212	166	t
261	Suprimentos MT Bovina	213	166	t
262	Almoxarifado	214	166	t
15	TI	23	100	t
16	Recursos Humanos	24	100	t
20	TI	25	100	t
100	COMERCIAL DIVERSOS	133	1	t
103	COMUNICACAO	134	1	t
104	SUSTENTABILIDADE	134	1	t
105	CUSTOMER EXPERIENCE	135	1	t
106	RELAC COM CLIENTE	135	1	t
107	IMPLANTACAO DE PROJETOS	136	1	t
108	DIVERSOS	137	1	t
109	EXCELENCIA DE GESTAO, PROCESSOS E PROJETOS	138	1	t
110	SSMA	138	1	t
111	CONTABIL FISCAL	139	1	t
112	FINANÇAS	139	1	t
113	FINANÇAS E SUPRIMENTOS	139	1	t
114	SUPRIMENTOS	139	1	t
115	FP&A	140	1	t
116	ORCAMENTO E DESEMPENHO	140	1	t
117	PRICING	140	1	t
118	GESTAO DE PESSOAS E DIVERSIDADE	141	1	t
119	REC HUMANOS	141	1	t
120	COMERCIAL GRANEIS LIQUIDOS	142	1	t
121	OPERACAO GRANEIS LIQUIDOS	142	1	t
122	INTELIGENCIA DE MERCADO	143	1	t
123	COMPLIANCE	144	1	t
124	JURIDICO	144	1	t
125	EXCELENCIA OPERACIONAL	145	1	t
126	OPERACAO CD	145	1	t
127	OPERACAO CLIAS	145	1	t
128	OPERACAO CLIAS; TRANSPORTE RODOVIARIO	145	1	t
129	FACILITIES	146	1	t
130	INFRAESTRUTURA	146	1	t
131	OPERAÇÃO PORTUARIA	146	1	t
132	PLANEJAMENTO OPERACAO PORTUARIA	146	1	t
133	SEGURANCA PATRIMONIAL	146	1	t
134	MANUTENCAO	147	1	t
135	OPERAÇÃO PORTUARIA; OPERACAO LOGISTICA	147	1	t
136	PROCESSO ADUANEIRO; OPERACAO CLIAS	147	1	t
137	PLAN ESTRATEGICO	148	1	t
138	BI E GOVERNANCA	149	1	t
139	DESENVOLVIMENTO DE SISTEMAS	149	1	t
140	INFRAESTRUTURA DE TI	149	1	t
141	SEGURANCA DA INFORMACAO	149	1	t
142	COMERCIAL 3PL	133	1	t
143	COMERCIAL E DESENV DE NEG - REGIAO NORTE	133	1	t
146	COMUNICACAO E SUSTENTABILIDADE	134	1	t
147	DESENVOLVIMENTO PROJETOS ENGENHARIA	136	1	t
148	FP&A E PRICING	140	1	t
149	GENTE E GESTÃO	141	1	t
150	NEGOCIO GRANEIS LIQUIDOS	142	1	t
151	AUDITORIA	144	1	t
153	MANUTENCAO OPERAÇÃO LOGISTICA	145	1	t
154	OPERACAO LOGISTICA	145	1	t
155	PROJETOS LOGISTICOS (3PL)	145	1	t
156	PROJETOS LOGISTICOS (3PL); TRANSPORTE RODOVIARIO	145	1	t
157	SEGURANCA PATRIMONIAL OPER LOGISTICA	145	1	t
158	TRANSPORTE RODOVIARIO	145	1	t
159	MANUTENCAO OPER PORTUARIA	146	1	t
160	OPERACAO PORTUARIA IMBITUBA	146	1	t
161	OPERACAO PORTUARIA VILA DO CONDE	146	1	t
162	OPERACAO TEV	146	1	t
163	PLANEJAMENTO DE PROJETOS	146	1	t
164	PROCESSO ADUANEIRO	146	1	t
165	OPERAÇÃO PORTUARIA; SEGURANCA PATRIMONIAL	147	1	t
167	SEGURANCA PATRIMONIAL; SEGURANCA PATRIMONIAL OPER LOGISTICA	147	1	t
168	REL COM INVESTIDORES	148	1	t
169	TECNOLOGIA	149	1	t
102	COMERCIAL LOGISTICA INTEGRADA	133	1	t
144	COMERCIAL LOGISTICA INTEGRADA; COMERCIAL 3PL	133	1	t
145	COMERCIAL OPERACAO PORTUARIA	133	1	t
\.


--
-- Data for Name: master_diretoria; Type: TABLE DATA; Schema: public; Owner: cristiano
--

COPY public.master_diretoria (id, name, tenant_id, is_active) FROM stdin;
133	COMERCIAL	1	t
134	COMUNICACAO E SUSTENTABILIDADE	1	t
135	CUSTOMER EXPERIENCE	1	t
136	DESENVOLVIMENTO PROJETOS ENGENHARIA	1	t
137	DIVERSOS	1	t
138	EXCELENCIA DE GESTAO, PROCESSOS E PROJETOS	1	t
139	FINANÇAS E SUPRIMENTOS	1	t
140	FP&A E PRICING	1	t
141	GENTE E GESTÃO	1	t
142	GRANEIS LIQUIDOS	1	t
143	INTELIGENCIA DE MERCADO	1	t
144	JURIDICO E COMPLIANCE	1	t
145	OPERACAO LOGISTICA	1	t
146	OPERAÇÃO PORTUARIA	1	t
147	OPERAÇÃO PORTUARIA; OPERACAO LOGISTICA	1	t
148	REL COM INVESTIDORES E PLAN ESTRATEGICO	1	t
149	TECNOLOGIA	1	t
199	Administrativo	166	t
200	Area Central	166	t
201	Caldeira	166	t
202	Caldeira/Efluente	166	t
203	Controle de Qualidade	166	t
204	ETE e ETA	166	t
205	Manutencao	166	t
206	Microbiologia	166	t
207	Moinho	166	t
208	Picador	166	t
209	Producao	166	t
210	Projetos	166	t
211	Segurança do Trabalho	166	t
212	Sistema da Qualidade	166	t
213	Suprimentos MP	166	t
214	Almoxarifado	166	t
23	Administrativo	100	t
24	Recursos Humanos	100	t
25	TI	100	t
\.


--
-- Data for Name: person_person; Type: TABLE DATA; Schema: public; Owner: cristiano
--

COPY public.person_person (id, name, birth_date, city, civil_status, complement, cpf, number, phone, sex, states, address, tenant_id) FROM stdin;
\.


--
-- Data for Name: tenants_tenant; Type: TABLE DATA; Schema: public; Owner: cristiano
--

COPY public.tenants_tenant (id, name, address, city, cnpj, complement, employees, number, outsource, phone, sector_id, states, governanca_id, origin_id, size_id, company_id, core_id, plano_id, planoaval_id) FROM stdin;
17	Pcline Computadores LTDA	Rua Viçosa	Belo Horizonte	06309919000148	504	10	43	0	(31)9919-2214	2	MG	1	1	2	1	1	1	1
2	Pcline Computadores TEste	Rua Viçosa	Belo Horizonte	06309919000148	504	10	43	0	(31)9919-2214	2	MG	1	1	2	1	1	1	1
1	ClIENTE SB ACS2	2	São Paulo	21622996000147	\N	0	53B	0	(11) 3833-0103	43	SP	2	1	1	1	3	1	1
166	Cliente ReG ACS	R MATIAS ROXO 300 AP	São Paulo	21622996000147		5000	53B	0	(11) 3833-0103	3	SP	3	2	9	2	3	1	1
100	ClIENTE SB ACS	R MATIAS ROXO 300 AP	São Paulo	21622996000147	\N	100	53B	50	(11)3833-0103	43	SP	2	1	8	1	3	1	1
\.


--
-- Data for Name: user_account_customuser; Type: TABLE DATA; Schema: public; Owner: cristiano
--

COPY public.user_account_customuser (id, password, last_login, is_superuser, email, name, date_joined, is_staff, is_active, person_id, default_tenant_id, kind) FROM stdin;
30	pbkdf2_sha256$720000$kxIt4sp8XaQ0exQuv9u7sZ$12eT002XigPZt05QX5j7af40c8aAhamrBlzTZjWyacU=	2025-10-14 08:41:16.272324-03	f	asampaio2810@ig.com.br	Ana Sampaio	2025-10-14 08:17:23.265002-03	f	t	\N	100	Comum
29	pbkdf2_sha256$720000$hCeh6Tc0fHCwOqSGI8DzNH$i1aTHYk+nj/JC6CrpLBZONvGIW40kp6MTA6Px8gB0oI=	2026-05-18 19:09:03.097491-03	t	cristiano.castro@pcline.com.br	Cristiano Fonseca de Castro	2027-04-02 00:00:00-03	t	t	\N	100	Master
100	pbkdf2_sha256$720000$2KlMaW3tclrSUk7feymVnv$+BD46xuI8m0SlQWJUce3/dpQv4lJ9gCJZkXslj/S+9M=	2025-04-22 20:29:42.114258-03	f	anasampaio@acssolucoescorp.com	Ana e Bel	2025-03-26 09:39:51-03	f	t	\N	166	Master
31	pbkdf2_sha256$720000$G860cJ4drZWLqu0rA23EH0$8t4C2S69aq4QyFdaUEg7qj0zfwxKSdavyObYzyyiJjs=	2025-10-14 08:39:14.964954-03	f	gabrieldantaschaves@gmail.com	Gabriel dantas	2025-10-14 08:18:18.621292-03	f	t	\N	100	Comum
\.


--
-- Data for Name: user_account_customuser_groups; Type: TABLE DATA; Schema: public; Owner: cristiano
--

COPY public.user_account_customuser_groups (id, customuser_id, group_id) FROM stdin;
\.


--
-- Data for Name: user_account_customuser_tenants; Type: TABLE DATA; Schema: public; Owner: cristiano
--

COPY public.user_account_customuser_tenants (id, customuser_id, tenant_id) FROM stdin;
4	29	17
\.


--
-- Data for Name: user_account_customuser_user_permissions; Type: TABLE DATA; Schema: public; Owner: cristiano
--

COPY public.user_account_customuser_user_permissions (id, customuser_id, permission_id) FROM stdin;
\.


--
-- Name: admin_avaliacao_combinacoes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cristiano
--

SELECT pg_catalog.setval('public.admin_avaliacao_combinacoes_id_seq', 433, true);


--
-- Name: admin_avaliacao_conhecimentos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cristiano
--

SELECT pg_catalog.setval('public.admin_avaliacao_conhecimentos_id_seq', 15, true);


--
-- Name: admin_avaliacao_familias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cristiano
--

SELECT pg_catalog.setval('public.admin_avaliacao_familias_id_seq', 27, true);


--
-- Name: admin_avaliacao_fatores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cristiano
--

SELECT pg_catalog.setval('public.admin_avaliacao_fatores_id_seq', 18, true);


--
-- Name: admin_avaliacao_grades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cristiano
--

SELECT pg_catalog.setval('public.admin_avaliacao_grades_id_seq', 10, true);


--
-- Name: admin_avaliacao_matrizes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cristiano
--

SELECT pg_catalog.setval('public.admin_avaliacao_matrizes_id_seq', 3, true);


--
-- Name: admin_avaliacao_niveis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cristiano
--

SELECT pg_catalog.setval('public.admin_avaliacao_niveis_id_seq', 54, true);


--
-- Name: admin_avaliacao_subfamilias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cristiano
--

SELECT pg_catalog.setval('public.admin_avaliacao_subfamilias_id_seq', 7, true);


--
-- Name: admin_descricao_areas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cristiano
--

SELECT pg_catalog.setval('public.admin_descricao_areas_id_seq', 2, true);


--
-- Name: admin_descricao_areasespecializacoes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cristiano
--

SELECT pg_catalog.setval('public.admin_descricao_areasespecializacoes_id_seq', 1, true);


--
-- Name: admin_descricao_descricoes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cristiano
--

SELECT pg_catalog.setval('public.admin_descricao_descricoes_id_seq', 8, true);


--
-- Name: admin_descricao_especializacoes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cristiano
--

SELECT pg_catalog.setval('public.admin_descricao_especializacoes_id_seq', 1, true);


--
-- Name: admin_descricao_experiencias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cristiano
--

SELECT pg_catalog.setval('public.admin_descricao_experiencias_id_seq', 2, true);


--
-- Name: admin_descricao_formacao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cristiano
--

SELECT pg_catalog.setval('public.admin_descricao_formacao_id_seq', 14, true);


--
-- Name: admin_descricao_gerencia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cristiano
--

SELECT pg_catalog.setval('public.admin_descricao_gerencia_id_seq', 3, true);


--
-- Name: admin_descricao_habilitacoes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cristiano
--

SELECT pg_catalog.setval('public.admin_descricao_habilitacoes_id_seq', 5, true);


--
-- Name: admin_descricao_idiomas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cristiano
--

SELECT pg_catalog.setval('public.admin_descricao_idiomas_id_seq', 2, true);


--
-- Name: admin_descricao_niveis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cristiano
--

SELECT pg_catalog.setval('public.admin_descricao_niveis_id_seq', 1, true);


--
-- Name: admin_descricao_proficiencias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cristiano
--

SELECT pg_catalog.setval('public.admin_descricao_proficiencias_id_seq', 3, true);


--
-- Name: admin_descricao_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cristiano
--

SELECT pg_catalog.setval('public.admin_descricao_status_id_seq', 4, true);


--
-- Name: admin_geral_core_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cristiano
--

SELECT pg_catalog.setval('public.admin_geral_core_id_seq', 3, true);


--
-- Name: admin_geral_dimensao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cristiano
--

SELECT pg_catalog.setval('public.admin_geral_dimensao_id_seq', 12, true);


--
-- Name: admin_geral_governanca_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cristiano
--

SELECT pg_catalog.setval('public.admin_geral_governanca_id_seq', 3, true);


--
-- Name: admin_geral_nivelcargo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cristiano
--

SELECT pg_catalog.setval('public.admin_geral_nivelcargo_id_seq', 2, true);


--
-- Name: admin_geral_origemcapital_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cristiano
--

SELECT pg_catalog.setval('public.admin_geral_origemcapital_id_seq', 2, true);


--
-- Name: admin_geral_plans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cristiano
--

SELECT pg_catalog.setval('public.admin_geral_plans_id_seq', 2, true);


--
-- Name: admin_geral_plansavaliacao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cristiano
--

SELECT pg_catalog.setval('public.admin_geral_plansavaliacao_id_seq', 1, true);


--
-- Name: admin_geral_sector_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cristiano
--

SELECT pg_catalog.setval('public.admin_geral_sector_id_seq', 48, true);


--
-- Name: admin_geral_tipoempresa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cristiano
--

SELECT pg_catalog.setval('public.admin_geral_tipoempresa_id_seq', 2, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cristiano
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 2, true);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cristiano
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, true);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cristiano
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 180, true);


--
-- Name: avaliacao_avaliacao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cristiano
--

SELECT pg_catalog.setval('public.avaliacao_avaliacao_id_seq', 1, false);


--
-- Name: avaliacao_superior_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cristiano
--

SELECT pg_catalog.setval('public.avaliacao_superior_id_seq', 156, true);


--
-- Name: background_task_completedtask_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cristiano
--

SELECT pg_catalog.setval('public.background_task_completedtask_id_seq', 7, true);


--
-- Name: background_task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cristiano
--

SELECT pg_catalog.setval('public.background_task_id_seq', 11, true);


--
-- Name: descricao_descricao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cristiano
--

SELECT pg_catalog.setval('public.descricao_descricao_id_seq', 99, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cristiano
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 3252, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cristiano
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 45, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cristiano
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 205, true);


--
-- Name: master_area_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cristiano
--

SELECT pg_catalog.setval('public.master_area_id_seq', 20, true);


--
-- Name: master_diretoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cristiano
--

SELECT pg_catalog.setval('public.master_diretoria_id_seq', 25, true);


--
-- Name: person_person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cristiano
--

SELECT pg_catalog.setval('public.person_person_id_seq', 10, true);


--
-- Name: tenants_tenant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cristiano
--

SELECT pg_catalog.setval('public.tenants_tenant_id_seq', 166, true);


--
-- Name: user_account_customuser_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cristiano
--

SELECT pg_catalog.setval('public.user_account_customuser_groups_id_seq', 1, false);


--
-- Name: user_account_customuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cristiano
--

SELECT pg_catalog.setval('public.user_account_customuser_id_seq', 31, true);


--
-- Name: user_account_customuser_tenants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cristiano
--

SELECT pg_catalog.setval('public.user_account_customuser_tenants_id_seq', 4, true);


--
-- Name: user_account_customuser_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cristiano
--

SELECT pg_catalog.setval('public.user_account_customuser_user_permissions_id_seq', 1, false);


--
-- Name: admin_avaliacao_combinacoes admin_avaliacao_combinacoes_name_key; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_avaliacao_combinacoes
    ADD CONSTRAINT admin_avaliacao_combinacoes_name_key UNIQUE (name);


--
-- Name: admin_avaliacao_combinacoes admin_avaliacao_combinacoes_pkey; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_avaliacao_combinacoes
    ADD CONSTRAINT admin_avaliacao_combinacoes_pkey PRIMARY KEY (id);


--
-- Name: admin_avaliacao_conhecimentos admin_avaliacao_conhecimentos_code_key; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_avaliacao_conhecimentos
    ADD CONSTRAINT admin_avaliacao_conhecimentos_code_key UNIQUE (code);


--
-- Name: admin_avaliacao_conhecimentos admin_avaliacao_conhecimentos_name_key; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_avaliacao_conhecimentos
    ADD CONSTRAINT admin_avaliacao_conhecimentos_name_key UNIQUE (name);


--
-- Name: admin_avaliacao_conhecimentos admin_avaliacao_conhecimentos_pkey; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_avaliacao_conhecimentos
    ADD CONSTRAINT admin_avaliacao_conhecimentos_pkey PRIMARY KEY (id);


--
-- Name: admin_avaliacao_familias admin_avaliacao_familias_name_df06538e_uniq; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_avaliacao_familias
    ADD CONSTRAINT admin_avaliacao_familias_name_df06538e_uniq UNIQUE (name);


--
-- Name: admin_avaliacao_familias admin_avaliacao_familias_pkey; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_avaliacao_familias
    ADD CONSTRAINT admin_avaliacao_familias_pkey PRIMARY KEY (id);


--
-- Name: admin_avaliacao_fatores admin_avaliacao_fatores_code_a5f32fd8_uniq; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_avaliacao_fatores
    ADD CONSTRAINT admin_avaliacao_fatores_code_a5f32fd8_uniq UNIQUE (code);


--
-- Name: admin_avaliacao_fatores admin_avaliacao_fatores_pkey; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_avaliacao_fatores
    ADD CONSTRAINT admin_avaliacao_fatores_pkey PRIMARY KEY (id);


--
-- Name: admin_avaliacao_grades admin_avaliacao_grades_pkey; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_avaliacao_grades
    ADD CONSTRAINT admin_avaliacao_grades_pkey PRIMARY KEY (id);


--
-- Name: admin_avaliacao_matrizes admin_avaliacao_matrizes_name_f50185e7_uniq; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_avaliacao_matrizes
    ADD CONSTRAINT admin_avaliacao_matrizes_name_f50185e7_uniq UNIQUE (name);


--
-- Name: admin_avaliacao_matrizes admin_avaliacao_matrizes_pkey; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_avaliacao_matrizes
    ADD CONSTRAINT admin_avaliacao_matrizes_pkey PRIMARY KEY (id);


--
-- Name: admin_avaliacao_niveis admin_avaliacao_niveis_pkey; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_avaliacao_niveis
    ADD CONSTRAINT admin_avaliacao_niveis_pkey PRIMARY KEY (id);


--
-- Name: admin_avaliacao_subfamilias admin_avaliacao_subfamilias_pkey; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_avaliacao_subfamilias
    ADD CONSTRAINT admin_avaliacao_subfamilias_pkey PRIMARY KEY (id);


--
-- Name: admin_descricao_areas admin_descricao_areas_name_97c816d1_uniq; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_areas
    ADD CONSTRAINT admin_descricao_areas_name_97c816d1_uniq UNIQUE (name);


--
-- Name: admin_descricao_areas admin_descricao_areas_pkey; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_areas
    ADD CONSTRAINT admin_descricao_areas_pkey PRIMARY KEY (id);


--
-- Name: admin_descricao_areasespecializacoes admin_descricao_areasespecializacoes_name_key; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_areasespecializacoes
    ADD CONSTRAINT admin_descricao_areasespecializacoes_name_key UNIQUE (name);


--
-- Name: admin_descricao_areasespecializacoes admin_descricao_areasespecializacoes_pkey; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_areasespecializacoes
    ADD CONSTRAINT admin_descricao_areasespecializacoes_pkey PRIMARY KEY (id);


--
-- Name: admin_descricao_descricoes admin_descricao_descricoes_pkey; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_descricoes
    ADD CONSTRAINT admin_descricao_descricoes_pkey PRIMARY KEY (id);


--
-- Name: admin_descricao_descricoes admin_descricao_descricoes_title_4a2bc489_uniq; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_descricoes
    ADD CONSTRAINT admin_descricao_descricoes_title_4a2bc489_uniq UNIQUE (title);


--
-- Name: admin_descricao_especializacoes admin_descricao_especializacoes_name_c6cc73ea_uniq; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_especializacoes
    ADD CONSTRAINT admin_descricao_especializacoes_name_c6cc73ea_uniq UNIQUE (name);


--
-- Name: admin_descricao_especializacoes admin_descricao_especializacoes_pkey; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_especializacoes
    ADD CONSTRAINT admin_descricao_especializacoes_pkey PRIMARY KEY (id);


--
-- Name: admin_descricao_experiencias admin_descricao_experiencias_name_04579892_uniq; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_experiencias
    ADD CONSTRAINT admin_descricao_experiencias_name_04579892_uniq UNIQUE (name);


--
-- Name: admin_descricao_experiencias admin_descricao_experiencias_pkey; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_experiencias
    ADD CONSTRAINT admin_descricao_experiencias_pkey PRIMARY KEY (id);


--
-- Name: admin_descricao_formacao admin_descricao_formacao_code_key; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_formacao
    ADD CONSTRAINT admin_descricao_formacao_code_key UNIQUE (code);


--
-- Name: admin_descricao_formacao admin_descricao_formacao_name_61d5a245_uniq; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_formacao
    ADD CONSTRAINT admin_descricao_formacao_name_61d5a245_uniq UNIQUE (name);


--
-- Name: admin_descricao_formacao admin_descricao_formacao_pkey; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_formacao
    ADD CONSTRAINT admin_descricao_formacao_pkey PRIMARY KEY (id);


--
-- Name: admin_descricao_gerencia admin_descricao_gerencia_name_key; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_gerencia
    ADD CONSTRAINT admin_descricao_gerencia_name_key UNIQUE (name);


--
-- Name: admin_descricao_gerencia admin_descricao_gerencia_pkey; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_gerencia
    ADD CONSTRAINT admin_descricao_gerencia_pkey PRIMARY KEY (id);


--
-- Name: admin_descricao_habilitacoes admin_descricao_habilitacoes_name_8444aef6_uniq; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_habilitacoes
    ADD CONSTRAINT admin_descricao_habilitacoes_name_8444aef6_uniq UNIQUE (name);


--
-- Name: admin_descricao_habilitacoes admin_descricao_habilitacoes_pkey; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_habilitacoes
    ADD CONSTRAINT admin_descricao_habilitacoes_pkey PRIMARY KEY (id);


--
-- Name: admin_descricao_idiomas admin_descricao_idiomas_name_cd5e2a69_uniq; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_idiomas
    ADD CONSTRAINT admin_descricao_idiomas_name_cd5e2a69_uniq UNIQUE (name);


--
-- Name: admin_descricao_idiomas admin_descricao_idiomas_pkey; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_idiomas
    ADD CONSTRAINT admin_descricao_idiomas_pkey PRIMARY KEY (id);


--
-- Name: admin_descricao_niveis admin_descricao_niveis_name_key; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_niveis
    ADD CONSTRAINT admin_descricao_niveis_name_key UNIQUE (name);


--
-- Name: admin_descricao_niveis admin_descricao_niveis_pkey; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_niveis
    ADD CONSTRAINT admin_descricao_niveis_pkey PRIMARY KEY (id);


--
-- Name: admin_descricao_proficiencias admin_descricao_proficiencias_name_key; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_proficiencias
    ADD CONSTRAINT admin_descricao_proficiencias_name_key UNIQUE (name);


--
-- Name: admin_descricao_proficiencias admin_descricao_proficiencias_pkey; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_proficiencias
    ADD CONSTRAINT admin_descricao_proficiencias_pkey PRIMARY KEY (id);


--
-- Name: admin_descricao_status admin_descricao_status_name_key; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_status
    ADD CONSTRAINT admin_descricao_status_name_key UNIQUE (name);


--
-- Name: admin_descricao_status admin_descricao_status_pkey; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_status
    ADD CONSTRAINT admin_descricao_status_pkey PRIMARY KEY (id);


--
-- Name: admin_geral_core admin_geral_core_pkey; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_geral_core
    ADD CONSTRAINT admin_geral_core_pkey PRIMARY KEY (id);


--
-- Name: admin_geral_dimensao admin_geral_dimensao_pkey; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_geral_dimensao
    ADD CONSTRAINT admin_geral_dimensao_pkey PRIMARY KEY (id);


--
-- Name: admin_geral_governanca admin_geral_governanca_name_key; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_geral_governanca
    ADD CONSTRAINT admin_geral_governanca_name_key UNIQUE (name);


--
-- Name: admin_geral_governanca admin_geral_governanca_pkey; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_geral_governanca
    ADD CONSTRAINT admin_geral_governanca_pkey PRIMARY KEY (id);


--
-- Name: admin_geral_nivelcargo admin_geral_nivelcargo_pkey; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_geral_nivelcargo
    ADD CONSTRAINT admin_geral_nivelcargo_pkey PRIMARY KEY (id);


--
-- Name: admin_geral_origemcapital admin_geral_origemcapital_name_key; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_geral_origemcapital
    ADD CONSTRAINT admin_geral_origemcapital_name_key UNIQUE (name);


--
-- Name: admin_geral_origemcapital admin_geral_origemcapital_pkey; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_geral_origemcapital
    ADD CONSTRAINT admin_geral_origemcapital_pkey PRIMARY KEY (id);


--
-- Name: admin_geral_plans admin_geral_plans_name_ae1e608b_uniq; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_geral_plans
    ADD CONSTRAINT admin_geral_plans_name_ae1e608b_uniq UNIQUE (name);


--
-- Name: admin_geral_plans admin_geral_plans_pkey; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_geral_plans
    ADD CONSTRAINT admin_geral_plans_pkey PRIMARY KEY (id);


--
-- Name: admin_geral_plansavaliacao admin_geral_plansavaliacao_name_key; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_geral_plansavaliacao
    ADD CONSTRAINT admin_geral_plansavaliacao_name_key UNIQUE (name);


--
-- Name: admin_geral_plansavaliacao admin_geral_plansavaliacao_pkey; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_geral_plansavaliacao
    ADD CONSTRAINT admin_geral_plansavaliacao_pkey PRIMARY KEY (id);


--
-- Name: admin_geral_sector admin_geral_sector_name_df66d8d2_uniq; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_geral_sector
    ADD CONSTRAINT admin_geral_sector_name_df66d8d2_uniq UNIQUE (name);


--
-- Name: admin_geral_sector admin_geral_sector_pkey; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_geral_sector
    ADD CONSTRAINT admin_geral_sector_pkey PRIMARY KEY (id);


--
-- Name: admin_geral_tipoempresa admin_geral_tipoempresa_pkey; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_geral_tipoempresa
    ADD CONSTRAINT admin_geral_tipoempresa_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: avaliacao_avaliacao avaliacao_avaliacao_pkey; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.avaliacao_avaliacao
    ADD CONSTRAINT avaliacao_avaliacao_pkey PRIMARY KEY (id);


--
-- Name: avaliacao_avaliacao avaliacao_avaliacao_title_tenant_id_046a2d8e_uniq; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.avaliacao_avaliacao
    ADD CONSTRAINT avaliacao_avaliacao_title_tenant_id_046a2d8e_uniq UNIQUE (title, tenant_id);


--
-- Name: avaliacao_superior avaliacao_superior_pkey; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.avaliacao_superior
    ADD CONSTRAINT avaliacao_superior_pkey PRIMARY KEY (id);


--
-- Name: avaliacao_superior avaliacao_superior_title_tenant_id_5290772f_uniq; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.avaliacao_superior
    ADD CONSTRAINT avaliacao_superior_title_tenant_id_5290772f_uniq UNIQUE (title, tenant_id);


--
-- Name: background_task_completedtask background_task_completedtask_pkey; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.background_task_completedtask
    ADD CONSTRAINT background_task_completedtask_pkey PRIMARY KEY (id);


--
-- Name: background_task background_task_pkey; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.background_task
    ADD CONSTRAINT background_task_pkey PRIMARY KEY (id);


--
-- Name: descricao_descricao descricao_descricao_pkey; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.descricao_descricao
    ADD CONSTRAINT descricao_descricao_pkey PRIMARY KEY (id);


--
-- Name: descricao_descricao descricao_descricao_title_tenant_id_is_active_3075a876_uniq; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.descricao_descricao
    ADD CONSTRAINT descricao_descricao_title_tenant_id_is_active_3075a876_uniq UNIQUE (title, tenant_id, is_active);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: master_area master_area_name_board_id_tenant_id_09b67c1a_uniq; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.master_area
    ADD CONSTRAINT master_area_name_board_id_tenant_id_09b67c1a_uniq UNIQUE (name, board_id, tenant_id);


--
-- Name: master_area master_area_pkey; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.master_area
    ADD CONSTRAINT master_area_pkey PRIMARY KEY (id);


--
-- Name: master_diretoria master_diretoria_name_tenant_id_963ceff4_uniq; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.master_diretoria
    ADD CONSTRAINT master_diretoria_name_tenant_id_963ceff4_uniq UNIQUE (name, tenant_id);


--
-- Name: master_diretoria master_diretoria_pkey; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.master_diretoria
    ADD CONSTRAINT master_diretoria_pkey PRIMARY KEY (id);


--
-- Name: person_person person_person_cpf_f16f6b8c_uniq; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.person_person
    ADD CONSTRAINT person_person_cpf_f16f6b8c_uniq UNIQUE (cpf);


--
-- Name: person_person person_person_name_c7a6309b_uniq; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.person_person
    ADD CONSTRAINT person_person_name_c7a6309b_uniq UNIQUE (name);


--
-- Name: person_person person_person_pkey; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.person_person
    ADD CONSTRAINT person_person_pkey PRIMARY KEY (id);


--
-- Name: tenants_tenant tenants_tenant_name_a74dac10_uniq; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.tenants_tenant
    ADD CONSTRAINT tenants_tenant_name_a74dac10_uniq UNIQUE (name);


--
-- Name: tenants_tenant tenants_tenant_pkey; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.tenants_tenant
    ADD CONSTRAINT tenants_tenant_pkey PRIMARY KEY (id);


--
-- Name: user_account_customuser_groups user_account_customuser__customuser_id_group_id_bee61c5f_uniq; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.user_account_customuser_groups
    ADD CONSTRAINT user_account_customuser__customuser_id_group_id_bee61c5f_uniq UNIQUE (customuser_id, group_id);


--
-- Name: user_account_customuser_user_permissions user_account_customuser__customuser_id_permission_1fd5e7be_uniq; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.user_account_customuser_user_permissions
    ADD CONSTRAINT user_account_customuser__customuser_id_permission_1fd5e7be_uniq UNIQUE (customuser_id, permission_id);


--
-- Name: user_account_customuser_tenants user_account_customuser__customuser_id_tenant_id_3c9a92f5_uniq; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.user_account_customuser_tenants
    ADD CONSTRAINT user_account_customuser__customuser_id_tenant_id_3c9a92f5_uniq UNIQUE (customuser_id, tenant_id);


--
-- Name: user_account_customuser user_account_customuser_email_key; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.user_account_customuser
    ADD CONSTRAINT user_account_customuser_email_key UNIQUE (email);


--
-- Name: user_account_customuser_groups user_account_customuser_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.user_account_customuser_groups
    ADD CONSTRAINT user_account_customuser_groups_pkey PRIMARY KEY (id);


--
-- Name: user_account_customuser user_account_customuser_person_id_key; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.user_account_customuser
    ADD CONSTRAINT user_account_customuser_person_id_key UNIQUE (person_id);


--
-- Name: user_account_customuser user_account_customuser_pkey; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.user_account_customuser
    ADD CONSTRAINT user_account_customuser_pkey PRIMARY KEY (id);


--
-- Name: user_account_customuser_tenants user_account_customuser_tenants_pkey; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.user_account_customuser_tenants
    ADD CONSTRAINT user_account_customuser_tenants_pkey PRIMARY KEY (id);


--
-- Name: user_account_customuser_user_permissions user_account_customuser_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.user_account_customuser_user_permissions
    ADD CONSTRAINT user_account_customuser_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: admin_avaliacao_combinacoes_name_d537fbf2_like; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX admin_avaliacao_combinacoes_name_d537fbf2_like ON public.admin_avaliacao_combinacoes USING btree (name varchar_pattern_ops);


--
-- Name: admin_avaliacao_conhecimentos_name_1a7fe85f_like; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX admin_avaliacao_conhecimentos_name_1a7fe85f_like ON public.admin_avaliacao_conhecimentos USING btree (name varchar_pattern_ops);


--
-- Name: admin_avaliacao_familias_name_df06538e_like; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX admin_avaliacao_familias_name_df06538e_like ON public.admin_avaliacao_familias USING btree (name varchar_pattern_ops);


--
-- Name: admin_avaliacao_matrizes_factor_id_2ebb57d4; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX admin_avaliacao_matrizes_factor_id_2ebb57d4 ON public.admin_avaliacao_matrizes USING btree (factor_id);


--
-- Name: admin_avaliacao_matrizes_level_id_3514d2d1; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX admin_avaliacao_matrizes_level_id_3514d2d1 ON public.admin_avaliacao_matrizes USING btree (level_id);


--
-- Name: admin_avaliacao_matrizes_name_f50185e7_like; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX admin_avaliacao_matrizes_name_f50185e7_like ON public.admin_avaliacao_matrizes USING btree (name varchar_pattern_ops);


--
-- Name: admin_avaliacao_niveis_factor_id_cef10059; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX admin_avaliacao_niveis_factor_id_cef10059 ON public.admin_avaliacao_niveis USING btree (factor_id);


--
-- Name: admin_avaliacao_subfamilias_family_id_d54664a9; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX admin_avaliacao_subfamilias_family_id_d54664a9 ON public.admin_avaliacao_subfamilias USING btree (family_id);


--
-- Name: admin_descricao_areas_name_97c816d1_like; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX admin_descricao_areas_name_97c816d1_like ON public.admin_descricao_areas USING btree (name varchar_pattern_ops);


--
-- Name: admin_descricao_areasespecializacoes_name_30dd6fad_like; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX admin_descricao_areasespecializacoes_name_30dd6fad_like ON public.admin_descricao_areasespecializacoes USING btree (name varchar_pattern_ops);


--
-- Name: admin_descricao_descricoes_area_specialization2_id_c78a5c2d; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX admin_descricao_descricoes_area_specialization2_id_c78a5c2d ON public.admin_descricao_descricoes USING btree (area_specialization2_id);


--
-- Name: admin_descricao_descricoes_area_specialization3_id_52420e16; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX admin_descricao_descricoes_area_specialization3_id_52420e16 ON public.admin_descricao_descricoes USING btree (area_specialization3_id);


--
-- Name: admin_descricao_descricoes_area_specialization4_id_aef89bb0; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX admin_descricao_descricoes_area_specialization4_id_aef89bb0 ON public.admin_descricao_descricoes USING btree (area_specialization4_id);


--
-- Name: admin_descricao_descricoes_area_specialization_id_395c0b27; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX admin_descricao_descricoes_area_specialization_id_395c0b27 ON public.admin_descricao_descricoes USING btree (area_specialization_id);


--
-- Name: admin_descricao_descricoes_areas2_id_1dfa3261; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX admin_descricao_descricoes_areas2_id_1dfa3261 ON public.admin_descricao_descricoes USING btree (areas2_id);


--
-- Name: admin_descricao_descricoes_areas3_id_b4b2d440; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX admin_descricao_descricoes_areas3_id_b4b2d440 ON public.admin_descricao_descricoes USING btree (areas3_id);


--
-- Name: admin_descricao_descricoes_areas4_id_a95fe181; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX admin_descricao_descricoes_areas4_id_a95fe181 ON public.admin_descricao_descricoes USING btree (areas4_id);


--
-- Name: admin_descricao_descricoes_areas_desired2_id_6a32c0de; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX admin_descricao_descricoes_areas_desired2_id_6a32c0de ON public.admin_descricao_descricoes USING btree (areas_desired2_id);


--
-- Name: admin_descricao_descricoes_areas_desired3_id_8c208d95; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX admin_descricao_descricoes_areas_desired3_id_8c208d95 ON public.admin_descricao_descricoes USING btree (areas_desired3_id);


--
-- Name: admin_descricao_descricoes_areas_desired4_id_989b5d3b; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX admin_descricao_descricoes_areas_desired4_id_989b5d3b ON public.admin_descricao_descricoes USING btree (areas_desired4_id);


--
-- Name: admin_descricao_descricoes_areas_desired_id_967007de; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX admin_descricao_descricoes_areas_desired_id_967007de ON public.admin_descricao_descricoes USING btree (areas_desired_id);


--
-- Name: admin_descricao_descricoes_areas_id_3a8cc29b; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX admin_descricao_descricoes_areas_id_3a8cc29b ON public.admin_descricao_descricoes USING btree (areas_id);


--
-- Name: admin_descricao_descricoes_experience_id_6aa0085f; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX admin_descricao_descricoes_experience_id_6aa0085f ON public.admin_descricao_descricoes USING btree (experience_id);


--
-- Name: admin_descricao_descricoes_family_id_f1f27ee3; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX admin_descricao_descricoes_family_id_f1f27ee3 ON public.admin_descricao_descricoes USING btree (family_id);


--
-- Name: admin_descricao_descricoes_formation_desired_id_ab847843; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX admin_descricao_descricoes_formation_desired_id_ab847843 ON public.admin_descricao_descricoes USING btree (formation_desired_id);


--
-- Name: admin_descricao_descricoes_formation_id_ca2f2259; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX admin_descricao_descricoes_formation_id_ca2f2259 ON public.admin_descricao_descricoes USING btree (formation_id);


--
-- Name: admin_descricao_descricoes_manage_team_id_ef9ea68a; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX admin_descricao_descricoes_manage_team_id_ef9ea68a ON public.admin_descricao_descricoes USING btree (manage_team_id);


--
-- Name: admin_descricao_descricoes_qualification2_id_e343312b; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX admin_descricao_descricoes_qualification2_id_e343312b ON public.admin_descricao_descricoes USING btree (qualification2_id);


--
-- Name: admin_descricao_descricoes_qualification3_id_1829a0fc; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX admin_descricao_descricoes_qualification3_id_1829a0fc ON public.admin_descricao_descricoes USING btree (qualification3_id);


--
-- Name: admin_descricao_descricoes_qualification4_id_3876fff0; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX admin_descricao_descricoes_qualification4_id_3876fff0 ON public.admin_descricao_descricoes USING btree (qualification4_id);


--
-- Name: admin_descricao_descricoes_qualification_id_c04c259e; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX admin_descricao_descricoes_qualification_id_c04c259e ON public.admin_descricao_descricoes USING btree (qualification_id);


--
-- Name: admin_descricao_descricoes_specialization_id_ff62d1d1; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX admin_descricao_descricoes_specialization_id_ff62d1d1 ON public.admin_descricao_descricoes USING btree (specialization_id);


--
-- Name: admin_descricao_descricoes_sub_familia_id_ef474526; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX admin_descricao_descricoes_sub_familia_id_ef474526 ON public.admin_descricao_descricoes USING btree (sub_familia_id);


--
-- Name: admin_descricao_descricoes_title_4a2bc489_like; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX admin_descricao_descricoes_title_4a2bc489_like ON public.admin_descricao_descricoes USING btree (title varchar_pattern_ops);


--
-- Name: admin_descricao_especializacoes_name_c6cc73ea_like; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX admin_descricao_especializacoes_name_c6cc73ea_like ON public.admin_descricao_especializacoes USING btree (name varchar_pattern_ops);


--
-- Name: admin_descricao_experiencias_name_04579892_like; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX admin_descricao_experiencias_name_04579892_like ON public.admin_descricao_experiencias USING btree (name varchar_pattern_ops);


--
-- Name: admin_descricao_formacao_name_61d5a245_like; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX admin_descricao_formacao_name_61d5a245_like ON public.admin_descricao_formacao USING btree (name varchar_pattern_ops);


--
-- Name: admin_descricao_gerencia_name_49d2993f_like; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX admin_descricao_gerencia_name_49d2993f_like ON public.admin_descricao_gerencia USING btree (name varchar_pattern_ops);


--
-- Name: admin_descricao_habilitacoes_name_8444aef6_like; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX admin_descricao_habilitacoes_name_8444aef6_like ON public.admin_descricao_habilitacoes USING btree (name varchar_pattern_ops);


--
-- Name: admin_descricao_idiomas_name_cd5e2a69_like; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX admin_descricao_idiomas_name_cd5e2a69_like ON public.admin_descricao_idiomas USING btree (name varchar_pattern_ops);


--
-- Name: admin_descricao_niveis_name_07590c41_like; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX admin_descricao_niveis_name_07590c41_like ON public.admin_descricao_niveis USING btree (name varchar_pattern_ops);


--
-- Name: admin_descricao_proficiencias_name_ddb69049_like; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX admin_descricao_proficiencias_name_ddb69049_like ON public.admin_descricao_proficiencias USING btree (name varchar_pattern_ops);


--
-- Name: admin_descricao_status_name_b3bb1440_like; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX admin_descricao_status_name_b3bb1440_like ON public.admin_descricao_status USING btree (name varchar_pattern_ops);


--
-- Name: admin_geral_governanca_name_6cd6fdaf_like; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX admin_geral_governanca_name_6cd6fdaf_like ON public.admin_geral_governanca USING btree (name varchar_pattern_ops);


--
-- Name: admin_geral_origemcapital_name_b7f26d9c_like; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX admin_geral_origemcapital_name_b7f26d9c_like ON public.admin_geral_origemcapital USING btree (name varchar_pattern_ops);


--
-- Name: admin_geral_plans_name_ae1e608b_like; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX admin_geral_plans_name_ae1e608b_like ON public.admin_geral_plans USING btree (name varchar_pattern_ops);


--
-- Name: admin_geral_plansavaliacao_name_86ba723d_like; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX admin_geral_plansavaliacao_name_86ba723d_like ON public.admin_geral_plansavaliacao USING btree (name varchar_pattern_ops);


--
-- Name: admin_geral_sector_name_df66d8d2_like; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX admin_geral_sector_name_df66d8d2_like ON public.admin_geral_sector USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: avaliacao_avaliacao_area_id_233775be; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX avaliacao_avaliacao_area_id_233775be ON public.avaliacao_avaliacao USING btree (area_id);


--
-- Name: avaliacao_avaliacao_board_id_63bc9f18; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX avaliacao_avaliacao_board_id_63bc9f18 ON public.avaliacao_avaliacao USING btree (board_id);


--
-- Name: avaliacao_avaliacao_company_id_fef51a7e; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX avaliacao_avaliacao_company_id_fef51a7e ON public.avaliacao_avaliacao USING btree (company_id);


--
-- Name: avaliacao_avaliacao_factor1_id_634eb7cc; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX avaliacao_avaliacao_factor1_id_634eb7cc ON public.avaliacao_avaliacao USING btree (factor1_id);


--
-- Name: avaliacao_avaliacao_factor2_id_8a7e45b1; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX avaliacao_avaliacao_factor2_id_8a7e45b1 ON public.avaliacao_avaliacao USING btree (factor2_id);


--
-- Name: avaliacao_avaliacao_factor3_id_7a0d5602; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX avaliacao_avaliacao_factor3_id_7a0d5602 ON public.avaliacao_avaliacao USING btree (factor3_id);


--
-- Name: avaliacao_avaliacao_factor4_id_17b26ee4; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX avaliacao_avaliacao_factor4_id_17b26ee4 ON public.avaliacao_avaliacao USING btree (factor4_id);


--
-- Name: avaliacao_avaliacao_factor5_id_4008777b; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX avaliacao_avaliacao_factor5_id_4008777b ON public.avaliacao_avaliacao USING btree (factor5_id);


--
-- Name: avaliacao_avaliacao_factor6_id_7bb754db; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX avaliacao_avaliacao_factor6_id_7bb754db ON public.avaliacao_avaliacao USING btree (factor6_id);


--
-- Name: avaliacao_avaliacao_factor7_id_48199109; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX avaliacao_avaliacao_factor7_id_48199109 ON public.avaliacao_avaliacao USING btree (factor7_id);


--
-- Name: avaliacao_avaliacao_factor8_id_8403c22a; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX avaliacao_avaliacao_factor8_id_8403c22a ON public.avaliacao_avaliacao USING btree (factor8_id);


--
-- Name: avaliacao_avaliacao_family_id_493b39e7; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX avaliacao_avaliacao_family_id_493b39e7 ON public.avaliacao_avaliacao USING btree (family_id);


--
-- Name: avaliacao_avaliacao_formation_id_e2c9b2a0; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX avaliacao_avaliacao_formation_id_e2c9b2a0 ON public.avaliacao_avaliacao USING btree (formation_id);


--
-- Name: avaliacao_avaliacao_governanca_id_74cd4a7f; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX avaliacao_avaliacao_governanca_id_74cd4a7f ON public.avaliacao_avaliacao USING btree (governanca_id);


--
-- Name: avaliacao_avaliacao_grade_id_6ea3b289; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX avaliacao_avaliacao_grade_id_6ea3b289 ON public.avaliacao_avaliacao USING btree (grade_id);


--
-- Name: avaliacao_avaliacao_level1_id_cbf47153; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX avaliacao_avaliacao_level1_id_cbf47153 ON public.avaliacao_avaliacao USING btree (level1_id);


--
-- Name: avaliacao_avaliacao_level2_id_540adcfe; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX avaliacao_avaliacao_level2_id_540adcfe ON public.avaliacao_avaliacao USING btree (level2_id);


--
-- Name: avaliacao_avaliacao_level3_id_344b076d; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX avaliacao_avaliacao_level3_id_344b076d ON public.avaliacao_avaliacao USING btree (level3_id);


--
-- Name: avaliacao_avaliacao_level4_id_d35ca57f; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX avaliacao_avaliacao_level4_id_d35ca57f ON public.avaliacao_avaliacao USING btree (level4_id);


--
-- Name: avaliacao_avaliacao_level5_id_d0ab2780; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX avaliacao_avaliacao_level5_id_d0ab2780 ON public.avaliacao_avaliacao USING btree (level5_id);


--
-- Name: avaliacao_avaliacao_level6_id_b344e382; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX avaliacao_avaliacao_level6_id_b344e382 ON public.avaliacao_avaliacao USING btree (level6_id);


--
-- Name: avaliacao_avaliacao_level7_id_f201c498; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX avaliacao_avaliacao_level7_id_f201c498 ON public.avaliacao_avaliacao USING btree (level7_id);


--
-- Name: avaliacao_avaliacao_level8_id_752dc705; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX avaliacao_avaliacao_level8_id_752dc705 ON public.avaliacao_avaliacao USING btree (level8_id);


--
-- Name: avaliacao_avaliacao_manage_team_id_275ea832; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX avaliacao_avaliacao_manage_team_id_275ea832 ON public.avaliacao_avaliacao USING btree (manage_team_id);


--
-- Name: avaliacao_avaliacao_origin_id_4352d21d; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX avaliacao_avaliacao_origin_id_4352d21d ON public.avaliacao_avaliacao USING btree (origin_id);


--
-- Name: avaliacao_avaliacao_size_id_90487529; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX avaliacao_avaliacao_size_id_90487529 ON public.avaliacao_avaliacao USING btree (size_id);


--
-- Name: avaliacao_avaliacao_sub_familia_id_6aacf7a0; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX avaliacao_avaliacao_sub_familia_id_6aacf7a0 ON public.avaliacao_avaliacao USING btree (sub_familia_id);


--
-- Name: avaliacao_avaliacao_tenant_id_0aaa87b0; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX avaliacao_avaliacao_tenant_id_0aaa87b0 ON public.avaliacao_avaliacao USING btree (tenant_id);


--
-- Name: avaliacao_avaliacao_title_super_id_3a389e8b; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX avaliacao_avaliacao_title_super_id_3a389e8b ON public.avaliacao_avaliacao USING btree (title_super_id);


--
-- Name: avaliacao_superior_tenant_id_ea0d8092; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX avaliacao_superior_tenant_id_ea0d8092 ON public.avaliacao_superior USING btree (tenant_id);


--
-- Name: background_task_attempts_a9ade23d; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX background_task_attempts_a9ade23d ON public.background_task USING btree (attempts);


--
-- Name: background_task_completedtask_attempts_772a6783; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX background_task_completedtask_attempts_772a6783 ON public.background_task_completedtask USING btree (attempts);


--
-- Name: background_task_completedtask_creator_content_type_id_21d6a741; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX background_task_completedtask_creator_content_type_id_21d6a741 ON public.background_task_completedtask USING btree (creator_content_type_id);


--
-- Name: background_task_completedtask_failed_at_3de56618; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX background_task_completedtask_failed_at_3de56618 ON public.background_task_completedtask USING btree (failed_at);


--
-- Name: background_task_completedtask_locked_at_29c62708; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX background_task_completedtask_locked_at_29c62708 ON public.background_task_completedtask USING btree (locked_at);


--
-- Name: background_task_completedtask_locked_by_edc8a213; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX background_task_completedtask_locked_by_edc8a213 ON public.background_task_completedtask USING btree (locked_by);


--
-- Name: background_task_completedtask_locked_by_edc8a213_like; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX background_task_completedtask_locked_by_edc8a213_like ON public.background_task_completedtask USING btree (locked_by varchar_pattern_ops);


--
-- Name: background_task_completedtask_priority_9080692e; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX background_task_completedtask_priority_9080692e ON public.background_task_completedtask USING btree (priority);


--
-- Name: background_task_completedtask_queue_61fb0415; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX background_task_completedtask_queue_61fb0415 ON public.background_task_completedtask USING btree (queue);


--
-- Name: background_task_completedtask_queue_61fb0415_like; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX background_task_completedtask_queue_61fb0415_like ON public.background_task_completedtask USING btree (queue varchar_pattern_ops);


--
-- Name: background_task_completedtask_run_at_77c80f34; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX background_task_completedtask_run_at_77c80f34 ON public.background_task_completedtask USING btree (run_at);


--
-- Name: background_task_completedtask_task_hash_91187576; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX background_task_completedtask_task_hash_91187576 ON public.background_task_completedtask USING btree (task_hash);


--
-- Name: background_task_completedtask_task_hash_91187576_like; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX background_task_completedtask_task_hash_91187576_like ON public.background_task_completedtask USING btree (task_hash varchar_pattern_ops);


--
-- Name: background_task_completedtask_task_name_388dabc2; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX background_task_completedtask_task_name_388dabc2 ON public.background_task_completedtask USING btree (task_name);


--
-- Name: background_task_completedtask_task_name_388dabc2_like; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX background_task_completedtask_task_name_388dabc2_like ON public.background_task_completedtask USING btree (task_name varchar_pattern_ops);


--
-- Name: background_task_creator_content_type_id_61cc9af3; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX background_task_creator_content_type_id_61cc9af3 ON public.background_task USING btree (creator_content_type_id);


--
-- Name: background_task_failed_at_b81bba14; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX background_task_failed_at_b81bba14 ON public.background_task USING btree (failed_at);


--
-- Name: background_task_locked_at_0fb0f225; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX background_task_locked_at_0fb0f225 ON public.background_task USING btree (locked_at);


--
-- Name: background_task_locked_by_db7779e3; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX background_task_locked_by_db7779e3 ON public.background_task USING btree (locked_by);


--
-- Name: background_task_locked_by_db7779e3_like; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX background_task_locked_by_db7779e3_like ON public.background_task USING btree (locked_by varchar_pattern_ops);


--
-- Name: background_task_priority_88bdbce9; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX background_task_priority_88bdbce9 ON public.background_task USING btree (priority);


--
-- Name: background_task_queue_1d5f3a40; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX background_task_queue_1d5f3a40 ON public.background_task USING btree (queue);


--
-- Name: background_task_queue_1d5f3a40_like; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX background_task_queue_1d5f3a40_like ON public.background_task USING btree (queue varchar_pattern_ops);


--
-- Name: background_task_run_at_7baca3aa; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX background_task_run_at_7baca3aa ON public.background_task USING btree (run_at);


--
-- Name: background_task_task_hash_d8f233bd; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX background_task_task_hash_d8f233bd ON public.background_task USING btree (task_hash);


--
-- Name: background_task_task_hash_d8f233bd_like; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX background_task_task_hash_d8f233bd_like ON public.background_task USING btree (task_hash varchar_pattern_ops);


--
-- Name: background_task_task_name_4562d56a; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX background_task_task_name_4562d56a ON public.background_task USING btree (task_name);


--
-- Name: background_task_task_name_4562d56a_like; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX background_task_task_name_4562d56a_like ON public.background_task USING btree (task_name varchar_pattern_ops);


--
-- Name: descricao_descricao_approver_id_1511ad4c; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX descricao_descricao_approver_id_1511ad4c ON public.descricao_descricao USING btree (approver_id);


--
-- Name: descricao_descricao_area_id_aa9dfa68; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX descricao_descricao_area_id_aa9dfa68 ON public.descricao_descricao USING btree (area_id);


--
-- Name: descricao_descricao_area_specialization2_id_aea25bab; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX descricao_descricao_area_specialization2_id_aea25bab ON public.descricao_descricao USING btree (area_specialization2_id);


--
-- Name: descricao_descricao_area_specialization3_id_f6281065; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX descricao_descricao_area_specialization3_id_f6281065 ON public.descricao_descricao USING btree (area_specialization3_id);


--
-- Name: descricao_descricao_area_specialization4_id_7ccfedb0; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX descricao_descricao_area_specialization4_id_7ccfedb0 ON public.descricao_descricao USING btree (area_specialization4_id);


--
-- Name: descricao_descricao_area_specialization_id_786880e4; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX descricao_descricao_area_specialization_id_786880e4 ON public.descricao_descricao USING btree (area_specialization_id);


--
-- Name: descricao_descricao_areas2_id_fe5fff9e; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX descricao_descricao_areas2_id_fe5fff9e ON public.descricao_descricao USING btree (areas2_id);


--
-- Name: descricao_descricao_areas3_id_77eb6c45; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX descricao_descricao_areas3_id_77eb6c45 ON public.descricao_descricao USING btree (areas3_id);


--
-- Name: descricao_descricao_areas4_id_63d67850; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX descricao_descricao_areas4_id_63d67850 ON public.descricao_descricao USING btree (areas4_id);


--
-- Name: descricao_descricao_areas_desired2_id_43d778f5; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX descricao_descricao_areas_desired2_id_43d778f5 ON public.descricao_descricao USING btree (areas_desired2_id);


--
-- Name: descricao_descricao_areas_desired3_id_4a43a0f0; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX descricao_descricao_areas_desired3_id_4a43a0f0 ON public.descricao_descricao USING btree (areas_desired3_id);


--
-- Name: descricao_descricao_areas_desired4_id_f0913701; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX descricao_descricao_areas_desired4_id_f0913701 ON public.descricao_descricao USING btree (areas_desired4_id);


--
-- Name: descricao_descricao_areas_desired_id_6eac839f; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX descricao_descricao_areas_desired_id_6eac839f ON public.descricao_descricao USING btree (areas_desired_id);


--
-- Name: descricao_descricao_areas_id_18f920b4; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX descricao_descricao_areas_id_18f920b4 ON public.descricao_descricao USING btree (areas_id);


--
-- Name: descricao_descricao_board_id_98f2ebf2; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX descricao_descricao_board_id_98f2ebf2 ON public.descricao_descricao USING btree (board_id);


--
-- Name: descricao_descricao_experience_id_55664a0d; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX descricao_descricao_experience_id_55664a0d ON public.descricao_descricao USING btree (experience_id);


--
-- Name: descricao_descricao_family_id_ecc1ca99; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX descricao_descricao_family_id_ecc1ca99 ON public.descricao_descricao USING btree (family_id);


--
-- Name: descricao_descricao_formation_desired_id_ac4ad8ae; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX descricao_descricao_formation_desired_id_ac4ad8ae ON public.descricao_descricao USING btree (formation_desired_id);


--
-- Name: descricao_descricao_formation_id_ed5e9f01; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX descricao_descricao_formation_id_ed5e9f01 ON public.descricao_descricao USING btree (formation_id);


--
-- Name: descricao_descricao_idioma2_id_d854abc0; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX descricao_descricao_idioma2_id_d854abc0 ON public.descricao_descricao USING btree (idioma2_id);


--
-- Name: descricao_descricao_idioma3_id_cb025522; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX descricao_descricao_idioma3_id_cb025522 ON public.descricao_descricao USING btree (idioma3_id);


--
-- Name: descricao_descricao_idioma_id_16f2c535; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX descricao_descricao_idioma_id_16f2c535 ON public.descricao_descricao USING btree (idioma_id);


--
-- Name: descricao_descricao_level_id_4dabcc1a; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX descricao_descricao_level_id_4dabcc1a ON public.descricao_descricao USING btree (level_id);


--
-- Name: descricao_descricao_manage_team_id_6ed7aaf2; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX descricao_descricao_manage_team_id_6ed7aaf2 ON public.descricao_descricao USING btree (manage_team_id);


--
-- Name: descricao_descricao_proficiency2_id_2f9a6e42; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX descricao_descricao_proficiency2_id_2f9a6e42 ON public.descricao_descricao USING btree (proficiency2_id);


--
-- Name: descricao_descricao_proficiency3_id_a7e663b0; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX descricao_descricao_proficiency3_id_a7e663b0 ON public.descricao_descricao USING btree (proficiency3_id);


--
-- Name: descricao_descricao_proficiency_id_a34f1dc1; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX descricao_descricao_proficiency_id_a34f1dc1 ON public.descricao_descricao USING btree (proficiency_id);


--
-- Name: descricao_descricao_qualification2_id_a0c12ea5; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX descricao_descricao_qualification2_id_a0c12ea5 ON public.descricao_descricao USING btree (qualification2_id);


--
-- Name: descricao_descricao_qualification3_id_33ef758e; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX descricao_descricao_qualification3_id_33ef758e ON public.descricao_descricao USING btree (qualification3_id);


--
-- Name: descricao_descricao_qualification_id_2f975c9b; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX descricao_descricao_qualification_id_2f975c9b ON public.descricao_descricao USING btree (qualification_id);


--
-- Name: descricao_descricao_sector_id_109267b7; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX descricao_descricao_sector_id_109267b7 ON public.descricao_descricao USING btree (sector_id);


--
-- Name: descricao_descricao_specialization_id_9f5e0082; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX descricao_descricao_specialization_id_9f5e0082 ON public.descricao_descricao USING btree (specialization_id);


--
-- Name: descricao_descricao_status_id_51760856; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX descricao_descricao_status_id_51760856 ON public.descricao_descricao USING btree (status_id);


--
-- Name: descricao_descricao_sub_familia_id_edd0798b; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX descricao_descricao_sub_familia_id_edd0798b ON public.descricao_descricao USING btree (sub_familia_id);


--
-- Name: descricao_descricao_tenant_id_76c1d531; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX descricao_descricao_tenant_id_76c1d531 ON public.descricao_descricao USING btree (tenant_id);


--
-- Name: descricao_descricao_user_id_id_22f6d6f6; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX descricao_descricao_user_id_id_22f6d6f6 ON public.descricao_descricao USING btree (user_id_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: master_area_board_id_14149ddc; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX master_area_board_id_14149ddc ON public.master_area USING btree (board_id);


--
-- Name: master_area_tenant_id_8051a2b2; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX master_area_tenant_id_8051a2b2 ON public.master_area USING btree (tenant_id);


--
-- Name: master_diretoria_tenant_id_e3f12bbe; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX master_diretoria_tenant_id_e3f12bbe ON public.master_diretoria USING btree (tenant_id);


--
-- Name: person_person_cpf_f16f6b8c_like; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX person_person_cpf_f16f6b8c_like ON public.person_person USING btree (cpf varchar_pattern_ops);


--
-- Name: person_person_name_c7a6309b_like; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX person_person_name_c7a6309b_like ON public.person_person USING btree (name varchar_pattern_ops);


--
-- Name: person_person_tenant_id_71dedc16; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX person_person_tenant_id_71dedc16 ON public.person_person USING btree (tenant_id);


--
-- Name: tenants_tenant_company_id_7274853e; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX tenants_tenant_company_id_7274853e ON public.tenants_tenant USING btree (company_id);


--
-- Name: tenants_tenant_core_id_97b1d1e7; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX tenants_tenant_core_id_97b1d1e7 ON public.tenants_tenant USING btree (core_id);


--
-- Name: tenants_tenant_governanca_id_82d5d7ed; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX tenants_tenant_governanca_id_82d5d7ed ON public.tenants_tenant USING btree (governanca_id);


--
-- Name: tenants_tenant_name_a74dac10_like; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX tenants_tenant_name_a74dac10_like ON public.tenants_tenant USING btree (name varchar_pattern_ops);


--
-- Name: tenants_tenant_origin_id_53c78e18; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX tenants_tenant_origin_id_53c78e18 ON public.tenants_tenant USING btree (origin_id);


--
-- Name: tenants_tenant_plano_id_9b1ba42a; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX tenants_tenant_plano_id_9b1ba42a ON public.tenants_tenant USING btree (plano_id);


--
-- Name: tenants_tenant_planoaval_id_30621853; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX tenants_tenant_planoaval_id_30621853 ON public.tenants_tenant USING btree (planoaval_id);


--
-- Name: tenants_tenant_sector_id_d9715b32; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX tenants_tenant_sector_id_d9715b32 ON public.tenants_tenant USING btree (sector_id);


--
-- Name: tenants_tenant_size_id_1c14fb9b; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX tenants_tenant_size_id_1c14fb9b ON public.tenants_tenant USING btree (size_id);


--
-- Name: user_account_customuser_default_tenant_id_615a2a3a; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX user_account_customuser_default_tenant_id_615a2a3a ON public.user_account_customuser USING btree (default_tenant_id);


--
-- Name: user_account_customuser_email_0e4de46b_like; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX user_account_customuser_email_0e4de46b_like ON public.user_account_customuser USING btree (email varchar_pattern_ops);


--
-- Name: user_account_customuser_groups_customuser_id_bc48d9d5; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX user_account_customuser_groups_customuser_id_bc48d9d5 ON public.user_account_customuser_groups USING btree (customuser_id);


--
-- Name: user_account_customuser_groups_group_id_e60f5d50; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX user_account_customuser_groups_group_id_e60f5d50 ON public.user_account_customuser_groups USING btree (group_id);


--
-- Name: user_account_customuser_tenants_customuser_id_baa39dcb; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX user_account_customuser_tenants_customuser_id_baa39dcb ON public.user_account_customuser_tenants USING btree (customuser_id);


--
-- Name: user_account_customuser_tenants_tenant_id_aec95365; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX user_account_customuser_tenants_tenant_id_aec95365 ON public.user_account_customuser_tenants USING btree (tenant_id);


--
-- Name: user_account_customuser_user_permissions_customuser_id_0c5cabee; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX user_account_customuser_user_permissions_customuser_id_0c5cabee ON public.user_account_customuser_user_permissions USING btree (customuser_id);


--
-- Name: user_account_customuser_user_permissions_permission_id_6fe066e3; Type: INDEX; Schema: public; Owner: cristiano
--

CREATE INDEX user_account_customuser_user_permissions_permission_id_6fe066e3 ON public.user_account_customuser_user_permissions USING btree (permission_id);


--
-- Name: admin_avaliacao_matrizes admin_avaliacao_matr_factor_id_2ebb57d4_fk_admin_ava; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_avaliacao_matrizes
    ADD CONSTRAINT admin_avaliacao_matr_factor_id_2ebb57d4_fk_admin_ava FOREIGN KEY (factor_id) REFERENCES public.admin_avaliacao_fatores(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: admin_avaliacao_matrizes admin_avaliacao_matr_level_id_3514d2d1_fk_admin_ava; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_avaliacao_matrizes
    ADD CONSTRAINT admin_avaliacao_matr_level_id_3514d2d1_fk_admin_ava FOREIGN KEY (level_id) REFERENCES public.admin_avaliacao_niveis(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: admin_avaliacao_niveis admin_avaliacao_nive_factor_id_cef10059_fk_admin_ava; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_avaliacao_niveis
    ADD CONSTRAINT admin_avaliacao_nive_factor_id_cef10059_fk_admin_ava FOREIGN KEY (factor_id) REFERENCES public.admin_avaliacao_fatores(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: admin_avaliacao_subfamilias admin_avaliacao_subf_family_id_d54664a9_fk_admin_ava; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_avaliacao_subfamilias
    ADD CONSTRAINT admin_avaliacao_subf_family_id_d54664a9_fk_admin_ava FOREIGN KEY (family_id) REFERENCES public.admin_avaliacao_familias(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: admin_descricao_descricoes admin_descricao_desc_area_specialization2_c78a5c2d_fk_admin_des; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_descricoes
    ADD CONSTRAINT admin_descricao_desc_area_specialization2_c78a5c2d_fk_admin_des FOREIGN KEY (area_specialization2_id) REFERENCES public.admin_descricao_areas(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: admin_descricao_descricoes admin_descricao_desc_area_specialization3_52420e16_fk_admin_des; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_descricoes
    ADD CONSTRAINT admin_descricao_desc_area_specialization3_52420e16_fk_admin_des FOREIGN KEY (area_specialization3_id) REFERENCES public.admin_descricao_areas(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: admin_descricao_descricoes admin_descricao_desc_area_specialization4_aef89bb0_fk_admin_des; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_descricoes
    ADD CONSTRAINT admin_descricao_desc_area_specialization4_aef89bb0_fk_admin_des FOREIGN KEY (area_specialization4_id) REFERENCES public.admin_descricao_areas(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: admin_descricao_descricoes admin_descricao_desc_area_specialization__395c0b27_fk_admin_des; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_descricoes
    ADD CONSTRAINT admin_descricao_desc_area_specialization__395c0b27_fk_admin_des FOREIGN KEY (area_specialization_id) REFERENCES public.admin_descricao_areas(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: admin_descricao_descricoes admin_descricao_desc_areas2_id_1dfa3261_fk_admin_des; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_descricoes
    ADD CONSTRAINT admin_descricao_desc_areas2_id_1dfa3261_fk_admin_des FOREIGN KEY (areas2_id) REFERENCES public.admin_descricao_areas(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: admin_descricao_descricoes admin_descricao_desc_areas3_id_b4b2d440_fk_admin_des; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_descricoes
    ADD CONSTRAINT admin_descricao_desc_areas3_id_b4b2d440_fk_admin_des FOREIGN KEY (areas3_id) REFERENCES public.admin_descricao_areas(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: admin_descricao_descricoes admin_descricao_desc_areas4_id_a95fe181_fk_admin_des; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_descricoes
    ADD CONSTRAINT admin_descricao_desc_areas4_id_a95fe181_fk_admin_des FOREIGN KEY (areas4_id) REFERENCES public.admin_descricao_areas(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: admin_descricao_descricoes admin_descricao_desc_areas_desired2_id_6a32c0de_fk_admin_des; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_descricoes
    ADD CONSTRAINT admin_descricao_desc_areas_desired2_id_6a32c0de_fk_admin_des FOREIGN KEY (areas_desired2_id) REFERENCES public.admin_descricao_areas(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: admin_descricao_descricoes admin_descricao_desc_areas_desired3_id_8c208d95_fk_admin_des; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_descricoes
    ADD CONSTRAINT admin_descricao_desc_areas_desired3_id_8c208d95_fk_admin_des FOREIGN KEY (areas_desired3_id) REFERENCES public.admin_descricao_areas(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: admin_descricao_descricoes admin_descricao_desc_areas_desired4_id_989b5d3b_fk_admin_des; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_descricoes
    ADD CONSTRAINT admin_descricao_desc_areas_desired4_id_989b5d3b_fk_admin_des FOREIGN KEY (areas_desired4_id) REFERENCES public.admin_descricao_areas(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: admin_descricao_descricoes admin_descricao_desc_areas_desired_id_967007de_fk_admin_des; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_descricoes
    ADD CONSTRAINT admin_descricao_desc_areas_desired_id_967007de_fk_admin_des FOREIGN KEY (areas_desired_id) REFERENCES public.admin_descricao_areas(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: admin_descricao_descricoes admin_descricao_desc_areas_id_3a8cc29b_fk_admin_des; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_descricoes
    ADD CONSTRAINT admin_descricao_desc_areas_id_3a8cc29b_fk_admin_des FOREIGN KEY (areas_id) REFERENCES public.admin_descricao_areas(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: admin_descricao_descricoes admin_descricao_desc_experience_id_6aa0085f_fk_admin_des; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_descricoes
    ADD CONSTRAINT admin_descricao_desc_experience_id_6aa0085f_fk_admin_des FOREIGN KEY (experience_id) REFERENCES public.admin_descricao_experiencias(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: admin_descricao_descricoes admin_descricao_desc_family_id_f1f27ee3_fk_admin_ava; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_descricoes
    ADD CONSTRAINT admin_descricao_desc_family_id_f1f27ee3_fk_admin_ava FOREIGN KEY (family_id) REFERENCES public.admin_avaliacao_familias(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: admin_descricao_descricoes admin_descricao_desc_formation_desired_id_ab847843_fk_admin_des; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_descricoes
    ADD CONSTRAINT admin_descricao_desc_formation_desired_id_ab847843_fk_admin_des FOREIGN KEY (formation_desired_id) REFERENCES public.admin_descricao_formacao(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: admin_descricao_descricoes admin_descricao_desc_formation_id_ca2f2259_fk_admin_des; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_descricoes
    ADD CONSTRAINT admin_descricao_desc_formation_id_ca2f2259_fk_admin_des FOREIGN KEY (formation_id) REFERENCES public.admin_descricao_formacao(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: admin_descricao_descricoes admin_descricao_desc_manage_team_id_ef9ea68a_fk_admin_des; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_descricoes
    ADD CONSTRAINT admin_descricao_desc_manage_team_id_ef9ea68a_fk_admin_des FOREIGN KEY (manage_team_id) REFERENCES public.admin_descricao_gerencia(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: admin_descricao_descricoes admin_descricao_desc_qualification2_id_e343312b_fk_admin_des; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_descricoes
    ADD CONSTRAINT admin_descricao_desc_qualification2_id_e343312b_fk_admin_des FOREIGN KEY (qualification2_id) REFERENCES public.admin_descricao_habilitacoes(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: admin_descricao_descricoes admin_descricao_desc_qualification3_id_1829a0fc_fk_admin_des; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_descricoes
    ADD CONSTRAINT admin_descricao_desc_qualification3_id_1829a0fc_fk_admin_des FOREIGN KEY (qualification3_id) REFERENCES public.admin_descricao_habilitacoes(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: admin_descricao_descricoes admin_descricao_desc_qualification4_id_3876fff0_fk_admin_des; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_descricoes
    ADD CONSTRAINT admin_descricao_desc_qualification4_id_3876fff0_fk_admin_des FOREIGN KEY (qualification4_id) REFERENCES public.admin_descricao_habilitacoes(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: admin_descricao_descricoes admin_descricao_desc_qualification_id_c04c259e_fk_admin_des; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_descricoes
    ADD CONSTRAINT admin_descricao_desc_qualification_id_c04c259e_fk_admin_des FOREIGN KEY (qualification_id) REFERENCES public.admin_descricao_habilitacoes(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: admin_descricao_descricoes admin_descricao_desc_specialization_id_ff62d1d1_fk_admin_des; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_descricoes
    ADD CONSTRAINT admin_descricao_desc_specialization_id_ff62d1d1_fk_admin_des FOREIGN KEY (specialization_id) REFERENCES public.admin_descricao_especializacoes(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: admin_descricao_descricoes admin_descricao_desc_sub_familia_id_ef474526_fk_admin_ava; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.admin_descricao_descricoes
    ADD CONSTRAINT admin_descricao_desc_sub_familia_id_ef474526_fk_admin_ava FOREIGN KEY (sub_familia_id) REFERENCES public.admin_avaliacao_subfamilias(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: avaliacao_avaliacao avaliacao_avaliacao_area_id_233775be_fk_master_area_id; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.avaliacao_avaliacao
    ADD CONSTRAINT avaliacao_avaliacao_area_id_233775be_fk_master_area_id FOREIGN KEY (area_id) REFERENCES public.master_area(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: avaliacao_avaliacao avaliacao_avaliacao_board_id_63bc9f18_fk_master_diretoria_id; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.avaliacao_avaliacao
    ADD CONSTRAINT avaliacao_avaliacao_board_id_63bc9f18_fk_master_diretoria_id FOREIGN KEY (board_id) REFERENCES public.master_diretoria(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: avaliacao_avaliacao avaliacao_avaliacao_company_id_fef51a7e_fk_admin_ger; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.avaliacao_avaliacao
    ADD CONSTRAINT avaliacao_avaliacao_company_id_fef51a7e_fk_admin_ger FOREIGN KEY (company_id) REFERENCES public.admin_geral_tipoempresa(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: avaliacao_avaliacao avaliacao_avaliacao_factor1_id_634eb7cc_fk_admin_ava; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.avaliacao_avaliacao
    ADD CONSTRAINT avaliacao_avaliacao_factor1_id_634eb7cc_fk_admin_ava FOREIGN KEY (factor1_id) REFERENCES public.admin_avaliacao_fatores(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: avaliacao_avaliacao avaliacao_avaliacao_factor2_id_8a7e45b1_fk_admin_ava; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.avaliacao_avaliacao
    ADD CONSTRAINT avaliacao_avaliacao_factor2_id_8a7e45b1_fk_admin_ava FOREIGN KEY (factor2_id) REFERENCES public.admin_avaliacao_fatores(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: avaliacao_avaliacao avaliacao_avaliacao_factor3_id_7a0d5602_fk_admin_ava; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.avaliacao_avaliacao
    ADD CONSTRAINT avaliacao_avaliacao_factor3_id_7a0d5602_fk_admin_ava FOREIGN KEY (factor3_id) REFERENCES public.admin_avaliacao_fatores(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: avaliacao_avaliacao avaliacao_avaliacao_factor4_id_17b26ee4_fk_admin_ava; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.avaliacao_avaliacao
    ADD CONSTRAINT avaliacao_avaliacao_factor4_id_17b26ee4_fk_admin_ava FOREIGN KEY (factor4_id) REFERENCES public.admin_avaliacao_fatores(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: avaliacao_avaliacao avaliacao_avaliacao_factor5_id_4008777b_fk_admin_ava; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.avaliacao_avaliacao
    ADD CONSTRAINT avaliacao_avaliacao_factor5_id_4008777b_fk_admin_ava FOREIGN KEY (factor5_id) REFERENCES public.admin_avaliacao_fatores(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: avaliacao_avaliacao avaliacao_avaliacao_factor6_id_7bb754db_fk_admin_ava; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.avaliacao_avaliacao
    ADD CONSTRAINT avaliacao_avaliacao_factor6_id_7bb754db_fk_admin_ava FOREIGN KEY (factor6_id) REFERENCES public.admin_avaliacao_fatores(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: avaliacao_avaliacao avaliacao_avaliacao_factor7_id_48199109_fk_admin_ava; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.avaliacao_avaliacao
    ADD CONSTRAINT avaliacao_avaliacao_factor7_id_48199109_fk_admin_ava FOREIGN KEY (factor7_id) REFERENCES public.admin_avaliacao_fatores(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: avaliacao_avaliacao avaliacao_avaliacao_factor8_id_8403c22a_fk_admin_ava; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.avaliacao_avaliacao
    ADD CONSTRAINT avaliacao_avaliacao_factor8_id_8403c22a_fk_admin_ava FOREIGN KEY (factor8_id) REFERENCES public.admin_avaliacao_fatores(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: avaliacao_avaliacao avaliacao_avaliacao_family_id_493b39e7_fk_admin_ava; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.avaliacao_avaliacao
    ADD CONSTRAINT avaliacao_avaliacao_family_id_493b39e7_fk_admin_ava FOREIGN KEY (family_id) REFERENCES public.admin_avaliacao_familias(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: avaliacao_avaliacao avaliacao_avaliacao_formation_id_e2c9b2a0_fk_admin_des; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.avaliacao_avaliacao
    ADD CONSTRAINT avaliacao_avaliacao_formation_id_e2c9b2a0_fk_admin_des FOREIGN KEY (formation_id) REFERENCES public.admin_descricao_formacao(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: avaliacao_avaliacao avaliacao_avaliacao_governanca_id_74cd4a7f_fk_admin_ger; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.avaliacao_avaliacao
    ADD CONSTRAINT avaliacao_avaliacao_governanca_id_74cd4a7f_fk_admin_ger FOREIGN KEY (governanca_id) REFERENCES public.admin_geral_governanca(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: avaliacao_avaliacao avaliacao_avaliacao_grade_id_6ea3b289_fk_admin_ava; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.avaliacao_avaliacao
    ADD CONSTRAINT avaliacao_avaliacao_grade_id_6ea3b289_fk_admin_ava FOREIGN KEY (grade_id) REFERENCES public.admin_avaliacao_combinacoes(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: avaliacao_avaliacao avaliacao_avaliacao_level1_id_cbf47153_fk_admin_ava; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.avaliacao_avaliacao
    ADD CONSTRAINT avaliacao_avaliacao_level1_id_cbf47153_fk_admin_ava FOREIGN KEY (level1_id) REFERENCES public.admin_avaliacao_niveis(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: avaliacao_avaliacao avaliacao_avaliacao_level2_id_540adcfe_fk_admin_ava; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.avaliacao_avaliacao
    ADD CONSTRAINT avaliacao_avaliacao_level2_id_540adcfe_fk_admin_ava FOREIGN KEY (level2_id) REFERENCES public.admin_avaliacao_niveis(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: avaliacao_avaliacao avaliacao_avaliacao_level3_id_344b076d_fk_admin_ava; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.avaliacao_avaliacao
    ADD CONSTRAINT avaliacao_avaliacao_level3_id_344b076d_fk_admin_ava FOREIGN KEY (level3_id) REFERENCES public.admin_avaliacao_niveis(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: avaliacao_avaliacao avaliacao_avaliacao_level4_id_d35ca57f_fk_admin_ava; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.avaliacao_avaliacao
    ADD CONSTRAINT avaliacao_avaliacao_level4_id_d35ca57f_fk_admin_ava FOREIGN KEY (level4_id) REFERENCES public.admin_avaliacao_niveis(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: avaliacao_avaliacao avaliacao_avaliacao_level5_id_d0ab2780_fk_admin_ava; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.avaliacao_avaliacao
    ADD CONSTRAINT avaliacao_avaliacao_level5_id_d0ab2780_fk_admin_ava FOREIGN KEY (level5_id) REFERENCES public.admin_avaliacao_niveis(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: avaliacao_avaliacao avaliacao_avaliacao_level6_id_b344e382_fk_admin_ava; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.avaliacao_avaliacao
    ADD CONSTRAINT avaliacao_avaliacao_level6_id_b344e382_fk_admin_ava FOREIGN KEY (level6_id) REFERENCES public.admin_avaliacao_niveis(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: avaliacao_avaliacao avaliacao_avaliacao_level7_id_f201c498_fk_admin_ava; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.avaliacao_avaliacao
    ADD CONSTRAINT avaliacao_avaliacao_level7_id_f201c498_fk_admin_ava FOREIGN KEY (level7_id) REFERENCES public.admin_avaliacao_niveis(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: avaliacao_avaliacao avaliacao_avaliacao_level8_id_752dc705_fk_admin_ava; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.avaliacao_avaliacao
    ADD CONSTRAINT avaliacao_avaliacao_level8_id_752dc705_fk_admin_ava FOREIGN KEY (level8_id) REFERENCES public.admin_avaliacao_niveis(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: avaliacao_avaliacao avaliacao_avaliacao_manage_team_id_275ea832_fk_admin_des; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.avaliacao_avaliacao
    ADD CONSTRAINT avaliacao_avaliacao_manage_team_id_275ea832_fk_admin_des FOREIGN KEY (manage_team_id) REFERENCES public.admin_descricao_gerencia(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: avaliacao_avaliacao avaliacao_avaliacao_origin_id_4352d21d_fk_admin_ger; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.avaliacao_avaliacao
    ADD CONSTRAINT avaliacao_avaliacao_origin_id_4352d21d_fk_admin_ger FOREIGN KEY (origin_id) REFERENCES public.admin_geral_origemcapital(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: avaliacao_avaliacao avaliacao_avaliacao_size_id_90487529_fk_admin_geral_dimensao_id; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.avaliacao_avaliacao
    ADD CONSTRAINT avaliacao_avaliacao_size_id_90487529_fk_admin_geral_dimensao_id FOREIGN KEY (size_id) REFERENCES public.admin_geral_dimensao(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: avaliacao_avaliacao avaliacao_avaliacao_sub_familia_id_6aacf7a0_fk_admin_ava; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.avaliacao_avaliacao
    ADD CONSTRAINT avaliacao_avaliacao_sub_familia_id_6aacf7a0_fk_admin_ava FOREIGN KEY (sub_familia_id) REFERENCES public.admin_avaliacao_subfamilias(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: avaliacao_avaliacao avaliacao_avaliacao_tenant_id_0aaa87b0_fk_tenants_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.avaliacao_avaliacao
    ADD CONSTRAINT avaliacao_avaliacao_tenant_id_0aaa87b0_fk_tenants_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenants_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: avaliacao_avaliacao avaliacao_avaliacao_title_super_id_3a389e8b_fk_avaliacao; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.avaliacao_avaliacao
    ADD CONSTRAINT avaliacao_avaliacao_title_super_id_3a389e8b_fk_avaliacao FOREIGN KEY (title_super_id) REFERENCES public.avaliacao_superior(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: avaliacao_superior avaliacao_superior_tenant_id_ea0d8092_fk_tenants_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.avaliacao_superior
    ADD CONSTRAINT avaliacao_superior_tenant_id_ea0d8092_fk_tenants_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenants_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: background_task_completedtask background_task_comp_creator_content_type_21d6a741_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.background_task_completedtask
    ADD CONSTRAINT background_task_comp_creator_content_type_21d6a741_fk_django_co FOREIGN KEY (creator_content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: background_task background_task_creator_content_type_61cc9af3_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.background_task
    ADD CONSTRAINT background_task_creator_content_type_61cc9af3_fk_django_co FOREIGN KEY (creator_content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: descricao_descricao descricao_descricao_approver_id_1511ad4c_fk_user_acco; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.descricao_descricao
    ADD CONSTRAINT descricao_descricao_approver_id_1511ad4c_fk_user_acco FOREIGN KEY (approver_id) REFERENCES public.user_account_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: descricao_descricao descricao_descricao_area_id_aa9dfa68_fk_master_area_id; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.descricao_descricao
    ADD CONSTRAINT descricao_descricao_area_id_aa9dfa68_fk_master_area_id FOREIGN KEY (area_id) REFERENCES public.master_area(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: descricao_descricao descricao_descricao_area_specialization2_aea25bab_fk_admin_des; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.descricao_descricao
    ADD CONSTRAINT descricao_descricao_area_specialization2_aea25bab_fk_admin_des FOREIGN KEY (area_specialization2_id) REFERENCES public.admin_descricao_areas(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: descricao_descricao descricao_descricao_area_specialization3_f6281065_fk_admin_des; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.descricao_descricao
    ADD CONSTRAINT descricao_descricao_area_specialization3_f6281065_fk_admin_des FOREIGN KEY (area_specialization3_id) REFERENCES public.admin_descricao_areas(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: descricao_descricao descricao_descricao_area_specialization4_7ccfedb0_fk_admin_des; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.descricao_descricao
    ADD CONSTRAINT descricao_descricao_area_specialization4_7ccfedb0_fk_admin_des FOREIGN KEY (area_specialization4_id) REFERENCES public.admin_descricao_areas(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: descricao_descricao descricao_descricao_area_specialization__786880e4_fk_admin_des; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.descricao_descricao
    ADD CONSTRAINT descricao_descricao_area_specialization__786880e4_fk_admin_des FOREIGN KEY (area_specialization_id) REFERENCES public.admin_descricao_areas(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: descricao_descricao descricao_descricao_areas2_id_fe5fff9e_fk_admin_des; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.descricao_descricao
    ADD CONSTRAINT descricao_descricao_areas2_id_fe5fff9e_fk_admin_des FOREIGN KEY (areas2_id) REFERENCES public.admin_descricao_areas(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: descricao_descricao descricao_descricao_areas3_id_77eb6c45_fk_admin_des; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.descricao_descricao
    ADD CONSTRAINT descricao_descricao_areas3_id_77eb6c45_fk_admin_des FOREIGN KEY (areas3_id) REFERENCES public.admin_descricao_areas(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: descricao_descricao descricao_descricao_areas4_id_63d67850_fk_admin_des; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.descricao_descricao
    ADD CONSTRAINT descricao_descricao_areas4_id_63d67850_fk_admin_des FOREIGN KEY (areas4_id) REFERENCES public.admin_descricao_areas(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: descricao_descricao descricao_descricao_areas_desired2_id_43d778f5_fk_admin_des; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.descricao_descricao
    ADD CONSTRAINT descricao_descricao_areas_desired2_id_43d778f5_fk_admin_des FOREIGN KEY (areas_desired2_id) REFERENCES public.admin_descricao_areas(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: descricao_descricao descricao_descricao_areas_desired3_id_4a43a0f0_fk_admin_des; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.descricao_descricao
    ADD CONSTRAINT descricao_descricao_areas_desired3_id_4a43a0f0_fk_admin_des FOREIGN KEY (areas_desired3_id) REFERENCES public.admin_descricao_areas(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: descricao_descricao descricao_descricao_areas_desired4_id_f0913701_fk_admin_des; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.descricao_descricao
    ADD CONSTRAINT descricao_descricao_areas_desired4_id_f0913701_fk_admin_des FOREIGN KEY (areas_desired4_id) REFERENCES public.admin_descricao_areas(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: descricao_descricao descricao_descricao_areas_desired_id_6eac839f_fk_admin_des; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.descricao_descricao
    ADD CONSTRAINT descricao_descricao_areas_desired_id_6eac839f_fk_admin_des FOREIGN KEY (areas_desired_id) REFERENCES public.admin_descricao_areas(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: descricao_descricao descricao_descricao_areas_id_18f920b4_fk_admin_des; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.descricao_descricao
    ADD CONSTRAINT descricao_descricao_areas_id_18f920b4_fk_admin_des FOREIGN KEY (areas_id) REFERENCES public.admin_descricao_areas(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: descricao_descricao descricao_descricao_board_id_98f2ebf2_fk_master_diretoria_id; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.descricao_descricao
    ADD CONSTRAINT descricao_descricao_board_id_98f2ebf2_fk_master_diretoria_id FOREIGN KEY (board_id) REFERENCES public.master_diretoria(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: descricao_descricao descricao_descricao_experience_id_55664a0d_fk_admin_des; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.descricao_descricao
    ADD CONSTRAINT descricao_descricao_experience_id_55664a0d_fk_admin_des FOREIGN KEY (experience_id) REFERENCES public.admin_descricao_experiencias(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: descricao_descricao descricao_descricao_family_id_ecc1ca99_fk_admin_ava; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.descricao_descricao
    ADD CONSTRAINT descricao_descricao_family_id_ecc1ca99_fk_admin_ava FOREIGN KEY (family_id) REFERENCES public.admin_avaliacao_familias(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: descricao_descricao descricao_descricao_formation_desired_id_ac4ad8ae_fk_admin_des; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.descricao_descricao
    ADD CONSTRAINT descricao_descricao_formation_desired_id_ac4ad8ae_fk_admin_des FOREIGN KEY (formation_desired_id) REFERENCES public.admin_descricao_formacao(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: descricao_descricao descricao_descricao_formation_id_ed5e9f01_fk_admin_des; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.descricao_descricao
    ADD CONSTRAINT descricao_descricao_formation_id_ed5e9f01_fk_admin_des FOREIGN KEY (formation_id) REFERENCES public.admin_descricao_formacao(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: descricao_descricao descricao_descricao_idioma2_id_d854abc0_fk_admin_des; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.descricao_descricao
    ADD CONSTRAINT descricao_descricao_idioma2_id_d854abc0_fk_admin_des FOREIGN KEY (idioma2_id) REFERENCES public.admin_descricao_idiomas(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: descricao_descricao descricao_descricao_idioma3_id_cb025522_fk_admin_des; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.descricao_descricao
    ADD CONSTRAINT descricao_descricao_idioma3_id_cb025522_fk_admin_des FOREIGN KEY (idioma3_id) REFERENCES public.admin_descricao_idiomas(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: descricao_descricao descricao_descricao_idioma_id_16f2c535_fk_admin_des; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.descricao_descricao
    ADD CONSTRAINT descricao_descricao_idioma_id_16f2c535_fk_admin_des FOREIGN KEY (idioma_id) REFERENCES public.admin_descricao_idiomas(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: descricao_descricao descricao_descricao_level_id_4dabcc1a_fk_admin_des; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.descricao_descricao
    ADD CONSTRAINT descricao_descricao_level_id_4dabcc1a_fk_admin_des FOREIGN KEY (level_id) REFERENCES public.admin_descricao_niveis(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: descricao_descricao descricao_descricao_manage_team_id_6ed7aaf2_fk_admin_des; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.descricao_descricao
    ADD CONSTRAINT descricao_descricao_manage_team_id_6ed7aaf2_fk_admin_des FOREIGN KEY (manage_team_id) REFERENCES public.admin_descricao_gerencia(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: descricao_descricao descricao_descricao_proficiency2_id_2f9a6e42_fk_admin_des; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.descricao_descricao
    ADD CONSTRAINT descricao_descricao_proficiency2_id_2f9a6e42_fk_admin_des FOREIGN KEY (proficiency2_id) REFERENCES public.admin_descricao_proficiencias(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: descricao_descricao descricao_descricao_proficiency3_id_a7e663b0_fk_admin_des; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.descricao_descricao
    ADD CONSTRAINT descricao_descricao_proficiency3_id_a7e663b0_fk_admin_des FOREIGN KEY (proficiency3_id) REFERENCES public.admin_descricao_proficiencias(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: descricao_descricao descricao_descricao_proficiency_id_a34f1dc1_fk_admin_des; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.descricao_descricao
    ADD CONSTRAINT descricao_descricao_proficiency_id_a34f1dc1_fk_admin_des FOREIGN KEY (proficiency_id) REFERENCES public.admin_descricao_proficiencias(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: descricao_descricao descricao_descricao_qualification2_id_a0c12ea5_fk_admin_des; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.descricao_descricao
    ADD CONSTRAINT descricao_descricao_qualification2_id_a0c12ea5_fk_admin_des FOREIGN KEY (qualification2_id) REFERENCES public.admin_descricao_habilitacoes(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: descricao_descricao descricao_descricao_qualification3_id_33ef758e_fk_admin_des; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.descricao_descricao
    ADD CONSTRAINT descricao_descricao_qualification3_id_33ef758e_fk_admin_des FOREIGN KEY (qualification3_id) REFERENCES public.admin_descricao_habilitacoes(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: descricao_descricao descricao_descricao_qualification_id_2f975c9b_fk_admin_des; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.descricao_descricao
    ADD CONSTRAINT descricao_descricao_qualification_id_2f975c9b_fk_admin_des FOREIGN KEY (qualification_id) REFERENCES public.admin_descricao_habilitacoes(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: descricao_descricao descricao_descricao_sector_id_109267b7_fk_admin_geral_sector_id; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.descricao_descricao
    ADD CONSTRAINT descricao_descricao_sector_id_109267b7_fk_admin_geral_sector_id FOREIGN KEY (sector_id) REFERENCES public.admin_geral_sector(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: descricao_descricao descricao_descricao_specialization_id_9f5e0082_fk_admin_des; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.descricao_descricao
    ADD CONSTRAINT descricao_descricao_specialization_id_9f5e0082_fk_admin_des FOREIGN KEY (specialization_id) REFERENCES public.admin_descricao_especializacoes(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: descricao_descricao descricao_descricao_status_id_51760856_fk_admin_des; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.descricao_descricao
    ADD CONSTRAINT descricao_descricao_status_id_51760856_fk_admin_des FOREIGN KEY (status_id) REFERENCES public.admin_descricao_status(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: descricao_descricao descricao_descricao_sub_familia_id_edd0798b_fk_admin_ava; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.descricao_descricao
    ADD CONSTRAINT descricao_descricao_sub_familia_id_edd0798b_fk_admin_ava FOREIGN KEY (sub_familia_id) REFERENCES public.admin_avaliacao_subfamilias(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: descricao_descricao descricao_descricao_tenant_id_76c1d531_fk_tenants_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.descricao_descricao
    ADD CONSTRAINT descricao_descricao_tenant_id_76c1d531_fk_tenants_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenants_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: descricao_descricao descricao_descricao_user_id_id_22f6d6f6_fk_user_acco; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.descricao_descricao
    ADD CONSTRAINT descricao_descricao_user_id_id_22f6d6f6_fk_user_acco FOREIGN KEY (user_id_id) REFERENCES public.user_account_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_user_account_customuser_id; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_user_account_customuser_id FOREIGN KEY (user_id) REFERENCES public.user_account_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: master_area master_area_board_id_14149ddc_fk_master_diretoria_id; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.master_area
    ADD CONSTRAINT master_area_board_id_14149ddc_fk_master_diretoria_id FOREIGN KEY (board_id) REFERENCES public.master_diretoria(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: master_area master_area_tenant_id_8051a2b2_fk_tenants_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.master_area
    ADD CONSTRAINT master_area_tenant_id_8051a2b2_fk_tenants_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenants_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: master_diretoria master_diretoria_tenant_id_e3f12bbe_fk_tenants_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.master_diretoria
    ADD CONSTRAINT master_diretoria_tenant_id_e3f12bbe_fk_tenants_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenants_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: person_person person_person_tenant_id_71dedc16_fk_tenants_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.person_person
    ADD CONSTRAINT person_person_tenant_id_71dedc16_fk_tenants_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenants_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tenants_tenant tenants_tenant_company_id_7274853e_fk_admin_ger; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.tenants_tenant
    ADD CONSTRAINT tenants_tenant_company_id_7274853e_fk_admin_ger FOREIGN KEY (company_id) REFERENCES public.admin_geral_tipoempresa(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tenants_tenant tenants_tenant_core_id_97b1d1e7_fk_admin_geral_core_id; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.tenants_tenant
    ADD CONSTRAINT tenants_tenant_core_id_97b1d1e7_fk_admin_geral_core_id FOREIGN KEY (core_id) REFERENCES public.admin_geral_core(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tenants_tenant tenants_tenant_governanca_id_82d5d7ed_fk_admin_ger; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.tenants_tenant
    ADD CONSTRAINT tenants_tenant_governanca_id_82d5d7ed_fk_admin_ger FOREIGN KEY (governanca_id) REFERENCES public.admin_geral_governanca(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tenants_tenant tenants_tenant_origin_id_53c78e18_fk_admin_ger; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.tenants_tenant
    ADD CONSTRAINT tenants_tenant_origin_id_53c78e18_fk_admin_ger FOREIGN KEY (origin_id) REFERENCES public.admin_geral_origemcapital(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tenants_tenant tenants_tenant_plano_id_9b1ba42a_fk_admin_geral_plans_id; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.tenants_tenant
    ADD CONSTRAINT tenants_tenant_plano_id_9b1ba42a_fk_admin_geral_plans_id FOREIGN KEY (plano_id) REFERENCES public.admin_geral_plans(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tenants_tenant tenants_tenant_planoaval_id_30621853_fk_admin_ger; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.tenants_tenant
    ADD CONSTRAINT tenants_tenant_planoaval_id_30621853_fk_admin_ger FOREIGN KEY (planoaval_id) REFERENCES public.admin_geral_plansavaliacao(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tenants_tenant tenants_tenant_sector_id_d9715b32_fk_admin_geral_sector_id; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.tenants_tenant
    ADD CONSTRAINT tenants_tenant_sector_id_d9715b32_fk_admin_geral_sector_id FOREIGN KEY (sector_id) REFERENCES public.admin_geral_sector(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tenants_tenant tenants_tenant_size_id_1c14fb9b_fk_admin_geral_dimensao_id; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.tenants_tenant
    ADD CONSTRAINT tenants_tenant_size_id_1c14fb9b_fk_admin_geral_dimensao_id FOREIGN KEY (size_id) REFERENCES public.admin_geral_dimensao(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_account_customuser_user_permissions user_account_customu_customuser_id_0c5cabee_fk_user_acco; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.user_account_customuser_user_permissions
    ADD CONSTRAINT user_account_customu_customuser_id_0c5cabee_fk_user_acco FOREIGN KEY (customuser_id) REFERENCES public.user_account_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_account_customuser_tenants user_account_customu_customuser_id_baa39dcb_fk_user_acco; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.user_account_customuser_tenants
    ADD CONSTRAINT user_account_customu_customuser_id_baa39dcb_fk_user_acco FOREIGN KEY (customuser_id) REFERENCES public.user_account_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_account_customuser_groups user_account_customu_customuser_id_bc48d9d5_fk_user_acco; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.user_account_customuser_groups
    ADD CONSTRAINT user_account_customu_customuser_id_bc48d9d5_fk_user_acco FOREIGN KEY (customuser_id) REFERENCES public.user_account_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_account_customuser user_account_customu_default_tenant_id_615a2a3a_fk_tenants_t; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.user_account_customuser
    ADD CONSTRAINT user_account_customu_default_tenant_id_615a2a3a_fk_tenants_t FOREIGN KEY (default_tenant_id) REFERENCES public.tenants_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_account_customuser_groups user_account_customu_group_id_e60f5d50_fk_auth_grou; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.user_account_customuser_groups
    ADD CONSTRAINT user_account_customu_group_id_e60f5d50_fk_auth_grou FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_account_customuser_user_permissions user_account_customu_permission_id_6fe066e3_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.user_account_customuser_user_permissions
    ADD CONSTRAINT user_account_customu_permission_id_6fe066e3_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_account_customuser_tenants user_account_customu_tenant_id_aec95365_fk_tenants_t; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.user_account_customuser_tenants
    ADD CONSTRAINT user_account_customu_tenant_id_aec95365_fk_tenants_t FOREIGN KEY (tenant_id) REFERENCES public.tenants_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_account_customuser user_account_customuser_person_id_4d44b7f6_fk_person_person_id; Type: FK CONSTRAINT; Schema: public; Owner: cristiano
--

ALTER TABLE ONLY public.user_account_customuser
    ADD CONSTRAINT user_account_customuser_person_id_4d44b7f6_fk_person_person_id FOREIGN KEY (person_id) REFERENCES public.person_person(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.18 (Ubuntu 12.18-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.18 (Ubuntu 12.18-0ubuntu0.20.04.1)

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

--
-- PostgreSQL database dump complete
--

--
-- Database "–help" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.18 (Ubuntu 12.18-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.18 (Ubuntu 12.18-0ubuntu0.20.04.1)

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

--
-- Name: –help; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "–help" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'pt_BR.UTF-8' LC_CTYPE = 'pt_BR.UTF-8';


ALTER DATABASE "–help" OWNER TO postgres;

\connect -reuse-previous=on "dbname='–help'"

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

--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

