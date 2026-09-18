USE DB_T04703_Marcelo_Nascimento;

-- ENCONTRO 18 -- DESAFIO - 01
CREATE TABLE departamentos (
    id_departamento INT PRIMARY KEY,
    nome_departamento VARCHAR(100)
);

CREATE TABLE funcionarios (
    id_funcionario INT PRIMARY KEY,
    nome_funcionario VARCHAR(100),
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES departamentos(id_departamento)
);

-- Departamentos
INSERT INTO departamentos (id_departamento, nome_departamento) VALUES
(1, 'Financeiro'),
(2, 'RH'),
(3, 'TI'),
(4, 'Marketing'),
(5, 'Inovação'); -- sem funcionários

-- Funcionários
INSERT INTO funcionarios (id_funcionario, nome_funcionario, id_departamento) VALUES
(1, 'Ana', 1),
(2, 'Bruno', 1),
(3, 'Carlos', 2),
(4, 'Daniela', 3),
(5, 'Eduardo', 3),
(6, 'Fernanda', 4);

-- Select desafio 1
select dep.nome_departamento as Departamento,
    fun.nome_funcionario
from departamentos as dep 
left join funcionarios as fun on dep.id_departamento = fun.id_departamento;

-- DESAFIO 2
-- CRIANDO A TABELA FUNCIONARIOS
CREATE TABLE tb_funcionarios (
    id_funcionario INT PRIMARY KEY,
    nome_funcionario VARCHAR(100),
    salario DECIMAL(10,2)
);

-- CRIANDO A TABELA FAIXA
CREATE TABLE tb_faixa_salarial (
    id_faixa INT PRIMARY KEY,
    nivel VARCHAR(50),
    salario_min DECIMAL(10,2),
    salario_max DECIMAL(10,2)
);


-- Funcionários
INSERT INTO tb_funcionarios (id_funcionario, nome_funcionario, salario) VALUES
(1, 'Ana', 1800.00),
(2, 'Bruno', 2500.00),
(3, 'Carlos', 3200.00),
(4, 'Daniela', 4500.00),
(5, 'Eduardo', 5200.00),
(6, 'Fernanda', 7000.00);

-- Faixas salariais
INSERT INTO tb_faixa_salarial (id_faixa, nivel, salario_min, salario_max) VALUES
(1, 'Junior', 0, 2000),
(2, 'Pleno', 2001, 5000),
(3, 'Senior', 5001, 99999);

-- Select desafio 2
select fun.id_funcionario as ID_Funcionário,
	fun.nome_funcionario as Funcionário,
    fun.salario as Salário,
    fai.nivel as Nível
from tb_funcionarios as fun
join tb_faixa_salarial as fai on fun.salario 
between fai.salario_min and fai.salario_max
ORDER BY salario asc;

-- DESAFIO 3
-- ELIMANDO TABELAS CASO JA EXISTAM
DROP TABLE IF EXISTS tb_departamentos;
DROP TABLE IF EXISTS tb_funcionarios;
DROP TABLE IF EXISTS tb_faixa_salarial;

-- CRIANDO A TABELA DEPART
CREATE TABLE tb_departamentos (
    id_departamento INT PRIMARY KEY,
    nome_departamento VARCHAR(100)
);

-- CRIANDO A TABELA FUNCIONARIO
CREATE TABLE tb_funcionarios (
    id_funcionario INT PRIMARY KEY,
    nome_funcionario VARCHAR(100),
    salario DECIMAL(10,2),
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES tb_departamentos(id_departamento)
);

-- CRIANDO A TABELA FAIXA SALARIAL
CREATE TABLE tb_faixa_salarial (
    id_faixa INT PRIMARY KEY,
    nivel VARCHAR(50),
    salario_min DECIMAL(10,2),
    salario_max DECIMAL(10,2)
);

-- Departamentos
INSERT INTO tb_departamentos (id_departamento, nome_departamento) VALUES
(1, 'Financeiro'),
(2, 'RH'),
(3, 'TI'),
(4, 'Vendas'),
(5, 'Inovação');

-- Funcionários
INSERT INTO tb_funcionarios (id_funcionario, nome_funcionario, salario, id_departamento) VALUES
(1, 'Ana', 1800.00, 1),
(2, 'Bruno', 2500.00, 4), -- Vendas (Pleno)
(3, 'Carlos', 3200.00, 2),
(4, 'Daniela', 4500.00, 4), -- Vendas (Pleno)
(5, 'Eduardo', 5200.00, 3),
(6, 'Fernanda', 7000.00, 4);

-- Faixas salariais
INSERT INTO tb_faixa_salarial (id_faixa, nivel, salario_min, salario_max) VALUES
(1, 'Junior', 0, 2000),
(2, 'Pleno', 2001, 5000),
(3, 'Senior', 5001, 99999); 

-- Select desafio 03
Select fun.nome_funcionario as Funcionário,
	fun.salario as Salário,
	dep.nome_departamento as Departamento,
    fai.nivel as Nível
from tb_funcionarios as fun
join tb_departamentos as dep on fun.id_departamento = dep.id_departamento
join tb_faixa_salarial as fai on fun.salario 
between fai.salario_min and fai.salario_max
WHERE dep.nome_departamento = 'Vendas' and fai.nivel = 'Pleno';
