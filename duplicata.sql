DROP DATABASE IF EXISTS duplicata;

CREATE DATABASE duplicata  DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

USE duplicata;

CREATE TABLE cliente (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE telefone (
    cliente_id INT NOT NULL,
    tipo VARCHAR(10) NOT NULL,
    numero VARCHAR(20) NOT NULL,
    PRIMARY KEY (cliente_id),
    FOREIGN KEY (cliente_id) REFERENCES cliente(id)
);

CREATE TABLE duplicata (
    id INT NOT NULL AUTO_INCREMENT,
    cliente_id INT NOT NULL,
    data_emissao DATE NOT NULL,
    data_vencimento DATE NOT NULL,
    data_pagamento DATE,
    valor DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (cliente_id) REFERENCES cliente(id)
);

INSERT INTO cliente (nome, endereco, bairro, cidade, estado) VALUES
('João da Silva', 'Rua 1', 'Bairro 1', 'Cidade 1', 'Estado 1'),
('Maria da Silva', 'Rua 2', 'Bairro 2', 'Cidade 2', 'Estado 2'),
('José da Silva', 'Rua 3', 'Bairro 3', 'Cidade 3', 'Estado 3');

INSERT INTO telefone (cliente_id, tipo, numero) VALUES
(1, 'celular', '9999-9999'),
(1, 'residencial', '3333-3333'),
(2, 'celular', '8888-8888'),
(2, 'residencial', '2222-2222'),
(3, 'celular', '7777-7777'),
(3, 'residencial', '1111-1111');

INSERT INTO duplicata (cliente_id, data_emissao, data_vencimento, valor) VALUES
(1, '2018-01-01', '2018-01-31', 100.00),
(1, '2018-02-01', '2018-02-28', 100.00),
(1, '2018-03-01', '2018-03-31', 100.00),
(2, '2018-01-01', '2018-01-31', 100.00),
(2, '2018-02-01', '2018-02-28', 100.00),
(2, '2018-03-01', '2018-03-31', 100.00),
(3, '2018-01-01', '2018-01-31', 100.00),
(3, '2018-02-01', '2018-02-28', 100.00),
(3, '2018-03-01', '2018-03-31', 100.00);

SELECT * FROM cliente;

SELECT * FROM telefone;

SELECT * FROM duplicata;

SHOW TABLES;