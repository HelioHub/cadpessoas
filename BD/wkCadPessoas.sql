
-- PostgreSQL database dump WK Cadastro de Pessoas. Teste Técnico.
-- Criar número do endereço e tipo de endereço (residencia, trabalho, casadepraia, casadaoutra, casadopai e etc...)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET default_tablespace = '';

SET default_with_oids = false;

----------------
--- drop tables
----------------
DROP TABLE IF EXISTS endereco_integracao;
DROP TABLE IF EXISTS endereco;
DROP TABLE IF EXISTS pessoa;

----------------------------------------------------------------------
-- Name: pessoa; Type: TABLE; Schema: public; Owner: -; Tablespace: 
----------------------------------------------------------------------
CREATE TABLE pessoa (
    idpessoa bigserial NOT NULL,
    flnatureza int2 NOT NULL,
    dsdocumento varchar(20) NOT NULL,
    nmprimeiro varchar(100) NOT NULL,
    nmsegundo varchar(100) NOT NULL,
    dtregistro date NULL,
    CONSTRAINT pessoa_pk PRIMARY KEY (idpessoa) 	
);
CREATE INDEX pessoa_idpessoa ON pessoa (idpessoa);
CREATE INDEX pessoa_dsdocumento ON pessoa (dsdocumento);

--------------------------------------------------------------------------------
-- Name: endereco_integracao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--------------------------------------------------------------------------------
CREATE TABLE endereco_integracao (
    idendereco bigint NOT NULL,
    dscep varchar(15) NULL,
    dsuf varchar(50) NULL,
    nmcidade varchar(100) NULL,
    nmbairro varchar(50) NULL,
    nmlogradouro varchar(100) NULL,
    dscomplemento varchar(100) NULL,
    CONSTRAINT enderecointegracao_pk PRIMARY KEY (idendereco)
);
CREATE INDEX enderecointegracao_idendereco ON endereco_integracao (idendereco);
CREATE INDEX enderecointegracao_dscep ON endereco_integracao (dscep);

----------------------------------------------------------------------
-- Name: endereco; Type: TABLE; Schema: public; Owner: -; Tablespace: 
----------------------------------------------------------------------
CREATE TABLE endereco (
    idendereco bigserial NOT NULL,
    idpessoa bigint NOT NULL,
    dscep bigint NOT NULL,
	dsnumero integer NULL,
    CONSTRAINT endereco_pk PRIMARY KEY (idendereco, idpessoa),
    CONSTRAINT endereco_fk_pessoa FOREIGN KEY (idpessoa) REFERENCES pessoa(idpessoa) ON DELETE CASCADE,
    CONSTRAINT endereco_fk_integracao FOREIGN KEY (dscep) REFERENCES endereco_integracao(idendereco) 
);
CREATE INDEX endereco_idendereco ON endereco (idendereco);
CREATE INDEX endereco_idpessoa ON endereco (idpessoa);
CREATE INDEX endereco_dscep ON endereco (dscep);

-- AJUSTES NO MODELO

-- ALTER TABLE endereco ADD COLUMN  dsnumero integer;		

ALTER TABLE pessoa DROP COLUMN flnatureza;
CREATE DOMAIN sexo_full AS char(1) DEFAULT 'M' NOT NULL CHECK ( VALUE IN ('M', 'F'));
ALTER TABLE pessoa ADD COLUMN flnatureza sexo_full;

--
-- PostgreSQL database dump complete
--
