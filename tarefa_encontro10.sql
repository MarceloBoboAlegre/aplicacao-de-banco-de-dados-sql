USE DB_T04703_Marcelo_Nascimento;

-- tabela inicial
CREATE TABLE RESERVAS(
	id int,
    cliente VARCHAR(50),
    cidade VARCHAR(30),
    pessoas int
);

-- inserindo dados na tabela inicial
INSERT INTO RESERVAS (id, cliente, cidade, pessoas) 
VALUES (1, 'José Carlos', 'Barueri', 2),
	(2, 'Vinícius Rocha', 'Porto Alegre', 1),
    (3, 'Joana Saraiva', 'Caraguatatuba', 2);
    
-- ALTERANDO A TABELA
-- 1
ALTER TABLE RESERVAS ADD COLUMN data_reserva date;

-- 2
ALTER TABLE RESERVAS CHANGE COLUMN pessoas quantidade_pessoas int;

-- 3
ALTER TABLE RESERVAS MODIFY COLUMN cliente varchar(100);

-- 4
ALTER TABLE RESERVAS ADD COLUMN valor_reserva decimal(8, 2);

-- 5
ALTER TABLE RESERVAS ADD COLUMN status_reserva varchar(50);

-- 6
ALTER TABLE RESERVAS DROP COLUMN status_reserva;

SELECT * FROM RESERVAS;
