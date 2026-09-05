USE DB_T04703_Marcelo_Nascimento;

CREATE TABLE TB_CONTATOS(
	id int auto_increment primary key,
    nome varchar(100),
	telefone varchar(20),
    email varchar(100),
    data_nascimento date
);

INSERT INTO TB_CONTATOS(nome, telefone, email, data_nascimento) 
VALUES ('Karen', '11 91538-7845', 'Karen_Bolos@gmail.com', '2001-10-05'),
	('Marcio', '12 91153-1295', 'MarcinhodoGrau@hotmail.com', '1989-05-15'),
    ('Henrique', '11 94244-9586', 'HenQue12@gmail.com', '1997-02-08'),
    ('Gustavo', '12 95246-8523', 'Guuuuuustavo5@gmail.com', '2003-08-29');
    
SELECT * FROM TB_CONTATOS;

-- Alterando tabelas
ALTER TABLE TB_CONTATOS ADD COLUMN ativo BOOLEAN DEFAULT TRUE;

ALTER TABLE TB_CONTATOS MODIFY COLUMN nome varchar(150) NOT NULL;

ALTER TABLE TB_CONTATOS CHANGE COLUMN telefone celular varchar(20);

ALTER TABLE TB_CONTATOS DROP COLUMN ativo;
