-- Database: wkcadpessoas

-- DROP DATABASE IF EXISTS wkcadpessoas;

CREATE DATABASE wkcadpessoas
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

COMMENT ON DATABASE wkcadpessoas
    IS 'Banco de Dados WK Cadastro de Pessoas.  Teste Técnico.';