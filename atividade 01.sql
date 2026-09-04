USE DB_T04703_Marcelo_Nascimento;

-- Atividade
CREATE TABLE TB_FORNECEDORES (
	id_fornecedor int primary key auto_increment,
    nome_fornecedor varchar(100),
    telefone_fornecedor varchar(20)
    );
    
INSERT INTO TB_FORNECEDORES (nome_fornecedor, telefone_fornecedor) 
VALUES ('Bing Bong', '(12) 91215,3457'),
	('Boa e Racha', '(11) 93234-4159'),
    ('Manuel Gomes', '(11) 99871-2515');

SELECT * FROM TB_FORNECEDORES;
    
CREATE TABLE TB_PRODUTOS (
	id_produto int primary key auto_increment,
    nome_produto varchar(100) not null,
    quantidade int not null,
    id_fornecedor int not null,
    FOREIGN KEY (id_fornecedor) REFERENCES TB_FORNECEDORES(id_fornecedor)
);

INSERT INTO TB_PRODUTOS (nome_produto, quantidade, id_fornecedor) 
VALUES ('Caderno capa dura - Surfista', 30, 1),
	('Caneta azul', 120, 3),
    ('Borracha com cheiro de morango', 52, 2);

SELECT * FROM TB_PRODUTOS;

CREATE TABLE TB_VENDAS (
	id_venda int auto_increment primary key,
    id_produto int not null,
    data_venda date not null,
    FOREIGN KEY (id_produto) REFERENCES TB_PRODUTOS(id_produto)
);

INSERT INTO TB_VENDAS (id_produto, data_venda) 
VALUES (1, '2026-02-20'),
	(2, '2026-02-18'),
    (3, '2026-03-01');

SELECT * FROM TB_VENDAS;
