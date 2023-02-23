DROP DATABASE IF EXISTS pedido;

CREATE DATABASE pedido  DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

USE pedido;

CREATE TABLE cliente (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) NOT NULL,
    cep VARCHAR(10) NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    complemento VARCHAR(100),
    PRIMARY KEY (id)
);

CREATE TABLE telefone (
    cliente_id INT NOT NULL,
    tipo VARCHAR(10) NOT NULL,
    numero VARCHAR(20) NOT NULL,
    PRIMARY KEY (cliente_id),
    FOREIGN KEY (cliente_id) REFERENCES cliente(id)
);

CREATE TABLE entregador (
    id int NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    veiculo VARCHAR(100) NOT NULL,
);

CREATE TABLE produto (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE pedido (
    id INT NOT NULL AUTO_INCREMENT,
    cliente_id INT NOT NULL,
    entregador_id INT NOT NULL,
    data DATE NOT NULL,
    hora_pedido TIME NOT NULL,
    hora_entrega TIME NOT NULL,
    hora_fim TIME NOT NULL,
    quantidade INT NOT NULL,
    id_produto INT NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_produto) REFERENCES produto(id),
    FOREIGN KEY (cliente_id) REFERENCES cliente(id),
    FOREIGN KEY (entregador_id) REFERENCES entregador(id)
);

INSERT INTO cliente( cpf, nome, descricao, cep, endereco, numero, complemento) VALUES
('12345678901', 'João da Silva', 'Rua 1', 'Bairro 1', 'Cidade 1', 'Estado 1'),
('12345678902', 'Maria da Silva', 'Rua 2', 'Bairro 2', 'Cidade 2', 'Estado 2'),
('12345678903', 'José da Silva', 'Rua 3', 'Bairro 3', 'Cidade 3', 'Estado 3');

INSERT INTO telefone (cliente_id, tipo, numero) VALUES
(1, 'celular', '9999-9999'),
(1, 'residencial', '3333-3333'),
(2, 'celular', '8888-8888'),
(2, 'residencial', '2222-2222'),
(3, 'celular', '7777-7777'),
(3, 'residencial', '1111-1111');

INSERT INTO entregador (nome, veiculo) VALUES
('João', 'Carro'),
('Maria', 'Moto'),
('José', 'Bicicleta');

INSERT INTO produto (nome, preco) VALUES
('Coca-Cola', 5.00),
('Pepsi', 5.00),
('Fanta', 5.00);

INSERT INTO Pedido (cliente_id, entregador_id, data, hora_pedido, hora_entrega, hora_fim, quantidade, id_produto, valor) VALUES
(1, 1, '2020-01-01', '10:00:00', '10:30:00', '11:00:00', 1, 1, 5.00),
(2, 2, '2020-01-01', '10:00:00', '10:30:00', '11:00:00', 1, 2, 5.00),
(3, 3, '2020-01-01', '10:00:00', '10:30:00', '11:00:00', 1, 3, 5.00);

SELECT * FROM cliente;

SELECT * FROM telefone;

SELECT * FROM entregador;

SELECT * FROM produto;

SELECT * FROM pedido;

SHOW TABLES;

