-- Index: pessoa_documento

-- DROP INDEX IF EXISTS public.pessoa_documento;

CREATE INDEX IF NOT EXISTS pessoa_documento
    ON public.pessoa USING btree
    (dsdocumento COLLATE pg_catalog."default" ASC NULLS LAST)
    WITH (deduplicate_items=True)
    TABLESPACE pg_default;

COMMENT ON INDEX public.pessoa_documento
    IS 'Indice para performar consulta da pessoa pelo documento';