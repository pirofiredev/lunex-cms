


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


CREATE SCHEMA IF NOT EXISTS "payload";


ALTER SCHEMA "payload" OWNER TO "postgres";


COMMENT ON SCHEMA "public" IS 'standard public schema';



CREATE EXTENSION IF NOT EXISTS "pg_stat_statements" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "pgcrypto" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "supabase_vault" WITH SCHEMA "vault";






CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA "extensions";






CREATE TYPE "payload"."enum_products_stock_size" AS ENUM (
    'xs',
    's',
    'm',
    'l',
    'xl',
    'xxl',
    'xxxl'
);


ALTER TYPE "payload"."enum_products_stock_size" OWNER TO "postgres";


CREATE TYPE "public"."enum_products_category" AS ENUM (
    't-shirts',
    'hoodies'
);


ALTER TYPE "public"."enum_products_category" OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_types"("tname" "text") RETURNS TABLE("column_name" "text", "data_type" "text")
    LANGUAGE "plpgsql"
    AS $_$
      BEGIN
          RETURN QUERY EXECUTE format($$SELECT column_name::text,data_type::text FROM information_schema.columns WHERE table_name ='$$|| '%I' ||$$';$$,tname);
      END;
    $_$;


ALTER FUNCTION "public"."get_types"("tname" "text") OWNER TO "postgres";

SET default_tablespace = '';

SET default_table_access_method = "heap";


