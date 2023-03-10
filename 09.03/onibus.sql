DROP DATABASE IF EXISTS onibus;
CREATE DATABASE onibus CHARSET=UTF8 COLLATE utf8_general_ci;
USE onibus;

-- DDL
CREATE TABLE motorista (
    cpf VARCHAR(14) NOT NULL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE telefone (
    cpf_motorista VARCHAR(14) NOT NULL,
    numero VARCHAR(15) NOT NULL,
	FOREIGN KEY (cpf_motorista) REFERENCES motorista(cpf)
);

CREATE TABLE linha (
    id VARCHAR(10) NOT NULL PRIMARY KEY,
    descricao TEXT NOT NULL 
);

CREATE TABLE horario (
    id_linha VARCHAR(10) NOT NULL,
    horario TIME NOT NULL,
	FOREIGN KEY (id_linha) REFERENCES linha(id)
);

CREATE TABLE dirige (
    cpf_motorista VARCHAR(14) NOT NULL,
    id_linha VARCHAR(10) NOT NULL,
    FOREIGN KEY (cpf_motorista) REFERENCES motorista(cpf),
    FOREIGN KEY (id_linha) REFERENCES linha(id)
);


-- DML (Importação de dados)
LOAD DATA INFILE 'C:/Users/Administrador/Downloads/tarefa.07.03/motorista.csv'
INTO TABLE motorista
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/Users/Administrador/Downloads/tarefa.07.03/telefone.csv'
INTO TABLE telefone
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/Users/Administrador/Downloads/tarefa.07.03/linha.csv'
INTO TABLE linha
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/Users/Administrador/Downloads/tarefa.07.03/horario.csv'
INTO TABLE horario
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/Users/Administrador/Downloads/tarefa.07.03/dirige.csv'
INTO TABLE dirige
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM motorista;
SELECT * FROM telefone;
SELECT * FROM linha;
SELECT * FROM horario;
SELECT * FROM dirige;

-- Trabalhar nas consultas/query para recuperação de dados
-- ./queries.sql
-- Geradas as conultas necessárias, salva como VISÕES

-- Motoristas que dirigem a linha 1
DROP VIEW IF EXISTS vw_moto_linha1;
CREATE VIEW vw_moto_linha1 AS
	SELECT m.nome, t.numero, d.id_linha FROM motorista m
		JOIN dirige d
		ON m.cpf = d.cpf_motorista
		JOIN linha l
		ON d.id_linha = l.id
		JOIN telefone t
		ON m.cpf = t.cpf_motorista
		WHERE l.id = "Linha1";
		

SELECT * FROM vw_moto_linha1;

-- Mostre todos os horários da linha 1
DROP VIEW IF EXISTS vw_horario_linha1;
CREATE VIEW vw_horario_linha1 AS
	SELECT h.horario, l.id FROM horario h
		JOIN linha l
		ON h.id_linha = l.id
		WHERE l.id = "Linha1";

SELECT * FROM vw_horario_linha1;

-- Mostre o id da linha que tenham os horários das 11:00
DROP VIEW IF EXISTS vw_linha_horario11;
CREATE VIEW vw_linha_horario11 AS
	SELECT h.horario, l.id FROM horario h
		JOIN linha l
		ON h.id_linha = l.id
		WHERE h.horario = "11:00";

SELECT * FROM vw_linha_horario11;


-- Mostre os nomes, telefones, id_linha, descricao e horários ordenados por id_linha
DROP VIEW IF EXISTS vw_moto_linha_desc_horario;
CREATE VIEW vw_moto_linha_desc_horario AS
	SELECT m.nome, t.numero, d.id_linha, l.descricao, h.horario 
	FROM motorista m
		JOIN dirige d
		ON m.cpf = d.cpf_motorista
		JOIN linha l
		ON d.id_linha = l.id
		JOIN telefone t
		ON m.cpf = t.cpf_motorista
		JOIN horario h
		ON l.id = h.id_linha
		ORDER BY d.id_linha;

SELECT * FROM vw_moto_linha_desc_horario;

-- Mostre uma consulta que mostre os nomes dos motoristas e quantas linhas eles dirigem
DROP VIEW IF EXISTS vw_moto_qtd_linha;
CREATE VIEW vw_moto_qtd_linha AS
	SELECT m.nome, COUNT(d.id_linha) AS qtd_linha FROM motorista m
		JOIN dirige d
		ON m.cpf = d.cpf_motorista
		GROUP BY m.nome;

SELECT * FROM vw_moto_qtd_linha;

-- Mostre o id_linha, a descrição e a quantidade de motoristas que dirigem esta linha
DROP VIEW IF EXISTS vw_linha_qtd_moto;
CREATE VIEW vw_linha_qtd_moto AS
	SELECT l.id, l.descricao, COUNT(d.cpf_motorista) AS qtd_moto FROM linha l
		JOIN dirige d
		ON l.id = d.id_linha
		GROUP BY l.id;

SELECT * FROM vw_linha_qtd_moto;


-- Motoristas com seus telefones
CREATE VIEW vw_motorista AS
	SELECT m.cpf, m.nome, t.numero AS telefone FROM motorista m
		LEFT JOIN telefone t
		ON m.cpf = t.cpf_motorista;

SELECT * FROM vw_motorista;


-- Nomes dos motoristas e linhas que dirige
CREATE VIEW vw_moto_x_linha AS
	SELECT m.nome, d.id_linha FROM motorista m
		LEFT JOIN dirige d
		ON m.cpf = d.cpf_motorista
		UNION
		SELECT m.nome, l.id FROM motorista m
			JOIN dirige d
			ON m.cpf = d.cpf_motorista
			RIGHT JOIN linha l
			ON d.id_linha = l.id;

SELECT * FROM vw_moto_x_linha;

		
	
	
	
	
	
