USE DB_T04703_Marcelo_Nascimento;

CREATE TABLE pedidos_lanchonete (
  id INT PRIMARY KEY,
  cliente VARCHAR(50),
  produto VARCHAR(50),
  valor DECIMAL(5,2),
  data_pedido DATE
);
 
INSERT INTO pedidos_lanchonete (id, cliente, produto, valor, data_pedido) VALUES
(1, 'Ana', 'Hamburguer', 12.50, '2025-07-10'),
(2, 'Lucas', 'Coxinha', 5.00, '2025-07-10'),
(3, 'Beatriz', 'Suco', 4.00, '2025-07-10'),
(4, 'Carlos', 'Hamburguer', 12.50, '2025-07-10'),
(5, 'Ana', 'Refrigerante', 6.00, '2025-07-11'),
(6, 'Lucas', 'Hamburguer', 12.50, '2025-07-11'),
(7, 'Beatriz', 'Refrigerante', 6.00, '2025-07-11'),
(8, 'Carlos', 'Coxinha', 5.00, '2025-07-11'),
(9, 'Ana', 'Coxinha', 5.00, '2025-07-12'),
(10, 'Lucas', 'Suco', 4.00, '2025-07-12'),
(11, 'Beatriz', 'Hamburguer', 12.50, '2025-07-12'),
(12, 'Carlos', 'Refrigerante', 6.00, '2025-07-12'),
(13, 'Ana', 'Hamburguer', 12.50, '2025-07-13'),
(14, 'Lucas', 'Coxinha', 5.00, '2025-07-13'),
(15, 'Beatriz', 'Coxinha', 5.00, '2025-07-13'),
(16, 'Carlos', 'Suco', 4.00, '2025-07-13'),
(17, 'Ana', 'Suco', 4.00, '2025-07-14'),
(18, 'Lucas', 'Refrigerante', 6.00, '2025-07-14'),
(19, 'Beatriz', 'Suco', 4.00, '2025-07-14'),
(20, 'Carlos', 'Hamburguer', 12.50, '2025-07-14'),
(21, 'Ana', 'Coxinha', 5.00, '2025-07-15'),
(22, 'Lucas', 'Hamburguer', 12.50, '2025-07-15'),
(23, 'Beatriz', 'Refrigerante', 6.00, '2025-07-15'),
(24, 'Carlos', 'Coxinha', 5.00, '2025-07-15'),
(25, 'Ana', 'Hamburguer', 12.50, '2025-07-16'),
(26, 'Lucas', 'Coxinha', 5.00, '2025-07-16'),
(27, 'Beatriz', 'Hamburguer', 12.50, '2025-07-16'),
(28, 'Carlos', 'Suco', 4.00, '2025-07-16'),
(29, 'Lucas', 'Suco', 4.00, '2025-07-17'),
(30, 'Beatriz', 'Coxinha', 5.00, '2025-07-17');

select * from pedidos_lanchonete;

-- COUNT()
-- Quantidade de venda por produto
select produto as Produto, 
	count(produto) as Quantidade 
from pedidos_lanchonete group by produto;

-- Clientes que mais compraram E o que compraram
select cliente as Cliente, 
	produto as Produto,
	count(cliente) as Qtde_Comprada 
from pedidos_lanchonete group by cliente, produto order by cliente asc, Qtde_Comprada desc;

-- SUM()
-- Total geral de vendas (Faturamento)
select produto as Produto, 
	sum(valor) as Faturamento 
from pedidos_lanchonete group by produto order by Faturamento desc;

-- Faturamento por data
select data_pedido as Data_Pedido,
	sum(valor) as Valor_Total
from pedidos_lanchonete group by data_pedido;

-- AVG()
-- Ticket Médio
select round(avg(valor), 2) as Ticket_Médio
from pedidos_lanchonete;

-- Ticket Médio por cliente
select cliente as Cliente, 
	round(avg(valor), 2) as Ticket_Médio
from pedidos_lanchonete group by cliente order by Ticket_Médio desc;

-- MAX() - Busca o maior valor
-- Data do último pedido vendido
select max(data_pedido) as Data_Ultimo_Pedido from pedidos_lanchonete;

-- Data do último pedido por cliente
select cliente as Cliente, 
	max(data_pedido) as Data_Ultimo_Pedido 
from pedidos_lanchonete group by cliente order by 2 asc;

-- MIN() - Busca o menor valor
-- Data da primeira venda
select min(data_pedido) as Data_Primeiro_Pedido from pedidos_lanchonete;

-- Data da primeira venda por produto
select produto as Produto, 
	min(data_pedido) as Data_Primeiro_Pedido 
from pedidos_lanchonete group by produto order by 2 asc;

-- HAVING (WHERE do GROUP BY)
select produto as Produto, 
	count(produto) as Quantidade 
from pedidos_lanchonete group by produto having Quantidade > 6;

