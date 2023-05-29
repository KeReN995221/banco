/*CREATE TABLE usuario (
                id_usuario SERIAL PRIMARY KEY NOT NULL,
                nome_usuario VARCHAR(45),
                email VARCHAR(100),
                senha VARCHAR(45)
);

CREATE TABLE projetos (
                id_projeto SERIAL PRIMARY KEY NOT NULL,
                titulo VARCHAR(45),
                data_projeto DATE,
                url VARCHAR(100)
);

CREATE TABLE likes_por_projeto (
                projeto_id INTEGER NOT NULL REFERENCES projetos(id_projeto),
                usuario_id INTEGER NOT NULL REFERENCES usuario(id_usuario)
);

CREATE TABLE comentario (
                id_comentario SERIAL PRIMARY KEY NOT NULL,
                comentario VARCHAR(255),
                data_comentario DATE,
                projeto_id INTEGER NOT NULL REFERENCES projetos(id_projeto),
                usuario_id INTEGER NOT NULL REFERENCES usuario(id_usuario)
);

CREATE TABLE likes_por_comentario (
                usuario_id INTEGER NOT NULL REFERENCES usuario(id_usuario),
                comentario_id INTEGER NOT NULL REFERENCES comentario(id_comentario)
);

INSERT INTO projetos (titulo, data_projeto)
VALUES('Aplicação C#', '2018-04-01'),
	('Aplicação Ionic', '2018-05-07'),
	('Aplicação Python', '2018-08-05');


INSERT INTO usuario (nome_usuario, email, senha)
VALUES('Bruna Luiza', 'bruninha@gmail.com', 'abc123.'),
	('Thiago Braga', 'thiagobraga_1@hotmail.com', 'pena093'),
	('Osvaldo Justino', 'osvaltino@yahoo.com.br', 'osvaldit1_s'),
	('Gabriel Fernando', 'gabriel_fnd@gmail.com', 'gabss34');
	
INSERT INTO comentario (comentario, projeto_id, usuario_id)
VALUES('A Microsoft acertou com essa linguagem!', 1, 1),
	('Parabéns pelo projeto! bem legal!', 1, 3),
	('Super interessante! Fácil e rápido!', 2, 4),
	('Cara, que simples fazer um app assim!', 2, 1),
	('Linguagem muito diferente.', 3, 3),
	('Adorei aprender Python! Parabéns!', 3, 2),
	('Muito maneiro esse framework!', 2, 2);
	
INSERT INTO likes_por_projeto
VALUES (1, 1),
	(1, 3),
	(2, 1),
	(2, 2),
	(2, 3),
	(2, 4),
	(3, 2);
	
INSERT INTO likes_por_comentario
VALUES (1, 7),
	(2, 7),
	(4, 7);

SELECT COUNT (c.projeto_id)
FROM comentario c
JOIN projetos p
ON p.id_projeto = c.projeto_id
GROUP BY projeto_id;
*/

SELECT p.titulo,
   (SELECT COUNT (c.projeto_id)
	FROM comentario c
	WHERE p.id_projeto = c.projeto_id)AS qtd_comentarios,
   (SELECT COUNT (l.projeto_id)
	FROM likes_por_projeto l
	WHERE l.projeto_id = p.id_projeto)AS qtd_likes
FROM projetos p 
GROUP BY p.id_projeto
ORDER BY p.id_projeto;


SELECT c.projeto_id
FROM comentario c, projetos p
WHERE c.projeto_id = p.id_projeto;

SELECT p.titulo 
FROM projetos p 
WHERE p.id_projeto IN 
	(SELECT c.projeto_id
	FROM comentario c
	WHERE c.projeto_id = p.id_projeto);
	
SELECT p.id_projeto, p.titulo,
	(SELECT COUNT (c.projeto_id)
	FROM comentario c
	WHERE c.projeto_id = p.id_projeto)AS qtde_comentarios
FROM projetos p;

SELECT f.titulo, f.qtde_comentarios
FROM 
	(SELECT p.id_projeto, p.titulo,
	    (SELECT COUNT (c.projeto_id)
		FROM comentario c
		WHERE c.projeto_id = p.id_projeto)AS qtde_comentarios
	FROM projetos p) AS f
WHERE f.qtde_comentarios > 2;