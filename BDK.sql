DROP DATABASE IF EXISTS banco_de_dados;
CREATE DATABASE banco_de_dados;
-- criado o banco de dados--
USE banco_de_dados;
-- CREATE TABLE estado(
-- id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
-- , nome VARCHAR(255) NOT NULL UNIQUE 
-- ,sigla CHAR(2) NOT NULL UNIQUE 
-- ,ativo CHAR(1) NOT NULL DEFAULT 'S'
-- );
-- INSERT INTO estado (id,nome,sigla,ativo) -- caso use todas as tabelas pode-se excluir o que está em parentese -- 
-- VALUES(NULL,'PARANÁ','PR','S');


-- INSERT INTO estado 
-- VALUES(NULL, 'SÃO PAULO','SP','S');

-- INSERT INTO estado(nome, sigla) -- como o id  e o ativo são gerados automaticamente não precisa escrever -- 
-- VALUES (NULL, 'MATO GROSSO', 'MT');

-- SELECT id,nome,sigla,ativo FROM estado;

CREATE TABLE tamanho(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
,medida VARCHAR(10) NOT NULL 
);
CREATE TABLE traje (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT 
,nome VARCHAR(255) NOT NULL 
,valor DECIMAL(8,2) NOT NULL 
,tamanho CHAR(1) NOT NULL 
, ativo CHAR(1) NOT NULL DEFAULT 'S'
);


INSERT INTO produto (id, nome, preco_custo,preco_venda,ativo)
VALUES(NULL, 'BALA', 0.3, 1.0,'S');

SELECT id,nome,preco_custo,preco_venda, ativo FROM traje;

CREATE TABLE cidade(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
, nome VARCHAR(255) NOT NULL 
,estado_id INT NOT NULL 
,ativo CHAR(1) NOT NULL DEFAULT 'S'
,CHECK (ativo IN('S','N'))
,FOREIGN KEY(estado_id) REFERENCES estado(id)
);

INSERT INTO cidade(nome, estado_id)
VALUES ('PARANAVAÍ', 1);

UPUDATE produto SET nome = 'BALÁ' 
