USE DB_T04703_Marcelo_Nascimento;

-- Encontro 11
-- Criando a tabela produtos
CREATE TABLE TB_PADARIA_PRODUTOS (
	codigo_produto int primary key auto_increment,
    nome varchar(100),
    preco float
);

-- Inserindo dados na tabela produtos
INSERT INTO TB_PADARIA_PRODUTOS (nome, preco) 
VALUES ('Sonho', 6.50),
	('Pão Francês', 1.50),
    ('Café Preto', 0.99),
    ('Coxinha', 3.20),
    ('Brigadeiro', 2.00),
    ('Croissant', 2.40);

-- Atualizando os registros
UPDATE TB_PADARIA_PRODUTOS SET preco = 6.70 WHERE codigo_produto = 1;
UPDATE TB_PADARIA_PRODUTOS SET preco = 1.80 WHERE codigo_produto = 5;

-- Excluindo um desses registros
DELETE FROM TB_PADARIA_PRODUTOS WHERE codigo_produto = 6;

-- Consultando a tabela
SELECT * FROM TB_PADARIA_PRODUTOS;
