DROP DATABASE IF EXISTS academia;
CREATE DATABASE academia  DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

USE academia;

CREATE TABLE aluno (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  nascimento DATE NOT NULL,
  sexo ENUM('M', 'F') NOT NULL,
  peso DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE telefone (
    id INT NOT NULL,
    tipo VARCHAR(10) NOT NULL,
    numero VARCHAR(20) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES aluno(id)
);

CREATE TABLE ficha (
    id_aluno INT NOT NULL,
    id_exercicio INT NOT NULL,
    dia_semana VARCHAR(10) NOT NULL,
    serie VARCHAR(40) NOT NULL,
    PRIMARY KEY (id_aluno),
    FOREIGN KEY (id_aluno) REFERENCES aluno(id)
);

CREATE TABLE exercicio (
    id INT NOT NULL AUTO_INCREMENT,
    descricao VARCHAR(100) NOT NULL,
    grupo_muscular VARCHAR(100) NOT NULL,
    aparelho VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO aluno (nome, nascimento, sexo, peso) VALUES
('João da Silva', '1980-01-01', 'M', 80.5),
('Maria da Silva', '1985-01-01', 'F', 55.12),
('José da Silva', '1990-01-01', 'M', 75.2);

INSERT INTO telefone (id, tipo, numero) VALUES
(1, 'celular', '9999-9999'),
(1, 'residencial', '3333-3333'),
(2, 'celular', '8888-8888'),
(2, 'residencial', '2222-2222'),
(3, 'celular', '7777-7777'),
(3, 'residencial', '1111-1111');

INSERT INTO ficha (id_aluno, id_exercicio, dia_semana, serie) VALUES
(1, 1, 'Segunda', '3x10'),
(1, 2, 'Terça', '3x10'),
(1, 3, 'Quarta', '3x10'),
(1, 4, 'Quinta', '3x10'),
(1, 5, 'Sexta', '3x10'),
(2, 1, 'Segunda', '3x10'),
(2, 2, 'Terça', '3x10'),
(2, 3, 'Quarta', '3x10'),
(2, 4, 'Quinta', '3x10'),
(2, 5, 'Sexta', '3x10'),


INSERT INTO exercicio (descricao, grupo_muscular, aparelho) VALUES
('Supino Reto', 'Peito', 'Supino Reto'),
('Supino Inclinado', 'Peito', 'Supino Inclinado'),
('Supino Declinado', 'Peito', 'Supino Declinado'),
('Supino Reto', 'Peito', 'Supino Reto'),
('Supino Inclinado', 'Peito', 'Supino Inclinado'),


SELECT * FROM aluno;

SELECT * FROM telefone;

SELECT * FROM ficha;

SELECT * FROM exercicio;

SHOW TABLES;


