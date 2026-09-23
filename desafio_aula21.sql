USE DB_T04703_Marcelo_Nascimento;

CREATE TABLE clientes_21 (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(100),
    cidade VARCHAR(50)
);

CREATE TABLE pedidos_21 (
    id_pedido INT PRIMARY KEY,
    id_cliente INT,
    valor DECIMAL(10,2),
    status VARCHAR(20),
    FOREIGN KEY (id_cliente) REFERENCES clientes_21(id_cliente)
);
 
INSERT INTO clientes_21 (id_cliente, nome, cidade) VALUES
(1, 'Carlos Silva', 'Barueri'),
(2, 'Ana Souza', 'Osasco'),
(3, 'Marcos Oliveira', 'Barueri'),
(4, 'Juliana Santos', 'São Paulo'),
(5, 'Rafael Costa', 'Osasco'),
(6, 'Fernanda Lima', 'Barueri'),
(7, 'Bruno Almeida', 'Jandira'),
(8, 'Camila Rocha', 'São Paulo');

 INSERT INTO pedidos_21 (id_pedido, id_cliente, valor, status) VALUES
(101, 1, 150.00, 'Concluído'),
(102, 1, 280.00, 'Concluído'),
(103, 1, 120.00, 'Cancelado'),
(104, 2, 350.00, 'Concluído'),
(105, 2, 180.00, 'Concluído'),
(106, 3, 500.00, 'Concluído'),
(107, 3, 220.00, 'Concluído'),
(108, 3, 100.00, 'Concluído'),
(109, 4, 750.00, 'Concluído'),
(110, 5, 90.00, 'Cancelado'),
(111, 5, 450.00, 'Concluído'),
(112, 5, 300.00, 'Concluído'),
(113, 6, 200.00, 'Concluído'),
(114, 6, 350.00, 'Concluído'),
(115, 7, 1000.00, 'Concluído'),
(116, 7, 150.00, 'Concluído'),
(117, 8, 80.00, 'Concluído'),
(118, 8, 120.00, 'Concluído'),
(119, 8, 200.00, 'Concluído');

-- Desafio 1: Quantidade de pedidos por cliente. Mostre o nome de cada cliente e a quantidade de pedidos realizados.
select cli.nome as Cliente,
	count(ped.id_pedido) as Qtde_Pedidos
from clientes_21 as cli
join pedidos_21 as ped on cli.id_cliente = ped.id_cliente 
group by cli.id_cliente order by Qtde_Pedidos desc;

-- Desafio 2: Total comprado por cliente. Mostre o nome do cliente e o valor total de seus pedidos
select cli.nome as Cliente,
	sum(ped.valor) as Valor_Pedidos
from clientes_21 as cli
join pedidos_21 as ped on cli.id_cliente = ped.id_cliente 
group by cli.id_cliente order by Valor_Pedidos desc;

-- Desafio 3: Média de pedidos por cliente. Mostre: nome do cliente, quantidade de pedidos, valor médio dos pedidos. Utilize count() e avg()
select cli.nome as Cliente,
	count(ped.id_pedido) as Qtde_Pedidos,
    round(avg(ped.valor), 2) as Valor_Médio
from clientes_21 as cli
join pedidos_21 as ped on cli.id_cliente = ped.id_cliente 
group by cli.id_cliente order by Qtde_Pedidos desc;

-- Desafio 4: Clientes que gastaram mais de R$700. Mostre o nome dos clientes cujo total de pedidos seja superior a R$700.
select cli.nome as Cliente,
	sum(ped.valor) as Valor_Pedidos
from clientes_21 as cli
join pedidos_21 as ped on cli.id_cliente = ped.id_cliente 
group by cli.id_cliente having Valor_Pedidos > 700
order by Valor_Pedidos desc;

-- Desafio 5: Total de pedidos por cidade. Mostre: cidade, quantidade de pedidos, valor dos pedidos.
select cli.cidade as Cidade,
	count(ped.id_pedido) as Qtde_Pedidos,
    sum(ped.valor) as Valor_Pedidos
from clientes_21 as cli
join pedidos_21 as ped on cli.id_cliente = ped.id_cliente 
group by cli.cidade order by Qtde_Pedidos desc;

-- Desafio 6: Clientes com mais de R$500 em pedidos concluídos. Mostre os clientes cujo total de pedidos concluídos e que seja superior a R$500
select cli.nome as Cliente,
	sum(ped.valor) as Valor_Pedidos
from clientes_21 as cli 
join pedidos_21 as ped on cli.id_cliente = ped.id_cliente 
where ped.status = 'Concluído' 
group by cli.id_cliente order by Valor_Pedidos desc;
