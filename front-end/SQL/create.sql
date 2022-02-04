CREATE SCHEMA senai_project;
USE senai_project;

CREATE TABLE usuario(
	id INT AUTO_INCREMENT,
    usuario VARCHAR(255) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO usuario values(null,'Marco', '1');

CREATE TABLE pessoa_juridica (
	id INT AUTO_INCREMENT,
    cnpj VARCHAR(14) NOT NULL,
    nome VARCHAR(255) NOT NULL,
    fantasia VARCHAR(255),
    data_abertura VARCHAR(25),
    tipo VARCHAR(100),
    cep VARCHAR(20),
    numero VARCHAR(10),
    logradouro VARCHAR(255),
    complemento VARCHAR(50),
    bairro VARCHAR(255),
    localidade VARCHAR(255),
    uf VARCHAR(10),
    PRIMARY KEY (id)
);

CREATE TABLE pessoa_fisica (
	id INT AUTO_INCREMENT,
    cpf VARCHAR(14) NOT NULL,
    nome VARCHAR(255) NOT NULL,
    nascimento VARCHAR(25),
    cep VARCHAR(20),
    numero VARCHAR(10),
    logradouro VARCHAR(255),
    complemento VARCHAR(50),
    bairro VARCHAR(255),
    localidade VARCHAR(255),
    uf VARCHAR(10),
    PRIMARY KEY (id)
);