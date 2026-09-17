USE DB_T04703_Marcelo_Nascimento;

CREATE TABLE EL_CLIENTES (
	id_cliente int primary key,
    nome varchar(50)
);

CREATE TABLE EL_PRODUTOS (
	id_produto int primary key,
    nome_produto varchar(50)
);

CREATE TABLE EL_PEDIDOS (
	id_pedido int primary key,
    id_cliente int,
    id_produto int
);

INSERT INTO EL_CLIENTES (id_cliente, nome) VALUES (1, 'Amanda'), (2, 'Bernardo'), (3, 'Camila');

INSERT INTO EL_PRODUTOS (id_produto, nome_produto) VALUES 
(101, 'Notebook'), 
(102, 'Mouse'), 
(103, 'Teclado'); 

INSERT INTO EL_PEDIDOS (id_pedido, id_cliente, id_produto) VALUES 
(1, 1, 101), -- Amanda comprou Notebook 
(2, 2, 102), -- Bernardo comprou Mouse 
(3, 4, 101), -- Cliente inexistente 
(4, 2, 105); -- Produto inexistente

-- Exercícios
-- 1 INNER JOIN: Liste os pedidos com nome do cliente e nome do produto. Apenas pedidos válidos
SELECT CLIENTE.nome AS Cliente, 
	PRODUTO.nome_produto AS Produto, 
    PEDIDO.id_pedido AS ID_Pedido
    FROM EL_PEDIDOS PEDIDO 
INNER JOIN EL_CLIENTES CLIENTE ON PEDIDO.id_cliente = CLIENTE.id_cliente 
INNER JOIN EL_PRODUTOS PRODUTO ON PEDIDO.id_produto = PRODUTO.id_produto;

-- 2 LEFT JOIN: Mostre todos os clientes, com os produtos que compraram (se compraram)
SELECT CLIENTE.nome AS Cliente,
	PRODUTO.nome_produto AS Produto,
    PEDIDO.id_pedido AS ID_Pedido
FROM EL_CLIENTES CLIENTE 
LEFT JOIN EL_PEDIDOS PEDIDO ON CLIENTE.id_cliente = PEDIDO.id_cliente
LEFT JOIN EL_PRODUTOS PRODUTO ON PRODUTO.id_produto = PEDIDO.id_produto;

-- 3 RIGHT JOIN: Mostre todos os pedidos, mesmo os que não têm cliente na base
SELECT PEDIDO.id_pedido AS ID_Pedido, 
	CLIENTE.nome AS Cliente,
	PRODUTO.nome_produto AS Produto
FROM EL_CLIENTES CLIENTE
RIGHT JOIN EL_PEDIDOS PEDIDO ON PEDIDO.id_cliente = CLIENTE.id_cliente
LEFT JOIN EL_PRODUTOS PRODUTO ON PRODUTO.id_produto = PEDIDO.id_produto;

-- EXTRAS
-- Clientes que não fizeram nenhum pedido
SELECT CLIENTE.nome AS Cliente,
	CLIENTE.id_cliente AS ID_Cliente,
	PEDIDO.id_pedido AS ID_Pedido
FROM EL_CLIENTES CLIENTE 
LEFT JOIN EL_PEDIDOS PEDIDO ON CLIENTE.id_cliente = PEDIDO.id_cliente
WHERE PEDIDO.id_pedido IS NULL;

-- Pedidos com produto inexistente
SELECT PEDIDO.id_pedido AS ID_Pedido,
	PEDIDO.id_produto AS ID_Produto_Pedido,
	PRODUTO.nome_produto AS Produto
FROM EL_PEDIDOS PEDIDO 
LEFT JOIN EL_PRODUTOS PRODUTO ON PEDIDO.id_produto = PRODUTO.id_produto 
WHERE PRODUTO.id_produto IS NULL;

-- Produtos ainda não vendidos
SELECT PRODUTO.id_produto AS ID_Produto,
	PRODUTO.nome_produto AS Produto,
	PEDIDO.id_pedido AS ID_Pedido
FROM EL_PRODUTOS PRODUTO 
LEFT JOIN EL_PEDIDOS PEDIDO ON PRODUTO.id_produto = PEDIDO.id_produto 
WHERE PEDIDO.id_pedido IS NULL;
