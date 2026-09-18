USE DB_T04703_Marcelo_Nascimento;

CREATE TABLE CLIENTES_SCORE (
	cliente_id int auto_increment primary key,
    nome varchar(100) NOT NULL,
    score_credito int not null
);

INSERT INTO CLIENTES_SCORE(nome, score_credito) 
VALUES ('João', 750),
	('Maria', 520),
    ('Pedro', 890),
    ('Ana', 610);

CREATE TABLE FAIXA_CREDITO_SCORE (
	faixa_id int primary key,
    score_min int not null,
    score_max int not null,
    risco varchar(10) not null
);

INSERT INTO FAIXA_CREDITO_SCORE(faixa_id, score_min, score_max, risco) 
VALUES (1, 0, 599, 'Baixo'),
	(2, 600, 799, 'Médio'),
    (3, 800, 999, 'Alto');
    
SELECT * FROM CLIENTES_SCORE;
SELECT * FROM FAIXA_CREDITO_SCORE;

-- NO EQUIN JOIN
SELECT CLIENTE.nome as Cliente,
	CLIENTE.score_credito as Score,
    FAIXA.risco as Risco
FROM CLIENTES_SCORE AS CLIENTE 
INNER JOIN FAIXA_CREDITO_SCORE AS FAIXA 
ON CLIENTE.score_credito BETWEEN FAIXA.score_min AND FAIXA.score_max;

-- 
