USE DB_T04703_Marcelo_Nascimento;

-- ELIMINANDO AS TABELAS CASO JA EXISTAM
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS vendedores;
DROP TABLE IF EXISTS categorias;
DROP TABLE IF EXISTS produtos;
DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS itens_pedido;

-- CRIAÇÃO DAS TABELAS

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cidade VARCHAR(50),
    estado CHAR(2)
);

CREATE TABLE vendedores (
    id_vendedor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    regiao VARCHAR(50)
);

CREATE TABLE categorias (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome_categoria VARCHAR(50) NOT NULL
);

CREATE TABLE produtos (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2),
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    id_vendedor INT,
    data_pedido DATE,
    valor_total DECIMAL(10,2),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_vendedor) REFERENCES vendedores(id_vendedor)
);

CREATE TABLE itens_pedido (
    id_item INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT,
    id_produto INT,
    quantidade INT,
    preco_unitario DECIMAL(10,2),
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

-- INSERINDO REGISTROS NAS TABELAS

INSERT INTO clientes (nome, cidade, estado) VALUES
('João Silva', 'Barueri', 'SP'),
('Maria Santos', 'Osasco', 'SP'),
('Carlos Oliveira', 'Jundiaí', 'SP'),
('Ana Souza', 'São Paulo', 'SP'),
('Pedro Lima', 'Campinas', 'SP'),
('Juliana Costa', 'Barueri', 'SP'),
('Rafael Alves', 'Santos', 'SP'),
('Fernanda Rocha', 'Osasco', 'SP'),
('Lucas Martins', 'Sorocaba', 'SP'),
('Camila Mendes', 'São Paulo', 'SP'),
('Bruno Ferreira', 'Atibaia', 'SP'),
('Patricia Gomes', 'Barueri', 'SP');

INSERT INTO vendedores (nome, regiao) VALUES
('Carlos Mendes', 'Grande São Paulo'),
('Ana Paula', 'Interior'),
('Roberto Lima', 'Grande São Paulo'),
('Fernanda Alves', 'Litoral');

INSERT INTO categorias (nome_categoria) VALUES
('Informática'),
('Periféricos'),
('Monitores'),
('Acessórios'),
('Redes');

INSERT INTO produtos (nome_produto, preco, id_categoria) VALUES
('Notebook Lenovo', 3500.00, 1),
('Notebook Dell', 4800.00, 1),
('Mouse sem fio', 89.90, 2),
('Teclado mecânico', 249.90, 2),
('Monitor LG 24', 899.90, 3),
('Monitor Samsung 27', 1499.90, 3),
('Webcam Full HD', 299.90, 4),
('Headset Gamer', 399.90, 4),
('Cabo HDMI', 49.90, 4),
('Roteador TP-Link', 299.90, 5),
('Switch 8 portas', 449.90, 5),
('Adaptador USB', 79.90, 4),
('SSD 480GB', 349.90, 1),
('Memória RAM 16GB', 399.90, 1),
('Impressora HP', 899.90, 1);

INSERT INTO pedidos 
(id_cliente, id_vendedor, data_pedido, valor_total) VALUES
(1, 1, '2026-08-02', 3590.00),
(2, 2, '2026-08-03', 899.90),
(3, 1, '2026-08-05', 549.80),
(4, 3, '2026-08-08', 1499.90),
(1, 2, '2026-08-12', 649.80),
(5, 2, '2026-08-15', 4800.00),
(6, 1, '2026-08-18', 399.90),
(7, 4, '2026-08-20', 749.80),
(8, 3, '2026-09-01', 349.90),
(9, 1, '2026-09-03', 1299.80),
(2, 2, '2026-09-05', 249.90),
(10, 3, '2026-09-06', 899.90);

INSERT INTO itens_pedido
(id_pedido, id_produto, quantidade, preco_unitario) VALUES
(1, 1, 1, 3500.00),
(1, 3, 1, 89.90),
(2, 5, 1, 899.90),
(3, 3, 1, 89.90),
(3, 4, 1, 249.90),
(3, 9, 1, 49.90),
(3, 12, 2, 79.90),
(4, 6, 1, 1499.90),
(5, 7, 1, 299.90),
(5, 8, 1, 349.90),
(6, 2, 1, 4800.00),
(7, 8, 1, 399.90),
(8, 10, 1, 299.90),
(8, 11, 1, 449.90),
(9, 13, 1, 349.90),
(10, 6, 1, 899.90),
(10, 4, 1, 249.90),
(11, 4, 1, 249.90),
(12, 15, 1, 899.90);

-- CONSULTA INICIAL AS TABELAS 
SELECT * FROM clientes;
SELECT * FROM vendedores;
SELECT * FROM categorias;
SELECT * FROM produtos;
SELECT * FROM pedidos;
SELECT * FROM itens_pedido;

-- Desafio 1
select cli.nome as Cliente, 
	cli.cidade as Cidade,
    ped.id_pedido as ID_Pedido,
    ped.valor_total as Valor_Total
from clientes as cli 
join pedidos as ped on cli.id_cliente = ped.id_cliente 
where ped.valor_total > 500 
order by ped.valor_total asc;

-- Desafio 2
select cli.nome as Cliente,
	cli.cidade as Cidade,
    ped.id_pedido as ID_Pedido,
    ped.valor_total as Valor_Total
from clientes as cli 
join pedidos as ped on cli.id_cliente = ped.id_cliente 
where (cli.cidade = 'Barueri' or cli.cidade = 'Osasco') and ped.valor_total > 400 
order by ped.valor_total asc;

-- Desafio 3
select cli.nome as Cliente,
	cli.cidade as Cidade,
	cli.estado as Estado
from clientes as cli
left join pedidos as ped on cli.id_cliente = ped.id_cliente 
where ped.id_pedido is null;

-- Desafio 4
select prod.nome_produto as Produto,
	prod.preco as Preço,
    cat.nome_categoria as Categoria
from produtos as prod 
join categorias as cat on prod.id_categoria = cat.id_categoria 
where cat.nome_categoria = 'Informática';

-- Desafio 5
select cli.nome as Cliente,
	cli.cidade as Cidade_do_Cliente,
	ped.id_pedido as ID_Pedido,
    vend.nome as Vendedor,
    ped.valor_total as Valor_Total
from pedidos as ped
join clientes as cli on ped.id_cliente = cli.id_cliente
join vendedores as vend on vend.id_vendedor = ped.id_vendedor 
where vend.regiao = 'Grande São Paulo';
