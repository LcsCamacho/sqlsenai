DROP DATABASE IF EXISTS cliente;

CREATE DATABASE cliente  DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

USE cliente;

CREATE TABLE cliente (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  nascimento DATE NOT NULL,
  sexo ENUM('M', 'F') NOT NULL,
  peso DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE telefone (
    cliente_id INT NOT NULL,
    tipo VARCHAR(10) NOT NULL,
    numero VARCHAR(20) NOT NULL,
    PRIMARY KEY (cliente_id),
    FOREIGN KEY (cliente_id) REFERENCES cliente(id)
    );

INSERT INTO cliente (nome, nascimento, sexo, peso) VALUES
('João da Silva', '1980-01-01', 'M', 80.5),
('Maria da Silva', '1985-01-01', 'F', 55.12),
('José da Silva', '1990-01-01', 'M', 75.2);


INSERT INTO telefone (cliente_id, tipo, numero) VALUES
(1, 'celular', '9999-9999'),
(1, 'residencial', '3333-3333'),
(2, 'celular', '8888-8888'),
(2, 'residencial', '2222-2222'),
(3, 'celular', '7777-7777'),
(3, 'residencial', '1111-1111');

SELECT * FROM cliente;

SELECT * FROM telefone;

SHOW TABLES;


-- Path: 23.02\cliente.sql







