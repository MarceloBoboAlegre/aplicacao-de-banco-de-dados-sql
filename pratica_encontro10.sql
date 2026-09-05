USE DB_T04703_Marcelo_Nascimento;

-- Criando as 3 tabelas
CREATE TABLE TB_GRUPOS (
	id_grupo int auto_increment primary key,
    nome_grupo varchar(150)
);

CREATE TABLE TB_CONTATOS (
	id_contato int auto_increment primary key,
    nome varchar(150),
    email varchar(150),
    id_grupo int,
    FOREIGN KEY (id_grupo) REFERENCES TB_GRUPOS(id_grupo)
);

CREATE TABLE TB_TELEFONES (
	telefone1 varchar(20) not null,
    telefone2 varchar(20),
    telefone3 varchar(20),
    id_contato int,
    FOREIGN KEY (id_contato) REFERENCES TB_CONTATOS(id_contato)
);

-- Inserindo dados nas tabelas
INSERT INTO TB_GRUPOS (nome_grupo) 
VALUES ('Loucos por pizza'),
	('Terceirão pra sempre'),
    ('Futebol Sexta'),
    ('Torcida Jovem Vasco');

INSERT INTO TB_CONTATOS (nome, email, id_grupo) 
VALUES ('Pedro', 'pedrinhodagama@gmail.com', 4),
	('Josué', 'pizzadojo@gmail.com', 1),
    ('Clara', 'claraalmeida14@hotmail.com', 2),
    ('Carlos', 'ograngecabeca@gmail.com', 3),
    ('Samantha', 'samantinha2@outlook.com', 1),
    ('Filipe', 'filipelipe@gmail.com', 3),
    ('João', 'bicicletaria7rodas@gmail.com', 4),
    ('Luíza', 'luizas2s2@gmail.com', 2),
    ('Henrique', 'matanoob37@gmail.com', 2),
    ('Luís', 'luisz@hotmail.com', 1);
    
INSERT INTO TB_TELEFONES (telefone1, telefone2, telefone3, id_contato) 
VALUES ('12 91625-4823', '11 96324-5874', '11 96321-4785', 1),
	('11 96587-7851', '11 91452-2587', '11 93574-1854', 7);

INSERT INTO TB_TELEFONES (telefone1, telefone2, id_contato) 
VALUES ('12 97855-4651', '12 92568-1564', 3),
	('11 92154-3422', '11 97381-6184', 5),
	('11 93295-6543', '12 99887-1163', 8),
    ('12 96338-9744', '12 91589-8559', 9);

INSERT INTO TB_TELEFONES (telefone1, id_contato) 
VALUES ('11 91554-6685', 2),
	('12 96663-8842', 4),
    ('11 97732-4997', 6),
    ('11 92884-4551', 10);

-- Consultando os dados
SELECT * FROM TB_GRUPOS;
SELECT * FROM TB_CONTATOS;
SELECT * FROM TB_TELEFONES;

-- Select somente com a coluna nome
SELECT nome FROM TB_CONTATOS;

-- Consulta usando where nome = 'Pedro';
SELECT nome, email, id_grupo FROM TB_CONTATOS WHERE nome = 'Pedro';
