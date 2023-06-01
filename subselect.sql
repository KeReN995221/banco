DROP DATABASE IF EXISTS  venda_produto;
CREATE DATABASE venda_produto;
USE venda_produto;

CREATE TABLE clientes(
id_cliente INTEGER NOT NULL  PRIMARY KEY 
, nome_cliente VARCHAR(255)
, email_cliente VARCHAR(255)
, telefone_cliente VARCHAR (20)
);

CREATE TABLE produtos (
id_produto INTEGER NOT NULL  PRIMARY KEY 
, nome_produto VARCHAR(255)
, preco_produto DOUBLE 
);



CREATE TABLE pedidos (
    id_pedido INTEGER NOT NULL PRIMARY KEY,
    data_pedido DATE,
    cliente_id INTEGER NOT NULL,
    CONSTRAINT cliente_id FOREIGN KEY (cliente_id) REFERENCES clientes (id_cliente)
);

CREATE TABLE itens_pedidos(
id_item INTEGER NOT NULL  PRIMARY KEY 
, quantidade_itens INTEGER NOT NULL 
, pedido_id INTEGER NOT NULL
, produto_id INTEGER NOT NULL
, CONSTRAINT pedido_id FOREIGN KEY (pedido_id) REFERENCES pedidos (id_pedido)
, CONSTRAINT produto_id FOREIGN KEY (produto_id) REFERENCES produtos (id_produto)
);

-- Inserções para a tabela "clientes"
INSERT INTO clientes (id_cliente, nome_cliente, email_cliente, telefone_cliente)
VALUES (1, 'João Silva', 'joao@example.com', '(11) 987654321');

INSERT INTO clientes (id_cliente, nome_cliente, email_cliente, telefone_cliente)
VALUES (2, 'Maria Santos', 'maria@example.com', '(11) 987654322');

INSERT INTO clientes (id_cliente, nome_cliente, email_cliente, telefone_cliente)
VALUES (3, 'Carlos Souza', 'carlos@example.com', '(11) 987654323');

-- Inserções para a tabela "produtos"
INSERT INTO produtos (id_produto, nome_produto, preco_produto)
VALUES (1, 'Camiseta', 29.99);

INSERT INTO produtos (id_produto, nome_produto, preco_produto)
VALUES (2, 'Calça', 59.99);

INSERT INTO produtos (id_produto, nome_produto, preco_produto)
VALUES (3, 'Tênis', 99.99);

-- Inserções para a tabela "pedidos"
INSERT INTO pedidos (id_pedido, data_pedido, cliente_id)
VALUES (1, '2023-05-30', 1);

INSERT INTO pedidos (id_pedido, data_pedido, cliente_id)
VALUES (2, '2023-05-31', 2);

-- Inserções para a tabela "itens_pedidos"
INSERT INTO itens_pedidos (id_item, quantidade_itens, pedido_id, produto_id)
VALUES (1, 2, 1, 1);

INSERT INTO itens_pedidos (id_item, quantidade_itens, pedido_id, produto_id)
VALUES (2, 1, 1, 2);

INSERT INTO itens_pedidos (id_item, quantidade_itens, pedido_id, produto_id)
VALUES (3, 1, 2, 3);


-- Encontre o nome e o e-mail de todos os clientes que fizeram pedidos

SELECT c.nome_cliente, c.email_cliente,
	(SELECT COUNT(p.cliente_id) 
	FROM pedidos p
	WHERE p.cliente_id = c.id_cliente) AS qtd_pedidos_por_clientes
FROM clientes c;

-- Encontre o nome do cliente que fez o pedido com o maior número de itens.

SELECT c.nome_cliente
FROM pedidos p
JOIN clientes c ON p.cliente_id = c.id_cliente
WHERE p.id_pedido = (
    SELECT pedido_id
    FROM itens_pedidos
    GROUP BY pedido_id
    ORDER BY SUM(quantidade_itens) DESC
    LIMIT 1
);