CREATE TABLE public.directus_access (
    id uuid NOT NULL,
    role uuid,
    "user" uuid,
    policy uuid NOT NULL,
    sort integer
);

CREATE TABLE public.directus_activity (
    id integer NOT NULL,
    action character varying(45) NOT NULL,
    "user" uuid,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    ip character varying(50),
    user_agent text,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    origin character varying(255)
);

CREATE TABLE public.directus_collections (
    collection character varying(64) NOT NULL,
    icon character varying(64),
    note text,
    display_template character varying(255),
    hidden boolean DEFAULT false NOT NULL,
    singleton boolean DEFAULT false NOT NULL,
    translations json,
    archive_field character varying(64),
    archive_app_filter boolean DEFAULT true NOT NULL,
    archive_value character varying(255),
    unarchive_value character varying(255),
    sort_field character varying(64),
    accountability character varying(255) DEFAULT 'all'::character varying,
    color character varying(255),
    item_duplication_fields json,
    sort integer,
    "group" character varying(64),
    collapse character varying(255) DEFAULT 'open'::character varying NOT NULL,
    preview_url character varying(255),
    versioning boolean DEFAULT false NOT NULL,
    status character varying(255) DEFAULT 'active'::character varying NOT NULL,
    autosave_revision_interval real
);

CREATE TABLE public.directus_comments (
    id uuid NOT NULL,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    comment text NOT NULL,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_updated timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    user_updated uuid
);

CREATE TABLE public.directus_dashboards (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(64) DEFAULT 'dashboard'::character varying NOT NULL,
    note text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    color character varying(255)
);

CREATE TABLE public.directus_deployment_projects (
    id uuid NOT NULL,
    deployment uuid NOT NULL,
    external_id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    url character varying(255),
    framework character varying(255),
    deployable boolean DEFAULT true NOT NULL
);

CREATE TABLE public.directus_deployment_runs (
    id uuid NOT NULL,
    project uuid NOT NULL,
    external_id character varying(255) NOT NULL,
    target character varying(255) NOT NULL,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    status character varying(255),
    url character varying(255),
    started_at timestamp with time zone,
    completed_at timestamp with time zone
);

CREATE TABLE public.directus_deployments (
    id uuid NOT NULL,
    provider character varying(255) NOT NULL,
    credentials text,
    options text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    webhook_ids json,
    webhook_secret character varying(255),
    last_synced_at timestamp with time zone
);

CREATE TABLE public.directus_extensions (
    enabled boolean DEFAULT true NOT NULL,
    id uuid NOT NULL,
    folder character varying(255) NOT NULL,
    source character varying(255) NOT NULL,
    bundle uuid
);

CREATE TABLE public.directus_fields (
    id integer NOT NULL,
    collection character varying(64) NOT NULL,
    field character varying(64) NOT NULL,
    special character varying(64),
    interface character varying(64),
    options json,
    display character varying(64),
    display_options json,
    readonly boolean DEFAULT false NOT NULL,
    hidden boolean DEFAULT false NOT NULL,
    sort integer,
    width character varying(30) DEFAULT 'full'::character varying,
    translations json,
    note text,
    conditions json,
    required boolean DEFAULT false,
    "group" character varying(64),
    validation json,
    validation_message text,
    searchable boolean DEFAULT true NOT NULL
);

CREATE TABLE public.directus_files (
    id uuid NOT NULL,
    storage character varying(255) NOT NULL,
    filename_disk character varying(255),
    filename_download character varying(255) NOT NULL,
    title character varying(255),
    type character varying(255),
    folder uuid,
    uploaded_by uuid,
    created_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modified_by uuid,
    modified_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    charset character varying(50),
    filesize bigint,
    width integer,
    height integer,
    duration integer,
    embed character varying(200),
    description text,
    location text,
    tags text,
    metadata json,
    focal_point_x integer,
    focal_point_y integer,
    tus_id character varying(64),
    tus_data json,
    uploaded_on timestamp with time zone
);

CREATE TABLE public.directus_flows (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(64),
    color character varying(255),
    description text,
    status character varying(255) DEFAULT 'active'::character varying NOT NULL,
    trigger character varying(255),
    accountability character varying(255) DEFAULT 'all'::character varying,
    options json,
    operation uuid,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);

CREATE TABLE public.directus_folders (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    parent uuid
);

