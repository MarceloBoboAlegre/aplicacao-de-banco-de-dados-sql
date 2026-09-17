USE DB_T04703_Marcelo_Nascimento;

CREATE TABLE FORNECEDORES_EX (
	id int primary key auto_increment,
    nome varchar(150)
);

CREATE TABLE PRODUTOS_EX (
	id int primary key auto_increment,
    nome varchar(150),
    preco decimal(8,2),
    estoque int,
    fornecedorId int,
    FOREIGN KEY (fornecedorId) REFERENCES FORNECEDORES_EX(id)
);

CREATE TABLE VENDAS_EX (
	id int primary key auto_increment,
    quantidade int,
    data_venda date,
    produtoId int,
    FOREIGN KEY (produtoId) REFERENCES PRODUTOS_EX(id)
);

INSERT INTO FORNECEDORES_EX (nome) VALUES
('Distribuidora Bom Preço'),
('Coca-Cola FEMSA'),
('Ambev'),
('Nestlé Brasil'),
('Unilever'),
('Hortifruti do Bairro'),
('Laticínios Boa Leite'),
('Padaria Pão Quente');

INSERT INTO PRODUTOS_EX (nome, preco, estoque, fornecedorId) VALUES
-- Mercearia
('Arroz Branco 5kg', 28.90, 35, 1),
('Feijão Carioca 1kg', 8.49, 50, 1),
('Açúcar Cristal 1kg', 4.99, 40, 1),
('Óleo de Soja 900ml', 6.49, 45, 1),
('Macarrão Espaguete 500g', 4.79, 30, 1),
('Farinha de Trigo 1kg', 5.99, 25, 1),
-- Bebidas
('Coca-Cola 2L', 10.99, 24, 2),
('Coca-Cola Lata 350ml', 4.49, 48, 2),
('Fanta Laranja 2L', 8.99, 20, 2),
('Guaraná Antarctica 2L', 8.49, 22, 3),
('Skol Lata 350ml', 3.99, 60, 3),
('Brahma Lata 350ml', 4.19, 55, 3),
-- Café e produtos Nestlé
('Café Solúvel 100g', 12.90, 20, 4),
('Leite em Pó 400g', 18.90, 18, 4),
('Achocolatado 400g', 9.99, 25, 4),
-- Produtos de limpeza
('Detergente Líquido 500ml', 2.99, 40, 5),
('Sabão em Pó 1kg', 12.49, 20, 5),
('Amaciante 2L', 9.99, 18, 5),
('Desinfetante 500ml', 5.49, 25, 5),
-- Hortifruti
('Banana Prata 1kg', 6.99, 15, 6),
('Maçã 1kg', 8.99, 12, 6),
('Tomate 1kg', 7.49, 18, 6),
('Batata 1kg', 5.99, 20, 6),
('Cebola 1kg', 5.49, 16, 6),
-- Laticínios
('Leite Integral 1L', 5.49, 30, 7),
('Queijo Mussarela 500g', 24.90, 10, 7),
('Manteiga 200g', 9.90, 15, 7),
('Iogurte Natural 170g', 3.99, 24, 7),
-- Padaria
('Pão Francês 1kg', 14.90, 10, 8),
('Pão de Forma 500g', 8.99, 15, 8),
('Bolo de Chocolate', 18.90, 6, 8);

