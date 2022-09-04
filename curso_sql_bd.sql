DROP DATABASE IF EXISTS banco_de_dados;
CREATE DATABASE banco_de_dados; 
-- ao dar enter novamente aparece uma mensagem de erro pois o banco já existe
-- DROP DATABASE banco_de_dados;--
-- após o comando foi excluido o banco de dados e ao rodar novamente apareceu uma mensagem de erro pois já havia sido excluido o banco de dados ---
-- DROP DATABASE IF EXISTS banco_de_dados; --

USE banco_de_dados;
-- criando  as tabelas 
CREATE TABLE estado(
 id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
 , nome VARCHAR(255) NOT NULL UNIQUE 
 ,sigla CHAR(2) NOT NULL UNIQUE 
 ,ativo CHAR(1) NOT NULL DEFAULT 'S'
 );

CREATE TABLE cliente (
     id INT NOT NULL PRIMARY KEY 
	 ,nome VARCHAR(10) NOT NULL UNIQUE
);

CREATE TABLE cidade(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
, nome VARCHAR(255) NOT NULL 
,estado_id INT NOT NULL 
,ativo CHAR(1) NOT NULL DEFAULT 'S'
,CHECK (ativo IN('S','N'))
,FOREIGN KEY(estado_id) REFERENCES estado(id)
,CONSTRAINT pk_ciade PRIMARY KEY (id)
, CONSTRAINT fk_cidade_estado FOREIGN KEY (estado_id) REFERENCES esado (id)
, CONSTRAINT cidade_unica UNIQUE (nome, estado_id)
);

-- inserindo um valor 
INSERT INTO cliente (nome) VALUES ('KEREN');

-- alterando a tabela 
ALTER TABLE cliente ADD COLUMN idade INT;

-- consultando a tabela 
SELECT * FROM cliente;

DESCRIBE cliente;
DESC  cliente;

-- ALTER TABLE cliente MODIFY COLUMN idade NOT NULL; 

ALTER TABLE cliente MODIFY COLUMN id INT NOT NULL PRIMARY KEY AUTO_INCREMENT ;

ALTER TABLE cliente ADD COLUMN idade INT NOT NULL DEFAULT 'IDADE NÃO INFORMADA'; 

-- modificando o nome da tabela 
ALTER TABLE cliente CHANGE  idade idade_cliente INT NOT NULL DEFAULT 'IDADE DO CLIENTE NÃO INFORMADA';


-- 5. Escreva o comando para inserir 3 registros da tabela estado com todas as colunas. 
INSERT INTO estado (id,nome, sigla, ativo, data_cadastro) VALUES (1, 'PARANÁ', 'PR', 'S', '2022-09-01'), (2, 'SÃO PAULO','SP', 'S', '2022-09-01'), (3, 'SANTA CATARINA', 'SC', 'S', '2022-09-01');

-- 6. Escreva o comando para inserir 2 registros da tabela estado, definindo todos os dados, exceto a chave  primária que é auto incremento. 
INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('AMAZONAS', 'AM', 'S', '2022-09-01'), ('RORAIMA','RR', 'S', '2022-09-01'), ('RONDONIA', 'RO', 'S', '2022-09-01');


-- 10.	Refaça o exercício anterior alterando os dados de mais que uma coluna de um único registro sem utilizar como filtro a chave primária. A escolha da coluna do filtro é muito importante – TOME CUIDADO.
UPDATE estado SET nome = 'MATO GROSSO DO SUL', sigla = 'MS' WHERE nome = 'MATO GROSSO DO SUL';
SELECT * FROM estado;

-- 12.	Exclua um único registro de uma tabela sem utilizar como filtro, a chave primária.
DELETE FROM cidade WHERE nome = 'BLUMENAL';
SELECT * FROM cidade;


-- 6.	Escreva o comando para seleccionar todos os registros da tabela cidade com todas as colunas.
SELECT id, nome, ativo, data_cadastro, estado_id FROM cidade;

