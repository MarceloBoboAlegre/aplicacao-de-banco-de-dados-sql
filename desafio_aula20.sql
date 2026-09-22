CREATE TABLE PedidosKarrot ( 
     id INT AUTO_INCREMENT PRIMARY KEY, 
     cliente VARCHAR(50), 
     produto VARCHAR(50), 
     data_pedido DATE, 
     hora_pedido TIME,  
     preco DECIMAL(6,2),
     observacao VARCHAR(100) 
);
 
INSERT INTO PedidosKarrot (cliente, produto, data_pedido, hora_pedido, preco, observacao) VALUES
('Ana Paula', 'Café Expresso', '2025-07-19', '08:10:00', 6.50, 'Com açúcar'),
('Bruno Costa', 'Cappuccino', '2025-07-19', '08:35:00', 8.00, 'Leite vegetal'),
('Carla Dias', 'Latte', '2025-07-19', '09:05:00', 7.50, 'Sem espuma'),
('Daniela Souza', 'Croissant', '2025-07-18', '10:15:00', 5.00, 'Com queijo'),
('Eduardo Lima', 'Chá Gelado', '2025-07-18', '11:20:00', 6.00, 'Com limão'),
('Fernanda Alves', 'Café Expresso', '2025-07-17', '14:30:00', 6.50, 'Sem açúcar'),
('Gabriel Silva', 'Pão de Queijo', '2025-07-16', '08:50:00', 4.00, 'Quentinho'),
('Heloísa Martins', 'Café Expresso', '2025-07-15', '07:45:00', 6.50, 'Com leite'),
('Igor Monteiro', 'Latte', '2025-07-14', '09:20:00', 7.50, 'Espuma extra'),
('Juliana Mendes', 'Cappuccino', '2025-07-14', '10:50:00', 8.00, 'Com canela'),
('Karen Rocha', 'Café Gelado', '2025-07-13', '16:00:00', 6.00, 'Com caramelo'),
('Lucas Prado', 'Chá Verde', '2025-07-13', '17:25:00', 6.00, 'Bem quente'),
('Mariana Borges', 'Pão de Queijo', '2025-07-13', '08:15:00', 4.00, 'Sem sal'),
('Nicolas Duarte', 'Croissant', '2025-07-12', '12:45:00', 5.00, 'Simples'),
('Olívia Ribeiro', 'Cappuccino', '2025-07-12', '13:00:00', 8.00, 'Com leite'),
('Paulo Vitor', 'Café Expresso', '2025-07-11', '08:05:00', 6.50, 'Forte'),
('Quésia Freitas', 'Latte', '2025-07-10', '11:40:00', 7.50, 'Com baunilha'),
('Rodrigo Lopes', 'Chá Gelado', '2025-07-10', '12:10:00', 6.00, 'Com hortelã'),
('Sara Oliveira', 'Café Expresso', '2025-07-10', '09:55:00', 6.50, 'Duplo'),
('Thiago Nunes', 'Cappuccino', '2025-07-10', '10:15:00', 8.00, 'Meio amargo');

-- EX 1 > Mostrar quantos pedidos foram feitos por data do pedido.
select data_pedido as Data_Pedido, 
	count(data_pedido) as Pedidos_Feitos 
from PedidosKarrot group by data_pedido order by data_pedido asc;

-- EX 2 > Mostrar a soma por produto dos pedidos que contêm a palavra leite na observação.
select produto as Produto, 
	sum(preco) as Valor 
from PedidosKarrot where observacao like '%leite%' 
group by produto;

-- EX 3 > Mostre a média de preços dos pedidos feitos no turno da manhã (antes de 12h), agrupado por produto
select produto as Produto,
	round(avg(preco), 2) as Media_Preço
from PedidosKarrot 
where hora_pedido < '12:00:00' 
group by produto order by Media_Preço desc;

-- EX 4 > Mostrar qual foi o menor e o maior valor cobrado para cada produto dos clientes, cujo o sobrenome termine com a letra "a"
select cliente as Cliente,
	min(preco) as Menor_Valor,
    max(preco) as Maior_Valor
from PedidosKarrot 
where cliente like '%a' 
group by cliente;

-- EX 5 > Quais produtos tiveram mais de 3 pedidos? (Use HAVING após o GROUP BY)
select produto as Produto, 
	count(produto) AS Quantidade 
from PedidosKarrot 
group by produto having Quantidade > 3;
