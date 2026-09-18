-- Select desafio 1
select dep.nome_departamento as Departamento,
    fun.nome_funcionario
from departamentos as dep 
left join funcionarios as fun on dep.id_departamento = fun.id_departamento;

-- Select desafio 2
select fun.id_funcionario as ID_Funcionário,
	fun.nome_funcionario as Funcionário,
    fun.salario as Salário,
    fai.nivel as Nível
from tb_funcionarios as fun
join tb_faixa_salarial as fai on fun.salario 
between fai.salario_min and fai.salario_max
ORDER BY salario asc;

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
