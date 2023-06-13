-- Table: synnigeograafia.avalikud_koos_koordinaatidega

-- DROP TABLE IF EXISTS synnigeograafia.avalikud_koos_koordinaatidega;

CREATE TABLE IF NOT EXISTS synnigeograafia.avalikud_koos_koordinaatidega
(
    id uuid NOT NULL,
    eesnimi character varying COLLATE pg_catalog."default",
    perekonnanimi character varying COLLATE pg_catalog."default",
    varjunimi character varying COLLATE pg_catalog."default",
    synniaeg character varying COLLATE pg_catalog."default",
    kasvukoht character varying COLLATE pg_catalog."default",
    surmaaeg character varying COLLATE pg_catalog."default",
    valdkond character varying COLLATE pg_catalog."default",
    tunnus character varying COLLATE pg_catalog."default",
    x_koordinaat character varying COLLATE pg_catalog."default",
    y_koordinaat character varying COLLATE pg_catalog."default",
    CONSTRAINT avalikud_koos_koordinaatidega_pkey PRIMARY KEY (id)
)

    TABLESPACE pg_default;

ALTER TABLE IF EXISTS synnigeograafia.avalikud_koos_koordinaatidega
    OWNER to postgres;