INSERT INTO VENDAS_EX (produtoId, quantidade, data_venda) VALUES
-- 01/08
(1, 3, '2026-08-01'),
(7, 5, '2026-08-01'),
(26, 4, '2026-08-01'),
-- 02/08
(2, 4, '2026-08-02'),
(11, 8, '2026-08-02'),
(21, 3, '2026-08-02'),
-- 04/08
(8, 6, '2026-08-04'),
(27, 2, '2026-08-04'),
(30, 5, '2026-08-04'),
-- 06/08
(1, 5, '2026-08-06'),
(5, 4, '2026-08-06'),
(25, 6, '2026-08-06'),
(16, 3, '2026-08-06'),
-- 08/08
(7, 8, '2026-08-08'),
(9, 4, '2026-08-08'),
(22, 5, '2026-08-08'),
(29, 3, '2026-08-08'),
-- 10/08
(3, 7, '2026-08-10'),
(10, 6, '2026-08-10'),
(26, 8, '2026-08-10'),
(31, 2, '2026-08-10'),
-- 12/08
(4, 5, '2026-08-12'),
(12, 7, '2026-08-12'),
(17, 3, '2026-08-12'),
-- 15/08
(1, 6, '2026-08-15'),
(6, 4, '2026-08-15'),
(28, 3, '2026-08-15'),
(30, 7, '2026-08-15'),
-- 18/08
(2, 5, '2026-08-18'),
(13, 3, '2026-08-18'),
(18, 4, '2026-08-18'),
(21, 5, '2026-08-18'),
-- 20/08
(7, 10, '2026-08-20'),
(11, 12, '2026-08-20'),
(14, 5, '2026-08-20'),
(26, 8, '2026-08-20'),
-- 22/08
(5, 6, '2026-08-22'),
(8, 9, '2026-08-22'),
(23, 4, '2026-08-22'),
(29, 5, '2026-08-22'),
-- 25/08
(1, 7, '2026-08-25'),
(4, 5, '2026-08-25'),
(10, 8, '2026-08-25'),
(27, 3, '2026-08-25'),
-- 27/08
(3, 6, '2026-08-27'),
(7, 9, '2026-08-27'),
(15, 4, '2026-08-27'),
(20, 5, '2026-08-27'),
-- 29/08
(2, 8, '2026-08-29'),
(11, 10, '2026-08-29'),
(24, 5, '2026-08-29'),
(31, 3, '2026-08-29'),
-- 01/09
(1, 5, '2026-09-01'),
(8, 7, '2026-09-01'),
(16, 4, '2026-09-01'),
(25, 6, '2026-09-01'),
-- 03/09
(5, 4, '2026-09-03'),
(9, 6, '2026-09-03'),
(17, 5, '2026-09-03'),
(30, 4, '2026-09-03'),
-- 05/09
(3, 8, '2026-09-05'),
(7, 11, '2026-09-05'),
(12, 9, '2026-09-05'),
(26, 7, '2026-09-05'),
-- 08/09
(2, 6, '2026-09-08'),
(6, 5, '2026-09-08'),
(21, 4, '2026-09-08'),
(28, 3, '2026-09-08'),
-- 10/09
(1, 8, '2026-09-10'),
(4, 6, '2026-09-10'),
(11, 12, '2026-09-10'),
(22, 5, '2026-09-10'),
-- 12/09
(7, 10, '2026-09-12'),
(10, 8, '2026-09-12'),
(25, 6, '2026-09-12'),
(31, 4, '2026-09-12');

SELECT * FROM FORNECEDORES_EX;
SELECT * FROM PRODUTOS_EX;
SELECT * FROM VENDAS_EX;

-- 1
SELECT
    p.nome AS Produto,
    f.nome AS Fornecedor
FROM PRODUTOS_EX p
JOIN FORNECEDORES_EX f
    ON p.fornecedorId = f.id;
    
-- 2
SELECT 
	p.nome AS Nome_Produto,
    v.quantidade AS Quantidade_Vendida,
    v.data_venda AS Data_da_Venda
FROM VENDAS_EX v
JOIN PRODUTOS_EX p
	ON v.produtoId = p.id
ORDER BY v.data_venda ASC;

-- 3
SELECT 
    p.nome AS Nome_Produto,
    p.preco as Preco_Unitario,
    SUM(v.quantidade) AS Total_vendido,
    f.nome AS Nome_Fornecedor
FROM PRODUTOS_EX p
JOIN VENDAS_EX v ON v.produtoId = p.id
INNER JOIN FORNECEDORES_EX f ON p.fornecedorId = f.id
GROUP BY p.id, p.nome
ORDER BY total_vendido DESC;

-- 4
SELECT 
	p.nome as Produto_Nome,
    p.estoque as Quantidade_Estoque,
    f.nome as Fornecedor_Nome
FROM PRODUTOS_EX p
INNER JOIN FORNECEDORES_EX f ON p.fornecedorId = f.id
WHERE p.estoque <= 30;
