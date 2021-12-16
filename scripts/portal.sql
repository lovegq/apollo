--
-- PostgreSQL database dump
CREATE TABLE public.app
(
    id                           bigint                      NOT NULL,
    data_change_created_by       character varying(255)      NOT NULL,
    data_change_created_time     timestamp without time zone NOT NULL,
    data_change_last_modified_by character varying(255),
    data_change_last_time        timestamp without time zone,
    deleted                      boolean,
    app_id                       character varying(255)      NOT NULL,
    name                         character varying(255)      NOT NULL,
    org_id                       character varying(255)      NOT NULL,
    org_name                     character varying(255)      NOT NULL,
    owner_email                  character varying(255)      NOT NULL,
    owner_name                   character varying(255)      NOT NULL
);


ALTER TABLE public.app
    OWNER TO growingio;

--
-- Name: app_namespace; Type: TABLE; Schema: public; Owner: growingio
--

CREATE TABLE public.app_namespace
(
    id                           bigint                      NOT NULL,
    data_change_created_by       character varying(255)      NOT NULL,
    data_change_created_time     timestamp without time zone NOT NULL,
    data_change_last_modified_by character varying(255),
    data_change_last_time        timestamp without time zone,
    deleted                      boolean,
    app_id                       character varying(255)      NOT NULL,
    comment                      character varying(255),
    format                       character varying(255)      NOT NULL,
    is_public                    boolean,
    name                         character varying(255)      NOT NULL
);


ALTER TABLE public.app_namespace
    OWNER TO growingio;

--
-- Name: authorities; Type: TABLE; Schema: public; Owner: growingio
--

CREATE TABLE public.authorities
(
    id        integer NOT NULL,
    username  character varying(120),
    authority character varying(120)
);


ALTER TABLE public.authorities
    OWNER TO growingio;

--
-- Name: authorities_id_seq; Type: SEQUENCE; Schema: public; Owner: growingio
--

CREATE SEQUENCE public.authorities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authorities_id_seq
    OWNER TO growingio;

--
-- Name: authorities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: growingio
--

ALTER SEQUENCE public.authorities_id_seq OWNED BY public.authorities.id;


--
-- Name: consumer; Type: TABLE; Schema: public; Owner: growingio
--

CREATE TABLE public.consumer
(
    id                           bigint                      NOT NULL,
    data_change_created_by       character varying(255)      NOT NULL,
    data_change_created_time     timestamp without time zone NOT NULL,
    data_change_last_modified_by character varying(255),
    data_change_last_time        timestamp without time zone,
    deleted                      boolean,
    app_id                       character varying(255)      NOT NULL,
    name                         character varying(255)      NOT NULL,
    org_id                       character varying(255)      NOT NULL,
    org_name                     character varying(255)      NOT NULL,
    owner_email                  character varying(255)      NOT NULL,
    owner_name                   character varying(255)      NOT NULL
);


ALTER TABLE public.consumer
    OWNER TO growingio;

--
-- Name: consumer_audit; Type: TABLE; Schema: public; Owner: growingio
--

CREATE TABLE public.consumer_audit
(
    id                       bigint                 NOT NULL,
    consumer_id              bigint                 NOT NULL,
    data_change_created_time timestamp without time zone,
    data_change_last_time    timestamp without time zone,
    method                   character varying(255) NOT NULL,
    uri                      character varying(255) NOT NULL
);


ALTER TABLE public.consumer_audit
    OWNER TO growingio;

--
-- Name: consumer_role; Type: TABLE; Schema: public; Owner: growingio
--

CREATE TABLE public.consumer_role
(
    id                           bigint                      NOT NULL,
    data_change_created_by       character varying(255)      NOT NULL,
    data_change_created_time     timestamp without time zone NOT NULL,
    data_change_last_modified_by character varying(255),
    data_change_last_time        timestamp without time zone,
    deleted                      boolean,
    consumer_id                  bigint                      NOT NULL,
    role_id                      bigint                      NOT NULL
);


ALTER TABLE public.consumer_role
    OWNER TO growingio;

--
-- Name: consumer_token; Type: TABLE; Schema: public; Owner: growingio
--

CREATE TABLE public.consumer_token
(
    id                           bigint                      NOT NULL,
    data_change_created_by       character varying(255)      NOT NULL,
    data_change_created_time     timestamp without time zone NOT NULL,
    data_change_last_modified_by character varying(255),
    data_change_last_time        timestamp without time zone,
    deleted                      boolean,
    consumer_id                  bigint                      NOT NULL,
    expires                      timestamp without time zone NOT NULL,
    token                        character varying(255)      NOT NULL
);


ALTER TABLE public.consumer_token
    OWNER TO growingio;

--
-- Name: favorite; Type: TABLE; Schema: public; Owner: growingio
--

CREATE TABLE public.favorite
(
    id                           bigint                      NOT NULL,
    data_change_created_by       character varying(255)      NOT NULL,
    data_change_created_time     timestamp without time zone NOT NULL,
    data_change_last_modified_by character varying(255),
    data_change_last_time        timestamp without time zone,
    deleted                      boolean,
    app_id                       character varying(255)      NOT NULL,
    "position"                   bigint,
    user_id                      character varying(255)      NOT NULL
);


ALTER TABLE public.favorite
    OWNER TO growingio;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: growingio
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence
    OWNER TO growingio;

