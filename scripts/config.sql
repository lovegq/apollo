--
-- PostgreSQL database dump
--

CREATE TABLE public.access_key
(
    id                           bigint                      NOT NULL,
    data_change_created_by       character varying(255)      NOT NULL,
    data_change_created_time     timestamp without time zone NOT NULL,
    data_change_last_modified_by character varying(255),
    data_change_last_time        timestamp without time zone,
    deleted                      boolean,
    app_id                       character varying(255)      NOT NULL,
    enabled                      boolean,
    secret                       character varying(255)      NOT NULL
);


ALTER TABLE public.access_key
    OWNER TO growingio;

--
-- Name: app; Type: TABLE; Schema: public; Owner: growingio
--

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
-- Name: audit; Type: TABLE; Schema: public; Owner: growingio
--

CREATE TABLE public.audit
(
    id                           bigint                      NOT NULL,
    data_change_created_by       character varying(255)      NOT NULL,
    data_change_created_time     timestamp without time zone NOT NULL,
    data_change_last_modified_by character varying(255),
    data_change_last_time        timestamp without time zone,
    deleted                      boolean,
    comment                      character varying(255),
    entity_id                    bigint,
    entity_name                  character varying(255)      NOT NULL,
    op_name                      character varying(255)      NOT NULL
);


ALTER TABLE public.audit
    OWNER TO growingio;

--
-- Name: cluster; Type: TABLE; Schema: public; Owner: growingio
--

CREATE TABLE public.cluster
(
    id                           bigint                      NOT NULL,
    data_change_created_by       character varying(255)      NOT NULL,
    data_change_created_time     timestamp without time zone NOT NULL,
    data_change_last_modified_by character varying(255),
    data_change_last_time        timestamp without time zone,
    deleted                      boolean,
    app_id                       character varying(255)      NOT NULL,
    name                         character varying(255)      NOT NULL,
    parent_cluster_id            bigint                      NOT NULL
);


ALTER TABLE public.cluster
    OWNER TO growingio;

--
-- Name: commit; Type: TABLE; Schema: public; Owner: growingio
--

CREATE TABLE public.commit
(
    id                           bigint                      NOT NULL,
    data_change_created_by       character varying(255)      NOT NULL,
    data_change_created_time     timestamp without time zone NOT NULL,
    data_change_last_modified_by character varying(255),
    data_change_last_time        timestamp without time zone,
    deleted                      boolean,
    app_id                       character varying(255)      NOT NULL,
    change_sets                  text                        NOT NULL,
    cluster_name                 character varying(255)      NOT NULL,
    comment                      character varying(255),
    namespace_name               character varying(255)      NOT NULL
);


ALTER TABLE public.commit
    OWNER TO growingio;

--
-- Name: gray_release_rule; Type: TABLE; Schema: public; Owner: growingio
--

CREATE TABLE public.gray_release_rule
(
    id                           bigint                      NOT NULL,
    data_change_created_by       character varying(255)      NOT NULL,
    data_change_created_time     timestamp without time zone NOT NULL,
    data_change_last_modified_by character varying(255),
    data_change_last_time        timestamp without time zone,
    deleted                      boolean,
    app_id                       character varying(255)      NOT NULL,
    branch_name                  character varying(255)      NOT NULL,
    branch_status                integer                     NOT NULL,
    cluster_name                 character varying(255)      NOT NULL,
    namespace_name               character varying(255)      NOT NULL,
    release_id                   bigint                      NOT NULL,
    rules                        character varying(255)
);


ALTER TABLE public.gray_release_rule
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
-- Name: instance; Type: TABLE; Schema: public; Owner: growingio
--

CREATE TABLE public.instance
(
    id                       bigint                      NOT NULL,
    app_id                   character varying(255)      NOT NULL,
    cluster_name             character varying(255)      NOT NULL,
    data_center              character varying(255)      NOT NULL,
    data_change_created_time timestamp without time zone NOT NULL,
    data_change_last_time    timestamp without time zone,
    ip                       character varying(255)      NOT NULL
);


ALTER TABLE public.instance
    OWNER TO growingio;

--
-- Name: instance_config; Type: TABLE; Schema: public; Owner: growingio
--

CREATE TABLE public.instance_config
(
    id                       bigint                      NOT NULL,
    config_app_id            character varying(255)      NOT NULL,
    config_cluster_name      character varying(255)      NOT NULL,
    config_namespace_name    character varying(255)      NOT NULL,
    data_change_created_time timestamp without time zone NOT NULL,
    data_change_last_time    timestamp without time zone,
    instance_id              bigint,
    release_delivery_time    timestamp without time zone NOT NULL,
    release_key              character varying(255)      NOT NULL
);


ALTER TABLE public.instance_config
    OWNER TO growingio;

--
-- Name: item; Type: TABLE; Schema: public; Owner: growingio
--

