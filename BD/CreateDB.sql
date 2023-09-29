-- Database: CadPessoas

DROP DATABASE IF EXISTS cadpessoas;

CREATE DATABASE cadpessoas
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

COMMENT ON DATABASE cadpessoas
    IS 'Banco de Dados WK Cadastro de Pessoas. Teste Técnico.';