USE DB_T04703_Marcelo_Nascimento;

-- ALUNO, PROFESSOR E COMENTÁRIO
CREATE TABLE TB_ALUNO (
	id_aluno int primary key auto_increment,
    nome varchar(50),
    sobrenome varchar(50),
    curso varchar(100)
);

CREATE TABLE TB_PROFESSOR (
	id_professor int primary key auto_increment,
    nome_professor varchar(100),
    curso varchar(100)
);

CREATE TABLE TB_COMENTARIO (
	id_comentario int primary key auto_increment,
    id_aluno int,
    id_professor int,
    comentario text,
    nota_do_professor decimal(3, 1),
    FOREIGN KEY (id_aluno) REFERENCES TB_ALUNO(id_aluno),
    FOREIGN KEY (id_professor) REFERENCES TB_PROFESSOR(id_professor)
);

INSERT INTO TB_ALUNO (nome, sobrenome, curso) 
VALUES ('Gabriel', 'Oliveira', 'Engenharia de Software'),
	('Ana', 'Martins', 'Administração'),
    ('Lucas', 'Ferreira', 'Direito'),
    ('Beatriz', 'Costa', 'Engenharia de Software'),
    ('Rafael', 'Almeida', 'Administração'),
    ('Júlia', 'Rodrigues', 'Direito'),
    ('Matheus', 'Santos', 'Administração'),
    ('Camila', 'Barbosa', 'Engenharia de Software'),
    ('Pedro', 'Carvalho', 'Direito'),
    ('Larissa', 'Gomes', 'Administração'),
    ('João', 'Ribeiro', 'Engenharia de Software'),
    ('Mariana', 'Lopes', 'Direito'),
    ('Felipe', 'Nascimento', 'Engenharia de Software'),
    ('Isabela', 'Araújo', 'Administração'),
    ('Bruno', 'Teixeira', 'Direito'),
    ('Manuela', 'Moreira', 'Engenharia de Software'),
    ('Thiago', 'Castro', 'Administração'),
    ('Sofia', 'Correia', 'Direito');

INSERT INTO TB_PROFESSOR (nome_professor, curso) 
VALUES ('Ricardo Mendes', 'Engenharia de Software'),
	('Fernanda Lima', 'Administração'),
    ('André Martins', 'Direito');

INSERT INTO TB_COMENTARIO (id_aluno, id_professor, comentario, nota_do_professor) 
VALUES (1, 1, 'Explica programação de forma clara e dá bons exemplos práticos.', 9.0),
	(4, 1, 'Domina o conteúdo, mas algumas explicações são rápidas demais.', 7.0),
    (8, 1, 'Professor excelente, sempre disposto a tirar dúvidas.', 10.0),
    (11, 1, 'A matéria é interessante, mas sinto falta de mais explicações durante os exercícios.', 5.5),
    (13, 1, 'Tem bastante conhecimento e incentiva os alunos a praticarem.', 8.0),
    (16, 1, 'Tenho dificuldade de acompanhar o ritmo das aulas e acho alguns assuntos pouco explicados.', 5.0),
    (2, 2, 'As aulas de Marketing são criativas e muito interessantes.', 10.0),
    (5, 2, 'Gosto das aulas, mas alguns conteúdos poderiam ter mais exemplos práticos.', 7.0),
    (7, 2, 'A professora conhece bastante a área, mas as aulas às vezes ficam muito teóricas.', 6.0),
    (10, 2, 'Muito atenciosa e consegue explicar os conceitos de forma simples.', 9.0),
    (14, 2, 'As discussões em sala ajudam bastante a compreender o conteúdo.', 8.0),
    (17, 2, 'Tenho dificuldade em acompanhar algumas aulas e gostaria de uma metodologia mais dinâmica.', 5.0),
    (3, 3, 'Explica Direito Constitucional de forma objetiva, embora o conteúdo seja bastante extenso.', 8.0),
    (6, 3, 'Excelente professor, principalmente nas explicações sobre jurisprudência.', 10.0),
    (9, 3, 'Tem bastante conhecimento, mas as aulas poderiam ser mais interativas.', 6.0),
    (12, 3, 'As explicações são detalhadas e ajudam bastante nas provas.', 9.0),
    (15, 3, 'O conteúdo é importante, mas considero as aulas muito cansativas e difíceis de acompanhar.', 5.0),
    (18, 3, 'Esclarece as dúvidas da turma e demonstra bastante domínio da matéria.', 8.0);

-- Item 1: Listar todos os alunos e seus cursos
SELECT nome, sobrenome, curso FROM TB_ALUNO ORDER BY curso ASC;

-- Item 2: Lista todos os professores e cursos que lecionam
SELECT nome_professor, curso FROM TB_PROFESSOR;

-- Item 3: Listar comentários com nota abaixo de 6 (vou colocar menor ou igual)
SELECT id_professor, comentario, nota_do_professor FROM TB_COMENTARIO WHERE nota_do_professor <= 6;

-- Item 3: Listar comentários com nota acima de 6
SELECT id_professor, comentario, nota_do_professor FROM TB_COMENTARIO WHERE nota_do_professor > 6;