CREATE TABLE public.item
(
    id                           bigint                      NOT NULL,
    data_change_created_by       character varying(255)      NOT NULL,
    data_change_created_time     timestamp without time zone NOT NULL,
    data_change_last_modified_by character varying(255),
    data_change_last_time        timestamp without time zone,
    deleted                      boolean,
    comment                      character varying(255),
    key                          character varying(255)      NOT NULL,
    line_num                     integer,
    namespace_id                 bigint                      NOT NULL,
    value                        text
);


ALTER TABLE public.item
    OWNER TO growingio;

--
-- Name: namespace; Type: TABLE; Schema: public; Owner: growingio
--

CREATE TABLE public.namespace
(
    id                           bigint                      NOT NULL,
    data_change_created_by       character varying(255)      NOT NULL,
    data_change_created_time     timestamp without time zone NOT NULL,
    data_change_last_modified_by character varying(255),
    data_change_last_time        timestamp without time zone,
    deleted                      boolean,
    app_id                       character varying(255)      NOT NULL,
    cluster_name                 character varying(255)      NOT NULL,
    namespace_name               character varying(255)      NOT NULL
);


ALTER TABLE public.namespace
    OWNER TO growingio;

--
-- Name: namespace_lock; Type: TABLE; Schema: public; Owner: growingio
--

CREATE TABLE public.namespace_lock
(
    id                           bigint                      NOT NULL,
    data_change_created_by       character varying(255)      NOT NULL,
    data_change_created_time     timestamp without time zone NOT NULL,
    data_change_last_modified_by character varying(255),
    data_change_last_time        timestamp without time zone,
    deleted                      boolean,
    namespace_id                 bigint
);


ALTER TABLE public.namespace_lock
    OWNER TO growingio;

--
-- Name: privilege; Type: TABLE; Schema: public; Owner: growingio
--

CREATE TABLE public.privilege
(
    id                           bigint                      NOT NULL,
    data_change_created_by       character varying(255)      NOT NULL,
    data_change_created_time     timestamp without time zone NOT NULL,
    data_change_last_modified_by character varying(255),
    data_change_last_time        timestamp without time zone,
    deleted                      boolean,
    name                         character varying(255)      NOT NULL,
    namespace_id                 bigint,
    privil_type                  character varying(255)      NOT NULL
);


ALTER TABLE public.privilege
    OWNER TO growingio;

--
-- Name: release; Type: TABLE; Schema: public; Owner: growingio
--

CREATE TABLE public.release
(
    id                           bigint                      NOT NULL,
    data_change_created_by       character varying(255)      NOT NULL,
    data_change_created_time     timestamp without time zone NOT NULL,
    data_change_last_modified_by character varying(255),
    data_change_last_time        timestamp without time zone,
    deleted                      boolean,
    app_id                       character varying(255)      NOT NULL,
    cluster_name                 character varying(255)      NOT NULL,
    comment                      character varying(255)      NOT NULL,
    configurations               text                        NOT NULL,
    is_abandoned                 bit(1) DEFAULT '0'::"bit",
    name                         character varying(255)      NOT NULL,
    namespace_name               character varying(255)      NOT NULL,
    release_key                  character varying(255)      NOT NULL
);


ALTER TABLE public.release
    OWNER TO growingio;

--
-- Name: release_history; Type: TABLE; Schema: public; Owner: growingio
--

CREATE TABLE public.release_history
(
    id                           bigint                      NOT NULL,
    data_change_created_by       character varying(255)      NOT NULL,
    data_change_created_time     timestamp without time zone NOT NULL,
    data_change_last_modified_by character varying(255),
    data_change_last_time        timestamp without time zone,
    deleted                      boolean,
    app_id                       character varying(255)      NOT NULL,
    branch_name                  character varying(255)      NOT NULL,
    cluster_name                 character varying(255)      NOT NULL,
    namespace_name               character varying(255)      NOT NULL,
    operation                    integer,
    operation_context            character varying(255)      NOT NULL,
    previous_release_id          bigint,
    release_id                   bigint
);


ALTER TABLE public.release_history
    OWNER TO growingio;

--
-- Name: release_message; Type: TABLE; Schema: public; Owner: growingio
--

CREATE TABLE public.release_message
(
    id                    bigint                 NOT NULL,
    data_change_last_time timestamp without time zone,
    message               character varying(255) NOT NULL
);


ALTER TABLE public.release_message
    OWNER TO growingio;

--
-- Name: server_config; Type: TABLE; Schema: public; Owner: growingio
--

CREATE TABLE public.server_config
(
    id                           bigint                      NOT NULL,
    data_change_created_by       character varying(255)      NOT NULL,
    data_change_created_time     timestamp without time zone NOT NULL,
    data_change_last_modified_by character varying(255),
    data_change_last_time        timestamp without time zone,
    deleted                      boolean,
    cluster                      character varying(255)      NOT NULL,
    comment                      character varying(255)      NOT NULL,
    key                          character varying(255)      NOT NULL,
    value                        character varying(255)      NOT NULL
);

