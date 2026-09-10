USE DB_T04703_Marcelo_Nascimento;

-- Tarefa 1: Criando a tabela
CREATE TABLE TB_VISITANTES (
	id_visitante int primary key auto_increment,
    nome varchar(150),
    cidade varchar(100),
    idade int,
    dia_visita date
);

-- Tarefa 2: Inserindo registros de visitantes
INSERT INTO TB_VISITANTES(nome, cidade, idade, dia_visita) 
VALUES ('Mariana Alves', 'São Paulo - SP', 28, '2026-08-12'),
	('Gabriel Souza', 'Curitiba - PR', 34, '2026-08-15'),
    ('Beatriz Martins', 'Salvador - BA', 22, '2026-08-18'),
    ('Lucas Ferreira', 'Belo Horizonte - MG', 41, '2026-08-20'),
    ('Camila Rodrigues', 'Recife - PE', 31, '2026-08-22'),
    ('Rafael Oliveira', 'Porto Alegre - RS', 26, '2026-08-25'),
    ('Juliana Costa', 'Fortaleza - CE', 37, '2026-08-28'),
    ('Thiago Mendes', 'Brasília - DF', 45, '2026-08-30'),
    ('Larissa Gomes', 'Manaus - AM', 19, '2026-09-02'),
    ('André Carvalho', 'Florianópolis - SC', 53, '2026-09-05');

-- Tarefa 3: Consultar todos os visitantes
SELECT * FROM TB_VISITANTES;

-- Tarefa 4: Consultar os visitantes de uma cidade específica
SELECT * FROM TB_VISITANTES WHERE cidade = 'São Paulo - SP';

-- Tarefa 5: Atualizar a cidade de um visitante
UPDATE TB_VISITANTES SET cidade = 'São Paulo - SP' WHERE id_visitante = 10;

-- Tarefa 6: Deletar o registro de um visitante pela idade
DELETE FROM TB_VISITANTES WHERE idade = 45;