-- 7.	Escreva o comando para seleccionar o nome de todos os registros da tabela cidade.
SELECT nome FROM cidade;

-- inserindo dados com o comando INSERT 
-- 5. Escreva o comando para inserir 3 registros da tabela estado com todas as colunas. 

INSERT INTO estado (id, nome, sigla, ativo) VALUES (NULL,'PARANÁ', 'PR', 'S');
INSERT INTO estado (id, nome, sigla, ativo) VALUES (NULL, 'PARÁ', 'PA', 'S');
INSERT INTO estado (id, nome, sigla, ativo) VALUES (NULL, 'PIAUÍ', 'PI', 'S');
-- 6. Escreva o comando para inserir 2 registros da tabela estado, definindo todos os dados, exceto a chave  primária que é auto incremento.
INSERT INTO estado (nome, sigla, ativo) VALUES ('AMAPÁ', 'AP', 'S');
INSERT INTO estado (nome, sigla, ativo) VALUES ('AMAZONAS', 'AM', 'S');

-- Alterando os valores das tabelas ou colunas utilizando os comando UPDATE e DELETE
-- Altere o valor de uma coluna de todos os registros.
UPDATE estado SET 
  sigla = 'PR'
, nome = 'PERNANBUCO'
, ativo = 'N'
 WHERE id = 1;

-- Exclua um único registro de uma tabela sem utilizar como filtro, a chave primária.
DELETE FROM estado WHERE nome = 'PERNANBUCO';


-- funções com consultas utilizando o SELECT 
-- 6.	Escreva o comando para selecionar todos os registros da tabela estado com todas as colunas.
SELECT * FROM estado;
-- 7.	Escreva o comando para seleccionar o nome de todos os registros da tabela estado.
SELECT nome FROM estado;

-- JOIN 

SELECT * FROM estado JOIN cidade;

-- Tente inserir 2 registros na tabela estado com nomes iguais.
INSERT INTO estado (id, nome, sigla, ativo) VALUES (NULL,'PARANÁ', 'PR', 'S');
INSERT INTO estado (id, nome, sigla, ativo) VALUES (NULL,'PARANÁ', 'PR', 'S');
-- 1062 Duplicate entry 'PARANÁ' for key 'estado.nome'

-- Tente inserir um registro na tabela cidade com a referência de um estado que NÃO EXISTE.
INSERT INTO cidade (nome, estado_id, ativo) VALUES ('BOM CONSELHO', 10, 'S');
-- Error Code: 1146. Table banco_de_dados.cidade' doesn't exist
/*
01 - O que é JOIN? Quando é necessário?
-- É a combinação de valores em comum entre as colunas ou mesmo as tabelas, sendo o JOIN utilizado para interelacionar os dados que estão por algum motivo exteerno separados,
-- tornando assim a informação dos dados mais nexo possivél. 
02 - Qual a sintaxe do JOIN? Maiúscula ou minúscula faz diferença? Existe algum padrão? Explique.
     Por padrão se utiliza a sintaxe maiúscula mesmo que sua sintaxe seja definida fora do SQL, pois é necessário aderir um padrão utilizado pela maioria.
     
03-O que é primordial para que o resultado tenha sentido em consultas com JOIN? Explique.
algo imprescindível para o JOIN é a forma de seleção visto que decorrente da estruturação dos dados é que se obtem um resultado positivo oui negativo nesse caso 
se for negativo pode ser prejudicial para o JOIN
   
04 - mais de uma maneira de realizar o JOIN? Quantas? Qual é a mais eficiente? 
      Pode existir mais de uma maneira, na verdade pode existir até 5 maneiras, sendo elas:
      LEFT JOIN, INNER JOIN, FULL JOIN e o CROSS JOIN.
      dentre elas a mais utilizada é a	INNER JOIN, entretanto as demais não deixam de ser importantes.
      






*/