USE DB_T04703_Marcelo_Nascimento;

-- Criando a tabela
CREATE TABLE PEDIDOS_23 (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    nome_cliente VARCHAR(100),
    produto VARCHAR(100),
    valor DECIMAL(10,2),
    desconto DECIMAL(10,2),
    forma_pagamento VARCHAR(50)
);

-- Inserindo dados
INSERT INTO PEDIDOS_23 (nome_cliente, produto, valor, desconto, forma_pagamento) VALUES
('Ana Silva', 'Notebook', 3500.00, 200.00, 'Cartão'),
('Bruno Lima', 'Mouse', 80.00, NULL, 'Pix'),
('Carlos Souza', 'Teclado', 150.00, 0.00, 'Boleto'),
('Daniela Rocha', 'Monitor', 1200.00, 100.00, 'Cartão'),
('Eduardo Mendes', 'Headset', 300.00, NULL, 'Pix'),
('Fernanda Alves', 'Cadeira Gamer', 900.00, 50.00, 'Boleto'),
('Gabriel Costa', 'Webcam', 250.00, 0.00, 'Cartão'),
('Helena Martins', 'Notebook', 4000.00, NULL, 'Cartão'),
('Igor Santos', 'Mouse Pad', 40.00, 5.00, 'Pix'),
('Juliana Freitas', 'Monitor', 1100.00, 0.00, 'Boleto');

/****** RESOLUÇÃO ******/
-- Desafio 1
select nome_cliente as Nome,
	produto as Produto,
	valor as Valor,
    if(valor > 1000, 'Alto', 'Baixo') as Categoria_Preço
from PEDIDOS_23;

-- Desafio 2
select nome_cliente as Nome,
	forma_pagamento as Forma_de_Pagamento,
    if(forma_pagamento = 'Pix', 'À vista', 'Parcelado') as Método
from PEDIDOS_23;

-- Desafio 3
select nome_cliente as Nome,
	produto as Produto,
    valor as Valor,
	CASE
		WHEN valor < 100 THEN 'Muito Barato'
		WHEN valor >= 100 and valor < 500 THEN 'Médio'
        WHEN valor >= 500 and valor < 2000 THEN 'Caro'
        ELSE 'Muito Caro'
	END as Situação
from PEDIDOS_23;

-- Desafio 4
ALTER TABLE PEDIDOS_23 
ADD categoria_produto varchar(100);

UPDATE PEDIDOS_23 
	set categoria_produto =
    CASE
		WHEN (produto = 'Notebook' or produto = 'Mouse' or produto = 'Teclado' or produto = 'Webcam') then 'Informática'
		WHEN produto = 'Cadeira Gamer' then 'Móveis'
		ELSE 'Outros'
    END;
    
SELECT produto, categoria_produto 
from PEDIDOS_23;

-- Desafio 5
SELECT nome_cliente as Cliente,
	round(ifnull(desconto, 0)) as Desconto
FROM PEDIDOS_23;
