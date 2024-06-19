
-- create
CREATE TABLE cadFun (
  CODEFUN INT NOT NULL PRIMARY KEY,
  NOME VARCHAR(40) NOT NULL,
  DEPTO CHAR(2),
  FUNCAO CHAR(20),
  SALARIO NUMERIC (10,2)
);

-- insert
INSERT INTO cadFun VALUES (12, 'CARLOS ALBERTO', '3', 'VENDEDOR', 1530.00);
INSERT INTO cadFun VALUES (15, 'MARCOS HENRIQUE', '2', 'GERENTE', 1985.75);
INSERT INTO cadFun VALUES (7, 'APARECIDA SILVA', '3', 'SECRETARIA', 1200.50);
INSERT INTO cadFun VALUES (9, 'SOLANGE PACHECO', '5', 'SUPERVISORA', 1599.51);
INSERT INTO cadFun VALUES (6, 'MARCELO SOUZA', '3', 'ANALISTA', 2250.11);
INSERT INTO cadFun VALUES (1, 'CELIO NASCIMENTO', '2', 'SECRETARIA', 1200.50);
INSERT INTO cadFun VALUES (2, 'WILSON DE MACEDO', '3', 'PROGRAMADOR', 1050.00);
INSERT INTO cadFun VALUES (5, 'AUGUSTO SOUZA', '3', 'PROGRAMADOR', 1050.00);
INSERT INTO cadFun VALUES (4, 'CARLOS BASTOS', '5', 'VENDEDOR', 1530.00);
INSERT INTO cadFun VALUES (25, 'PEDRO SILVA', '3', 'SUPERVISOR', 1599.51);
INSERT INTO cadFun VALUES (3, 'ANA BASTOS', '5', 'VENDEDORA', 1530.00);
INSERT INTO cadFun VALUES (10, 'PAULO DA SILVA', '2', 'VENDEDOR', 1530.00);

-- fetch 
-- SELECT
SELECT codefun, nome FROM cadFun;

SELECT NOME, SALARIO FROM cadFun where codefun = 1;

SELECT NOME, SALARIO FROM cadFun WHERE SALARIO > 2; 

SELECT NOME, SALARIO FROM cadFun WHERE SALARIO < 3500 OR DEPTO = '3';

SELECT NOME, SALARIO FROM cadFun WHERE FUNCAO = 'PROGRAMADOR'; 

SELECT * FROM cadFun WHERE SALARIO > 2000;

-- DISTINCT

SELECT SALARIO FROM cadFun;
SELECT DISTINCT SALARIO FROM cadFun;

SELECT DEPTO FROM cadFun;
select DISTINCT DEPTO FROM cadFun;

SELECT NOME, SALARIO FROM cadFun
ORDER BY SALARIO DESC; -- Decrescente

SELECT NOME, SALARIO FROM cadFun
ORDER BY NOME ASC; -- Decrescente

SELECT NOME, SALARIO FROM cadFun
ORDER BY NOME DESC; -- Decrescente

SELECT * FROM cadFun ORDER BY NOME;

SELECT NOME, FUNCAO FROM cadFun ORDER BY FUNCAO, NOME DESC;

SELECT NOME FROM cadFun WHERE CODEFUN = 2 ORDER BY NOME;

-- CLASULA LIMIT
SELECT NOME, SALARIO FROM cadFun ORDER BY NOME LIMIT 3;

SELECT NOME, SALARIO FROM cadFun ORDER BY NOME LIMIT 1 offset 2;

