CREATE TABLE FUNCIONARIOS_22 (
    id INT,
    nome VARCHAR(50),
    sobrenome VARCHAR(50),
    nome_completo VARCHAR(100),
    cargo VARCHAR(50),
    salario DECIMAL(10,2),
    data_admissao DATE,
    email VARCHAR(100)
);

CREATE TABLE VENDAS_22 (
    id INT,
    id_funcionario INT,
    data_venda DATE,
    valor DECIMAL(10,2),
    quantidade INT,
    observacao VARCHAR(100)
);

INSERT INTO FUNCIONARIOS_22 VALUES
(1, ' Ana ', 'Silva', NULL, 'Analista', 3000.00, '2023-01-10', 'ana.silva@empresa.com'),
(2, 'Bruno', 'Souza', NULL, 'Gerente', 8000.00, '2020-06-20', NULL),
(3, 'Carlos', ' Pereira ', NULL, 'Analista', 3200.00, '2022-03-15', 'carlos.pereira@empresa.com'),
(4, 'Daniela', 'Costa', NULL, 'Diretora', 15000.00, '2018-11-01', NULL),
(5, 'Eduardo', 'Almeida', NULL, 'Estagiário', 1500.00, '2025-01-05', 'eduardo.almeida@empresa.com');

INSERT INTO VENDAS_22 VALUES
(1, 1, '2025-04-01', 100.00, 2, ' venda normal '),
(2, 2, '2025-04-10', 500.00, 5, 'Venda urgente'),
(3, 2, '2025-04-15', 200.00, 0, 'erro quantidade'),
(4, 3, '2025-03-20', 50.00, 1, NULL),
(5, 4, '2025-02-10', 1000.00, 10, '  desconto aplicado  '),
(6, 5, '2025-04-18', 80.00, 1, 'nova venda');

SELECT * FROM FUNCIONARIOS_22;
SELECT * FROM VENDAS_22;

/****** FUNÇÕES TEXTO ******/
-- UPPER(string) - Maiuscula
select upper('mysql') as SGDB;

-- LOWER(string) - Minuscula
select lower('MYSQL') as SGDB;

-- LENGTH(string) - Quantidade de caracteres
select length('mysql') as SGDB;

-- CONCAT(string, ' ', string) - CONCATENAR (+ Trim)
select nome as Nome, sobrenome as Sobrenome, 
	concat(trim(nome), ' ', trim(sobrenome)) as Nome_Completo
from FUNCIONARIOS_22;

-- TRIM(string) - ELIMINA ESPAÇOS EM BRANCO
select trim(nome) as Nome, trim(sobrenome) as Sobrenome
from FUNCIONARIOS_22;

-- Atualizando a informação na coluna nome_completo da tabela
update FUNCIONARIOS_22 
set nome_completo = concat(trim(nome), ' ', trim(sobrenome)) 
where 1 = 1;

-- LEFT(STRING, quantidade de caracteres) 
select left('mysql', 3) as SGDB;

-- RIGHT(STRING, quantidade de caracteres) 
select right('mysql', 3) as SGDB;

-- SUBSTRING(coluna, caracter inicial, quantidade de caracteres) - parte do texto
select cargo as Cargo, 
	substring(cargo, 4, 2) as Resultado
from FUNCIONARIOS_22;

-- REPLACE (coluna, o que será substituído, o que substituirá) 
select id, id_funcionario, quantidade, 
	observacao as Observação_Atual,
	trim(replace(lower(observacao), 'venda', 'pedido')) as Observação_Ajustada
from VENDAS_22;