--
-- Name: permission; Type: TABLE; Schema: public; Owner: growingio
--

CREATE TABLE public.permission
(
    id                           bigint                      NOT NULL,
    data_change_created_by       character varying(255)      NOT NULL,
    data_change_created_time     timestamp without time zone NOT NULL,
    data_change_last_modified_by character varying(255),
    data_change_last_time        timestamp without time zone,
    deleted                      boolean,
    permission_type              character varying(255)      NOT NULL,
    target_id                    character varying(255)      NOT NULL
);


ALTER TABLE public.permission
    OWNER TO growingio;

--
-- Name: permission_id_seq; Type: SEQUENCE; Schema: public; Owner: growingio
--

CREATE SEQUENCE public.permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permission_id_seq
    OWNER TO growingio;

--
-- Name: permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: growingio
--

ALTER SEQUENCE public.permission_id_seq OWNED BY public.permission.id;


--
-- Name: role; Type: TABLE; Schema: public; Owner: growingio
--

CREATE TABLE public.role
(
    id                           bigint                      NOT NULL,
    data_change_created_by       character varying(255)      NOT NULL,
    data_change_created_time     timestamp without time zone NOT NULL,
    data_change_last_modified_by character varying(255),
    data_change_last_time        timestamp without time zone,
    deleted                      boolean,
    role_name                    character varying(255)      NOT NULL
);


ALTER TABLE public.role
    OWNER TO growingio;

--
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: growingio
--

CREATE SEQUENCE public.role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_id_seq
    OWNER TO growingio;

--
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: growingio
--

ALTER SEQUENCE public.role_id_seq OWNED BY public.role.id;


--
-- Name: role_permission; Type: TABLE; Schema: public; Owner: growingio
--

CREATE TABLE public.role_permission
(
    id                           bigint                      NOT NULL,
    data_change_created_by       character varying(255)      NOT NULL,
    data_change_created_time     timestamp without time zone NOT NULL,
    data_change_last_modified_by character varying(255),
    data_change_last_time        timestamp without time zone,
    deleted                      boolean,
    permission_id                bigint                      NOT NULL,
    role_id                      bigint                      NOT NULL
);


ALTER TABLE public.role_permission
    OWNER TO growingio;

--
-- Name: server_config; Type: TABLE; Schema: public; Owner: growingio
--

CREATE TABLE public.server_config
(
    id                           bigint                                    NOT NULL,
    data_change_created_by       character varying(255),
    data_change_created_time     timestamp without time zone DEFAULT now() NOT NULL,
    data_change_last_modified_by character varying(255),
    data_change_last_time        timestamp without time zone,
    deleted                      boolean,
    comment                      character varying(255)                    NOT NULL,
    key                          character varying(255)                    NOT NULL,
    value                        character varying(255)                    NOT NULL
);


ALTER TABLE public.server_config
    OWNER TO growingio;

--
-- Name: server_config_id_seq; Type: SEQUENCE; Schema: public; Owner: growingio
--

CREATE SEQUENCE public.server_config_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.server_config_id_seq
    OWNER TO growingio;

--
-- Name: server_config_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: growingio
--

ALTER SEQUENCE public.server_config_id_seq OWNED BY public.server_config.id;


--
-- Name: spring_session; Type: TABLE; Schema: public; Owner: growingio
--

CREATE TABLE public.spring_session
(
    principal_name        character varying(100),
    expiry_time           bigint        NOT NULL,
    max_inactive_interval integer       NOT NULL,
    last_access_time      bigint        NOT NULL,
    creation_time         bigint        NOT NULL,
    session_id            character(36) NOT NULL,
    primary_id            character(36) NOT NULL
);


ALTER TABLE public.spring_session
    OWNER TO growingio;

--
-- Name: spring_session_attributes; Type: TABLE; Schema: public; Owner: growingio
--

CREATE TABLE public.spring_session_attributes
(
    attribute_bytes    bytea                  NOT NULL,
    attribute_name     character varying(200) NOT NULL,
    session_primary_id character(36)          NOT NULL
);


ALTER TABLE public.spring_session_attributes
    OWNER TO growingio;

--
-- Name: user_role; Type: TABLE; Schema: public; Owner: growingio
--

CREATE TABLE public.user_role
(
    id                           bigint                      NOT NULL,
    data_change_created_by       character varying(255)      NOT NULL,
    data_change_created_time     timestamp without time zone NOT NULL,
    data_change_last_modified_by character varying(255),
    data_change_last_time        timestamp without time zone,
    deleted                      boolean,
    role_id                      bigint                      NOT NULL,
    user_id                      character varying(255)      NOT NULL
);


ALTER TABLE public.user_role
    OWNER TO growingio;

--
-- Name: user_role_id_seq; Type: SEQUENCE; Schema: public; Owner: growingio
--

CREATE SEQUENCE public.user_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_role_id_seq
    OWNER TO growingio;

--
-- Name: user_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: growingio
--

ALTER SEQUENCE public.user_role_id_seq OWNED BY public.user_role.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: growingio
--

CREATE TABLE public.users
(
    id                bigint                 NOT NULL,
    email             character varying(255) NOT NULL,
    enabled           integer                NOT NULL,
    password          character varying(255) NOT NULL,
    user_display_name character varying(255) NOT NULL,
    username          character varying(255) NOT NULL
);
