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
,CONSTRAINT pk_ciade PRIMARY KEY (id)
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
, cliente_id INT NOT NULL
, CONSTRAINT cliente_id FOREIGN KEY (cliente_id) REFERENCES cidade (id)
);


CREATE TABLE telefone(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT 
, numero  VARCHAR(20) NOT NULL UNIQUE 
, numero2 VARCHAR (20) UNIQUE
, numero3 VARCHAR (20) UNIQUE
, numero4 VARCHAR (20) UNIQUE
, funcionário_id INT NOT NULL
, CONSTRAINT funcionário_id FOREIGN KEY (funcionário_id) REFERENCES cidade (id)
);
