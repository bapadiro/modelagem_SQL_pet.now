CREATE DATABASE pet_now;

USE pet_now;

-- será criado as entidades (tabelas): Cliente, Dog, Suites, Estadia, Pagamento

-- Criando entidade (tabela) Cliente
CREATE TABLE Cliente (
	ID_Cliente INT UNSIGNED NOT NULL,
    NM_Nome VARCHAR (50) NOT NULL,
    NUM_CPF INT NOT NULL,
    NM_Dog VARCHAR (50) NOT NULL,
    RC_Raca VARCHAR (50) NOT NULL  
);

-- Inserindo A PK
ALTER TABLE Cliente ADD CONSTRAINT PK_Cliente PRIMARY KEY (ID_Cliente);

-- Inserindo AUTO_INCREMENT no ID_Cliente
ALTER TABLE Cliente MODIFY ID_Cliente INT UNSIGNED AUTO_INCREMENT;

-- Criando a entidade (tabela) Dog
CREATE TABLE Dog (
	ID_Dog INT UNSIGNED NOT NULL,
    ID_Cliente INT UNSIGNED NOT NULL,
    NUM_Idade INT NOT NULL,
    NUM_Peso FLOAT NOT NULL,
    NM_Racao VARCHAR (50) NOT NULL
);

-- Inserindo PK
ALTER TABLE Dog ADD CONSTRAINT PK_Dog PRIMARY KEY (ID_Dog);

-- Inserindo AUTO_INCREMENT no ID_Dog
ALTER TABLE Dog MODIFY ID_Dog INT UNSIGNED AUTO_INCREMENT;

-- Criando entidade (tabela) Suite
CREATE TABLE Suite(
	ID_Suite INT UNSIGNED NOT NULL,
    NM_Nome VARCHAR (50) NOT NULL,
    VL_Preco FLOAT NOT NULL
);

-- Inserindo PK
ALTER TABLE Suite ADD CONSTRAINT PK_Suite PRIMARY KEY (ID_Suite);

-- Inserindo AUTO_INCREMENT ID_Suite)
ALTER TABLE Suite MODIFY ID_Suite INT UNSIGNED AUTO_INCREMENT;

-- Criando entidade (tabela) Estadia
CREATE TABLE Estadia (
	ID_Estadia INT UNSIGNED NOT NULL,
    ID_Cliente INT UNSIGNED NOT NULL,
    ID_Suite INT UNSIGNED NOT NULL,
    DT_Datain DATE,
    DT_Dataout DATE,
    VL_Pgto FLOAT NOT NULL
);

-- Inserindo PK
ALTER TABLE Estadia ADD CONSTRAINT PK_Estadia PRIMARY KEY (ID_Estadia);

-- Inserindo AUTO_INCREMENT ID_Estadia
ALTER TABLE Estadia MODIFY ID_Estadia INT UNSIGNED AUTO_INCREMENT;

-- Criando a entidade (tabela) Pagamento
CREATE TABLE Pagamento (
	ID_Pgto INT UNSIGNED NOT NULL,
    ID_Estadia INT NOT NULL,
    ST_Status VARCHAR (3) NOT NULL
);

-- Inserindo PK
ALTER TABLE Pagamento ADD CONSTRAINT PK_Pgto PRIMARY KEY (ID_Pgto);

-- Inserindo AUTO_INCREMENTO ID_Pgto
ALTER TABLE Pagamento MODIFY ID_Pgto INT UNSIGNED AUTO_INCREMENT;

-- RELACIONANDO AS ENTIDADES

-- Dog x Cliente
ALTER TABLE Dog ADD CONSTRAINT FK_Dog_Cliente FOREIGN KEY (ID_Cliente) REFERENCES Cliente (ID_Cliente);

-- Estadia x Suite
ALTER TABLE Estadia ADD CONSTRAINT FK_Estadia_Suite FOREIGN KEY (ID_Suite) REFERENCES Suite (ID_Suite);

-- Alterando a tabela Pagamento na coluna ID_Estadia INT NOT NULL para
-- ID_Estadia INT UNSIGNED NOT NULL
ALTER TABLE Pagamento MODIFY ID_Estadia INT UNSIGNED NOT NULL;

-- Pagamento x Estadia
ALTER TABLE Pagamento ADD CONSTRAINT FK_Pgto_Estadia FOREIGN KEY (ID_Estadia) REFERENCES Estadia (ID_Estadia);

SELECT * FROM Cliente;
SELECT * FROM Dog;
SELECT * FROM Pagamento;
SELECT * FROM Suite;
SELECT * FROM Pagamento;


