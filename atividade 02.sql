USE DB_T04703_Marcelo_Nascimento;

-- Atividade 01
CREATE TABLE TB_PRODUTOS (
	id_produto int primary key auto_increment,
    nome varchar(100),
    preco decimal(8, 2)
);

CREATE TABLE TB_VENDAS (
	id_venda int primary key auto_increment,
    id_produto int,
    quantidade int,
    data_venda date,
    FOREIGN KEY (id_produto) REFERENCES TB_PRODUTOS(id_produto)
);

CREATE TABLE TB_FORNECEDORES (
	id_fornecedor int primary key auto_increment,
    nome varchar(100),
    telefone varchar(20)
);

INSERT INTO TB_PRODUTOS (nome, preco) 
VALUES ('Bolo de fubá', 32.25),
	('Pão de queijo', 4.00),
    ('Café preto', 1.30),
    ('Bolo de chocolate', 35.75),
    ('Coxinha', 7.99);

SELECT * FROM TB_PRODUTOS;

INSERT INTO TB_VENDAS (id_produto, quantidade, data_venda) 
VALUES (1, 7, '2025-06-01'),
	(2, 8, '2025-06-01'),
    (4, 1, '2025-06-01'),
    (5, 8, '2025-06-01'),
    (3, 10, '2025-06-01'),
    (2, 10, '2025-06-02'),
    (4, 3, '2025-06-02'),
    (5, 9, '2025-06-02'),
    (1, 7, '2025-06-02'),
    (3, 6, '2025-06-02'),
    (3, 7, '2025-06-03'),
    (2, 2, '2025-06-03'),
    (1, 4, '2025-06-03'),
    (4, 4, '2025-06-03'),
    (5, 4, '2025-06-03');

SELECT * FROM TB_VENDAS;

INSERT INTO TB_FORNECEDORES (nome, telefone) 
VALUES ('Chico Bento', '15 91532-5541'),
	('Cascão', '14 97185-1561'),
    ('Mônica', '15 91895-3214'),
    ('Cebolinha', '15 94354-4861');

SELECT * FROM TB_FORNECEDORES;

-- Item 1: Listar todos os produtos cadastrados
SELECT nome, preco FROM TB_PRODUTOS ORDER BY preco ASC;

-- Item 2: Listar total de unidades vendida por produto
SELECT id_produto, sum(quantidade) as total_vendido FROM TB_VENDAS GROUP BY id_produto;

-- Item 3: Listar o total de vendas do Bolo de Fubá
SELECT id_produto, sum(quantidade) FROM TB_VENDAS WHERE id_produto = 1 GROUP BY id_produto;

-- Item 4: Listar o total de vendas do Bolo de Chocolate
SELECT id_produto, sum(quantidade) FROM TB_VENDAS WHERE id_produto = 4 GROUP BY id_produto;

-- Item 5: Produtos vendidos em 2025-06-03
SELECT id_produto, quantidade, data_venda FROM TB_VENDAS WHERE data_venda = '2025-06-03';
