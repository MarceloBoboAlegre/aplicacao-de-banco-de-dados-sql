USE DB_T04703_Marcelo_Nascimento;

-- CRIANDO A TABELA A
CREATE TABLE TabelaA(
  Nome varchar(50) NULL
);
 
-- CRIANDO A TABELA B
CREATE TABLE TabelaB(
  Nome varchar(50) NULL
);
 
-- INSERINDO REGISTROS NAS TABELAS
INSERT INTO TabelaA VALUES('Fernanda');
INSERT INTO TabelaA VALUES('Josefa');
INSERT INTO TabelaA VALUES('Luiz');
INSERT INTO TabelaA VALUES('Fernando');
 
INSERT INTO TabelaB VALUES('Carlos');
INSERT INTO TabelaB VALUES('Manoel');
INSERT INTO TabelaB VALUES('Luiz');
INSERT INTO TabelaB VALUES('Fernando');

-- Consulta inicial
SELECT * FROM TabelaA;
SELECT * FROM TabelaB;

-- INNER JOIN
SELECT * FROM TabelaA AS A INNER JOIN TabelaB as B ON A.nome = B.Nome;
SELECT A.Nome as NomeA, B.Nome as NomeB FROM TabelaA as A INNER JOIN TabelaB as B on A.Nome = B.nome;

-- LEFT JOIN
SELECT * FROM TabelaA AS A LEFT JOIN TabelaB as B ON A.nome = B.Nome;
SELECT A.Nome as NomeA, B.Nome as NomeB FROM TabelaA as A LEFT JOIN TabelaB as B on A.Nome = B.nome;

-- RIGHT JOIN
SELECT * FROM TabelaA AS A RIGHT JOIN TabelaB as B ON A.nome = B.Nome;
SELECT A.Nome as NomeA, B.Nome as NomeB FROM TabelaA as A RIGHT JOIN TabelaB as B on A.Nome = B.nome;

-- FULL OUTER JOIN (Nao disponivel no mysql)
-- Alternativa LEFT JOIN UNION RIGHT JOIN
SELECT A.Nome as NomeA, B.Nome as NomeB FROM TabelaA as A LEFT JOIN TabelaB as B on A.Nome = B.nome
UNION
SELECT A.Nome as NomeA, B.Nome as NomeB FROM TabelaA as A RIGHT JOIN TabelaB as B on A.Nome = B.nome;

-- LEFT AND RIGHT EXCLUDING JOIN
SELECT A.Nome as NomeA, B.Nome as NomeB FROM TabelaA as A LEFT JOIN TabelaB as B on A.Nome = B.nome WHERE B.Nome is NULL;
SELECT A.Nome as NomeA, B.Nome as NomeB FROM TabelaA as A RIGHT JOIN TabelaB as B on A.Nome = B.nome WHERE A.Nome is NULL;
