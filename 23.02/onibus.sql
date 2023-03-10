DROP DATABASE IF EXISTS onibus;

CREATE DATABASE onibus  DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

USE onibus;

CREATE TABLE motorista (
    cpf VARCHAR(11) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    PRIMARY KEY (cpf)
);

CREATE TABLE telefone (
    cpf VARCHAR(11) NOT NULL,
    tipo VARCHAR(10) NOT NULL,
    numero VARCHAR(20) NOT NULL,
    PRIMARY KEY (cpf),
    FOREIGN KEY (cpf) REFERENCES motorista(cpf)
);

CREATE TABLE dirige (
    cpf VARCHAR(11) NOT NULL,
    id_linha INT NOT NULL,
    PRIMARY KEY (cpf, id_linha),
    FOREIGN KEY (cpf) REFERENCES motorista(cpf),
    FOREIGN KEY (id_linha) REFERENCES linha(id)
);

CREATE TABLE linha (
    id INT NOT NULL AUTO_INCREMENT,
    descricao VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE itinerario (
    id_linha INT NOT NULL,
    ordem INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_linha, ordem),
    FOREIGN KEY (id_linha) REFERENCES linha(id)
);

INSERT INTO motorista (cpf, nome) VALUES
('11111111111', 'João da Silva'),
('22222222222', 'Maria da Silva'),
('33333333333', 'José da Silva');

INSERT INTO telefone (cpf, tipo, numero) VALUES
('11111111111', 'celular', '9999-9999'),
('11111111111', 'residencial', '3333-3333'),
('22222222222', 'celular', '8888-8888'),
('22222222222', 'residencial', '2222-2222'),
('33333333333', 'celular', '7777-7777'),
('33333333333', 'residencial', '1111-1111');

INSERT INTO linha (descricao) VALUES
('Linha 1'),
('Linha 2'),
('Linha 3');

INSERT INTO itinerario (id_linha, ordem, nome) VALUES
(1, 1, 'Ponto 1'),
(1, 2, 'Ponto 2'),
(1, 3, 'Ponto 3'),
(2, 1, 'Ponto 4'),
(2, 2, 'Ponto 5'),
(2, 3, 'Ponto 6'),
(3, 1, 'Ponto 7'),
(3, 2, 'Ponto 8'),
(3, 3, 'Ponto 9');

INSERT INTO dirige (cpf, id_linha) VALUES
('11111111111', 1),
('22222222222', 2),
('33333333333', 3);

SELECT * FROM motorista;

SELECT * FROM telefone;

SELECT * FROM linha;

SELECT * FROM itinerario;

SELECT * FROM dirige;

SHOW TABLES;