USE DB_T04703_Marcelo_Nascimento;

DROP TABLE IF EXISTS produtos;
DROP TABLE IF EXISTS vendas;

-- Tabela de Produtos
CREATE TABLE produtos (
    id_produto INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL
);

-- Tabela de Vendas
CREATE TABLE vendas (
    id_venda INT PRIMARY KEY,
    id_produto INT,
    quantidade INT NOT NULL,
    data_venda DATE,
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

CREATE TABLE faixa_preco (
    id_faixa INT PRIMARY KEY,
    descricao VARCHAR(50) NOT NULL,
    preco_min DECIMAL(10,2) NOT NULL,
    preco_max DECIMAL(10,2)
);

-- Inserindo Produtos
INSERT INTO produtos (id_produto, nome, preco) VALUES
(1, 'Caderno', 10.00),
(2, 'Caneta', 2.50),
(3, 'Mochila', 120.00),
(4, 'Notebook', 3500.00),
(5, 'Mouse', 80.00),
(6, 'Teclado', 150.00),
(7, 'Garrafa', 25.00),
(8, 'Livro', 60.00),
(9, 'Fone de Ouvido', 250.00),
(10, 'Calculadora', 90.00);

-- Inserindo Vendas
INSERT INTO vendas (id_venda, id_produto, quantidade, data_venda) VALUES
(1, 1, 3, '2025-08-01'),
(2, 2, 10, '2025-08-02'),
(3, 3, 1, '2025-08-02'),
(4, 5, 2, '2025-08-03'),
(5, 1, 1, '2025-08-04'),
(6, 9, 4, '2025-08-04'),
(7, 10, 1, '2025-08-05'),
(8, 2, 5, '2025-08-05'),
(9, 5, 1, '2025-08-06'),
(10, 8, 2, '2025-08-07');

 INSERT INTO faixa_preco (id_faixa, descricao, preco_min, preco_max) VALUES
(1, 'Barato', 0.00, 50.00),
(2, 'Intermediário', 50.01, 500.00),
(3, 'Caro', 500.01, 5000.00);

-- DESAFIO 1: Listar todos os produtos disponíveis, mostrando quantas vezes cada um foi vendido - Mesmo que nunca tenha sido vendido
SELECT produtos.id_produto as ID_Produto,
	produtos.nome as Produto,
	produtos.preco as Preço,
	SUM(vendas.quantidade) as Vendas_totais
from produtos 
left join vendas on produtos.id_produto = vendas.id_produto 
group by produtos.id_produto order by produtos.id_produto;

-- Desafio 2: Classificar os produtos em categoria de preço
SELECT produtos.id_produto as ID_Produto,
	produtos.nome as Produto,
    produtos.preco as Preço,
    faixa.descricao as Categoria
FROM produtos 
join faixa_preco as faixa on produtos.preco
between faixa.preco_min and faixa.preco_max 
ORDER BY produtos.preco asc;
