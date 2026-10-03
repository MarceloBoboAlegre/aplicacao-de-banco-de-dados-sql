-- Acessando BD
USE DB_T04703_Marcelo_Nascimento;

-- Criando tabela clientes
CREATE TABLE TB_CLIENTES_PBI (
	id_cliente int,
    nome varchar(150),
    email varchar(150),
    cidade varchar(150),
    estado char(2)
);

-- Criando tabela produtos
CREATE TABLE TB_PRODUTOS_PBI (
	id_produto int, 
    nome varchar(150), 
    categoria varchar(50), 
    preco decimal(10, 2)
);

-- Criando tabela vendas
CREATE TABLE TB_VENDAS_PBI (
	id_venda int,
    data_venda date,
    id_cliente int,
    id_produto int,
    quantidade int,
    preco_unitario decimal(10, 2),
    valor_total decimal(10, 2)
);

-- Inserindo registros através do load_data
LOAD DATA LOCAL INFILE 'C:/Users/PC/Documents/estudos/fat/banco de dados/Base_Clientes.csv' 
INTO TABLE TB_CLIENTES_PBI 
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/PC/Documents/estudos/fat/banco de dados/Base_Produtos.csv' 
INTO TABLE TB_PRODUTOS_PBI 
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/PC/Documents/estudos/fat/banco de dados/Base_Vendas.csv' 
INTO TABLE TB_VENDAS_PBI 
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS 
(
id_venda,
@data_venda,
id_cliente,
id_produto,
quantidade,
preco_unitario,
valor_total
)
SET data_venda = STR_TO_DATE(@data_venda, '%d/%m/%Y');

SELECT * FROM TB_VENDAS_PBI;
