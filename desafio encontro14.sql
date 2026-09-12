-- Desafio encontro 14
USE DB_T04703_Marcelo_Nascimento;

-- Criando a tabela do desafio
CREATE TABLE PRODUTOS_DESAFIO (
	id_produto int primary key auto_increment,
    nome varchar(100),
    preco decimal(10, 2),
    estoque int
);

-- Inserindo dados na tabela
INSERT INTO PRODUTOS_DESAFIO (nome, preco, estoque) 
VALUES ('Pão francês', 1.52, 180),
('Pão de leite', 2.55, 65),
('Pão de hambúrguer', 2.59, 48),
('Pão de hambúrguer com gergelim', 2.79, 42),
('Pão de hot dog', 2.59, 55),
('Baguete', 5.98, 24),
('Baguete parmesão', 7.98, 18),
('Baguete com gergelim', 7.18, 21),
('Baguete de frango com Catupiry', 9.98, 12),
('Pão de milho', 5.98, 17),
('Pão de queijo gourmet', 4.79, 36),
('Chipa', 4.39, 30),
('Croissant de queijo', 5.99, 15),
('Croissant francês', 9.99, 35),
('Croissant de calabresa', 13.40, 11),
('Sonho de creme', 5.99, 22),
('Rabanada', 10.90, 14),
('Brioche simples', 29.90, 8),
('Brioche de goiaba', 68.90, 6),
('Bolo de cenoura com chocolate', 22.45, 9),
('Bolo de churros', 22.45, 7),
('Bolo de coco', 27.90, 10),
('Bolo mesclado', 27.90, 8),
('Bolo de leite', 22.90, 6),
('Broa de goiabada', 7.90, 19),
('Broa de avelã', 9.90, 13),
('Ciabatta', 14.90, 16),
('Torrada doce', 7.90, 20),
('Pão francês integral', 2.40, 45),
('Pão de pizza de presunto e mussarela', 7.48, 14);

SELECT * FROM PRODUTOS_DESAFIO;

-- Pergunta 1: Quais produtos têm acima de R$5,00
SELECT * FROM PRODUTOS_DESAFIO WHERE preco > 5.00;

-- Pergunta 2: Quais produtos possuem a palavra "Bolo" no nome?
SELECT * FROM PRODUTOS_DESAFIO WHERE nome like '%bolo%';

-- Pergunta 3: Quais produtos têm menos de 20 unidades no estoque?
SELECT * FROM PRODUTOS_DESAFIO WHERE estoque < 20;

-- Pergunta 4: Quais produtos custam entre R$3,00 e R$10,00?
SELECT * FROM PRODUTOS_DESAFIO WHERE preco >= 3.00 and preco <= 10.00;

-- Pergunta 5: Quais produtos têm nome que começa com "Pão"?
SELECT * FROM PRODUTOS_DESAFIO WHERE nome like 'Pão%';

-- Pergunta 6: Qual é o comando para encontrar produtos com nome "Croissant" e que tenham mais de 30 unidades no estoque?
SELECT * FROM PRODUTOS_DESAFIO WHERE nome like '%Croissant%' and estoque > 30;

-- -----------------------------------------------------------------------------------------------
-- Missão encontro 14 (2)
CREATE TABLE CLIENTES ( 
            id INT PRIMARY KEY AUTO_INCREMENT, 
            nome VARCHAR(50), 
            cidade VARCHAR(50), 
            idade INT, 
            ativo BOOLEAN 
); 

CREATE TABLE PRODUTOS ( 
          id INT PRIMARY KEY AUTO_INCREMENT, 
          nome VARCHAR(100), 
          categoria VARCHAR(50), 
          preco DECIMAL(10,2) 
);
 
INSERT INTO CLIENTES (nome, cidade, idade, ativo) 
VALUES ('João', 'São Paulo', 25, 1), 
               ('Maria', 'Santos', 30, 1), 
               ('Bruno', 'Campinas', 19, 0), 
               ('Ana', 'São Paulo', 40, 1), 
               ('Carla', 'Campinas', 25, 0), 
               ('Marcos', 'São Bernardo', 33, 1),
               ('Fernanda', 'Santos', 22, 1); 

INSERT INTO PRODUTOS (nome, categoria, preco) 
VALUES ('Fone Bluetooth', 'Eletrônicos', 120.00), 
               ('Mouse Gamer', 'Informática', 80.00),
               ('Capa Celular', 'Acessórios', 30.00), 
               ('Notebook', 'Eletrônicos', 2500.00),
               ('Teclado', 'Informática', 150.00),
               ('Carregador Turbo', 'Acessórios', 60.00), 
               ('Suporte de Celular', 'Acessórios', 25.00); 

-- Missão 1: Liste todos os produtos com preço maior que 100 reais
SELECT * FROM PRODUTOS WHERE preco > 100 ORDER BY preco ASC; 

-- Missão 2: Liste os clientes que moram em São Paulo ou Campinas, com idade maior que 25 anos
SELECT * FROM CLIENTES WHERE (cidade = 'São Paulo' OR cidade = 'Campinas') AND idade > 25;

-- Missão 3: Liste os produtos que pertencem às categorias 'Acessórios' ou 'Informática'
SELECT * FROM PRODUTOS WHERE categoria = 'Acessórios' OR categoria =  'Informática';


