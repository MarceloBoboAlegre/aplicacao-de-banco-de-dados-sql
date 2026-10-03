USE DB_T04703_Marcelo_Nascimento;

create table PRODUTOS_PADARIA (
	nome varchar(100),
    preco decimal (8, 2)
);

INSERT INTO PRODUTOS_PADARIA (nome, preco) VALUES ('Pão Francês (kg)', 14.90);
INSERT INTO PRODUTOS_PADARIA (nome, preco) VALUES ('Pão de Queijo', 3.50);
INSERT INTO PRODUTOS_PADARIA (nome, preco) VALUES ('Croissant de Presunto e Queijo', 8.50);
INSERT INTO PRODUTOS_PADARIA (nome, preco) VALUES ('Bolo de Cenoura com Chocolate', 22.00);
INSERT INTO PRODUTOS_PADARIA (nome, preco) VALUES ('Sonho de Doce de Leite', 6.00);
INSERT INTO PRODUTOS_PADARIA (nome, preco) VALUES ('Pão de Batata com Requeijão', 5.50);
INSERT INTO PRODUTOS_PADARIA (nome, preco) VALUES ('Baguete Recheada', 12.00);
INSERT INTO PRODUTOS_PADARIA (nome, preco) VALUES ('Broa de Milho', 4.00);
INSERT INTO PRODUTOS_PADARIA (nome, preco) VALUES ('Torta de Frango (fatia)', 9.50);
INSERT INTO PRODUTOS_PADARIA (nome, preco) VALUES ('Café Coado (copo)', 3.00);

-- 1
select upper(nome) as Nome_Maiúsculo
from PRODUTOS_PADARIA;

-- 2
select lower(nome) as Nome_Minúsculo
from PRODUTOS_PADARIA;

-- 3
select character_length(nome) as Caracteres_Produto
from PRODUTOS_PADARIA;

-- 4
select left(nome, 3) as Primeiras_3_Letras
from PRODUTOS_PADARIA;

-- 5
select round(preco) as Preço_Arredondado 
from PRODUTOS_PADARIA;

-- 6
select nome as Produto, 
	preco as Preço,
--  now() as Data_Hora,
    curdate() as Data_Atual
from PRODUTOS_PADARIA;