CREATE TABLE public.directus_migrations (
    version character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE public.directus_notifications (
    id integer NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    status character varying(255) DEFAULT 'inbox'::character varying,
    recipient uuid NOT NULL,
    sender uuid,
    subject character varying(255) NOT NULL,
    message text,
    collection character varying(64),
    item character varying(255)
);

CREATE TABLE public.directus_oauth_clients (
    client_id character varying(255) NOT NULL,
    client_name character varying(200) NOT NULL,
    redirect_uris json NOT NULL,
    grant_types json NOT NULL,
    token_endpoint_auth_method character varying(255) DEFAULT 'none'::character varying NOT NULL,
    client_secret_hash character varying(64),
    registration_type character varying(10) DEFAULT 'dcr'::character varying NOT NULL,
    client_uri text,
    logo_uri text,
    tos_uri text,
    policy_uri text,
    metadata_fetched_at timestamp with time zone,
    metadata_expires_at timestamp with time zone,
    metadata_etag character varying(255),
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE public.directus_oauth_codes (
    id uuid NOT NULL,
    code_hash character varying(64) NOT NULL,
    client character varying(255) NOT NULL,
    "user" uuid NOT NULL,
    redirect_uri character varying(255) NOT NULL,
    resource character varying(255) NOT NULL,
    code_challenge character varying(128) NOT NULL,
    code_challenge_method character varying(10) NOT NULL,
    scope character varying(255),
    expires_at timestamp with time zone NOT NULL,
    used_at timestamp with time zone
);

CREATE TABLE public.directus_oauth_consents (
    id uuid NOT NULL,
    "user" uuid NOT NULL,
    client character varying(255) NOT NULL,
    redirect_uri character varying(255) NOT NULL,
    scope character varying(255),
    date_created timestamp with time zone NOT NULL,
    date_updated timestamp with time zone NOT NULL
);

CREATE TABLE public.directus_oauth_tokens (
    id uuid NOT NULL,
    client character varying(255) NOT NULL,
    "user" uuid NOT NULL,
    session character varying(64) NOT NULL,
    previous_session character varying(64),
    resource character varying(255) NOT NULL,
    code_hash character varying(64) NOT NULL,
    scope character varying(255),
    expires_at timestamp with time zone NOT NULL,
    date_created timestamp with time zone NOT NULL
);

CREATE TABLE public.directus_operations (
    id uuid NOT NULL,
    name character varying(255),
    key character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    position_x integer NOT NULL,
    position_y integer NOT NULL,
    options json,
    resolve uuid,
    reject uuid,
    flow uuid NOT NULL,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);

CREATE TABLE public.directus_panels (
    id uuid NOT NULL,
    dashboard uuid NOT NULL,
    name character varying(255),
    icon character varying(64) DEFAULT NULL::character varying,
    color character varying(10),
    show_header boolean DEFAULT false NOT NULL,
    note text,
    type character varying(255) NOT NULL,
    position_x integer NOT NULL,
    position_y integer NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    options json,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);

CREATE TABLE public.directus_permissions (
    id integer NOT NULL,
    collection character varying(64) NOT NULL,
    action character varying(10) NOT NULL,
    permissions json,
    validation json,
    presets json,
    fields text,
    policy uuid NOT NULL
);

CREATE TABLE public.directus_policies (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    icon character varying(64) DEFAULT 'badge'::character varying NOT NULL,
    description text,
    ip_access text,
    enforce_tfa boolean DEFAULT false NOT NULL,
    admin_access boolean DEFAULT false NOT NULL,
    app_access boolean DEFAULT false NOT NULL
);

CREATE TABLE public.directus_presets (
    id integer NOT NULL,
    bookmark character varying(255),
    "user" uuid,
    role uuid,
    collection character varying(64),
    search character varying(100),
    layout character varying(100) DEFAULT 'tabular'::character varying,
    layout_query json,
    layout_options json,
    refresh_interval integer,
    filter json,
    icon character varying(64) DEFAULT 'bookmark'::character varying,
    color character varying(255)
);

CREATE TABLE public.directus_relations (
    id integer NOT NULL,
    many_collection character varying(64) NOT NULL,
    many_field character varying(64) NOT NULL,
    one_collection character varying(64),
    one_field character varying(64),
    one_collection_field character varying(64),
    one_allowed_collections text,
    junction_field character varying(64),
    sort_field character varying(64),
    one_deselect_action character varying(255) DEFAULT 'nullify'::character varying NOT NULL
);

CREATE TABLE public.directus_revisions (
    id integer NOT NULL,
    activity integer NOT NULL,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    data json,
    delta json,
    parent integer,
    version uuid
);

CREATE TABLE public.directus_roles (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    icon character varying(64) DEFAULT 'supervised_user_circle'::character varying NOT NULL,
    description text,
    parent uuid
);

CREATE TABLE public.directus_sessions (
    token character varying(64) NOT NULL,
    "user" uuid,
    expires timestamp with time zone NOT NULL,
    ip character varying(255),
    user_agent text,
    share uuid,
    origin character varying(255),
    next_token character varying(64),
    oauth_client character varying(255)
);

CREATE TABLE public.directus_settings (
    id integer NOT NULL,
    project_name character varying(100) DEFAULT 'Directus'::character varying NOT NULL,
    project_url character varying(255),
    project_color character varying(255) DEFAULT '#6644FF'::character varying NOT NULL,
    project_logo uuid,
    public_foreground uuid,
    public_background uuid,
    public_note text,
    auth_login_attempts integer DEFAULT 25,
    auth_password_policy character varying(100),
    storage_asset_transform character varying(7) DEFAULT 'all'::character varying,
    storage_asset_presets json,
    custom_css text,
    storage_default_folder uuid,
    basemaps json,
    mapbox_key character varying(255),
    module_bar json,
    project_descriptor character varying(100),
    default_language character varying(255) DEFAULT 'en-US'::character varying NOT NULL,
    custom_aspect_ratios json,
    public_favicon uuid,
    default_appearance character varying(255) DEFAULT 'auto'::character varying NOT NULL,
    default_theme_light character varying(255),
    theme_light_overrides json,
    default_theme_dark character varying(255),
    theme_dark_overrides json,
    report_error_url character varying(255),
    report_bug_url character varying(255),
    report_feature_url character varying(255),
    public_registration boolean DEFAULT false NOT NULL,
    public_registration_verify_email boolean DEFAULT true NOT NULL,
    public_registration_role uuid,
    public_registration_email_filter json,
    visual_editor_urls json,
    project_id uuid,
    mcp_enabled boolean DEFAULT false NOT NULL,
    mcp_allow_deletes boolean DEFAULT false NOT NULL,
    mcp_prompts_collection character varying(255) DEFAULT NULL::character varying,
    mcp_system_prompt_enabled boolean DEFAULT true NOT NULL,
    mcp_system_prompt text,
    project_owner character varying(255),
    project_usage character varying(255),
    org_name character varying(255),
    product_updates boolean,
    project_status character varying(255),
    ai_openai_api_key text,
    ai_anthropic_api_key text,
    ai_system_prompt text,
    ai_google_api_key text,
    ai_openai_compatible_api_key text,
    ai_openai_compatible_base_url text,
    ai_openai_compatible_name text,
    ai_openai_compatible_models json,
    ai_openai_compatible_headers json,
    ai_openai_allowed_models json,
    ai_anthropic_allowed_models json,
    ai_google_allowed_models json,
    collaborative_editing_enabled boolean DEFAULT false NOT NULL,
    ai_translation_default_model text,
    ai_translation_glossary json,
    ai_translation_style_guide text,
    license_key character varying(255) DEFAULT NULL::character varying,
    license_token text,
    mcp_oauth_enabled boolean DEFAULT false NOT NULL,
    mcp_oauth_dcr_enabled boolean DEFAULT false NOT NULL,
    mcp_oauth_cimd_enabled boolean DEFAULT false NOT NULL
);

CREATE TABLE public.directus_shares (
    id uuid NOT NULL,
    name character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    role uuid,
    password character varying(255),
    user_created uuid,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_start timestamp with time zone,
    date_end timestamp with time zone,
    times_used integer DEFAULT 0,
    max_uses integer
);

CREATE TABLE public.directus_translations (
    id uuid NOT NULL,
    language character varying(255) NOT NULL,
    key character varying(255) NOT NULL,
    value text NOT NULL
);

CREATE TABLE public.directus_users (
    id uuid NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(128),
    password character varying(255),
    location character varying(255),
    title character varying(50),
    description text,
    tags json,
    avatar uuid,
    language character varying(255) DEFAULT NULL::character varying,
    tfa_secret character varying(255),
    status character varying(16) DEFAULT 'active'::character varying NOT NULL,
    role uuid,
    token character varying(255),
    last_access timestamp with time zone,
    last_page character varying(255),
    provider character varying(128) DEFAULT 'default'::character varying NOT NULL,
    external_identifier character varying(255),
    auth_data json,
    email_notifications boolean DEFAULT true,
    appearance character varying(255),
    theme_dark character varying(255),
    theme_light character varying(255),
    theme_light_overrides json,
    theme_dark_overrides json,
    text_direction character varying(255) DEFAULT 'auto'::character varying NOT NULL
);

CREATE TABLE public.directus_versions (
    id uuid NOT NULL,
    key character varying(64) NOT NULL,
    name character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255),
    hash character varying(255),
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_updated timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    user_updated uuid,
    delta json
);

CREATE TABLE public.products (
    id integer NOT NULL,
    slug character varying(255),
    name character varying(255),
    category character varying(255),
    price integer,
    description text DEFAULT 'no description'::text,
    care json,
    images uuid,
    drop_id integer
);

CREATE TABLE public.stock (
    stock_id integer NOT NULL,
    size character varying(255),
    quantity integer,
    product_id integer
);

ALTER TABLE ONLY public.directus_activity ALTER COLUMN id SET DEFAULT nextval('public.directus_activity_id_seq'::regclass);
ALTER TABLE ONLY public.directus_fields ALTER COLUMN id SET DEFAULT nextval('public.directus_fields_id_seq'::regclass);
ALTER TABLE ONLY public.directus_notifications ALTER COLUMN id SET DEFAULT nextval('public.directus_notifications_id_seq'::regclass);
ALTER TABLE ONLY public.directus_permissions ALTER COLUMN id SET DEFAULT nextval('public.directus_permissions_id_seq'::regclass);
ALTER TABLE ONLY public.directus_presets ALTER COLUMN id SET DEFAULT nextval('public.directus_presets_id_seq'::regclass);
ALTER TABLE ONLY public.directus_relations ALTER COLUMN id SET DEFAULT nextval('public.directus_relations_id_seq'::regclass);
ALTER TABLE ONLY public.directus_revisions ALTER COLUMN id SET DEFAULT nextval('public.directus_revisions_id_seq'::regclass);
ALTER TABLE ONLY public.directus_settings ALTER COLUMN id SET DEFAULT nextval('public.directus_settings_id_seq'::regclass);
ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);
ALTER TABLE ONLY public.stock ALTER COLUMN stock_id SET DEFAULT nextval('public.stock_stock_id_seq'::regclass);
COPY public.directus_access (id, role, "user", policy, sort) FROM stdin;
f459508b-80df-48d8-b302-5261164c6ea9	\N	\N	abf8a154-5b1c-4a46-ac9c-7300570f4f17	1
5963236e-12b2-46ff-bc9c-0b86d386ee69	d566c885-c7ed-4494-bef4-0b4e423e7901	\N	a91123aa-ba1a-4c22-b440-f7b797fa88c1	\N
\.
COPY public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, origin) FROM stdin;
1	login	c142a669-54e4-4b64-95f3-992767df9471	2026-08-13 18:51:52.707+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_users	c142a669-54e4-4b64-95f3-992767df9471	http://localhost:8055
2	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-13 18:52:30.415+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_settings	1	http://localhost:8055
3	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-13 18:52:51.482+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	1	http://localhost:8055
4	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-13 18:52:51.485+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_collections	prod	http://localhost:8055
5	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-13 18:56:18.094+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	2	http://localhost:8055
8	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-13 18:58:38.35+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_settings	1	http://localhost:8055
9	login	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 09:30:34.099+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_users	c142a669-54e4-4b64-95f3-992767df9471	http://127.0.0.1:8055
10	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 09:31:09.125+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_settings	1	http://127.0.0.1:8055
11	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 09:31:10.876+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_settings	1	http://127.0.0.1:8055
12	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 09:31:12.831+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_settings	1	http://127.0.0.1:8055
13	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 09:31:17.278+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_settings	1	http://127.0.0.1:8055
14	delete	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 09:32:32.139+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_collections	prod	http://127.0.0.1:8055
15	delete	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 09:32:32.141+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	1	http://127.0.0.1:8055
16	delete	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 09:32:32.142+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	2	http://127.0.0.1:8055
17	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 09:43:18.877+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_collections	drops	http://127.0.0.1:8055
18	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 09:43:21.628+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	3	http://127.0.0.1:8055
19	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 09:43:30.285+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	4	http://127.0.0.1:8055
20	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 09:43:36.772+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	5	http://127.0.0.1:8055
21	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 09:43:41.69+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	6	http://127.0.0.1:8055
22	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 09:43:46.653+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	7	http://127.0.0.1:8055
23	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 09:43:48.208+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	8	http://127.0.0.1:8055
24	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 09:45:58.723+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_files	a822ea0b-7bf3-4990-8f7e-805fd1e04412	http://127.0.0.1:8055
25	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 09:46:06.783+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_files	a822ea0b-7bf3-4990-8f7e-805fd1e04412	http://127.0.0.1:8055
26	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 09:46:09.561+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_files	0ec67a37-8ce6-4d5d-8a08-376435050e63	http://127.0.0.1:8055
27	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 09:46:16.938+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_files	994275ba-80fa-4815-b625-c44476f574f2	http://127.0.0.1:8055
28	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 09:49:52.826+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_collections	products	http://127.0.0.1:8055
29	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 09:49:56.11+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	9	http://127.0.0.1:8055
30	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 09:50:21.974+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_collections	products	http://127.0.0.1:8055
31	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 09:53:50.036+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_settings	1	http://127.0.0.1:8055
32	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 09:54:59.331+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	10	http://127.0.0.1:8055
33	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 09:54:59.335+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_collections	example	http://127.0.0.1:8055
34	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 09:56:12.819+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	11	http://127.0.0.1:8055
36	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 09:58:49.637+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_settings	1	http://127.0.0.1:8055
37	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 09:58:53.255+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_settings	1	http://127.0.0.1:8055
38	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 09:58:55.504+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_settings	1	http://127.0.0.1:8055
39	delete	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 09:59:13.118+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_collections	example	http://127.0.0.1:8055
40	delete	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 09:59:13.127+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	10	http://127.0.0.1:8055
41	delete	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 09:59:13.128+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	11	http://127.0.0.1:8055
42	delete	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:02:43.611+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	8	http://127.0.0.1:8055
43	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:03:30.669+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	12	http://127.0.0.1:8055
44	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:03:35.439+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	3	http://127.0.0.1:8055
45	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:03:35.444+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	4	http://127.0.0.1:8055
46	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:03:35.454+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	5	http://127.0.0.1:8055
47	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:03:35.458+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	6	http://127.0.0.1:8055
48	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:03:35.464+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	7	http://127.0.0.1:8055
49	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:03:35.48+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	12	http://127.0.0.1:8055
51	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:04:19.001+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	13	http://127.0.0.1:8055
50	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:03:52.408+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_collections	products	http://127.0.0.1:8055
52	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:04:33.935+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_settings	1	http://127.0.0.1:8055
53	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:07:55.563+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	14	http://127.0.0.1:8055
54	delete	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:08:14.153+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_collections	products	http://127.0.0.1:8055
55	delete	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:08:14.155+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	9	http://127.0.0.1:8055
56	delete	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:08:14.155+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	13	http://127.0.0.1:8055
57	delete	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:08:14.156+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	14	http://127.0.0.1:8055
58	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:09:50.386+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	15	http://127.0.0.1:8055
59	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:09:50.39+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_collections	products	http://127.0.0.1:8055
60	delete	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:10:07.015+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_collections	products	http://127.0.0.1:8055
61	delete	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:10:07.022+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	15	http://127.0.0.1:8055
62	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:10:18.201+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	16	http://127.0.0.1:8055
63	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:10:18.207+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_collections	productss	http://127.0.0.1:8055
64	delete	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:10:37.643+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_collections	drops	http://127.0.0.1:8055
65	delete	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:10:37.652+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	3	http://127.0.0.1:8055
66	delete	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:10:37.654+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	4	http://127.0.0.1:8055
67	delete	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:10:37.655+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	5	http://127.0.0.1:8055
68	delete	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:10:37.657+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	6	http://127.0.0.1:8055
69	delete	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:10:37.659+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	7	http://127.0.0.1:8055
70	delete	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:10:37.661+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	12	http://127.0.0.1:8055
71	delete	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:10:44.157+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_collections	productss	http://127.0.0.1:8055
72	delete	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:10:44.159+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	16	http://127.0.0.1:8055
73	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:11:14.189+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	17	http://127.0.0.1:8055
74	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:11:14.191+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_collections	products	http://127.0.0.1:8055
75	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:14:27.687+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	18	http://127.0.0.1:8055
76	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:14:49.162+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	19	http://127.0.0.1:8055
77	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:18:36.354+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	20	http://127.0.0.1:8055
78	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:18:47.403+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	20	http://127.0.0.1:8055
79	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:19:15.56+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	21	http://127.0.0.1:8055
80	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:19:21.305+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	21	http://127.0.0.1:8055
81	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:19:36.479+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	22	http://127.0.0.1:8055
82	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:25:39.272+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	23	http://127.0.0.1:8055
83	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:26:50.124+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_folders	1bca5a21-99f2-4f20-b294-e664268e4bde	http://127.0.0.1:8055
84	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:26:59.573+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_files	0ec67a37-8ce6-4d5d-8a08-376435050e63	http://127.0.0.1:8055
85	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:26:59.574+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_files	994275ba-80fa-4815-b625-c44476f574f2	http://127.0.0.1:8055
86	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:26:59.574+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_files	a822ea0b-7bf3-4990-8f7e-805fd1e04412	http://127.0.0.1:8055
87	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:28:36.595+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	24	http://127.0.0.1:8055
88	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:30:12.902+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	25	http://127.0.0.1:8055
89	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:32:39.067+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	26	http://127.0.0.1:8055
90	delete	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:33:12.432+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	26	http://127.0.0.1:8055
91	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:35:31.384+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	27	http://127.0.0.1:8055
92	delete	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:40:23.552+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	27	http://127.0.0.1:8055
93	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:42:41.508+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	28	http://127.0.0.1:8055
94	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:42:41.51+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_collections	stock	http://127.0.0.1:8055
95	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:45:31.176+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	29	http://127.0.0.1:8055
96	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:45:43.226+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	29	http://127.0.0.1:8055
97	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:46:12.939+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	30	http://127.0.0.1:8055
98	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:46:58.535+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_collections	stock	http://127.0.0.1:8055
99	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:47:06.946+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_collections	products	http://127.0.0.1:8055
100	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:55:52.684+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	31	http://127.0.0.1:8055
101	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:56:20.56+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	32	http://127.0.0.1:8055
102	delete	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:56:57.587+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	32	http://127.0.0.1:8055
103	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:57:09.15+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	33	http://127.0.0.1:8055
104	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:58:01.854+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	33	http://127.0.0.1:8055
105	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:58:10.762+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	17	http://127.0.0.1:8055
106	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:58:10.767+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	18	http://127.0.0.1:8055
107	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:58:10.771+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	19	http://127.0.0.1:8055
108	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:58:10.775+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	20	http://127.0.0.1:8055
109	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:58:10.779+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	21	http://127.0.0.1:8055
110	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:58:10.783+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	33	http://127.0.0.1:8055
111	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:58:10.787+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	22	http://127.0.0.1:8055
112	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:58:10.792+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	23	http://127.0.0.1:8055
113	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:58:10.796+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	24	http://127.0.0.1:8055
114	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:58:10.799+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	25	http://127.0.0.1:8055
115	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:58:10.804+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	31	http://127.0.0.1:8055
116	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:58:12.725+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	17	http://127.0.0.1:8055
117	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:58:12.731+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	18	http://127.0.0.1:8055
118	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:58:12.735+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	19	http://127.0.0.1:8055
119	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:58:12.739+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	20	http://127.0.0.1:8055
120	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:58:12.743+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	33	http://127.0.0.1:8055
121	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:58:12.746+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	21	http://127.0.0.1:8055
122	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:58:12.751+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	22	http://127.0.0.1:8055
123	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:58:12.755+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	23	http://127.0.0.1:8055
124	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:58:12.761+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	24	http://127.0.0.1:8055
125	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:58:12.777+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	25	http://127.0.0.1:8055
126	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:58:12.781+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	31	http://127.0.0.1:8055
127	delete	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:01:40.457+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	33	http://127.0.0.1:8055
128	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:02:46.586+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	34	http://127.0.0.1:8055
129	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:02:46.683+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	35	http://127.0.0.1:8055
130	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:02:46.685+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_collections	products_stock	http://127.0.0.1:8055
131	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:02:46.715+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	36	http://127.0.0.1:8055
132	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:02:46.802+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	37	http://127.0.0.1:8055
133	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:02:54.006+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	17	http://127.0.0.1:8055
134	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:02:54.01+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	18	http://127.0.0.1:8055
135	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:02:54.015+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	19	http://127.0.0.1:8055
136	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:02:54.018+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	20	http://127.0.0.1:8055
137	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:02:54.023+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	21	http://127.0.0.1:8055
138	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:02:54.026+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	34	http://127.0.0.1:8055
139	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:02:54.032+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	22	http://127.0.0.1:8055
140	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:02:54.037+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	23	http://127.0.0.1:8055
141	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:02:54.041+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	24	http://127.0.0.1:8055
142	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:02:54.045+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	25	http://127.0.0.1:8055
143	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:02:54.049+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	31	http://127.0.0.1:8055
148	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:04:42.954+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	products	1	http://127.0.0.1:8055
149	delete	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:05:12.049+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	31	http://127.0.0.1:8055
150	delete	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:06:18.738+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_collections	products_stock	http://127.0.0.1:8055
151	delete	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:06:18.741+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	35	http://127.0.0.1:8055
152	delete	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:06:18.742+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	36	http://127.0.0.1:8055
153	delete	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:06:18.742+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	37	http://127.0.0.1:8055
154	delete	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:06:18.753+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	34	http://127.0.0.1:8055
155	delete	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:06:29.789+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	products	1	http://127.0.0.1:8055
158	delete	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:09:50.714+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_collections	stock	http://127.0.0.1:8055
159	delete	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:09:50.715+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	28	http://127.0.0.1:8055
160	delete	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:09:50.717+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	29	http://127.0.0.1:8055
161	delete	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:09:50.719+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	30	http://127.0.0.1:8055
162	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:10:08.363+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	38	http://127.0.0.1:8055
163	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:10:08.367+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_collections	stock	http://127.0.0.1:8055
164	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:11:35.966+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	39	http://127.0.0.1:8055
165	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:11:50.828+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	40	http://127.0.0.1:8055
166	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:11:53.446+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	38	http://127.0.0.1:8055
167	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:11:53.453+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	40	http://127.0.0.1:8055
168	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:11:53.459+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	39	http://127.0.0.1:8055
169	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:12:06.641+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	41	http://127.0.0.1:8055
170	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:12:08.521+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	38	http://127.0.0.1:8055
171	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:12:08.526+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	41	http://127.0.0.1:8055
172	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:12:08.53+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	40	http://127.0.0.1:8055
173	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:12:08.534+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	39	http://127.0.0.1:8055
174	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:13:04.787+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	42	http://127.0.0.1:8055
175	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:13:10+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	17	http://127.0.0.1:8055
176	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:13:10.004+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	18	http://127.0.0.1:8055
177	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:13:10.008+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	19	http://127.0.0.1:8055
178	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:13:10.012+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	20	http://127.0.0.1:8055
179	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:13:10.017+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	42	http://127.0.0.1:8055
180	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:13:10.021+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	21	http://127.0.0.1:8055
181	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:13:10.025+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	22	http://127.0.0.1:8055
182	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:13:10.029+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	23	http://127.0.0.1:8055
183	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:13:10.033+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	24	http://127.0.0.1:8055
184	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:13:10.037+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	25	http://127.0.0.1:8055
185	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:13:11.242+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	17	http://127.0.0.1:8055
186	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:13:11.246+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	18	http://127.0.0.1:8055
187	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:13:11.255+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	19	http://127.0.0.1:8055
188	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:13:11.259+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	20	http://127.0.0.1:8055
189	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:13:11.263+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	21	http://127.0.0.1:8055
190	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:13:11.267+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	42	http://127.0.0.1:8055
191	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:13:11.27+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	22	http://127.0.0.1:8055
192	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:13:11.274+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	23	http://127.0.0.1:8055
193	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:13:11.279+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	24	http://127.0.0.1:8055
194	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:13:11.283+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	25	http://127.0.0.1:8055
195	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:13:14.206+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	17	http://127.0.0.1:8055
196	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:13:14.209+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	18	http://127.0.0.1:8055
197	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:13:14.213+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	19	http://127.0.0.1:8055
198	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:13:14.217+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	20	http://127.0.0.1:8055
199	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:13:14.221+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	42	http://127.0.0.1:8055
200	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:13:14.224+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	21	http://127.0.0.1:8055
201	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:13:14.228+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	22	http://127.0.0.1:8055
202	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:13:14.232+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	23	http://127.0.0.1:8055
203	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:13:14.235+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	24	http://127.0.0.1:8055
204	update	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:13:14.24+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	directus_fields	25	http://127.0.0.1:8055
205	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:14:12.632+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	stock	1	http://127.0.0.1:8055
206	create	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:14:12.634+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	products	2	http://127.0.0.1:8055
\.
COPY public.directus_collections (collection, icon, note, display_template, hidden, singleton, translations, archive_field, archive_app_filter, archive_value, unarchive_value, sort_field, accountability, color, item_duplication_fields, sort, "group", collapse, preview_url, versioning, status, autosave_revision_interval) FROM stdin;
products	shopping_cart	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open	\N	f	active	\N
stock	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open	\N	f	active	\N
\.
COPY public.directus_comments (id, collection, item, comment, date_created, date_updated, user_created, user_updated) FROM stdin;
\.
COPY public.directus_dashboards (id, name, icon, note, date_created, user_created, color) FROM stdin;
\.
COPY public.directus_deployment_projects (id, deployment, external_id, name, date_created, user_created, url, framework, deployable) FROM stdin;
\.
COPY public.directus_deployment_runs (id, project, external_id, target, date_created, user_created, status, url, started_at, completed_at) FROM stdin;
\.
COPY public.directus_deployments (id, provider, credentials, options, date_created, user_created, webhook_ids, webhook_secret, last_synced_at) FROM stdin;
\.
COPY public.directus_extensions (enabled, id, folder, source, bundle) FROM stdin;
\.
COPY public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message, searchable) FROM stdin;
17	products	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
18	products	slug	\N	input	{"placeholder":"item naming in URL"}	\N	\N	f	f	2	full	\N	\N	\N	t	\N	\N	\N	t
19	products	name	\N	input	{"placeholder":"actual item name"}	\N	\N	f	f	3	full	\N	\N	\N	t	\N	\N	\N	t
20	products	category	\N	select-dropdown	{"allowOther":true,"choices":[{"text":"t-shirts","value":"tShirts"},{"text":"hoodies","value":"hoodies"},{"text":"pants","value":"pants"},{"text":"shoes","value":"shoes"}]}	\N	\N	f	f	4	full	\N	\N	\N	t	\N	\N	\N	t
42	products	stock	o2m	list-o2m	\N	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N	t
21	products	price	\N	input	\N	\N	\N	f	f	6	full	\N	\N	\N	t	\N	\N	\N	t
22	products	description	\N	input-multiline	\N	\N	\N	f	f	7	full	\N	\N	\N	f	\N	\N	\N	t
23	products	care	cast-json	select-multiple-dropdown	{"placeholder":"tips how to keep care of item","choices":[{"text":"do not wash in hot water","value":"do not wash in hot water"},{"text":"do not use washing machine","value":"do not use washing machine"}],"allowOther":true}	\N	\N	f	f	8	full	\N	\N	\N	f	\N	\N	\N	t
24	products	images	file	file-image	{"folder":"1bca5a21-99f2-4f20-b294-e664268e4bde","crop":false}	\N	\N	f	f	9	full	\N	\N	\N	f	\N	\N	\N	t
25	products	drop_id	\N	input	\N	\N	\N	f	f	10	full	\N	\N	\N	f	\N	\N	\N	t
38	stock	stock_id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
41	stock	product_id	\N	input	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N	t
40	stock	quantity	\N	input	\N	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N	t
39	stock	size	\N	select-dropdown	{"choices":[{"text":"XS","value":"xs"},{"text":"S","value":"s"},{"text":"M","value":"m"},{"text":"L","value":"l"},{"text":"XL","value":"xl"},{"text":"XXL","value":"xxl"},{"text":"One size","value":"onesize"}]}	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N	t
\.
COPY public.directus_files (id, storage, filename_disk, filename_download, title, type, folder, uploaded_by, created_on, modified_by, modified_on, charset, filesize, width, height, duration, embed, description, location, tags, metadata, focal_point_x, focal_point_y, tus_id, tus_data, uploaded_on) FROM stdin;
a822ea0b-7bf3-4990-8f7e-805fd1e04412	local	a822ea0b-7bf3-4990-8f7e-805fd1e04412.png	c0333109-7972-48c9-a3a9-e59e4df883ad-Photoroom.png	pivo	image/png	1bca5a21-99f2-4f20-b294-e664268e4bde	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 09:45:58.722+00	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:26:59.571+00	\N	1637469	1254	1254	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2026-08-15 09:45:58.736+00
0ec67a37-8ce6-4d5d-8a08-376435050e63	local	0ec67a37-8ce6-4d5d-8a08-376435050e63.png	aura.png	Aura	image/png	1bca5a21-99f2-4f20-b294-e664268e4bde	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 09:46:09.56+00	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:26:59.571+00	\N	2072539	1054	1492	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2026-08-15 09:46:09.571+00
994275ba-80fa-4815-b625-c44476f574f2	local	994275ba-80fa-4815-b625-c44476f574f2.png	drip.png	Drip	image/png	1bca5a21-99f2-4f20-b294-e664268e4bde	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 09:46:16.937+00	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 10:26:59.571+00	\N	854606	830	830	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2026-08-15 09:46:16.949+00
\.
COPY public.directus_flows (id, name, icon, color, description, status, trigger, accountability, options, operation, date_created, user_created) FROM stdin;
\.
COPY public.directus_folders (id, name, parent) FROM stdin;
1bca5a21-99f2-4f20-b294-e664268e4bde	items	\N
\.
COPY public.directus_migrations (version, name, "timestamp") FROM stdin;
20201028A	Remove Collection Foreign Keys	2026-08-13 18:51:26.614787+00
20201029A	Remove System Relations	2026-08-13 18:51:26.621539+00
20201029B	Remove System Collections	2026-08-13 18:51:26.626695+00
20201029C	Remove System Fields	2026-08-13 18:51:26.632894+00
20201105A	Add Cascade System Relations	2026-08-13 18:51:26.691446+00
20201105B	Change Webhook URL Type	2026-08-13 18:51:26.69952+00
20210225A	Add Relations Sort Field	2026-08-13 18:51:26.708784+00
20210304A	Remove Locked Fields	2026-08-13 18:51:26.718186+00
20210312A	Webhooks Collections Text	2026-08-13 18:51:26.725417+00
20210331A	Add Refresh Interval	2026-08-13 18:51:26.728875+00
20210415A	Make Filesize Nullable	2026-08-13 18:51:26.736687+00
20210416A	Add Collections Accountability	2026-08-13 18:51:26.740737+00
20210422A	Remove Files Interface	2026-08-13 18:51:26.742922+00
20210506A	Rename Interfaces	2026-08-13 18:51:26.753726+00
20210510A	Restructure Relations	2026-08-13 18:51:26.769058+00
20210518A	Add Foreign Key Constraints	2026-08-13 18:51:26.775435+00
20210519A	Add System Fk Triggers	2026-08-13 18:51:26.801964+00
20210521A	Add Collections Icon Color	2026-08-13 18:51:26.805218+00
20210525A	Add Insights	2026-08-13 18:51:26.818223+00
20210608A	Add Deep Clone Config	2026-08-13 18:51:26.821511+00
20210626A	Change Filesize Bigint	2026-08-13 18:51:26.830938+00
20210716A	Add Conditions to Fields	2026-08-13 18:51:26.835244+00
20210721A	Add Default Folder	2026-08-13 18:51:26.842961+00
20210802A	Replace Groups	2026-08-13 18:51:26.847781+00
20210803A	Add Required to Fields	2026-08-13 18:51:26.852308+00
20210805A	Update Groups	2026-08-13 18:51:26.859979+00
20210805B	Change Image Metadata Structure	2026-08-13 18:51:26.863897+00
20210811A	Add Geometry Config	2026-08-13 18:51:26.86734+00
20210831A	Remove Limit Column	2026-08-13 18:51:26.870757+00
20210903A	Add Auth Provider	2026-08-13 18:51:26.886335+00
20210907A	Webhooks Collections Not Null	2026-08-13 18:51:26.898349+00
20210910A	Move Module Setup	2026-08-13 18:51:26.905187+00
20210920A	Webhooks URL Not Null	2026-08-13 18:51:26.918851+00
20210924A	Add Collection Organization	2026-08-13 18:51:26.927471+00
20210927A	Replace Fields Group	2026-08-13 18:51:26.936262+00
20210927B	Replace M2M Interface	2026-08-13 18:51:26.938507+00
20210929A	Rename Login Action	2026-08-13 18:51:26.940482+00
20211007A	Update Presets	2026-08-13 18:51:26.946257+00
20211009A	Add Auth Data	2026-08-13 18:51:26.949526+00
20211016A	Add Webhook Headers	2026-08-13 18:51:26.952738+00
20211103A	Set Unique to User Token	2026-08-13 18:51:26.956115+00
20211103B	Update Special Geometry	2026-08-13 18:51:26.958373+00
20211104A	Remove Collections Listing	2026-08-13 18:51:26.961706+00
20211118A	Add Notifications	2026-08-13 18:51:26.977729+00
20211211A	Add Shares	2026-08-13 18:51:26.995081+00
20211230A	Add Project Descriptor	2026-08-13 18:51:26.998376+00
20220303A	Remove Default Project Color	2026-08-13 18:51:27.006502+00
20220308A	Add Bookmark Icon and Color	2026-08-13 18:51:27.009707+00
20220314A	Add Translation Strings	2026-08-13 18:51:27.012728+00
20220322A	Rename Field Typecast Flags	2026-08-13 18:51:27.015713+00
20220323A	Add Field Validation	2026-08-13 18:51:27.018864+00
20220325A	Fix Typecast Flags	2026-08-13 18:51:27.022318+00
20220325B	Add Default Language	2026-08-13 18:51:27.032835+00
20220402A	Remove Default Value Panel Icon	2026-08-13 18:51:27.042446+00
20220429A	Add Flows	2026-08-13 18:51:27.07094+00
20220429B	Add Color to Insights Icon	2026-08-13 18:51:27.075621+00
20220429C	Drop Non Null From IP of Activity	2026-08-13 18:51:27.08002+00
20220429D	Drop Non Null From Sender of Notifications	2026-08-13 18:51:27.083829+00
20220614A	Rename Hook Trigger to Event	2026-08-13 18:51:27.086228+00
20220801A	Update Notifications Timestamp Column	2026-08-13 18:51:27.094151+00
20220802A	Add Custom Aspect Ratios	2026-08-13 18:51:27.097752+00
20220826A	Add Origin to Accountability	2026-08-13 18:51:27.102493+00
20230401A	Update Material Icons	2026-08-13 18:51:27.111367+00
20230525A	Add Preview Settings	2026-08-13 18:51:27.114708+00
20230526A	Migrate Translation Strings	2026-08-13 18:51:27.123002+00
20230721A	Require Shares Fields	2026-08-13 18:51:27.12873+00
20230823A	Add Content Versioning	2026-08-13 18:51:27.143659+00
20230927A	Themes	2026-08-13 18:51:27.161+00
20231009A	Update CSV Fields to Text	2026-08-13 18:51:27.164322+00
20231009B	Update Panel Options	2026-08-13 18:51:27.166501+00
20231010A	Add Extensions	2026-08-13 18:51:27.169981+00
20231215A	Add Focalpoints	2026-08-13 18:51:27.172887+00
20240122A	Add Report URL Fields	2026-08-13 18:51:27.176033+00
20240204A	Marketplace	2026-08-13 18:51:27.20031+00
20240305A	Change Useragent Type	2026-08-13 18:51:27.211731+00
20240311A	Deprecate Webhooks	2026-08-13 18:51:27.220249+00
20240422A	Public Registration	2026-08-13 18:51:27.230426+00
20240515A	Add Session Window	2026-08-13 18:51:27.234449+00
20240701A	Add Tus Data	2026-08-13 18:51:27.238519+00
20240716A	Update Files Date Fields	2026-08-13 18:51:27.24746+00
20240806A	Permissions Policies	2026-08-13 18:51:27.330346+00
20240817A	Update Icon Fields Length	2026-08-13 18:51:27.38177+00
20240909A	Separate Comments	2026-08-13 18:51:27.390495+00
20240909B	Consolidate Content Versioning	2026-08-13 18:51:27.3938+00
20240924A	Migrate Legacy Comments	2026-08-13 18:51:27.398298+00
20240924B	Populate Versioning Deltas	2026-08-13 18:51:27.401464+00
20250224A	Visual Editor	2026-08-13 18:51:27.405033+00
20250609A	License Banner	2026-08-13 18:51:27.409033+00
20250613A	Add Project ID	2026-08-13 18:51:27.419476+00
20250718A	Add Direction	2026-08-13 18:51:27.423321+00
20250813A	Add MCP	2026-08-13 18:51:27.42695+00
20251012A	Add Field Searchable	2026-08-13 18:51:27.43032+00
20251014A	Add Project Owner	2026-08-13 18:51:27.48228+00
20251028A	Add Retention Indexes	2026-08-13 18:51:27.515901+00
20251103A	Add AI Settings	2026-08-13 18:51:27.519801+00
20251224A	Remove Webhooks	2026-08-13 18:51:27.523922+00
20260110A	Add AI Provider Settings	2026-08-13 18:51:27.529265+00
20260113A	Add Revisions Index	2026-08-13 18:51:27.595888+00
20260128A	Add Collaborative Editing	2026-08-13 18:51:27.599539+00
20260204A	Add Deployment	2026-08-13 18:51:27.62688+00
20260211A	Add Deployment Webhooks	2026-08-13 18:51:27.638526+00
20260217A	Null Item Versions	2026-08-13 18:51:27.644781+00
20260312A	Add AI Translation Settings	2026-08-13 18:51:27.648369+00
20260507A	Add Licensing	2026-08-13 18:51:27.654999+00
20260512A	Add Autosave Revision Interval	2026-08-13 18:51:27.659424+00
20260512B	Add MCP Oauth	2026-08-13 18:51:27.747528+00
\.
COPY public.directus_notifications (id, "timestamp", status, recipient, sender, subject, message, collection, item) FROM stdin;
\.
COPY public.directus_oauth_clients (client_id, client_name, redirect_uris, grant_types, token_endpoint_auth_method, client_secret_hash, registration_type, client_uri, logo_uri, tos_uri, policy_uri, metadata_fetched_at, metadata_expires_at, metadata_etag, date_created) FROM stdin;
\.
COPY public.directus_oauth_codes (id, code_hash, client, "user", redirect_uri, resource, code_challenge, code_challenge_method, scope, expires_at, used_at) FROM stdin;
\.
COPY public.directus_oauth_consents (id, "user", client, redirect_uri, scope, date_created, date_updated) FROM stdin;
\.
COPY public.directus_oauth_tokens (id, client, "user", session, previous_session, resource, code_hash, scope, expires_at, date_created) FROM stdin;
\.
COPY public.directus_operations (id, name, key, type, position_x, position_y, options, resolve, reject, flow, date_created, user_created) FROM stdin;
\.
COPY public.directus_panels (id, dashboard, name, icon, color, show_header, note, type, position_x, position_y, width, height, options, date_created, user_created) FROM stdin;
\.
COPY public.directus_permissions (id, collection, action, permissions, validation, presets, fields, policy) FROM stdin;
\.
COPY public.directus_policies (id, name, icon, description, ip_access, enforce_tfa, admin_access, app_access) FROM stdin;
abf8a154-5b1c-4a46-ac9c-7300570f4f17	$t:public_label	public	$t:public_description	\N	f	f	f
a91123aa-ba1a-4c22-b440-f7b797fa88c1	Administrator	verified	$t:admin_description	\N	f	t	t
\.
COPY public.directus_presets (id, bookmark, "user", role, collection, search, layout, layout_query, layout_options, refresh_interval, filter, icon, color) FROM stdin;
2	\N	c142a669-54e4-4b64-95f3-992767df9471	\N	directus_files	\N	cards	{"cards":{"sort":["-uploaded_on"],"page":1}}	{"cards":{"icon":"insert_drive_file","title":"{{ title }}","subtitle":"{{ type }} • {{ filesize }}","size":4,"imageFit":"crop"}}	\N	\N	bookmark	\N
6	\N	c142a669-54e4-4b64-95f3-992767df9471	\N	products	\N	\N	{"tabular":{"page":1}}	\N	\N	\N	bookmark	\N
3	\N	c142a669-54e4-4b64-95f3-992767df9471	\N	products	\N	tabular	{"tabular":{"page":1,"fields":["category","name","slug","stock","id"]}}	\N	\N	\N	bookmark	\N
\.
COPY public.directus_relations (id, many_collection, many_field, one_collection, one_field, one_collection_field, one_allowed_collections, junction_field, sort_field, one_deselect_action) FROM stdin;
4	products	images	directus_files	\N	\N	\N	\N	\N	nullify
8	stock	product_id	products	stock	\N	\N	\N	\N	nullify
\.
COPY public.directus_revisions (id, activity, collection, item, data, delta, parent, version) FROM stdin;
1	2	directus_settings	1	{"id":1,"project_name":"Directus","project_url":null,"project_color":"#6644FF","public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"basemaps":null,"mapbox_key":null,"module_bar":null,"project_descriptor":null,"default_language":"en-US","custom_aspect_ratios":null,"default_appearance":"auto","default_theme_light":null,"theme_light_overrides":null,"default_theme_dark":null,"theme_dark_overrides":null,"report_error_url":null,"report_bug_url":null,"report_feature_url":null,"public_registration":false,"public_registration_verify_email":true,"public_registration_email_filter":null,"visual_editor_urls":null,"project_id":"019ffc77-0939-744b-ae42-d1ffb12d956c","mcp_enabled":false,"mcp_allow_deletes":false,"mcp_prompts_collection":null,"mcp_system_prompt_enabled":true,"mcp_system_prompt":null,"project_owner":"waverest.official@gmail.com","project_usage":null,"org_name":null,"product_updates":false,"project_status":null,"ai_openai_api_key":null,"ai_anthropic_api_key":null,"ai_system_prompt":null,"ai_google_api_key":null,"ai_openai_compatible_api_key":null,"ai_openai_compatible_base_url":null,"ai_openai_compatible_name":null,"ai_openai_compatible_models":null,"ai_openai_compatible_headers":null,"ai_openai_allowed_models":["gpt-5.4-nano","gpt-5.4-mini","gpt-5.4"],"ai_anthropic_allowed_models":["claude-haiku-4-5","claude-sonnet-4-6"],"ai_google_allowed_models":["gemini-3-pro-preview","gemini-3-flash-preview","gemini-2.5-pro","gemini-2.5-flash"],"collaborative_editing_enabled":false,"ai_translation_default_model":null,"ai_translation_glossary":null,"ai_translation_style_guide":null,"license_key":"**********","license_token":"**********","mcp_oauth_enabled":false,"mcp_oauth_dcr_enabled":false,"mcp_oauth_cimd_enabled":false}	{"project_owner":"waverest.official@gmail.com","project_usage":null,"org_name":null,"product_updates":false}	\N	\N
2	3	directus_fields	1	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id"}	\N	\N
3	4	directus_collections	prod	{"singleton":false,"collection":"prod"}	{"singleton":false,"collection":"prod"}	\N	\N
4	5	directus_fields	2	{"sort":2,"interface":"input","special":null,"field":"name"}	{"sort":2,"interface":"input","special":null,"field":"name"}	\N	\N
7	8	directus_settings	1	{"id":1,"project_name":"Directus","project_url":null,"project_color":"#ED333B","public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"basemaps":null,"mapbox_key":null,"module_bar":null,"project_descriptor":null,"default_language":"en-US","custom_aspect_ratios":null,"default_appearance":"auto","default_theme_light":null,"theme_light_overrides":null,"default_theme_dark":null,"theme_dark_overrides":null,"report_error_url":null,"report_bug_url":null,"report_feature_url":null,"public_registration":false,"public_registration_verify_email":true,"public_registration_email_filter":null,"visual_editor_urls":null,"project_id":"019ffc77-0939-744b-ae42-d1ffb12d956c","mcp_enabled":false,"mcp_allow_deletes":false,"mcp_prompts_collection":null,"mcp_system_prompt_enabled":true,"mcp_system_prompt":null,"project_owner":"waverest.official@gmail.com","project_usage":null,"org_name":null,"product_updates":false,"project_status":null,"ai_openai_api_key":null,"ai_anthropic_api_key":null,"ai_system_prompt":null,"ai_google_api_key":null,"ai_openai_compatible_api_key":null,"ai_openai_compatible_base_url":null,"ai_openai_compatible_name":null,"ai_openai_compatible_models":null,"ai_openai_compatible_headers":null,"ai_openai_allowed_models":["gpt-5.4-nano","gpt-5.4-mini","gpt-5.4"],"ai_anthropic_allowed_models":["claude-haiku-4-5","claude-sonnet-4-6"],"ai_google_allowed_models":["gemini-3-pro-preview","gemini-3-flash-preview","gemini-2.5-pro","gemini-2.5-flash"],"collaborative_editing_enabled":false,"ai_translation_default_model":null,"ai_translation_glossary":null,"ai_translation_style_guide":null,"license_key":"**********","license_token":"**********","mcp_oauth_enabled":false,"mcp_oauth_dcr_enabled":false,"mcp_oauth_cimd_enabled":false}	{"project_color":"#ED333B"}	\N	\N
8	10	directus_settings	1	{"id":1,"project_name":"Directus","project_url":null,"project_color":"#ED333B","public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"basemaps":null,"mapbox_key":null,"module_bar":null,"project_descriptor":null,"default_language":"en-US","custom_aspect_ratios":null,"default_appearance":"auto","default_theme_light":"Directus Default","theme_light_overrides":null,"default_theme_dark":null,"theme_dark_overrides":null,"report_error_url":null,"report_bug_url":null,"report_feature_url":null,"public_registration":false,"public_registration_verify_email":true,"public_registration_email_filter":null,"visual_editor_urls":null,"project_id":"019ffc77-0939-744b-ae42-d1ffb12d956c","mcp_enabled":false,"mcp_allow_deletes":false,"mcp_prompts_collection":null,"mcp_system_prompt_enabled":true,"mcp_system_prompt":null,"project_owner":"waverest.official@gmail.com","project_usage":null,"org_name":null,"product_updates":false,"project_status":null,"ai_openai_api_key":null,"ai_anthropic_api_key":null,"ai_system_prompt":null,"ai_google_api_key":null,"ai_openai_compatible_api_key":null,"ai_openai_compatible_base_url":null,"ai_openai_compatible_name":null,"ai_openai_compatible_models":null,"ai_openai_compatible_headers":null,"ai_openai_allowed_models":["gpt-5.4-nano","gpt-5.4-mini","gpt-5.4"],"ai_anthropic_allowed_models":["claude-haiku-4-5","claude-sonnet-4-6"],"ai_google_allowed_models":["gemini-3-pro-preview","gemini-3-flash-preview","gemini-2.5-pro","gemini-2.5-flash"],"collaborative_editing_enabled":false,"ai_translation_default_model":null,"ai_translation_glossary":null,"ai_translation_style_guide":null,"license_key":"**********","license_token":"**********","mcp_oauth_enabled":false,"mcp_oauth_dcr_enabled":false,"mcp_oauth_cimd_enabled":false}	{"default_theme_light":"Directus Default"}	\N	\N
21	26	directus_files	0ec67a37-8ce6-4d5d-8a08-376435050e63	{"storage":"local","title":"Aura","filename_download":"aura.png","type":"image/png"}	{"storage":"local","title":"Aura","filename_download":"aura.png","type":"image/png"}	\N	\N
22	27	directus_files	994275ba-80fa-4815-b625-c44476f574f2	{"storage":"local","title":"Drip","filename_download":"drip.png","type":"image/png"}	{"storage":"local","title":"Drip","filename_download":"drip.png","type":"image/png"}	\N	\N
24	29	directus_fields	9	{"special":null,"field":"description"}	{"special":null,"field":"description"}	\N	\N
25	30	directus_collections	products	{"collection":"products","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":null,"collapse":"open","preview_url":null,"versioning":false,"status":"inactive","autosave_revision_interval":null}	{"status":"inactive"}	\N	\N
27	32	directus_fields	10	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id"}	\N	\N
28	33	directus_collections	example	{"singleton":false,"collection":"example"}	{"singleton":false,"collection":"example"}	\N	\N
9	11	directus_settings	1	{"id":1,"project_name":"Directus","project_url":null,"project_color":"#ED333B","public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"basemaps":null,"mapbox_key":null,"module_bar":null,"project_descriptor":null,"default_language":"en-US","custom_aspect_ratios":null,"default_appearance":"auto","default_theme_light":"Directus Color Match","theme_light_overrides":null,"default_theme_dark":null,"theme_dark_overrides":null,"report_error_url":null,"report_bug_url":null,"report_feature_url":null,"public_registration":false,"public_registration_verify_email":true,"public_registration_email_filter":null,"visual_editor_urls":null,"project_id":"019ffc77-0939-744b-ae42-d1ffb12d956c","mcp_enabled":false,"mcp_allow_deletes":false,"mcp_prompts_collection":null,"mcp_system_prompt_enabled":true,"mcp_system_prompt":null,"project_owner":"waverest.official@gmail.com","project_usage":null,"org_name":null,"product_updates":false,"project_status":null,"ai_openai_api_key":null,"ai_anthropic_api_key":null,"ai_system_prompt":null,"ai_google_api_key":null,"ai_openai_compatible_api_key":null,"ai_openai_compatible_base_url":null,"ai_openai_compatible_name":null,"ai_openai_compatible_models":null,"ai_openai_compatible_headers":null,"ai_openai_allowed_models":["gpt-5.4-nano","gpt-5.4-mini","gpt-5.4"],"ai_anthropic_allowed_models":["claude-haiku-4-5","claude-sonnet-4-6"],"ai_google_allowed_models":["gemini-3-pro-preview","gemini-3-flash-preview","gemini-2.5-pro","gemini-2.5-flash"],"collaborative_editing_enabled":false,"ai_translation_default_model":null,"ai_translation_glossary":null,"ai_translation_style_guide":null,"license_key":"**********","license_token":"**********","mcp_oauth_enabled":false,"mcp_oauth_dcr_enabled":false,"mcp_oauth_cimd_enabled":false}	{"default_theme_light":"Directus Color Match"}	\N	\N
10	12	directus_settings	1	{"id":1,"project_name":"Directus","project_url":null,"project_color":"#ED333B","public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"basemaps":null,"mapbox_key":null,"module_bar":null,"project_descriptor":null,"default_language":"en-US","custom_aspect_ratios":null,"default_appearance":"auto","default_theme_light":"Directus Minimal","theme_light_overrides":null,"default_theme_dark":null,"theme_dark_overrides":null,"report_error_url":null,"report_bug_url":null,"report_feature_url":null,"public_registration":false,"public_registration_verify_email":true,"public_registration_email_filter":null,"visual_editor_urls":null,"project_id":"019ffc77-0939-744b-ae42-d1ffb12d956c","mcp_enabled":false,"mcp_allow_deletes":false,"mcp_prompts_collection":null,"mcp_system_prompt_enabled":true,"mcp_system_prompt":null,"project_owner":"waverest.official@gmail.com","project_usage":null,"org_name":null,"product_updates":false,"project_status":null,"ai_openai_api_key":null,"ai_anthropic_api_key":null,"ai_system_prompt":null,"ai_google_api_key":null,"ai_openai_compatible_api_key":null,"ai_openai_compatible_base_url":null,"ai_openai_compatible_name":null,"ai_openai_compatible_models":null,"ai_openai_compatible_headers":null,"ai_openai_allowed_models":["gpt-5.4-nano","gpt-5.4-mini","gpt-5.4"],"ai_anthropic_allowed_models":["claude-haiku-4-5","claude-sonnet-4-6"],"ai_google_allowed_models":["gemini-3-pro-preview","gemini-3-flash-preview","gemini-2.5-pro","gemini-2.5-flash"],"collaborative_editing_enabled":false,"ai_translation_default_model":null,"ai_translation_glossary":null,"ai_translation_style_guide":null,"license_key":"**********","license_token":"**********","mcp_oauth_enabled":false,"mcp_oauth_dcr_enabled":false,"mcp_oauth_cimd_enabled":false}	{"default_theme_light":"Directus Minimal"}	\N	\N
11	13	directus_settings	1	{"id":1,"project_name":"Directus","project_url":null,"project_color":"#18222F","public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"basemaps":null,"mapbox_key":null,"module_bar":null,"project_descriptor":null,"default_language":"en-US","custom_aspect_ratios":null,"default_appearance":"auto","default_theme_light":"Directus Minimal","theme_light_overrides":null,"default_theme_dark":null,"theme_dark_overrides":null,"report_error_url":null,"report_bug_url":null,"report_feature_url":null,"public_registration":false,"public_registration_verify_email":true,"public_registration_email_filter":null,"visual_editor_urls":null,"project_id":"019ffc77-0939-744b-ae42-d1ffb12d956c","mcp_enabled":false,"mcp_allow_deletes":false,"mcp_prompts_collection":null,"mcp_system_prompt_enabled":true,"mcp_system_prompt":null,"project_owner":"waverest.official@gmail.com","project_usage":null,"org_name":null,"product_updates":false,"project_status":null,"ai_openai_api_key":null,"ai_anthropic_api_key":null,"ai_system_prompt":null,"ai_google_api_key":null,"ai_openai_compatible_api_key":null,"ai_openai_compatible_base_url":null,"ai_openai_compatible_name":null,"ai_openai_compatible_models":null,"ai_openai_compatible_headers":null,"ai_openai_allowed_models":["gpt-5.4-nano","gpt-5.4-mini","gpt-5.4"],"ai_anthropic_allowed_models":["claude-haiku-4-5","claude-sonnet-4-6"],"ai_google_allowed_models":["gemini-3-pro-preview","gemini-3-flash-preview","gemini-2.5-pro","gemini-2.5-flash"],"collaborative_editing_enabled":false,"ai_translation_default_model":null,"ai_translation_glossary":null,"ai_translation_style_guide":null,"license_key":"**********","license_token":"**********","mcp_oauth_enabled":false,"mcp_oauth_dcr_enabled":false,"mcp_oauth_cimd_enabled":false}	{"project_color":"#18222F"}	\N	\N
12	17	directus_collections	drops	{"collection":"drops"}	{"collection":"drops"}	\N	\N
13	18	directus_fields	3	{"special":["uuid"],"field":"id"}	{"special":["uuid"],"field":"id"}	\N	\N
14	19	directus_fields	4	{"special":null,"field":"slug"}	{"special":null,"field":"slug"}	\N	\N
15	20	directus_fields	5	{"special":null,"field":"name"}	{"special":null,"field":"name"}	\N	\N
16	21	directus_fields	6	{"special":null,"field":"release_date"}	{"special":null,"field":"release_date"}	\N	\N
17	22	directus_fields	7	{"special":null,"field":"description"}	{"special":null,"field":"description"}	\N	\N
18	23	directus_fields	8	{"special":null,"field":"image"}	{"special":null,"field":"image"}	\N	\N
19	24	directus_files	a822ea0b-7bf3-4990-8f7e-805fd1e04412	{"storage":"local","title":"C0333109 7972 48c9 A3a9 E59e4df883ad Photoroom","filename_download":"c0333109-7972-48c9-a3a9-e59e4df883ad-Photoroom.png","type":"image/png"}	{"storage":"local","title":"C0333109 7972 48c9 A3a9 E59e4df883ad Photoroom","filename_download":"c0333109-7972-48c9-a3a9-e59e4df883ad-Photoroom.png","type":"image/png"}	\N	\N
20	25	directus_files	a822ea0b-7bf3-4990-8f7e-805fd1e04412	{"id":"a822ea0b-7bf3-4990-8f7e-805fd1e04412","storage":"local","filename_disk":"a822ea0b-7bf3-4990-8f7e-805fd1e04412.png","filename_download":"c0333109-7972-48c9-a3a9-e59e4df883ad-Photoroom.png","title":"pivo","type":"image/png","created_on":"2026-08-15T09:45:58.722Z","modified_on":"2026-08-15T09:46:06.782Z","charset":null,"filesize":"1637469","width":1254,"height":1254,"duration":null,"embed":null,"description":null,"location":null,"tags":null,"metadata":{},"focal_point_x":null,"focal_point_y":null,"tus_id":null,"tus_data":null,"uploaded_on":"2026-08-15T09:45:58.736Z"}	{"title":"pivo","modified_by":"c142a669-54e4-4b64-95f3-992767df9471","modified_on":"2026-08-15T09:46:06.782Z"}	\N	\N
23	28	directus_collections	products	{"collection":"products"}	{"collection":"products"}	\N	\N
26	31	directus_settings	1	{"id":1,"project_name":"Directus","project_url":null,"project_color":"#ED333B","public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"basemaps":null,"mapbox_key":null,"module_bar":null,"project_descriptor":null,"default_language":"en-US","custom_aspect_ratios":null,"default_appearance":"auto","default_theme_light":"Directus Minimal","theme_light_overrides":null,"default_theme_dark":null,"theme_dark_overrides":null,"report_error_url":null,"report_bug_url":null,"report_feature_url":null,"public_registration":false,"public_registration_verify_email":true,"public_registration_email_filter":null,"visual_editor_urls":null,"project_id":"019ffc77-0939-744b-ae42-d1ffb12d956c","mcp_enabled":false,"mcp_allow_deletes":false,"mcp_prompts_collection":null,"mcp_system_prompt_enabled":true,"mcp_system_prompt":null,"project_owner":"waverest.official@gmail.com","project_usage":null,"org_name":null,"product_updates":false,"project_status":null,"ai_openai_api_key":null,"ai_anthropic_api_key":null,"ai_system_prompt":null,"ai_google_api_key":null,"ai_openai_compatible_api_key":null,"ai_openai_compatible_base_url":null,"ai_openai_compatible_name":null,"ai_openai_compatible_models":null,"ai_openai_compatible_headers":null,"ai_openai_allowed_models":["gpt-5.4-nano","gpt-5.4-mini","gpt-5.4"],"ai_anthropic_allowed_models":["claude-haiku-4-5","claude-sonnet-4-6"],"ai_google_allowed_models":["gemini-3-pro-preview","gemini-3-flash-preview","gemini-2.5-pro","gemini-2.5-flash"],"collaborative_editing_enabled":false,"ai_translation_default_model":null,"ai_translation_glossary":null,"ai_translation_style_guide":null,"license_key":"**********","license_token":"**********","mcp_oauth_enabled":false,"mcp_oauth_dcr_enabled":false,"mcp_oauth_cimd_enabled":false}	{"project_color":"#ED333B"}	\N	\N
29	34	directus_fields	11	{"sort":2,"interface":"file-image","special":["file"],"field":"item"}	{"sort":2,"interface":"file-image","special":["file"],"field":"item"}	\N	\N
31	36	directus_settings	1	{"id":1,"project_name":"Directus","project_url":null,"project_color":"#ED333B","public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"basemaps":null,"mapbox_key":null,"module_bar":null,"project_descriptor":null,"default_language":"en-US","custom_aspect_ratios":null,"default_appearance":"auto","default_theme_light":"Directus Minimal","theme_light_overrides":null,"default_theme_dark":"Directus Default","theme_dark_overrides":null,"report_error_url":null,"report_bug_url":null,"report_feature_url":null,"public_registration":false,"public_registration_verify_email":true,"public_registration_email_filter":null,"visual_editor_urls":null,"project_id":"019ffc77-0939-744b-ae42-d1ffb12d956c","mcp_enabled":false,"mcp_allow_deletes":false,"mcp_prompts_collection":null,"mcp_system_prompt_enabled":true,"mcp_system_prompt":null,"project_owner":"waverest.official@gmail.com","project_usage":null,"org_name":null,"product_updates":false,"project_status":null,"ai_openai_api_key":null,"ai_anthropic_api_key":null,"ai_system_prompt":null,"ai_google_api_key":null,"ai_openai_compatible_api_key":null,"ai_openai_compatible_base_url":null,"ai_openai_compatible_name":null,"ai_openai_compatible_models":null,"ai_openai_compatible_headers":null,"ai_openai_allowed_models":["gpt-5.4-nano","gpt-5.4-mini","gpt-5.4"],"ai_anthropic_allowed_models":["claude-haiku-4-5","claude-sonnet-4-6"],"ai_google_allowed_models":["gemini-3-pro-preview","gemini-3-flash-preview","gemini-2.5-pro","gemini-2.5-flash"],"collaborative_editing_enabled":false,"ai_translation_default_model":null,"ai_translation_glossary":null,"ai_translation_style_guide":null,"license_key":"**********","license_token":"**********","mcp_oauth_enabled":false,"mcp_oauth_dcr_enabled":false,"mcp_oauth_cimd_enabled":false}	{"default_theme_dark":"Directus Default"}	\N	\N
32	37	directus_settings	1	{"id":1,"project_name":"Directus","project_url":null,"project_color":"#ED333B","public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"basemaps":null,"mapbox_key":null,"module_bar":null,"project_descriptor":null,"default_language":"en-US","custom_aspect_ratios":null,"default_appearance":"auto","default_theme_light":"Directus Color Match","theme_light_overrides":null,"default_theme_dark":"Directus Default","theme_dark_overrides":null,"report_error_url":null,"report_bug_url":null,"report_feature_url":null,"public_registration":false,"public_registration_verify_email":true,"public_registration_email_filter":null,"visual_editor_urls":null,"project_id":"019ffc77-0939-744b-ae42-d1ffb12d956c","mcp_enabled":false,"mcp_allow_deletes":false,"mcp_prompts_collection":null,"mcp_system_prompt_enabled":true,"mcp_system_prompt":null,"project_owner":"waverest.official@gmail.com","project_usage":null,"org_name":null,"product_updates":false,"project_status":null,"ai_openai_api_key":null,"ai_anthropic_api_key":null,"ai_system_prompt":null,"ai_google_api_key":null,"ai_openai_compatible_api_key":null,"ai_openai_compatible_base_url":null,"ai_openai_compatible_name":null,"ai_openai_compatible_models":null,"ai_openai_compatible_headers":null,"ai_openai_allowed_models":["gpt-5.4-nano","gpt-5.4-mini","gpt-5.4"],"ai_anthropic_allowed_models":["claude-haiku-4-5","claude-sonnet-4-6"],"ai_google_allowed_models":["gemini-3-pro-preview","gemini-3-flash-preview","gemini-2.5-pro","gemini-2.5-flash"],"collaborative_editing_enabled":false,"ai_translation_default_model":null,"ai_translation_glossary":null,"ai_translation_style_guide":null,"license_key":"**********","license_token":"**********","mcp_oauth_enabled":false,"mcp_oauth_dcr_enabled":false,"mcp_oauth_cimd_enabled":false}	{"default_theme_light":"Directus Color Match"}	\N	\N
33	38	directus_settings	1	{"id":1,"project_name":"Directus","project_url":null,"project_color":"#ED333B","public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"basemaps":null,"mapbox_key":null,"module_bar":null,"project_descriptor":null,"default_language":"en-US","custom_aspect_ratios":null,"default_appearance":"auto","default_theme_light":"Directus Default","theme_light_overrides":null,"default_theme_dark":"Directus Default","theme_dark_overrides":null,"report_error_url":null,"report_bug_url":null,"report_feature_url":null,"public_registration":false,"public_registration_verify_email":true,"public_registration_email_filter":null,"visual_editor_urls":null,"project_id":"019ffc77-0939-744b-ae42-d1ffb12d956c","mcp_enabled":false,"mcp_allow_deletes":false,"mcp_prompts_collection":null,"mcp_system_prompt_enabled":true,"mcp_system_prompt":null,"project_owner":"waverest.official@gmail.com","project_usage":null,"org_name":null,"product_updates":false,"project_status":null,"ai_openai_api_key":null,"ai_anthropic_api_key":null,"ai_system_prompt":null,"ai_google_api_key":null,"ai_openai_compatible_api_key":null,"ai_openai_compatible_base_url":null,"ai_openai_compatible_name":null,"ai_openai_compatible_models":null,"ai_openai_compatible_headers":null,"ai_openai_allowed_models":["gpt-5.4-nano","gpt-5.4-mini","gpt-5.4"],"ai_anthropic_allowed_models":["claude-haiku-4-5","claude-sonnet-4-6"],"ai_google_allowed_models":["gemini-3-pro-preview","gemini-3-flash-preview","gemini-2.5-pro","gemini-2.5-flash"],"collaborative_editing_enabled":false,"ai_translation_default_model":null,"ai_translation_glossary":null,"ai_translation_style_guide":null,"license_key":"**********","license_token":"**********","mcp_oauth_enabled":false,"mcp_oauth_dcr_enabled":false,"mcp_oauth_cimd_enabled":false}	{"default_theme_light":"Directus Default"}	\N	\N
34	43	directus_fields	12	{"sort":1,"interface":"file-image","special":["file"],"options":{"crop":false},"field":"itemImage"}	{"sort":1,"interface":"file-image","special":["file"],"options":{"crop":false},"field":"itemImage"}	\N	\N
35	44	directus_fields	3	{"id":3,"field":"id","special":["uuid"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"validation":null,"validation_message":null,"searchable":true}	{"collection":"drops","field":"id","sort":1,"group":null}	\N	\N
36	45	directus_fields	4	{"id":4,"field":"slug","special":null,"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"validation":null,"validation_message":null,"searchable":true}	{"collection":"drops","field":"slug","sort":2,"group":null}	\N	\N
37	46	directus_fields	5	{"id":5,"field":"name","special":null,"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"validation":null,"validation_message":null,"searchable":true}	{"collection":"drops","field":"name","sort":3,"group":null}	\N	\N
38	47	directus_fields	6	{"id":6,"field":"release_date","special":null,"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"validation":null,"validation_message":null,"searchable":true}	{"collection":"drops","field":"release_date","sort":4,"group":null}	\N	\N
39	48	directus_fields	7	{"id":7,"field":"description","special":null,"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"validation":null,"validation_message":null,"searchable":true}	{"collection":"drops","field":"description","sort":5,"group":null}	\N	\N
40	49	directus_fields	12	{"id":12,"field":"itemImage","special":["file"],"interface":"file-image","options":{"crop":false},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"validation":null,"validation_message":null,"searchable":true}	{"collection":"drops","field":"itemImage","sort":6,"group":null}	\N	\N
42	51	directus_fields	13	{"sort":1,"interface":"file-image","special":["file"],"options":{"crop":false},"field":"itemImage"}	{"sort":1,"interface":"file-image","special":["file"],"options":{"crop":false},"field":"itemImage"}	\N	\N
45	58	directus_fields	15	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id"}	\N	\N
46	59	directus_collections	products	{"singleton":false,"collection":"products"}	{"singleton":false,"collection":"products"}	\N	\N
49	73	directus_fields	17	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id"}	\N	\N
50	74	directus_collections	products	{"singleton":false,"collection":"products"}	{"singleton":false,"collection":"products"}	\N	\N
41	50	directus_collections	products	{"collection":"products","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":null,"collapse":"open","preview_url":null,"versioning":false,"status":"active","autosave_revision_interval":null}	{"status":"active"}	\N	\N
43	52	directus_settings	1	{"id":1,"project_name":"Directus","project_url":null,"project_color":"#E35169","public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"basemaps":null,"mapbox_key":null,"module_bar":null,"project_descriptor":null,"default_language":"en-US","custom_aspect_ratios":null,"default_appearance":"auto","default_theme_light":"Directus Default","theme_light_overrides":null,"default_theme_dark":"Directus Default","theme_dark_overrides":null,"report_error_url":null,"report_bug_url":null,"report_feature_url":null,"public_registration":false,"public_registration_verify_email":true,"public_registration_email_filter":null,"visual_editor_urls":null,"project_id":"019ffc77-0939-744b-ae42-d1ffb12d956c","mcp_enabled":false,"mcp_allow_deletes":false,"mcp_prompts_collection":null,"mcp_system_prompt_enabled":true,"mcp_system_prompt":null,"project_owner":"waverest.official@gmail.com","project_usage":null,"org_name":null,"product_updates":false,"project_status":null,"ai_openai_api_key":null,"ai_anthropic_api_key":null,"ai_system_prompt":null,"ai_google_api_key":null,"ai_openai_compatible_api_key":null,"ai_openai_compatible_base_url":null,"ai_openai_compatible_name":null,"ai_openai_compatible_models":null,"ai_openai_compatible_headers":null,"ai_openai_allowed_models":["gpt-5.4-nano","gpt-5.4-mini","gpt-5.4"],"ai_anthropic_allowed_models":["claude-haiku-4-5","claude-sonnet-4-6"],"ai_google_allowed_models":["gemini-3-pro-preview","gemini-3-flash-preview","gemini-2.5-pro","gemini-2.5-flash"],"collaborative_editing_enabled":false,"ai_translation_default_model":null,"ai_translation_glossary":null,"ai_translation_style_guide":null,"license_key":"**********","license_token":"**********","mcp_oauth_enabled":false,"mcp_oauth_dcr_enabled":false,"mcp_oauth_cimd_enabled":false}	{"project_color":"#E35169"}	\N	\N
44	53	directus_fields	14	{"special":null,"field":"category"}	{"special":null,"field":"category"}	\N	\N
47	62	directus_fields	16	{"sort":1,"hidden":true,"readonly":true,"interface":"input","special":["uuid"],"field":"id"}	{"sort":1,"hidden":true,"readonly":true,"interface":"input","special":["uuid"],"field":"id"}	\N	\N
48	63	directus_collections	productss	{"singleton":false,"collection":"productss"}	{"singleton":false,"collection":"productss"}	\N	\N
51	75	directus_fields	18	{"sort":2,"interface":"input","special":null,"required":true,"options":{"placeholder":"item naming in URL"},"field":"slug"}	{"sort":2,"interface":"input","special":null,"required":true,"options":{"placeholder":"item naming in URL"},"field":"slug"}	\N	\N
52	76	directus_fields	19	{"sort":3,"interface":"input","special":null,"required":true,"options":{"placeholder":"actual item name"},"field":"name"}	{"sort":3,"interface":"input","special":null,"required":true,"options":{"placeholder":"actual item name"},"field":"name"}	\N	\N
53	77	directus_fields	20	{"sort":4,"interface":"select-dropdown","special":null,"options":{"allowOther":true,"choices":[{"text":"t-shirts","value":"tShirts"},{"text":"hoodies","value":"hoodies"},{"text":"pants","value":"pants"},{"text":"shoes","value":"shoes"}]},"field":"category"}	{"sort":4,"interface":"select-dropdown","special":null,"options":{"allowOther":true,"choices":[{"text":"t-shirts","value":"tShirts"},{"text":"hoodies","value":"hoodies"},{"text":"pants","value":"pants"},{"text":"shoes","value":"shoes"}]},"field":"category"}	\N	\N
54	78	directus_fields	20	{"id":20,"field":"category","special":null,"interface":"select-dropdown","options":{"allowOther":true,"choices":[{"text":"t-shirts","value":"tShirts"},{"text":"hoodies","value":"hoodies"},{"text":"pants","value":"pants"},{"text":"shoes","value":"shoes"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"category","required":true}	\N	\N
55	79	directus_fields	21	{"sort":5,"interface":"input","special":null,"field":"price"}	{"sort":5,"interface":"input","special":null,"field":"price"}	\N	\N
56	80	directus_fields	21	{"id":21,"field":"price","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"price","required":true}	\N	\N
57	81	directus_fields	22	{"sort":6,"interface":"input-multiline","special":null,"required":false,"field":"description"}	{"sort":6,"interface":"input-multiline","special":null,"required":false,"field":"description"}	\N	\N
58	82	directus_fields	23	{"sort":7,"interface":"select-multiple-dropdown","special":["cast-json"],"options":{"placeholder":"tips how to keep care of item","choices":[{"text":"do not wash in hot water","value":"do not wash in hot water"},{"text":"do not use washing machine","value":"do not use washing machine"}],"allowOther":true},"field":"care"}	{"sort":7,"interface":"select-multiple-dropdown","special":["cast-json"],"options":{"placeholder":"tips how to keep care of item","choices":[{"text":"do not wash in hot water","value":"do not wash in hot water"},{"text":"do not use washing machine","value":"do not use washing machine"}],"allowOther":true},"field":"care"}	\N	\N
59	83	directus_folders	1bca5a21-99f2-4f20-b294-e664268e4bde	{"name":"items"}	{"name":"items"}	\N	\N
60	84	directus_files	0ec67a37-8ce6-4d5d-8a08-376435050e63	{"id":"0ec67a37-8ce6-4d5d-8a08-376435050e63","storage":"local","filename_disk":"0ec67a37-8ce6-4d5d-8a08-376435050e63.png","filename_download":"aura.png","title":"Aura","type":"image/png","created_on":"2026-08-15T09:46:09.560Z","modified_on":"2026-08-15T10:26:59.571Z","charset":null,"filesize":"2072539","width":1054,"height":1492,"duration":null,"embed":null,"description":null,"location":null,"tags":null,"metadata":{},"focal_point_x":null,"focal_point_y":null,"tus_id":null,"tus_data":null,"uploaded_on":"2026-08-15T09:46:09.571Z"}	{"folder":"1bca5a21-99f2-4f20-b294-e664268e4bde","modified_by":"c142a669-54e4-4b64-95f3-992767df9471","modified_on":"2026-08-15T10:26:59.571Z"}	\N	\N
61	85	directus_files	994275ba-80fa-4815-b625-c44476f574f2	{"id":"994275ba-80fa-4815-b625-c44476f574f2","storage":"local","filename_disk":"994275ba-80fa-4815-b625-c44476f574f2.png","filename_download":"drip.png","title":"Drip","type":"image/png","created_on":"2026-08-15T09:46:16.937Z","modified_on":"2026-08-15T10:26:59.571Z","charset":null,"filesize":"854606","width":830,"height":830,"duration":null,"embed":null,"description":null,"location":null,"tags":null,"metadata":{},"focal_point_x":null,"focal_point_y":null,"tus_id":null,"tus_data":null,"uploaded_on":"2026-08-15T09:46:16.949Z"}	{"folder":"1bca5a21-99f2-4f20-b294-e664268e4bde","modified_by":"c142a669-54e4-4b64-95f3-992767df9471","modified_on":"2026-08-15T10:26:59.571Z"}	\N	\N
62	86	directus_files	a822ea0b-7bf3-4990-8f7e-805fd1e04412	{"id":"a822ea0b-7bf3-4990-8f7e-805fd1e04412","storage":"local","filename_disk":"a822ea0b-7bf3-4990-8f7e-805fd1e04412.png","filename_download":"c0333109-7972-48c9-a3a9-e59e4df883ad-Photoroom.png","title":"pivo","type":"image/png","created_on":"2026-08-15T09:45:58.722Z","modified_on":"2026-08-15T10:26:59.571Z","charset":null,"filesize":"1637469","width":1254,"height":1254,"duration":null,"embed":null,"description":null,"location":null,"tags":null,"metadata":{},"focal_point_x":null,"focal_point_y":null,"tus_id":null,"tus_data":null,"uploaded_on":"2026-08-15T09:45:58.736Z"}	{"folder":"1bca5a21-99f2-4f20-b294-e664268e4bde","modified_by":"c142a669-54e4-4b64-95f3-992767df9471","modified_on":"2026-08-15T10:26:59.571Z"}	\N	\N
63	87	directus_fields	24	{"sort":8,"interface":"file-image","special":["file"],"options":{"folder":"1bca5a21-99f2-4f20-b294-e664268e4bde","crop":false},"required":false,"field":"images"}	{"sort":8,"interface":"file-image","special":["file"],"options":{"folder":"1bca5a21-99f2-4f20-b294-e664268e4bde","crop":false},"required":false,"field":"images"}	\N	\N
64	88	directus_fields	25	{"sort":9,"interface":"input","special":null,"required":false,"field":"drop_id"}	{"sort":9,"interface":"input","special":null,"required":false,"field":"drop_id"}	\N	\N
65	89	directus_fields	26	{"sort":10,"interface":"input-block-editor","special":["cast-json"],"options":{"folder":null},"field":"stock"}	{"sort":10,"interface":"input-block-editor","special":["cast-json"],"options":{"folder":null},"field":"stock"}	\N	\N
66	91	directus_fields	27	{"sort":10,"interface":"input","special":null,"field":"stock"}	{"sort":10,"interface":"input","special":null,"field":"stock"}	\N	\N
67	93	directus_fields	28	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"product_id"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"product_id"}	\N	\N
68	94	directus_collections	stock	{"singleton":false,"collection":"stock"}	{"singleton":false,"collection":"stock"}	\N	\N
69	95	directus_fields	29	{"sort":2,"interface":"select-dropdown","special":null,"options":{"choices":[{"text":"xs","value":"xs"},{"text":"s","value":"s"},{"text":"m","value":"m"},{"text":"l","value":"l"},{"text":"xl","value":"xl"},{"text":"xxl","value":"xxl"},{"text":"onesize","value":"onesize"}],"placeholder":"item size"},"field":"size"}	{"sort":2,"interface":"select-dropdown","special":null,"options":{"choices":[{"text":"xs","value":"xs"},{"text":"s","value":"s"},{"text":"m","value":"m"},{"text":"l","value":"l"},{"text":"xl","value":"xl"},{"text":"xxl","value":"xxl"},{"text":"onesize","value":"onesize"}],"placeholder":"item size"},"field":"size"}	\N	\N
70	96	directus_fields	29	{"id":29,"field":"size","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"xs","value":"xs"},{"text":"s","value":"s"},{"text":"m","value":"m"},{"text":"l","value":"l"},{"text":"xl","value":"xl"},{"text":"xxl","value":"xxl"},{"text":"onesize","value":"onesize"}],"placeholder":"item size"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null,"searchable":true}	{"collection":"stock","field":"size","translations":null,"required":true}	\N	\N
71	97	directus_fields	30	{"sort":3,"interface":"input","special":null,"required":true,"field":"quantity"}	{"sort":3,"interface":"input","special":null,"required":true,"field":"quantity"}	\N	\N
72	98	directus_collections	stock	{"collection":"stock","icon":"box","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":null,"collapse":"open","preview_url":null,"versioning":false,"status":"active","autosave_revision_interval":null}	{"icon":"box"}	\N	\N
73	99	directus_collections	products	{"collection":"products","icon":"shopping_cart","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":null,"collapse":"open","preview_url":null,"versioning":false,"status":"active","autosave_revision_interval":null}	{"icon":"shopping_cart"}	\N	\N
74	100	directus_fields	31	{"sort":10,"interface":"list-o2m","special":["o2m"],"field":"size"}	{"sort":10,"interface":"list-o2m","special":["o2m"],"field":"size"}	\N	\N
75	101	directus_fields	32	{"sort":11,"interface":"select-dropdown-m2o","special":["m2o"],"field":"stock"}	{"sort":11,"interface":"select-dropdown-m2o","special":["m2o"],"field":"stock"}	\N	\N
76	103	directus_fields	33	{"sort":11,"interface":"select-dropdown-m2o","special":["m2o"],"field":"stock"}	{"sort":11,"interface":"select-dropdown-m2o","special":["m2o"],"field":"stock"}	\N	\N
77	104	directus_fields	33	{"id":33,"field":"stock","special":["m2o"],"interface":"select-dropdown-m2o","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"stock","required":true}	\N	\N
78	105	directus_fields	17	{"id":17,"field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"id","sort":1,"group":null}	\N	\N
79	106	directus_fields	18	{"id":18,"field":"slug","special":null,"interface":"input","options":{"placeholder":"item naming in URL"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"slug","sort":2,"group":null}	\N	\N
80	107	directus_fields	19	{"id":19,"field":"name","special":null,"interface":"input","options":{"placeholder":"actual item name"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"name","sort":3,"group":null}	\N	\N
81	108	directus_fields	20	{"id":20,"field":"category","special":null,"interface":"select-dropdown","options":{"allowOther":true,"choices":[{"text":"t-shirts","value":"tShirts"},{"text":"hoodies","value":"hoodies"},{"text":"pants","value":"pants"},{"text":"shoes","value":"shoes"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"category","sort":4,"group":null}	\N	\N
82	109	directus_fields	21	{"id":21,"field":"price","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"price","sort":5,"group":null}	\N	\N
83	110	directus_fields	33	{"id":33,"field":"stock","special":["m2o"],"interface":"select-dropdown-m2o","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"stock","sort":6,"group":null}	\N	\N
84	111	directus_fields	22	{"id":22,"field":"description","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"description","sort":7,"group":null}	\N	\N
85	112	directus_fields	23	{"id":23,"field":"care","special":["cast-json"],"interface":"select-multiple-dropdown","options":{"placeholder":"tips how to keep care of item","choices":[{"text":"do not wash in hot water","value":"do not wash in hot water"},{"text":"do not use washing machine","value":"do not use washing machine"}],"allowOther":true},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"care","sort":8,"group":null}	\N	\N
86	113	directus_fields	24	{"id":24,"field":"images","special":["file"],"interface":"file-image","options":{"folder":"1bca5a21-99f2-4f20-b294-e664268e4bde","crop":false},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"images","sort":9,"group":null}	\N	\N
87	114	directus_fields	25	{"id":25,"field":"drop_id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"drop_id","sort":10,"group":null}	\N	\N
88	115	directus_fields	31	{"id":31,"field":"size","special":["o2m"],"interface":"list-o2m","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"size","sort":11,"group":null}	\N	\N
89	116	directus_fields	17	{"id":17,"field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"id","sort":1,"group":null}	\N	\N
90	117	directus_fields	18	{"id":18,"field":"slug","special":null,"interface":"input","options":{"placeholder":"item naming in URL"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"slug","sort":2,"group":null}	\N	\N
91	118	directus_fields	19	{"id":19,"field":"name","special":null,"interface":"input","options":{"placeholder":"actual item name"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"name","sort":3,"group":null}	\N	\N
92	119	directus_fields	20	{"id":20,"field":"category","special":null,"interface":"select-dropdown","options":{"allowOther":true,"choices":[{"text":"t-shirts","value":"tShirts"},{"text":"hoodies","value":"hoodies"},{"text":"pants","value":"pants"},{"text":"shoes","value":"shoes"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"category","sort":4,"group":null}	\N	\N
93	120	directus_fields	33	{"id":33,"field":"stock","special":["m2o"],"interface":"select-dropdown-m2o","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"stock","sort":5,"group":null}	\N	\N
94	121	directus_fields	21	{"id":21,"field":"price","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"price","sort":6,"group":null}	\N	\N
95	122	directus_fields	22	{"id":22,"field":"description","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"description","sort":7,"group":null}	\N	\N
96	123	directus_fields	23	{"id":23,"field":"care","special":["cast-json"],"interface":"select-multiple-dropdown","options":{"placeholder":"tips how to keep care of item","choices":[{"text":"do not wash in hot water","value":"do not wash in hot water"},{"text":"do not use washing machine","value":"do not use washing machine"}],"allowOther":true},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"care","sort":8,"group":null}	\N	\N
97	124	directus_fields	24	{"id":24,"field":"images","special":["file"],"interface":"file-image","options":{"folder":"1bca5a21-99f2-4f20-b294-e664268e4bde","crop":false},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"images","sort":9,"group":null}	\N	\N
98	125	directus_fields	25	{"id":25,"field":"drop_id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"drop_id","sort":10,"group":null}	\N	\N
99	126	directus_fields	31	{"id":31,"field":"size","special":["o2m"],"interface":"list-o2m","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"size","sort":11,"group":null}	\N	\N
100	128	directus_fields	34	{"sort":12,"interface":"list-m2m","special":["m2m"],"field":"stock"}	{"sort":12,"interface":"list-m2m","special":["m2m"],"field":"stock"}	\N	\N
101	129	directus_fields	35	{"sort":1,"hidden":true,"field":"id"}	{"sort":1,"hidden":true,"field":"id"}	\N	\N
102	130	directus_collections	products_stock	{"hidden":true,"icon":"import_export","collection":"products_stock"}	{"hidden":true,"icon":"import_export","collection":"products_stock"}	\N	\N
103	131	directus_fields	36	{"sort":2,"hidden":true,"field":"products_id"}	{"sort":2,"hidden":true,"field":"products_id"}	\N	\N
104	132	directus_fields	37	{"sort":3,"hidden":true,"field":"stock_product_id"}	{"sort":3,"hidden":true,"field":"stock_product_id"}	\N	\N
105	133	directus_fields	17	{"id":17,"field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"id","sort":1,"group":null}	\N	\N
106	134	directus_fields	18	{"id":18,"field":"slug","special":null,"interface":"input","options":{"placeholder":"item naming in URL"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"slug","sort":2,"group":null}	\N	\N
107	135	directus_fields	19	{"id":19,"field":"name","special":null,"interface":"input","options":{"placeholder":"actual item name"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"name","sort":3,"group":null}	\N	\N
108	136	directus_fields	20	{"id":20,"field":"category","special":null,"interface":"select-dropdown","options":{"allowOther":true,"choices":[{"text":"t-shirts","value":"tShirts"},{"text":"hoodies","value":"hoodies"},{"text":"pants","value":"pants"},{"text":"shoes","value":"shoes"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"category","sort":4,"group":null}	\N	\N
109	137	directus_fields	21	{"id":21,"field":"price","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"price","sort":5,"group":null}	\N	\N
110	138	directus_fields	34	{"id":34,"field":"stock","special":["m2m"],"interface":"list-m2m","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"stock","sort":6,"group":null}	\N	\N
111	139	directus_fields	22	{"id":22,"field":"description","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"description","sort":7,"group":null}	\N	\N
112	140	directus_fields	23	{"id":23,"field":"care","special":["cast-json"],"interface":"select-multiple-dropdown","options":{"placeholder":"tips how to keep care of item","choices":[{"text":"do not wash in hot water","value":"do not wash in hot water"},{"text":"do not use washing machine","value":"do not use washing machine"}],"allowOther":true},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"care","sort":8,"group":null}	\N	\N
113	141	directus_fields	24	{"id":24,"field":"images","special":["file"],"interface":"file-image","options":{"folder":"1bca5a21-99f2-4f20-b294-e664268e4bde","crop":false},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"images","sort":9,"group":null}	\N	\N
114	142	directus_fields	25	{"id":25,"field":"drop_id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"drop_id","sort":10,"group":null}	\N	\N
115	143	directus_fields	31	{"id":31,"field":"size","special":["o2m"],"interface":"list-o2m","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"size","sort":11,"group":null}	\N	\N
120	148	products	1	{"price":10,"category":"tShirts","name":"pivozavr","slug":"pivo","description":"pivozavr is a great tshirt for those who play all the time tanks games","care":["do not use washing machine"]}	{"price":10,"category":"tShirts","name":"pivozavr","slug":"pivo","description":"pivozavr is a great tshirt for those who play all the time tanks games","care":["do not use washing machine"]}	\N	\N
121	162	directus_fields	38	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"stock_id"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"stock_id"}	\N	\N
122	163	directus_collections	stock	{"singleton":false,"collection":"stock"}	{"singleton":false,"collection":"stock"}	\N	\N
123	164	directus_fields	39	{"sort":2,"interface":"select-dropdown","special":null,"options":{"choices":[{"text":"XS","value":"xs"},{"text":"S","value":"s"},{"text":"M","value":"m"},{"text":"L","value":"l"},{"text":"XL","value":"xl"},{"text":"XXL","value":"xxl"},{"text":"One size","value":"onesize"}]},"field":"size"}	{"sort":2,"interface":"select-dropdown","special":null,"options":{"choices":[{"text":"XS","value":"xs"},{"text":"S","value":"s"},{"text":"M","value":"m"},{"text":"L","value":"l"},{"text":"XL","value":"xl"},{"text":"XXL","value":"xxl"},{"text":"One size","value":"onesize"}]},"field":"size"}	\N	\N
124	165	directus_fields	40	{"sort":3,"interface":"input","special":null,"field":"quantity"}	{"sort":3,"interface":"input","special":null,"field":"quantity"}	\N	\N
125	166	directus_fields	38	{"id":38,"field":"stock_id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"validation":null,"validation_message":null,"searchable":true}	{"collection":"stock","field":"stock_id","sort":1,"group":null}	\N	\N
126	167	directus_fields	40	{"id":40,"field":"quantity","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"validation":null,"validation_message":null,"searchable":true}	{"collection":"stock","field":"quantity","sort":2,"group":null}	\N	\N
127	168	directus_fields	39	{"id":39,"field":"size","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"XS","value":"xs"},{"text":"S","value":"s"},{"text":"M","value":"m"},{"text":"L","value":"l"},{"text":"XL","value":"xl"},{"text":"XXL","value":"xxl"},{"text":"One size","value":"onesize"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"validation":null,"validation_message":null,"searchable":true}	{"collection":"stock","field":"size","sort":3,"group":null}	\N	\N
128	169	directus_fields	41	{"sort":4,"interface":"input","special":null,"field":"product_id"}	{"sort":4,"interface":"input","special":null,"field":"product_id"}	\N	\N
129	170	directus_fields	38	{"id":38,"field":"stock_id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"validation":null,"validation_message":null,"searchable":true}	{"collection":"stock","field":"stock_id","sort":1,"group":null}	\N	\N
130	171	directus_fields	41	{"id":41,"field":"product_id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"validation":null,"validation_message":null,"searchable":true}	{"collection":"stock","field":"product_id","sort":2,"group":null}	\N	\N
131	172	directus_fields	40	{"id":40,"field":"quantity","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"validation":null,"validation_message":null,"searchable":true}	{"collection":"stock","field":"quantity","sort":3,"group":null}	\N	\N
132	173	directus_fields	39	{"id":39,"field":"size","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"XS","value":"xs"},{"text":"S","value":"s"},{"text":"M","value":"m"},{"text":"L","value":"l"},{"text":"XL","value":"xl"},{"text":"XXL","value":"xxl"},{"text":"One size","value":"onesize"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"validation":null,"validation_message":null,"searchable":true}	{"collection":"stock","field":"size","sort":4,"group":null}	\N	\N
133	174	directus_fields	42	{"sort":11,"interface":"list-o2m","special":["o2m"],"field":"stock"}	{"sort":11,"interface":"list-o2m","special":["o2m"],"field":"stock"}	\N	\N
134	175	directus_fields	17	{"id":17,"field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"id","sort":1,"group":null}	\N	\N
135	176	directus_fields	18	{"id":18,"field":"slug","special":null,"interface":"input","options":{"placeholder":"item naming in URL"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"slug","sort":2,"group":null}	\N	\N
136	177	directus_fields	19	{"id":19,"field":"name","special":null,"interface":"input","options":{"placeholder":"actual item name"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"name","sort":3,"group":null}	\N	\N
137	178	directus_fields	20	{"id":20,"field":"category","special":null,"interface":"select-dropdown","options":{"allowOther":true,"choices":[{"text":"t-shirts","value":"tShirts"},{"text":"hoodies","value":"hoodies"},{"text":"pants","value":"pants"},{"text":"shoes","value":"shoes"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"category","sort":4,"group":null}	\N	\N
138	179	directus_fields	42	{"id":42,"field":"stock","special":["o2m"],"interface":"list-o2m","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"stock","sort":5,"group":null}	\N	\N
139	180	directus_fields	21	{"id":21,"field":"price","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"price","sort":6,"group":null}	\N	\N
140	181	directus_fields	22	{"id":22,"field":"description","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"description","sort":7,"group":null}	\N	\N
141	182	directus_fields	23	{"id":23,"field":"care","special":["cast-json"],"interface":"select-multiple-dropdown","options":{"placeholder":"tips how to keep care of item","choices":[{"text":"do not wash in hot water","value":"do not wash in hot water"},{"text":"do not use washing machine","value":"do not use washing machine"}],"allowOther":true},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"care","sort":8,"group":null}	\N	\N
142	183	directus_fields	24	{"id":24,"field":"images","special":["file"],"interface":"file-image","options":{"folder":"1bca5a21-99f2-4f20-b294-e664268e4bde","crop":false},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"images","sort":9,"group":null}	\N	\N
143	184	directus_fields	25	{"id":25,"field":"drop_id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"drop_id","sort":10,"group":null}	\N	\N
144	185	directus_fields	17	{"id":17,"field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"id","sort":1,"group":null}	\N	\N
145	186	directus_fields	18	{"id":18,"field":"slug","special":null,"interface":"input","options":{"placeholder":"item naming in URL"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"slug","sort":2,"group":null}	\N	\N
146	187	directus_fields	19	{"id":19,"field":"name","special":null,"interface":"input","options":{"placeholder":"actual item name"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"name","sort":3,"group":null}	\N	\N
147	188	directus_fields	20	{"id":20,"field":"category","special":null,"interface":"select-dropdown","options":{"allowOther":true,"choices":[{"text":"t-shirts","value":"tShirts"},{"text":"hoodies","value":"hoodies"},{"text":"pants","value":"pants"},{"text":"shoes","value":"shoes"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"category","sort":4,"group":null}	\N	\N
148	189	directus_fields	21	{"id":21,"field":"price","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"price","sort":5,"group":null}	\N	\N
149	190	directus_fields	42	{"id":42,"field":"stock","special":["o2m"],"interface":"list-o2m","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"stock","sort":6,"group":null}	\N	\N
150	191	directus_fields	22	{"id":22,"field":"description","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"description","sort":7,"group":null}	\N	\N
151	192	directus_fields	23	{"id":23,"field":"care","special":["cast-json"],"interface":"select-multiple-dropdown","options":{"placeholder":"tips how to keep care of item","choices":[{"text":"do not wash in hot water","value":"do not wash in hot water"},{"text":"do not use washing machine","value":"do not use washing machine"}],"allowOther":true},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"care","sort":8,"group":null}	\N	\N
152	193	directus_fields	24	{"id":24,"field":"images","special":["file"],"interface":"file-image","options":{"folder":"1bca5a21-99f2-4f20-b294-e664268e4bde","crop":false},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"images","sort":9,"group":null}	\N	\N
153	194	directus_fields	25	{"id":25,"field":"drop_id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"drop_id","sort":10,"group":null}	\N	\N
154	195	directus_fields	17	{"id":17,"field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"id","sort":1,"group":null}	\N	\N
155	196	directus_fields	18	{"id":18,"field":"slug","special":null,"interface":"input","options":{"placeholder":"item naming in URL"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"slug","sort":2,"group":null}	\N	\N
156	197	directus_fields	19	{"id":19,"field":"name","special":null,"interface":"input","options":{"placeholder":"actual item name"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"name","sort":3,"group":null}	\N	\N
157	198	directus_fields	20	{"id":20,"field":"category","special":null,"interface":"select-dropdown","options":{"allowOther":true,"choices":[{"text":"t-shirts","value":"tShirts"},{"text":"hoodies","value":"hoodies"},{"text":"pants","value":"pants"},{"text":"shoes","value":"shoes"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"category","sort":4,"group":null}	\N	\N
158	199	directus_fields	42	{"id":42,"field":"stock","special":["o2m"],"interface":"list-o2m","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"stock","sort":5,"group":null}	\N	\N
159	200	directus_fields	21	{"id":21,"field":"price","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"price","sort":6,"group":null}	\N	\N
160	201	directus_fields	22	{"id":22,"field":"description","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"description","sort":7,"group":null}	\N	\N
161	202	directus_fields	23	{"id":23,"field":"care","special":["cast-json"],"interface":"select-multiple-dropdown","options":{"placeholder":"tips how to keep care of item","choices":[{"text":"do not wash in hot water","value":"do not wash in hot water"},{"text":"do not use washing machine","value":"do not use washing machine"}],"allowOther":true},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"care","sort":8,"group":null}	\N	\N
162	203	directus_fields	24	{"id":24,"field":"images","special":["file"],"interface":"file-image","options":{"folder":"1bca5a21-99f2-4f20-b294-e664268e4bde","crop":false},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"images","sort":9,"group":null}	\N	\N
163	204	directus_fields	25	{"id":25,"field":"drop_id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"validation":null,"validation_message":null,"searchable":true}	{"collection":"products","field":"drop_id","sort":10,"group":null}	\N	\N
165	206	products	2	{"slug":"pivo","name":"pivozavr","category":"tShirts","price":123,"care":["do not use washing machine"]}	{"slug":"pivo","name":"pivozavr","category":"tShirts","price":123,"care":["do not use washing machine"]}	\N	\N
164	205	stock	1	{"quantity":12,"size":"m"}	{"quantity":12,"size":"m"}	165	\N
\.
COPY public.directus_roles (id, name, icon, description, parent) FROM stdin;
d566c885-c7ed-4494-bef4-0b4e423e7901	Administrator	verified	$t:admin_description	\N
\.
COPY public.directus_sessions (token, "user", expires, ip, user_agent, share, origin, next_token, oauth_client) FROM stdin;
A5KQSiI7GUWAglhMtwFKS7oNXqiGgt-d9LYZQ8YVohm09SV4yDqH8GTj0ZGV9n4B	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:09:47.435+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	\N	http://127.0.0.1:8055	SUxdaLG06HlEsupr_bLcrfz45AOrUWqr_OohO4VQYckdA6rAbNdK_t0oWYVKwU24	\N
SUxdaLG06HlEsupr_bLcrfz45AOrUWqr_OohO4VQYckdA6rAbNdK_t0oWYVKwU24	c142a669-54e4-4b64-95f3-992767df9471	2026-08-16 11:09:37.435+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	\N	http://127.0.0.1:8055	\N	\N
HU7uVqXHL4zeUjanujBdSV5MI8m785RVn2TgaVUq9iJv9N6HjnknvDu4_Kq5ugpM	c142a669-54e4-4b64-95f3-992767df9471	2026-08-15 11:09:39.241+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:153.0) Gecko/20100101 Firefox/153.0	\N	http://127.0.0.1:8055	A5KQSiI7GUWAglhMtwFKS7oNXqiGgt-d9LYZQ8YVohm09SV4yDqH8GTj0ZGV9n4B	\N
\.
COPY public.directus_settings (id, project_name, project_url, project_color, project_logo, public_foreground, public_background, public_note, auth_login_attempts, auth_password_policy, storage_asset_transform, storage_asset_presets, custom_css, storage_default_folder, basemaps, mapbox_key, module_bar, project_descriptor, default_language, custom_aspect_ratios, public_favicon, default_appearance, default_theme_light, theme_light_overrides, default_theme_dark, theme_dark_overrides, report_error_url, report_bug_url, report_feature_url, public_registration, public_registration_verify_email, public_registration_role, public_registration_email_filter, visual_editor_urls, project_id, mcp_enabled, mcp_allow_deletes, mcp_prompts_collection, mcp_system_prompt_enabled, mcp_system_prompt, project_owner, project_usage, org_name, product_updates, project_status, ai_openai_api_key, ai_anthropic_api_key, ai_system_prompt, ai_google_api_key, ai_openai_compatible_api_key, ai_openai_compatible_base_url, ai_openai_compatible_name, ai_openai_compatible_models, ai_openai_compatible_headers, ai_openai_allowed_models, ai_anthropic_allowed_models, ai_google_allowed_models, collaborative_editing_enabled, ai_translation_default_model, ai_translation_glossary, ai_translation_style_guide, license_key, license_token, mcp_oauth_enabled, mcp_oauth_dcr_enabled, mcp_oauth_cimd_enabled) FROM stdin;
1	Directus	\N	#E35169	\N	\N	\N	\N	25	\N	all	\N	\N	\N	\N	\N	\N	\N	en-US	\N	\N	auto	Directus Default	\N	Directus Default	\N	\N	\N	\N	f	t	\N	\N	\N	019ffc77-0939-744b-ae42-d1ffb12d956c	f	f	\N	t	\N	waverest.official@gmail.com	\N	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	["gpt-5.4-nano","gpt-5.4-mini","gpt-5.4"]	["claude-haiku-4-5","claude-sonnet-4-6"]	["gemini-3-pro-preview","gemini-3-flash-preview","gemini-2.5-pro","gemini-2.5-flash"]	f	\N	\N	\N	1||scrypt||16384||8||1||Zy9/Dec4fYd3Mxomx/m76w==||x5YrclrrdrOkqMMl||2bHkvxJW3Et8U+PbiAVl8Tt716+dunNdc8cbtEw=||GRLyIH84cCUMbdc22eQ06Q==	1||scrypt||16384||8||1||WbwgQerQ4MEVrM8uE14Wtw==||WGWdFm8Cb8cKNB7M||m3q+ACR/O7400EcNRflMljvSlkQDjDQRcX5b1m1rwbbXzOcqYEyyJLr8kZhrbAOjZeJrpDpv5lQ8ryCYKG7LrnfM8GrnbGj1tjdY4Cnu4FasdSmChphAL9+/XhEEqt8buu4ydBzNCExbt7NMu42lSJKNAijliWm+2zm0rbZTt/V73EHlvk9WTYgRVFFluoBGeNgD3nW2qYxuJbVf9Jo5UAoV4cBgRCIIVu7jt7jSxi5S3+zm0upCuxXjOFGnnh8VSwzNPqEJnVqnmxXZ5Vt9fHJpoSmmTXcyVlOXv+DVkUKwDMZTo958tQEWS92wlVA8Ogkt2ht0J6C8+GmhvAn2HBBO2a631RbLwPY8XEEQa43PCJwGsKSamFrNfNUXsj7zXJkYH6CbD3lLivg6itgXdXcjsidVVL3Ngvz9Ujwb5jvwveMhkT97MvTV7/c+99UkbVUzrY3j9lRUib9CnLVrz+zAGP2M/SSemf3XTFa5796G75oFAC18t8hZLBqt4iCRaudtKW3KGRlt3PgaLHXrAIeIhs5Ph65Ex8iskdh4af8xChu4EiHok7bjJ29kU2DS8Iz5dwhwXlX/ika+eSewuSEMa4pT+aGHx0DOv1H50KclUkM9w7+aB5J8PZbMRc6lq7McY9EXhD4wTZH+46Z45aX0PkjlahtT6GDDJvSkTdCTrFWHZxATwFkrRwuuBAS2kLLitKU/RUnHT4JPnC8rfkJ0Etyc9fn1SsAsycvNw3in3l4owGY917uLRtXxSeVfKs79KjNWfhQ7mROSaJ+gwjw2nqW9+kLEGGYcT9TrNh3HYf4vsEZX4fTBDfC/TscLNPTu8K1Ap+/tjl48/7q7RxBs3XaTeDkgpdn8njiRkdvoX1xX7DeWpOg4/eVZMm+XOAV8dC0ZhcWh||581h8h7AJGYnJ1JLACnu6g==	f	f	f
\.
COPY public.directus_shares (id, name, collection, item, role, password, user_created, date_created, date_start, date_end, times_used, max_uses) FROM stdin;
\.
COPY public.directus_translations (id, language, key, value) FROM stdin;
\.
COPY public.directus_users (id, first_name, last_name, email, password, location, title, description, tags, avatar, language, tfa_secret, status, role, token, last_access, last_page, provider, external_identifier, auth_data, email_notifications, appearance, theme_dark, theme_light, theme_light_overrides, theme_dark_overrides, text_direction) FROM stdin;
c142a669-54e4-4b64-95f3-992767df9471	Admin	User	waverest.official@gmail.com	$argon2id$v=19$m=65536,t=3,p=4$jVQC4GkdPsFo7gF7cRanKw$ikgcQuiexs8xv3t9xJYcE8rPSJ9TsjHS6PvF3KF0L4M	\N	\N	\N	\N	\N	\N	\N	active	d566c885-c7ed-4494-bef4-0b4e423e7901	\N	2026-08-15 11:09:37.438+00	/content/stock	default	\N	\N	t	\N	\N	\N	\N	\N	auto
\.
COPY public.directus_versions (id, key, name, collection, item, hash, date_created, date_updated, user_created, user_updated, delta) FROM stdin;
\.
COPY public.products (id, slug, name, category, price, description, care, images, drop_id) FROM stdin;
2	pivo	pivozavr	tShirts	123	no description	["do not use washing machine"]	a822ea0b-7bf3-4990-8f7e-805fd1e04412	\N
\.
COPY public.stock (stock_id, size, quantity, product_id) FROM stdin;
1	m	12	2
\.
ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.directus_activity
    ADD CONSTRAINT directus_activity_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_pkey PRIMARY KEY (collection);
ALTER TABLE ONLY public.directus_comments
    ADD CONSTRAINT directus_comments_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.directus_deployment_projects
    ADD CONSTRAINT directus_deployment_projects_deployment_external_id_unique UNIQUE (deployment, external_id);
ALTER TABLE ONLY public.directus_deployment_projects
    ADD CONSTRAINT directus_deployment_projects_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.directus_deployment_runs
    ADD CONSTRAINT directus_deployment_runs_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.directus_deployments
    ADD CONSTRAINT directus_deployments_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.directus_deployments
    ADD CONSTRAINT directus_deployments_provider_unique UNIQUE (provider);
ALTER TABLE ONLY public.directus_extensions
    ADD CONSTRAINT directus_extensions_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.directus_fields
    ADD CONSTRAINT directus_fields_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_operation_unique UNIQUE (operation);
ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.directus_migrations
    ADD CONSTRAINT directus_migrations_pkey PRIMARY KEY (version);
ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.directus_oauth_clients
    ADD CONSTRAINT directus_oauth_clients_pkey PRIMARY KEY (client_id);
ALTER TABLE ONLY public.directus_oauth_codes
    ADD CONSTRAINT directus_oauth_codes_code_hash_unique UNIQUE (code_hash);
ALTER TABLE ONLY public.directus_oauth_codes
    ADD CONSTRAINT directus_oauth_codes_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.directus_oauth_consents
    ADD CONSTRAINT directus_oauth_consents_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.directus_oauth_consents
    ADD CONSTRAINT directus_oauth_consents_user_client_redirect_uri_unique UNIQUE ("user", client, redirect_uri);
ALTER TABLE ONLY public.directus_oauth_tokens
    ADD CONSTRAINT directus_oauth_tokens_client_user_unique UNIQUE (client, "user");
ALTER TABLE ONLY public.directus_oauth_tokens
    ADD CONSTRAINT directus_oauth_tokens_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_unique UNIQUE (reject);
ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_unique UNIQUE (resolve);
ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.directus_policies
    ADD CONSTRAINT directus_policies_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.directus_relations
    ADD CONSTRAINT directus_relations_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.directus_roles
    ADD CONSTRAINT directus_roles_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_pkey PRIMARY KEY (token);
ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.directus_translations
    ADD CONSTRAINT directus_translations_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_email_unique UNIQUE (email);
ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_external_identifier_unique UNIQUE (external_identifier);
ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_token_unique UNIQUE (token);
ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.stock
    ADD CONSTRAINT stock_pkey PRIMARY KEY (stock_id);
ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_policy_foreign FOREIGN KEY (policy) REFERENCES public.directus_policies(id) ON DELETE CASCADE;
ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;
ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;
ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_group_foreign FOREIGN KEY ("group") REFERENCES public.directus_collections(collection);
ALTER TABLE ONLY public.directus_comments
    ADD CONSTRAINT directus_comments_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;
ALTER TABLE ONLY public.directus_comments
    ADD CONSTRAINT directus_comments_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);
ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;
ALTER TABLE ONLY public.directus_deployment_projects
    ADD CONSTRAINT directus_deployment_projects_deployment_foreign FOREIGN KEY (deployment) REFERENCES public.directus_deployments(id) ON DELETE CASCADE;
ALTER TABLE ONLY public.directus_deployment_projects
    ADD CONSTRAINT directus_deployment_projects_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;
ALTER TABLE ONLY public.directus_deployment_runs
    ADD CONSTRAINT directus_deployment_runs_project_foreign FOREIGN KEY (project) REFERENCES public.directus_deployment_projects(id) ON DELETE CASCADE;
ALTER TABLE ONLY public.directus_deployment_runs
    ADD CONSTRAINT directus_deployment_runs_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;
ALTER TABLE ONLY public.directus_deployments
    ADD CONSTRAINT directus_deployments_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;
ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_folder_foreign FOREIGN KEY (folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;
ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_modified_by_foreign FOREIGN KEY (modified_by) REFERENCES public.directus_users(id);
ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_uploaded_by_foreign FOREIGN KEY (uploaded_by) REFERENCES public.directus_users(id);
ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;
ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_folders(id);
ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_recipient_foreign FOREIGN KEY (recipient) REFERENCES public.directus_users(id) ON DELETE CASCADE;
ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_sender_foreign FOREIGN KEY (sender) REFERENCES public.directus_users(id);
ALTER TABLE ONLY public.directus_oauth_codes
    ADD CONSTRAINT directus_oauth_codes_client_foreign FOREIGN KEY (client) REFERENCES public.directus_oauth_clients(client_id) ON DELETE CASCADE;
ALTER TABLE ONLY public.directus_oauth_codes
    ADD CONSTRAINT directus_oauth_codes_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;
ALTER TABLE ONLY public.directus_oauth_consents
    ADD CONSTRAINT directus_oauth_consents_client_foreign FOREIGN KEY (client) REFERENCES public.directus_oauth_clients(client_id) ON DELETE CASCADE;
ALTER TABLE ONLY public.directus_oauth_consents
    ADD CONSTRAINT directus_oauth_consents_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;
ALTER TABLE ONLY public.directus_oauth_tokens
    ADD CONSTRAINT directus_oauth_tokens_client_foreign FOREIGN KEY (client) REFERENCES public.directus_oauth_clients(client_id) ON DELETE CASCADE;
ALTER TABLE ONLY public.directus_oauth_tokens
    ADD CONSTRAINT directus_oauth_tokens_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;
ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_flow_foreign FOREIGN KEY (flow) REFERENCES public.directus_flows(id) ON DELETE CASCADE;
ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_foreign FOREIGN KEY (reject) REFERENCES public.directus_operations(id);
ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_foreign FOREIGN KEY (resolve) REFERENCES public.directus_operations(id);
ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;
ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_dashboard_foreign FOREIGN KEY (dashboard) REFERENCES public.directus_dashboards(id) ON DELETE CASCADE;
ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;
ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_policy_foreign FOREIGN KEY (policy) REFERENCES public.directus_policies(id) ON DELETE CASCADE;
ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;
ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;
ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_activity_foreign FOREIGN KEY (activity) REFERENCES public.directus_activity(id) ON DELETE CASCADE;
ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_revisions(id);
ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_version_foreign FOREIGN KEY (version) REFERENCES public.directus_versions(id) ON DELETE CASCADE;
ALTER TABLE ONLY public.directus_roles
    ADD CONSTRAINT directus_roles_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_roles(id);
ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_oauth_client_foreign FOREIGN KEY (oauth_client) REFERENCES public.directus_oauth_clients(client_id) ON DELETE CASCADE;
ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_share_foreign FOREIGN KEY (share) REFERENCES public.directus_shares(id) ON DELETE CASCADE;
ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;
ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_project_logo_foreign FOREIGN KEY (project_logo) REFERENCES public.directus_files(id);
ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_background_foreign FOREIGN KEY (public_background) REFERENCES public.directus_files(id);
ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_favicon_foreign FOREIGN KEY (public_favicon) REFERENCES public.directus_files(id);
ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_foreground_foreign FOREIGN KEY (public_foreground) REFERENCES public.directus_files(id);
ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_registration_role_foreign FOREIGN KEY (public_registration_role) REFERENCES public.directus_roles(id) ON DELETE SET NULL;
ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_storage_default_folder_foreign FOREIGN KEY (storage_default_folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;
ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_collection_foreign FOREIGN KEY (collection) REFERENCES public.directus_collections(collection) ON DELETE CASCADE;
ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;
ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;
ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE SET NULL;
ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_collection_foreign FOREIGN KEY (collection) REFERENCES public.directus_collections(collection) ON DELETE CASCADE;
ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;
ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);
ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_images_foreign FOREIGN KEY (images) REFERENCES public.directus_files(id) ON DELETE SET NULL;
ALTER TABLE ONLY public.stock
    ADD CONSTRAINT stock_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE SET NULL;
