CREATE TABLE IF NOT EXISTS public.dim_metodos_pago
(
    id integer NOT NULL DEFAULT nextval('dim_metodos_pago_id_seq'::regclass),
    nombre character varying COLLATE pg_catalog."default",
    descripcion character varying COLLATE pg_catalog."default",
    CONSTRAINT dim_metodos_pago_pkey PRIMARY KEY (id)
);


CREATE TABLE IF NOT EXISTS public.dim_usuarios
(
    id integer NOT NULL DEFAULT nextval('dim_usuarios_id_seq'::regclass),
    nombre character varying COLLATE pg_catalog."default",
    apellido character varying COLLATE pg_catalog."default",
    dni character varying COLLATE pg_catalog."default",
    email character varying COLLATE pg_catalog."default",
    contrasena character varying COLLATE pg_catalog."default",
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT dim_usuarios_pkey PRIMARY KEY (id),
    CONSTRAINT dim_usuarios_dni_key UNIQUE (dni),
    CONSTRAINT dim_usuarios_email_key UNIQUE (email)
);

CREATE TABLE IF NOT EXISTS public.fact_carrito
(
    id integer NOT NULL DEFAULT nextval('fact_carrito_id_seq'::regclass),
    usuario_id integer,
    producto_id integer,
    cantidad integer,
    fecha_agregado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fact_carrito_pkey PRIMARY KEY (id),
    CONSTRAINT fact_carrito_producto_id_fkey FOREIGN KEY (producto_id)
        REFERENCES public.dim_productos (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fact_carrito_usuario_id_fkey FOREIGN KEY (usuario_id)
        REFERENCES public.dim_usuarios (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS public.fact_detalle_ordenes
(
    id integer NOT NULL DEFAULT nextval('fact_detalle_ordenes_id_seq'::regclass),
    orden_id integer,
    producto_id integer,
    cantidad integer,
    precio_unitario double precision,
    CONSTRAINT fact_detalle_ordenes_pkey PRIMARY KEY (id),
    CONSTRAINT fact_detalle_ordenes_orden_id_fkey FOREIGN KEY (orden_id)
        REFERENCES public.fact_ordenes (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fact_detalle_ordenes_producto_id_fkey FOREIGN KEY (producto_id)
        REFERENCES public.dim_productos (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS public.dim_direcciones_envio
(
    id integer NOT NULL DEFAULT nextval('dim_direcciones_envio_id_seq'::regclass),
    usuario_id integer,
    calle character varying COLLATE pg_catalog."default",
    ciudad character varying COLLATE pg_catalog."default",
    departamento character varying COLLATE pg_catalog."default",
    provincia character varying COLLATE pg_catalog."default",
    distrito character varying COLLATE pg_catalog."default",
    estado character varying COLLATE pg_catalog."default",
    codigo_postal character varying COLLATE pg_catalog."default",
    pais character varying COLLATE pg_catalog."default",
    CONSTRAINT dim_direcciones_envio_pkey PRIMARY KEY (id),
    CONSTRAINT dim_direcciones_envio_usuario_id_fkey FOREIGN KEY (usuario_id)
        REFERENCES public.dim_usuarios (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);


CREATE TABLE IF NOT EXISTS public.fact_historial_pagos
(
    id integer NOT NULL DEFAULT nextval('fact_historial_pagos_id_seq'::regclass),
    orden_id integer,
    metodo_pago_id integer,
    monto double precision,
    fecha_pago timestamp without time zone,
    estado_pago character varying COLLATE pg_catalog."default",
    CONSTRAINT fact_historial_pagos_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.fact_ordenes
(
    id integer NOT NULL DEFAULT nextval('fact_ordenes_id_seq'::regclass),
    usuario_id integer,
    fecha_orden timestamp without time zone,
    total double precision,
    estado character varying COLLATE pg_catalog."default",
    CONSTRAINT fact_ordenes_pkey PRIMARY KEY (id),
    CONSTRAINT fact_ordenes_usuario_id_fkey FOREIGN KEY (usuario_id)
        REFERENCES public.dim_usuarios (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS public.fact_ordenes_metodo_pago
(
    id integer NOT NULL DEFAULT nextval('fact_ordenes_metodo_pago_id_seq'::regclass),
    orden_id integer,
    metodo_pago_id integer,
    monto_pagado double precision,
    CONSTRAINT fact_ordenes_metodo_pago_pkey PRIMARY KEY (id),
    CONSTRAINT fact_ordenes_metodo_pago_metodo_pago_id_fkey FOREIGN KEY (metodo_pago_id)
        REFERENCES public.fact_ordenes (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fact_ordenes_metodo_pago_orden_id_fkey FOREIGN KEY (orden_id)
        REFERENCES public.fact_ordenes (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS public.fact_resenas_productos
(
    id integer NOT NULL DEFAULT nextval('fact_resenas_productos_id_seq'::regclass),
    usuario_id integer,
    producto_id integer,
    calificacion integer,
    comentario character varying COLLATE pg_catalog."default",
    fecha timestamp without time zone,
    CONSTRAINT fact_resenas_productos_pkey PRIMARY KEY (id),
    CONSTRAINT fact_resenas_productos_producto_id_fkey FOREIGN KEY (producto_id)
        REFERENCES public.dim_productos (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fact_resenas_productos_usuario_id_fkey FOREIGN KEY (usuario_id)
        REFERENCES public.dim_usuarios (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);


CREATE TABLE IF NOT EXISTS public.dim_productos
(
    id integer NOT NULL DEFAULT nextval('dim_productos_id_seq'::regclass),
    nombre character varying COLLATE pg_catalog."default",
    descripcion character varying COLLATE pg_catalog."default",
    precio double precision,
    stock integer,
    categoriaid integer,
    CONSTRAINT dim_productos_pkey PRIMARY KEY (id),
    CONSTRAINT dim_productos_categoriaid_fkey FOREIGN KEY (categoriaid)
        REFERENCES public.dim_categorias (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS public.dim_categorias
(
    id integer NOT NULL DEFAULT nextval('dim_categorias_id_seq'::regclass),
    nombre character varying COLLATE pg_catalog."default",
    descripcion character varying COLLATE pg_catalog."default",
    CONSTRAINT dim_categorias_pkey PRIMARY KEY (id)
);

