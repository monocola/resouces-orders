-- TABLE PRODUCTS:
-- Table: public.products

-- DROP TABLE public.products;

CREATE TABLE public.products
(
    id uuid NOT NULL DEFAULT uuid_generate_v4(),
    category_name character varying(50) COLLATE pg_catalog."default",
    name character varying(255) COLLATE pg_catalog."default",
    unity_price numeric(10,2),
    state integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT tbl_product_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE public.products
    OWNER to postgres;

	
-- TABLE ORDERS:
-- Table: public.orders

-- DROP TABLE public.orders;

CREATE TABLE public.orders
(
    id uuid NOT NULL DEFAULT uuid_generate_v4(),
    order_number character varying(100) COLLATE pg_catalog."default",
    customer character varying(255) COLLATE pg_catalog."default",
    quantity_tax integer,
    total_tax integer,
    quantity_total integer,
    unity_price numeric(10,2),
    state integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT tbl_orders_pkey PRIMARY KEY (id)
)

--TABLE ORDERS_DETAILS

-- Table: public.orders_details

-- DROP TABLE public.orders_details;

CREATE TABLE public.orders_details
(
    id uuid NOT NULL DEFAULT uuid_generate_v4(),
    product_id uuid,
    order_id uuid,
    quantity integer,
    unity_price numeric(10,2),
    total_amount numeric(10,2),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT tbl_order_details_pkey PRIMARY KEY (id),
    CONSTRAINT tbl_orders_orderdetails_fkey FOREIGN KEY (order_id)
        REFERENCES public.orders (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT tbl_product_orderdetails_fkey FOREIGN KEY (product_id)
        REFERENCES public.products (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.orders_details
    OWNER to postgres;

	