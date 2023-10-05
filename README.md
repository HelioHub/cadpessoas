# Projeto CadPessoas - Cadastro de Pessoas - WK Teste Técnico Delphi MultiTier

Projeto Teste Técnico Delphi MultiTier aplicando técnicas de POO, MVC e Clean Code. 
Utilizando DELPHI XE6 (somente componentes nativos) e Banco de dados PostGreSQL.
Hélio Marques

## Documento de Requisitos CadPessoas

![## Documento de Requisitos CadPessoas](https://github.com/HelioHub/cadpessoas/blob/main/Requisitos/Requisitos.png)

## Diagrama Inicial de Entidade e Relacionamento CadPessoas

![## Diagrama de Entidade e Relacionamento CadPessoas](https://github.com/HelioHub/cadpessoas/blob/main/BD/Modelo.png)

## Novo Diagrama de Entidade e Relacionamento CadPessoas 

	• Novo diagrama definido para considerar o Cadastro CEP único e reutilizável. 
	• Pessoa x Endereco_Integracao relacionamento n para n 
	• Script main/BD/wkCadPessoas.sql.

![## Diagrama de Entidade e Relacionamento CadPessoas](https://github.com/HelioHub/cadpessoas/blob/main/BD/ModeloNovo.png)

## Telas Principais Desenvolvidas 

![## Documento de Requisitos CadPessoas](https://github.com/HelioHub/cadpessoas/blob/main/Requisitos/Sistema.png)

## Arquitetura do sistema em três camadas

	• Comunicação Rest com JSON entre aplicação Cliente / Servidor
	• Aplicação de Clean Code
	• Orientação a objetos
	• Padrões de projeto
	• Garantir integridade entre registros (não ter pessoa sem endereço)
	• Camada de persistência, utilizar Firedac

## PW DB PostGreSQL

    Database: wkcadpessoas
	pw: wk@2023
	Dlls para conectar PostGreSQL no DELPHI XE6: https://www.postgresql.org/ftp/odbc/versions/dll/

## Clean Code

	https://balta.io/artigos/clean-code	

## Criação de Banco de Dados no PostGreSQL

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

## Script criação Schemas no PostGreSQL

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
	DROP TABLE IF EXISTS pessoa;
	DROP TABLE IF EXISTS endereco;
	DROP TABLE IF EXISTS endereco_integracao;

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

	----------------------------------------------------------------------
	-- Name: endereco; Type: TABLE; Schema: public; Owner: -; Tablespace: 
	----------------------------------------------------------------------
	CREATE TABLE endereco (
		idendereco bigserial NOT NULL,
		idpessoa bigint NOT NULL,
		dscep varchar(15) NULL,
		CONSTRAINT endereco_pk PRIMARY KEY (idendereco),
		CONSTRAINT endereco_fk_pessoa FOREIGN KEY (idpessoa) REFERENCES pessoa(idpessoa) ON DELETE CASCADE
	);
	CREATE INDEX endereco_idendereco ON endereco (idendereco);
	CREATE INDEX endereco_idpessoa ON endereco (idpessoa);

	--------------------------------------------------------------------------------
	-- Name: endereco_integracao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
	--------------------------------------------------------------------------------
	CREATE TABLE endereco_integracao (
		idendereco bigint NOT NULL,
		dsuf varchar(50) NULL,
		nmcidade varchar(100) NULL,
		nmbairro varchar(50) NULL,
		nmlogradouro varchar(100) NULL,
		dscomplemento varchar(100) NULL,
		CONSTRAINT enderecointegracao_pk PRIMARY KEY (idendereco),
		CONSTRAINT enderecointegracao_fk_endereco FOREIGN KEY (idendereco) REFERENCES endereco(idendereco) ON DELETE CASCADE
	);
	CREATE INDEX enderecointegracao_idendereco ON endereco_integracao (idendereco);


	-- AJUSTES NO MODELO

	ALTER TABLE endereco ADD COLUMN  dsnumero integer;		

	ALTER TABLE pessoa DROP COLUMN flnatureza;
	CREATE DOMAIN sexo_full AS char(1) DEFAULT 'M' NOT NULL CHECK ( VALUE IN ('M', 'F'));
	ALTER TABLE pessoa ADD COLUMN flnatureza sexo_full;

	--
	-- PostgreSQL database dump complete
	--

## Alteração no Modelo de Dados conforme meu entendimento, óbvio que tivesse em equipe seria colocado em debate.

	### Criação de Indices para melhor performar nos relacionamentos
		CREATE INDEX pessoa_idpessoa ON pessoa (idpessoa);
		CREATE INDEX endereco_idendereco ON endereco (idendereco);
		CREATE INDEX enderecointegracao_idendereco ON endereco_integracao (idendereco);
		
	### Criação do campo dsnumero na Table endereco do CEP 
		ALTER TABLE endereco ADD COLUMN  dsnumero integer;		

	### Definição do Domínio do campo flnatureza (cláusula CHECK restringindo os sexos a masculino e feminino) 
		ALTER TABLE pessoa DROP COLUMN flnatureza;
		CREATE DOMAIN sexo_full AS char(1) DEFAULT 'M' NOT NULL CHECK ( VALUE IN ('M', 'F'));
        ALTER TABLE pessoa ADD COLUMN flnatureza sexo_full;
		
## Insert em Lote

![## Documento de Requisitos CadPessoas](https://github.com/HelioHub/cadpessoas/blob/main/Requisitos/InsertLote.png)

