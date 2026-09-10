USE DB_T04703_Marcelo_Nascimento;

-- START TRANSACTION;
-- COMMIT;
-- ROLLBACK;
-- SAVEPOINT;
-- ROLLBACK TO SAVEPOINT;

CREATE TABLE CONTA (
	id_cliente int primary key,
    nome_cliente varchar(100) not null,
    saldo decimal(10,2) not null
);

INSERT INTO CONTA (id_cliente, nome_cliente, saldo) 
VALUES (1, 'Josivaldo', '1000.00'),
	(2, 'Luís', '700.00');
    
SELECT * FROM CONTA;

-- EXEMPLO INICIAL -
-- Ajustando saldo do cliente Luís
-- Utilizando o COMMIT
START TRANSACTION;

UPDATE CONTA 
SET saldo = saldo + 250 
WHERE id_cliente = 2;

SELECT * FROM CONTA;

COMMIT;

-- TRUNCATE TABLE contatos; (apaga dados da tabela mais rapido que o DELETE FROM, mas não pode ser WHERE)