CREATE TABLE IF NOT EXISTS "payload"."categories" (
    "id" integer NOT NULL,
    "name" character varying NOT NULL,
    "slug" character varying NOT NULL,
    "description" character varying,
    "updated_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL,
    "created_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "payload"."categories" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "payload"."categories_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "payload"."categories_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "payload"."categories_id_seq" OWNED BY "payload"."categories"."id";



CREATE TABLE IF NOT EXISTS "payload"."drops" (
    "id" integer NOT NULL,
    "slug" character varying NOT NULL,
    "name" character varying NOT NULL,
    "release_date" timestamp(3) with time zone NOT NULL,
    "description" character varying,
    "image_id" integer,
    "updated_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL,
    "created_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "payload"."drops" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "payload"."drops_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "payload"."drops_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "payload"."drops_id_seq" OWNED BY "payload"."drops"."id";



CREATE TABLE IF NOT EXISTS "payload"."media" (
    "id" integer NOT NULL,
    "alt" character varying NOT NULL,
    "updated_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL,
    "created_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL,
    "url" character varying,
    "thumbnail_u_r_l" character varying,
    "filename" character varying,
    "mime_type" character varying,
    "filesize" numeric,
    "width" numeric,
    "height" numeric,
    "focal_x" numeric,
    "focal_y" numeric
);


ALTER TABLE "payload"."media" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "payload"."media_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "payload"."media_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "payload"."media_id_seq" OWNED BY "payload"."media"."id";



CREATE TABLE IF NOT EXISTS "payload"."payload_kv" (
    "id" integer NOT NULL,
    "key" character varying NOT NULL,
    "data" "jsonb" NOT NULL
);


ALTER TABLE "payload"."payload_kv" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "payload"."payload_kv_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "payload"."payload_kv_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "payload"."payload_kv_id_seq" OWNED BY "payload"."payload_kv"."id";



CREATE TABLE IF NOT EXISTS "payload"."payload_locked_documents" (
    "id" integer NOT NULL,
    "global_slug" character varying,
    "updated_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL,
    "created_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "payload"."payload_locked_documents" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "payload"."payload_locked_documents_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "payload"."payload_locked_documents_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "payload"."payload_locked_documents_id_seq" OWNED BY "payload"."payload_locked_documents"."id";



CREATE TABLE IF NOT EXISTS "payload"."payload_locked_documents_rels" (
    "id" integer NOT NULL,
    "order" integer,
    "parent_id" integer NOT NULL,
    "path" character varying NOT NULL,
    "users_id" integer,
    "media_id" integer,
    "products_id" integer,
    "drops_id" integer,
    "categories_id" integer
);


ALTER TABLE "payload"."payload_locked_documents_rels" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "payload"."payload_locked_documents_rels_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "payload"."payload_locked_documents_rels_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "payload"."payload_locked_documents_rels_id_seq" OWNED BY "payload"."payload_locked_documents_rels"."id";



CREATE TABLE IF NOT EXISTS "payload"."payload_migrations" (
    "id" integer NOT NULL,
    "name" character varying,
    "batch" numeric,
    "updated_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL,
    "created_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "payload"."payload_migrations" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "payload"."payload_migrations_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "payload"."payload_migrations_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "payload"."payload_migrations_id_seq" OWNED BY "payload"."payload_migrations"."id";



CREATE TABLE IF NOT EXISTS "payload"."payload_preferences" (
    "id" integer NOT NULL,
    "key" character varying,
    "value" "jsonb",
    "updated_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL,
    "created_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "payload"."payload_preferences" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "payload"."payload_preferences_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "payload"."payload_preferences_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "payload"."payload_preferences_id_seq" OWNED BY "payload"."payload_preferences"."id";



CREATE TABLE IF NOT EXISTS "payload"."payload_preferences_rels" (
    "id" integer NOT NULL,
    "order" integer,
    "parent_id" integer NOT NULL,
    "path" character varying NOT NULL,
    "users_id" integer
);


ALTER TABLE "payload"."payload_preferences_rels" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "payload"."payload_preferences_rels_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "payload"."payload_preferences_rels_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "payload"."payload_preferences_rels_id_seq" OWNED BY "payload"."payload_preferences_rels"."id";



CREATE TABLE IF NOT EXISTS "payload"."products" (
    "id" integer NOT NULL,
    "slug" character varying NOT NULL,
    "name" character varying NOT NULL,
    "category_id" integer NOT NULL,
    "price_chf" numeric NOT NULL,
    "stripe_price_id" character varying,
    "description" character varying NOT NULL,
    "is_new" boolean DEFAULT false,
    "drop_id" integer,
    "updated_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL,
    "created_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "payload"."products" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "payload"."products_care" (
    "_order" integer NOT NULL,
    "_parent_id" integer NOT NULL,
    "id" character varying NOT NULL,
    "instruction" character varying
);


ALTER TABLE "payload"."products_care" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "payload"."products_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "payload"."products_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "payload"."products_id_seq" OWNED BY "payload"."products"."id";



CREATE TABLE IF NOT EXISTS "payload"."products_images" (
    "_order" integer NOT NULL,
    "_parent_id" integer NOT NULL,
    "id" character varying NOT NULL,
    "image_id" integer NOT NULL
);


ALTER TABLE "payload"."products_images" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "payload"."products_stock" (
    "_order" integer NOT NULL,
    "_parent_id" integer NOT NULL,
    "id" character varying NOT NULL,
    "size" "payload"."enum_products_stock_size" NOT NULL,
    "quantity" numeric NOT NULL
);


ALTER TABLE "payload"."products_stock" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "payload"."users" (
    "id" integer NOT NULL,
    "updated_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL,
    "created_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL,
    "email" character varying NOT NULL,
    "reset_password_token" character varying,
    "reset_password_expiration" timestamp(3) with time zone,
    "salt" character varying,
    "hash" character varying,
    "login_attempts" numeric DEFAULT 0,
    "lock_until" timestamp(3) with time zone
);


ALTER TABLE "payload"."users" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "payload"."users_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "payload"."users_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "payload"."users_id_seq" OWNED BY "payload"."users"."id";



CREATE TABLE IF NOT EXISTS "payload"."users_sessions" (
    "_order" integer NOT NULL,
    "_parent_id" integer NOT NULL,
    "id" character varying NOT NULL,
    "created_at" timestamp(3) with time zone,
    "expires_at" timestamp(3) with time zone NOT NULL
);


ALTER TABLE "payload"."users_sessions" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."drops" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "slug" "text" NOT NULL,
    "name" "text" NOT NULL,
    "release_date" timestamp with time zone NOT NULL,
    "description" "text",
    "image" "text"
);


ALTER TABLE "public"."drops" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."products" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "slug" character varying NOT NULL,
    "name" character varying NOT NULL,
    "category" "public"."enum_products_category" NOT NULL,
    "price_chf" numeric NOT NULL,
    "stripe_price_id" character varying,
    "description" character varying,
    "care" "jsonb",
    "images" "jsonb",
    "is_new" boolean DEFAULT false,
    "drop_id" character varying,
    "stock" "jsonb"
);


ALTER TABLE "public"."products" OWNER TO "postgres";


ALTER TABLE ONLY "payload"."categories" ALTER COLUMN "id" SET DEFAULT "nextval"('"payload"."categories_id_seq"'::"regclass");



ALTER TABLE ONLY "payload"."drops" ALTER COLUMN "id" SET DEFAULT "nextval"('"payload"."drops_id_seq"'::"regclass");



ALTER TABLE ONLY "payload"."media" ALTER COLUMN "id" SET DEFAULT "nextval"('"payload"."media_id_seq"'::"regclass");



ALTER TABLE ONLY "payload"."payload_kv" ALTER COLUMN "id" SET DEFAULT "nextval"('"payload"."payload_kv_id_seq"'::"regclass");



ALTER TABLE ONLY "payload"."payload_locked_documents" ALTER COLUMN "id" SET DEFAULT "nextval"('"payload"."payload_locked_documents_id_seq"'::"regclass");



ALTER TABLE ONLY "payload"."payload_locked_documents_rels" ALTER COLUMN "id" SET DEFAULT "nextval"('"payload"."payload_locked_documents_rels_id_seq"'::"regclass");



ALTER TABLE ONLY "payload"."payload_migrations" ALTER COLUMN "id" SET DEFAULT "nextval"('"payload"."payload_migrations_id_seq"'::"regclass");



ALTER TABLE ONLY "payload"."payload_preferences" ALTER COLUMN "id" SET DEFAULT "nextval"('"payload"."payload_preferences_id_seq"'::"regclass");



ALTER TABLE ONLY "payload"."payload_preferences_rels" ALTER COLUMN "id" SET DEFAULT "nextval"('"payload"."payload_preferences_rels_id_seq"'::"regclass");



ALTER TABLE ONLY "payload"."products" ALTER COLUMN "id" SET DEFAULT "nextval"('"payload"."products_id_seq"'::"regclass");



ALTER TABLE ONLY "payload"."users" ALTER COLUMN "id" SET DEFAULT "nextval"('"payload"."users_id_seq"'::"regclass");



ALTER TABLE ONLY "payload"."categories"
    ADD CONSTRAINT "categories_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "payload"."drops"
    ADD CONSTRAINT "drops_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "payload"."media"
    ADD CONSTRAINT "media_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "payload"."payload_kv"
    ADD CONSTRAINT "payload_kv_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "payload"."payload_locked_documents"
    ADD CONSTRAINT "payload_locked_documents_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "payload"."payload_locked_documents_rels"
    ADD CONSTRAINT "payload_locked_documents_rels_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "payload"."payload_migrations"
    ADD CONSTRAINT "payload_migrations_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "payload"."payload_preferences"
    ADD CONSTRAINT "payload_preferences_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "payload"."payload_preferences_rels"
    ADD CONSTRAINT "payload_preferences_rels_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "payload"."products_care"
    ADD CONSTRAINT "products_care_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "payload"."products_images"
    ADD CONSTRAINT "products_images_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "payload"."products"
    ADD CONSTRAINT "products_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "payload"."products_stock"
    ADD CONSTRAINT "products_stock_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "payload"."users"
    ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "payload"."users_sessions"
    ADD CONSTRAINT "users_sessions_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."drops"
    ADD CONSTRAINT "drops_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."products"
    ADD CONSTRAINT "products_pkey" PRIMARY KEY ("id");



CREATE INDEX "categories_created_at_idx" ON "payload"."categories" USING "btree" ("created_at");



CREATE UNIQUE INDEX "categories_name_idx" ON "payload"."categories" USING "btree" ("name");



CREATE UNIQUE INDEX "categories_slug_idx" ON "payload"."categories" USING "btree" ("slug");



CREATE INDEX "categories_updated_at_idx" ON "payload"."categories" USING "btree" ("updated_at");



CREATE INDEX "drops_created_at_idx" ON "payload"."drops" USING "btree" ("created_at");



CREATE INDEX "drops_image_idx" ON "payload"."drops" USING "btree" ("image_id");



CREATE UNIQUE INDEX "drops_slug_idx" ON "payload"."drops" USING "btree" ("slug");



CREATE INDEX "drops_updated_at_idx" ON "payload"."drops" USING "btree" ("updated_at");



CREATE INDEX "media_created_at_idx" ON "payload"."media" USING "btree" ("created_at");



CREATE UNIQUE INDEX "media_filename_idx" ON "payload"."media" USING "btree" ("filename");



CREATE INDEX "media_updated_at_idx" ON "payload"."media" USING "btree" ("updated_at");



CREATE UNIQUE INDEX "payload_kv_key_idx" ON "payload"."payload_kv" USING "btree" ("key");



CREATE INDEX "payload_locked_documents_created_at_idx" ON "payload"."payload_locked_documents" USING "btree" ("created_at");



CREATE INDEX "payload_locked_documents_global_slug_idx" ON "payload"."payload_locked_documents" USING "btree" ("global_slug");



CREATE INDEX "payload_locked_documents_rels_categories_id_idx" ON "payload"."payload_locked_documents_rels" USING "btree" ("categories_id");



CREATE INDEX "payload_locked_documents_rels_drops_id_idx" ON "payload"."payload_locked_documents_rels" USING "btree" ("drops_id");



CREATE INDEX "payload_locked_documents_rels_media_id_idx" ON "payload"."payload_locked_documents_rels" USING "btree" ("media_id");



CREATE INDEX "payload_locked_documents_rels_order_idx" ON "payload"."payload_locked_documents_rels" USING "btree" ("order");



CREATE INDEX "payload_locked_documents_rels_parent_idx" ON "payload"."payload_locked_documents_rels" USING "btree" ("parent_id");



CREATE INDEX "payload_locked_documents_rels_path_idx" ON "payload"."payload_locked_documents_rels" USING "btree" ("path");



CREATE INDEX "payload_locked_documents_rels_products_id_idx" ON "payload"."payload_locked_documents_rels" USING "btree" ("products_id");



CREATE INDEX "payload_locked_documents_rels_users_id_idx" ON "payload"."payload_locked_documents_rels" USING "btree" ("users_id");



CREATE INDEX "payload_locked_documents_updated_at_idx" ON "payload"."payload_locked_documents" USING "btree" ("updated_at");



CREATE INDEX "payload_migrations_created_at_idx" ON "payload"."payload_migrations" USING "btree" ("created_at");



CREATE INDEX "payload_migrations_updated_at_idx" ON "payload"."payload_migrations" USING "btree" ("updated_at");



CREATE INDEX "payload_preferences_created_at_idx" ON "payload"."payload_preferences" USING "btree" ("created_at");



CREATE INDEX "payload_preferences_key_idx" ON "payload"."payload_preferences" USING "btree" ("key");



CREATE INDEX "payload_preferences_rels_order_idx" ON "payload"."payload_preferences_rels" USING "btree" ("order");



CREATE INDEX "payload_preferences_rels_parent_idx" ON "payload"."payload_preferences_rels" USING "btree" ("parent_id");



CREATE INDEX "payload_preferences_rels_path_idx" ON "payload"."payload_preferences_rels" USING "btree" ("path");



CREATE INDEX "payload_preferences_rels_users_id_idx" ON "payload"."payload_preferences_rels" USING "btree" ("users_id");



CREATE INDEX "payload_preferences_updated_at_idx" ON "payload"."payload_preferences" USING "btree" ("updated_at");



CREATE INDEX "products_care_order_idx" ON "payload"."products_care" USING "btree" ("_order");



CREATE INDEX "products_care_parent_id_idx" ON "payload"."products_care" USING "btree" ("_parent_id");



CREATE INDEX "products_category_idx" ON "payload"."products" USING "btree" ("category_id");



CREATE INDEX "products_created_at_idx" ON "payload"."products" USING "btree" ("created_at");



CREATE INDEX "products_drop_idx" ON "payload"."products" USING "btree" ("drop_id");



CREATE INDEX "products_images_image_idx" ON "payload"."products_images" USING "btree" ("image_id");



CREATE INDEX "products_images_order_idx" ON "payload"."products_images" USING "btree" ("_order");



CREATE INDEX "products_images_parent_id_idx" ON "payload"."products_images" USING "btree" ("_parent_id");



CREATE UNIQUE INDEX "products_slug_idx" ON "payload"."products" USING "btree" ("slug");



CREATE INDEX "products_stock_order_idx" ON "payload"."products_stock" USING "btree" ("_order");



CREATE INDEX "products_stock_parent_id_idx" ON "payload"."products_stock" USING "btree" ("_parent_id");



CREATE INDEX "products_updated_at_idx" ON "payload"."products" USING "btree" ("updated_at");



CREATE INDEX "users_created_at_idx" ON "payload"."users" USING "btree" ("created_at");



CREATE UNIQUE INDEX "users_email_idx" ON "payload"."users" USING "btree" ("email");



CREATE INDEX "users_sessions_order_idx" ON "payload"."users_sessions" USING "btree" ("_order");



CREATE INDEX "users_sessions_parent_id_idx" ON "payload"."users_sessions" USING "btree" ("_parent_id");



CREATE INDEX "users_updated_at_idx" ON "payload"."users" USING "btree" ("updated_at");



ALTER TABLE ONLY "payload"."drops"
    ADD CONSTRAINT "drops_image_id_media_id_fk" FOREIGN KEY ("image_id") REFERENCES "payload"."media"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "payload"."payload_locked_documents_rels"
    ADD CONSTRAINT "payload_locked_documents_rels_categories_fk" FOREIGN KEY ("categories_id") REFERENCES "payload"."categories"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "payload"."payload_locked_documents_rels"
    ADD CONSTRAINT "payload_locked_documents_rels_drops_fk" FOREIGN KEY ("drops_id") REFERENCES "payload"."drops"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "payload"."payload_locked_documents_rels"
    ADD CONSTRAINT "payload_locked_documents_rels_media_fk" FOREIGN KEY ("media_id") REFERENCES "payload"."media"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "payload"."payload_locked_documents_rels"
    ADD CONSTRAINT "payload_locked_documents_rels_parent_fk" FOREIGN KEY ("parent_id") REFERENCES "payload"."payload_locked_documents"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "payload"."payload_locked_documents_rels"
    ADD CONSTRAINT "payload_locked_documents_rels_products_fk" FOREIGN KEY ("products_id") REFERENCES "payload"."products"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "payload"."payload_locked_documents_rels"
    ADD CONSTRAINT "payload_locked_documents_rels_users_fk" FOREIGN KEY ("users_id") REFERENCES "payload"."users"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "payload"."payload_preferences_rels"
    ADD CONSTRAINT "payload_preferences_rels_parent_fk" FOREIGN KEY ("parent_id") REFERENCES "payload"."payload_preferences"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "payload"."payload_preferences_rels"
    ADD CONSTRAINT "payload_preferences_rels_users_fk" FOREIGN KEY ("users_id") REFERENCES "payload"."users"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "payload"."products_care"
    ADD CONSTRAINT "products_care_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "payload"."products"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "payload"."products"
    ADD CONSTRAINT "products_category_id_categories_id_fk" FOREIGN KEY ("category_id") REFERENCES "payload"."categories"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "payload"."products"
    ADD CONSTRAINT "products_drop_id_drops_id_fk" FOREIGN KEY ("drop_id") REFERENCES "payload"."drops"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "payload"."products_images"
    ADD CONSTRAINT "products_images_image_id_media_id_fk" FOREIGN KEY ("image_id") REFERENCES "payload"."media"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "payload"."products_images"
    ADD CONSTRAINT "products_images_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "payload"."products"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "payload"."products_stock"
    ADD CONSTRAINT "products_stock_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "payload"."products"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "payload"."users_sessions"
    ADD CONSTRAINT "users_sessions_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "payload"."users"("id") ON DELETE CASCADE;



CREATE POLICY "Enable read access for all users" ON "payload"."categories" FOR SELECT USING (true);



CREATE POLICY "Enable read access for all users" ON "payload"."drops" FOR SELECT USING (true);



CREATE POLICY "Enable read access for all users" ON "payload"."media" FOR SELECT USING (true);



CREATE POLICY "Enable read access for all users" ON "payload"."products" FOR SELECT USING (true);



CREATE POLICY "Enable read access for all users" ON "payload"."products_care" FOR SELECT USING (true);



CREATE POLICY "Enable read access for all users" ON "payload"."products_images" FOR SELECT USING (true);



CREATE POLICY "Enable read access for all users" ON "payload"."products_stock" FOR SELECT USING (true);



ALTER TABLE "payload"."categories" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "payload"."drops" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "payload"."media" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "payload"."payload_kv" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "payload"."payload_locked_documents" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "payload"."payload_locked_documents_rels" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "payload"."payload_migrations" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "payload"."payload_preferences" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "payload"."payload_preferences_rels" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "payload"."products" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "payload"."products_care" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "payload"."products_images" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "payload"."products_stock" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "payload"."users" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "payload"."users_sessions" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "Enable read access for all users" ON "public"."drops" FOR SELECT USING (true);



CREATE POLICY "Enable read access for all users" ON "public"."products" FOR SELECT USING (true);





ALTER PUBLICATION "supabase_realtime" OWNER TO "postgres";


GRANT USAGE ON SCHEMA "payload" TO "anon";
GRANT USAGE ON SCHEMA "payload" TO "authenticated";



GRANT USAGE ON SCHEMA "public" TO "postgres";
GRANT USAGE ON SCHEMA "public" TO "anon";
GRANT USAGE ON SCHEMA "public" TO "authenticated";
GRANT USAGE ON SCHEMA "public" TO "service_role";






















































































































































GRANT ALL ON FUNCTION "public"."get_types"("tname" "text") TO "anon";
GRANT ALL ON FUNCTION "public"."get_types"("tname" "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_types"("tname" "text") TO "service_role";


















GRANT SELECT ON TABLE "payload"."categories" TO "anon";
GRANT SELECT ON TABLE "payload"."categories" TO "authenticated";



GRANT SELECT ON TABLE "payload"."drops" TO "anon";
GRANT SELECT ON TABLE "payload"."drops" TO "authenticated";



GRANT SELECT ON TABLE "payload"."media" TO "anon";
GRANT SELECT ON TABLE "payload"."media" TO "authenticated";



GRANT SELECT ON TABLE "payload"."products" TO "anon";
GRANT SELECT ON TABLE "payload"."products" TO "authenticated";



GRANT SELECT ON TABLE "payload"."products_care" TO "anon";
GRANT SELECT ON TABLE "payload"."products_care" TO "authenticated";



GRANT SELECT ON TABLE "payload"."products_images" TO "anon";
GRANT SELECT ON TABLE "payload"."products_images" TO "authenticated";



GRANT SELECT ON TABLE "payload"."products_stock" TO "anon";
GRANT SELECT ON TABLE "payload"."products_stock" TO "authenticated";



GRANT ALL ON TABLE "public"."drops" TO "anon";
GRANT ALL ON TABLE "public"."drops" TO "authenticated";
GRANT ALL ON TABLE "public"."drops" TO "service_role";



GRANT ALL ON TABLE "public"."products" TO "anon";
GRANT ALL ON TABLE "public"."products" TO "authenticated";
GRANT ALL ON TABLE "public"."products" TO "service_role";









ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "service_role";






ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "service_role";






ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "service_role";































