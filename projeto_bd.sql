DROP DATABASE IF EXISTS banco_de_dados;
CREATE DATABASE banco_de_dados; 
USE banco_de_dados;

CREATE TABLE estado(
 id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
 , nome VARCHAR(255) NOT NULL UNIQUE 
 ,sigla CHAR(2) NOT NULL UNIQUE 
 ,ativo CHAR(1) NOT NULL DEFAULT 'S'
,CONSTRAINT estado_ativo_deve_ser_S_ou_N CHECK (ativo IN ('S', 'N') )
 );
 
INSERT INTO estado (nome, sigla, ativo) VALUES ( 'PARANÁ', 'PR', 'S');
INSERT INTO estado (nome, sigla, ativo) VALUES ( 'AMAZONAS','AM', 'S');
INSERT INTO estado (nome, sigla, ativo) VALUES ( 'PERNANBUCO', 'PE', 'S'); 
 
SELECT * FROM estado;
 
 CREATE TABLE cidade(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
, nome VARCHAR(255) NOT NULL 
,estado_id INT NOT NULL 
,ativo CHAR(1) NOT NULL DEFAULT 'S'
,CHECK (ativo IN('S','N'))
,CONSTRAINT fk_cidade_estado FOREIGN KEY(estado_id) REFERENCES estado(id)
,CONSTRAINT cidade_ativo_deve_ser_S_ou_N CHECK (ativo IN ('S','N'))
, CONSTRAINT cidade_unica UNIQUE (nome, estado_id)
);
 
INSERT INTO cidade ( nome, estado_id, ativo) VALUES ( 'CRUZEIRO DO SUL', 1, 'S');
INSERT INTO cidade (nome, estado_id, ativo) VALUES ('PARANAVAÍ', 1, 'S');
INSERT INTO cidade ( nome, estado_id, ativo) VALUES ('MARINGA', 1, 'S');


SELECT * FROM cidade;


CREATE TABLE cliente(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
, nome VARCHAR (45) NOT NULL
, cpf VARCHAR (45) NOT NULL UNIQUE 
, cidade_id INT NOT NULL 
, ativo CHAR(1) NOT NULL DEFAULT 'S'
, endereço VARCHAR (255) NOT NULL 
, estado_id INT NOT NULL 
, CONSTRAINT cidade_id FOREIGN KEY (cidade_id) REFERENCES cidade (id)
,CONSTRAINT cliente_ativo_deve_ser_S_ou_N CHECK (ativo IN ('S','N'))
);

INSERT INTO cliente ( nome, cpf, cidade_id, ativo, endereço, estado_id) VALUES ( 'JENOVEVA', '123.999.029-47', 1, 'S', 'RUA CARLINDA DUARTE CANTELE', 1);
INSERT INTO cliente ( nome, cpf, cidade_id, ativo, endereço, estado_id) VALUES ( 'ARTUR', '145.999.029-47', 1, 'S', 'RUA CARLINDA DUARTE CANTELE', 1);
INSERT INTO cliente ( nome, cpf, cidade_id, ativo, endereço, estado_id) VALUES ( 'JENOVEVA', '453.999.029-47', 1, 'S', 'RUA CARLINDA DUARTE CANTELE', 1);

SELECT * FROM cliente;

CREATE TABLE funcionário (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT 
, nome VARCHAR (45) NOT NULL
, cpf VARCHAR (45) NOT NULL UNIQUE 
, cidade_id INT NOT NULL 
, ativo CHAR(1) NOT NULL DEFAULT 'S'
, endereço VARCHAR (255) NOT NULL 
, estado_id INT NOT NULL 
, CONSTRAINT cidade_id2 FOREIGN KEY (cidade_id) REFERENCES cidade (id)
,CONSTRAINT funcionário_ativo_deve_ser_S_ou_N CHECK (ativo IN ('S','N'))

);

INSERT INTO funcionário (nome, cpf, cidade_id, ativo, endereço, estado_id)  VALUES ('CLODOALDO', '456.123.029-57', 1, 'S', 'RUA DO LIMOEIRO', 2 );
INSERT INTO funcionário (nome, cpf, cidade_id, ativo, endereço, estado_id)  VALUES ('THEO', '366.123.029-57', 2, 'S', 'RUA DO LIMOEIRO', 3 );
INSERT INTO funcionário (nome, cpf, cidade_id, ativo, endereço, estado_id)  VALUES ('AZU', '478.123.029-57', 3, 'S', 'RUA DO LIMOEIRO', 1);

SELECT * FROM funcionário;



CREATE TABLE telefone(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT 
, numero  VARCHAR(20) NOT NULL UNIQUE 
, numero2 VARCHAR (20) UNIQUE
, numero3 VARCHAR (20) UNIQUE
, numero4 VARCHAR (20) UNIQUE
, cliente_id INT 
, funcionário_id INT 
, usuario CHAR (1) NOT NULL
, CONSTRAINT funcionário_id FOREIGN KEY (funcionário_id) REFERENCES funcionário (id)
, CONSTRAINT funcionário_id FOREIGN KEY (funcionário_id) REFERENCES funcionário (id)
, CONSTRAINT usuario_deve_ser_C_ou_F CHECK (usuario IN ('F','C') )
);

INSERT INTO telefone (numero, numero2, cliente_id, usuario) VALUES ('995221', '99060526', 1, 'C');
INSERT INTO telefone (numero, numero4, funcionario_id, usuario) VALUES ('9923221', '99740526', 2, 'F');
INSERT INTO telefone (numero, numero2, cliente_id, usuario) VALUES ('9957421', '99064526', 2, 'C');

SELECT * FROM telefone;


CREATE TABLE categoria (
id INT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT 
, nome VARCHAR (255) NOT NULL
, sexo CHAR(1) NOT NULL 
, CONSTRAINT sexo_deve_ser_Feminino_masculino CHECK (sexo IN('F', 'V'))
);


INSERT INTO categoria (nome, sexo) VALUES ('NOIVA', 'F');

SELECT * FROM categoria;

CREATE TABLE tipo (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
, comprimento VARCHAR(255) NOT NULL
-- adulto ou infsntil, o comptimrnto se refere se é curto ou longo
, modelo VARCHAR (255) NOT NULL

);

INSERT INTO tipo (comprimento, modelo) VALUES ('longo','sereia'); 

CREATE TABLE traje(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT 
, cor VARCHAR(255) NOT NULL
, categoria_id INT NOT NULL 
, tipo_id INT NOT NULL
, valor DECIMAL NOT NULL
, CONSTRAINT categoria_id FOREIGN KEY (categoria_id) REFERENCES categoria (id)
, CONSTRAINT tipo_id FOREIGN KEY (tipo_id) REFERENCES tipo(id)

);

INSERT INTO traje (cor, categoria_id, tipo_id, valor) VALUES ('BRANCO', 1, 1, 1000.00);

SELECT * FROM traje;


CREATE TABLE locação(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
 -- data , data de devolução da peça , desconto , valor total




);