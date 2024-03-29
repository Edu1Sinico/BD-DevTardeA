CREATE DATABASE EX01;

CREATE TABLE TBL_FORNECEDOR(
	FCODIGO INT NOT NULL,
	FNOME VARCHAR(50) NOT NULL,
	FSTATUS VARCHAR(10) NOT NULL DEFAULT 'ATIVO',
	FCIDADE VARCHAR(50) NOT NULL,
	PRIMARY KEY (FCODIGO)
);

CREATE TABLE TBL_PECA(
	PCODIGO INT NOT NULL,
	PNOME VARCHAR(30) NOT NULL,
	PCOR VARCHAR(30) NOT NULL,
	PESO DECIMAL(7,2) NOT NULL,
	PCIDADE VARCHAR(30) NOT NULL, 
	PRIMARY KEY (PCODIGO)
);

CREATE TABLE TBL_INSTITUICAO(
	ICODIGO INT NOT NULL,
	INOME VARCHAR(30) NOT NULL,
	PRIMARY KEY (ICODIGO)
);

CREATE TABLE TBL_PROJETO(
	PRCODIGO SERIAL NOT NULL,
	PRNOME VARCHAR(30) NOT NULL,
	CIDADE VARCHAR(30) NOT NULL,
	ICODIGO INT NOT NULL,
	PRIMARY KEY (PRCODIGO),
	FOREIGN KEY (ICODIGO) REFERENCES TBL_INSTITUICAO(ICODIGO)
);

CREATE TABLE TBL_FORNECIMENTO(
	FCODIGO INT NOT NULL,
	PCODIGO INT NOT NULL,
	PRCODIGO SERIAL NOT NULL,
	QTDE INT NOT NULL,
	PRIMARY KEY (FCODIGO, PCODIGO, PRCODIGO),
	FOREIGN KEY (FCODIGO) REFERENCES TBL_FORNECEDOR(FCODIGO),
	FOREIGN KEY (PCODIGO) REFERENCES TBL_PECA(PCODIGO),
	FOREIGN KEY (PRCODIGO) REFERENCES TBL_PROJETO(PRCODIGO)
);

-- INDEXES
CREATE INDEX IDX_ICODIGO ON TBL_PROJETO(ICODIGO);
CREATE INDEX IDX_FCODIGO ON TBL_FORNECIMENTO(FCODIGO);
CREATE INDEX IDX_PCODIGO ON TBL_FORNECIMENTO(PCODIGO);
CREATE INDEX IDX_PRCODIGO ON TBL_FORNECIMENTO(PRCODIGO);

-- ALTERAÇÕES (PARTE 02)

SELECT * FROM TBL_FORNECEDOR;
SELECT * FROM TBL_PECA;
SELECT * FROM TBL_INSTITUICAO;
SELECT * FROM TBL_PROJETO;
SELECT * FROM TBL_FORNECIMENTO;

DROP TABLE TBL_INSTITUICAO;

ALTER TABLE TBL_PROJETO DROP prcodigo CASCADE;
	
ALTER TABLE TBL_PROJETO DROP COLUMN ICOD;
	
-- CRIAÇÃO DA TABELA CIDADE
CREATE TABLE TBL_CIDADE(
	CCOD INT NOT NULL,
	CNOME VARCHAR(30) NOT NULL,
	UF CHAR(2) NOT NULL,
	PRIMARY KEY (CCOD)
);

SELECT * FROM TBL_CIDADE;

-- ALTERAÇÃO NA TABELA FORNECEDOR
SELECT * FROM TBL_FORNECEDOR;

ALTER TABLE TBL_FORNECEDOR DROP COLUMN FCIDADE

ALTER TABLE TBL_FORNECEDOR ADD CCOD INT NOT NULL;

ALTER TABLE TBL_FORMECEDOR AND FONE BIGINT NOT NULL;

ALTER TABLE TBL_FORNECEDOR ADD CCOD INT NOT NULL;

ALTER TABLE TBL_FORNECEDOR ADD CONSTRAINT FK_CCOD_FORNECEDOR FOREIGN KEY (CCOD) REFERENCES TBL_CIDADE (CCOD);

-- ALTERAÇÃO NA TABELA PECA
SELECT * FROM TBL_PECA;

ALTER TABLE TBL_PECA DROP COLUMN PCIDADE

ALTER TABLE TBL_PECA AND CCOD INT NOT NULL;

ALTER TABLE TBL_PECA RENAME FCODIGO TO FCOD;

ALTER TABLE TBL_PECA ADD CONSTRAINT FK_CCOD_PECA FOREIGN KEY (CCOD) REFERENCES TBL_CIDADE (CCOD);

-- ALTERAÇÃO NA TABELA PROJETO
SELECT * FROM TBL_PROJETO;

ALTER TABLE TBL_PROJETO DROP COLUMN CIDADE

ALTER TABLE TBL_PROJETO ADD CONSTRAINT FK_CCOD_PROJETO FOREIGN KEY (CCOD) REFERENCES TBL_CIDADE (CCOD);

-- INDEXES
CREATE INDEX FK_CCOD_FORNECEDOR ON TBL_FORNECEDOR(CCOD);
CREATE INDEX FK_CCOD_PECA ON TBL_PECA(CCOD);