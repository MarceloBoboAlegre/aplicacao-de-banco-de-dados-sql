USE DB_T04703_Marcelo_Nascimento;

-- ELIMINAR TABELA CASO EXISTAM
DROP TABLE IF EXISTS TB_CLIENTES;
DROP TABLE IF EXISTS TB_PEDIDOS;
DROP TABLE IF EXISTS TB_VENDAS;
DROP TABLE IF EXISTS TB_PRODUTOS;

-- CRIAR TABELAS PARA ANALISE
-- CLIENTES
CREATE TABLE TB_CLIENTES (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(100),
    cidade VARCHAR(100)
);

-- PEDIDOS
CREATE TABLE TB_PEDIDOS (
    id_pedido INT PRIMARY KEY,
    id_cliente INT,
    valor_total DECIMAL(10,2)
);

-- PRODUTOS
CREATE TABLE TB_PRODUTOS (
    id_produto INT PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(10,2)
);

-- INSERIR REGISTROS NAS TABELAS
-- CLIENTES
INSERT INTO TB_CLIENTES VALUES
(1, 'Ana Silva', 'São Paulo'),
(2, 'Bruno Souza', 'Rio de Janeiro'),
(3, 'Carla Mendes', 'Curitiba'),
(4, 'Daniel Rocha', 'São Paulo'),
(5, 'Eduardo Lima', 'Belo Horizonte'),
(6, 'Fernanda Alves', 'Salvador'),
(7, 'Gustavo Pereira', 'Fortaleza'),
(8, 'Helena Costa', 'São Paulo'),
(9, 'Igor Martins', 'Curitiba'),
(10, 'Juliana Ramos', 'Recife'),
(11, 'Kleber Dias', 'Porto Alegre'),
(12, 'Larissa Gomes', 'São Paulo'),
(13, 'Marcos Vinicius', 'Rio de Janeiro'),
(14, 'Natalia Teixeira', 'Brasília'),
(15, 'Otavio Barros', 'São Paulo'),
(16, 'Patricia Freitas', 'Salvador'),
(17, 'Rafael Nogueira', 'Curitiba'),
(18, 'Sabrina Cardoso', 'Fortaleza'),
(19, 'Tiago Ribeiro', 'São Paulo'),
(20, 'Vanessa Duarte', 'Belo Horizonte');

-- PRODUTOS
INSERT INTO TB_PRODUTOS VALUES
(1, 'Mouse Gamer RGB', 120.00),
(2, 'Teclado Mecânico', 250.00),
(3, 'Headset Gamer', 300.00),
(4, 'Mousepad Grande', 80.00),
(5, 'Webcam Full HD', 200.00),
(6, 'Hub USB 4 Portas', 60.00),
(7, 'Suporte para Notebook', 90.00),
(8, 'Cooler para Notebook', 110.00),
(9, 'Cabo HDMI', 40.00),
(10, 'Adaptador USB-C', 70.00),
(11, 'Pen Drive 64GB', 55.00),
(12, 'HD Externo 1TB', 350.00),
(13, 'SSD 480GB', 280.00),
(14, 'Carregador Universal', 150.00),
(15, 'Base para Monitor', 130.00),
(16, 'Filtro de Linha', 75.00),
(17, 'Switch de Rede', 220.00),
(18, 'Roteador Wi-Fi', 300.00),
(19, 'Cabo de Rede', 25.00),
(20, 'Organizador de Cabos', 30.00);

-- PEDIDOS
INSERT INTO TB_PEDIDOS VALUES
(1, 1, 120.00),
(2, 2, 500.00),
(3, 3, 80.00),
(4, 4, 350.00),
(5, 5, 200.00),
(6, 6, 150.00),
(7, 7, 90.00),
(8, 8, 300.00),
(9, 9, 60.00),
(10, 10, 110.00),
(11, 11, 75.00),
(12, 12, 250.00),
(13, 13, 400.00),
(14, 14, 55.00),
(15, 15, 280.00),
(16, 16, 130.00),
(17, 17, 220.00),
(18, 18, 300.00),
(19, 19, 40.00),
(20, 20, 30.00);

CREATE TABLE TB_PEDIDOS_CLIENTE AS
SELECT id_pedido, nome as cliente, valor_total 
FROM TB_PEDIDOS AS P
INNER JOIN TB_CLIENTES AS C
ON P.id_cliente = C.id_cliente;

SELECT * FROM TB_PEDIDOS_CLIENTE;

-- --------------------------------------------------------------------------------------------------------
CREATE TABLE PRODUTOS ( 
 id INT AUTO_INCREMENT PRIMARY KEY, 
  nome VARCHAR(50),
  estoque INT 
); 

CREATE TABLE VENDAS ( 
 id INT AUTO_INCREMENT PRIMARY KEY, 
 produto_id INT, 
 quantidade INT, 
 FOREIGN KEY (produto_id) REFERENCES PRODUTOS(id) 
);

INSERT INTO PRODUTOS (nome, estoque) 
VALUES ('Pão Francês', 100), 
	('Bolo de Chocolate', 20), 
	('Sonho com creme', 15);

SELECT * FROM PRODUTOS;

-- Transaction
START TRANSACTION;

INSERT INTO VENDAS (produto_id, quantidade) 
VALUES (1, 2);

UPDATE PRODUTOS SET estoque = 0 WHERE id = 2;

SAVEPOINT savepoint_1;

INSERT INTO VENDAS (produto_id, quantidade) VALUES (2, 1);

ROLLBACK TO savepoint_1;

COMMIT;

SELECT * FROM VENDAS;
SELECT * FROM PRODUTOS;
