DROP DATABASE IF EXISTS banco_de_dados;
CREATE DATABASE banco_de_dados; 
-- ao dar enter novamente aparece uma mensagem de erro pois o banco já existe
-- DROP DATABASE banco_de_dados;--
-- após o comando foi excluido o banco de dados e ao rodar novamente apareceu uma mensagem de erro pois já havia sido excluido o banco de dados ---
-- DROP DATABASE IF EXISTS banco_de_dados; --

USE banco_de_dados;

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
INSERT INTO cliente (nome) VALUES ('KEREN');
-- alterando a tabela 
ALTER TABLE cliente ADD COLUMN idade INT;

SELECT * FROM cliente;

DESCRIBE cliente;
DESC  cliente;

-- ALTER TABLE cliente MODIFY COLUMN idade NOT NULL; 

ALTER TABLE cliente MODIFY COLUMN id INT NOT NULL PRIMARY KEY AUTO_INCREMENT ;

ALTER TABLE cliente ADD COLUMN idade INT NOT NULL DEFAULT 'IDADE NÃO INFORMADA'; 

-- modificando o nome da tabela 
ALTER TABLE cliente CHANGE  idade idade_cliente INT NOT NULL DEFAULT 'IDADE DO CLIENTE NÃO INFORMADA';


/*
AGORA É A SUA VEZ!!!! Para que você aprenda, é muito importante que não copie e cole, digite os comandos e mentalize o que está fazendo na medida que digita cada comando. Uma dica importante é que você digite primeiro no bloco de notas, com o intuito de testar se realmente consegue digitar os comandos sem a ajuda do IDE – testar os comandos.
9. Escreva o comando para alterar o valor de uma coluna de um único registro de uma tabela usando como filtro ou chave primária.
10. Refaça o exercício anterior alterando os dados de uma coluna de um único registro sem usar como filtro uma chave primária. A escolha da coluna do filtro é muito importante – TOME CUIDADO.
11. Alterar o valor de uma coluna de todos os registros.
12. Exclua um único registro de uma tabela sem usar como filtro, uma chave primária.
Escreva todos os comandos 13 para fechar o cliente com o comando “38”.
*/








-- 5. Escreva o comando para inserir 3 registros da tabela estado com todas as colunas. 

INSERT INTO estado (id, nome, sigla, ativo) VALUES (NULL,'PARANÁ', 'PR', 'S');
INSERT INTO estado (id, nome, sigla, ativo) VALUES (NULL, 'PARÁ', 'PA', 'S');
INSERT INTO estado (id, nome, sigla, ativo) VALUES (NULL, 'PIAUÍ', 'PI', 'S');
-- 6. Escreva o comando para inserir 2 registros da tabela estado, definindo todos os dados, exceto a chave  primária que é auto incremento.
INSERT INTO estado (nome, sigla, ativo) VALUES ('PIAUÍ', 'PI', 'S');
INSERT INTO estado (nome, sigla, ativo) VALUES ('PIAUÍ', 'PI', 'S');

-- 6. Escreva o comando para inserir 2 registros da tabela estado, definindo todos os dados, exceto a chave  primária que é auto incremento.
INSERT INTO estado (nome, sigla, ativo) VALUES ('AMAPÁ', 'AP', 'S');
INSERT INTO estado (nome, sigla, ativo) VALUES ('AMAZONAS', 'AM', 'S');

-- Altere o valor de uma coluna de todos os registros.
UPDATE estado SET 
  sigla = 'PR'
, nome = 'PERNANBUCO'
, ativo = 'N'
 WHERE id = 1;

-- Exclua um único registro de uma tabela sem utilizar como filtro, a chave primária.
DELETE FROM estado WHERE nome = 'PERNANBUCO';

-- 6.	Escreva o comando para selecionar todos os registros da tabela estado com todas as colunas.
SELECT * FROM estado;
-- 7.	Escreva o comando para seleccionar o nome de todos os registros da tabela estado.
SELECT nome FROM estado;
