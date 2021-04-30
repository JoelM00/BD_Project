-- DROP SCHEMA Refood;
CREATE SCHEMA Refood;
USE Refood;

-- DROP TABLE Contacto;
CREATE TABLE Contacto (
idContacto int NOT NULL,
Email VARCHAR(45),
Telefone VARCHAR(45),
PRIMARY KEY (idContacto)
);

-- DROP TABLE Endereço;
CREATE TABLE Endereço (
id int NOT NULL,
Rua VARCHAR(45),
`Codigo-Postal` VARCHAR(45),
Localidade VARCHAR(45),
PRIMARY KEY (id)
);

-- DROP TABLE `Centro de Operações`;
CREATE TABLE `Centro de Operações` (
id INT NOT NULL,
Endereço int NOT NULL,
PRIMARY KEY (id),
CONSTRAINT `fk_Centro_Endereço`
	FOREIGN KEY (Endereço)
    REFERENCES Endereço (id)
);

-- DROP TABLE Beneficiário;
CREATE TABLE Beneficiário (
idBeneficiário int NOT NULL,
Nome VARCHAR (45),
`Restrições Alimentares` VARCHAR (100),
`Numero de Elementos` int NOT NULL,
Contacto int,
`Centro de Operações` int NOT NULL,
PRIMARY KEY (idBeneficiário),
CONSTRAINT `fk_Beneficiario_Centro`
	FOREIGN KEY (`Centro de Operações`)
	REFERENCES `Centro de Operações` (id),
CONSTRAINT `fk_Beneficiario_Contacto`
	FOREIGN KEY (Contacto)
	REFERENCES Contacto (idContacto)
);

-- DROP TABLE Voluntário;
CREATE TABLE Voluntário (
idVoluntário int NOT NULL,
Nome VARCHAR(45),
Contacto int,
`Centro de Operações` int NOT NULL,
PRIMARY KEY (idVoluntário),
CONSTRAINT `fk_Voluntário_Centro`
	FOREIGN KEY (`Centro de Operações`)
	REFERENCES `Centro de Operações` (id),
CONSTRAINT `fk_Voluntário_Contacto`
	FOREIGN KEY (Contacto)
	REFERENCES Contacto (idContacto)
);

-- DROP TABLE Fonte;
CREATE TABLE Fonte (
idFonte int NOT NULL,
Nome VARCHAR(45),
Endereço int NOT NULL,
`Centro de Operações` int NOT NULL,
Contacto int NOT NULL,
PRIMARY KEY (idFonte),
CONSTRAINT `fk_Fonte_Endereço`
	FOREIGN KEY (Endereço)
    REFERENCES Endereço (id),
CONSTRAINT `fk_Fonte_Centro`
	FOREIGN KEY (`Centro de Operações`)
	REFERENCES `Centro de Operações` (id),
CONSTRAINT `fk_Fonte_Contacto`
	FOREIGN KEY (`Contacto`)
	REFERENCES `Contacto` (idContacto)
);

-- DROP TABLE Alimento;
CREATE TABLE Alimento (
Nome VARCHAR(45) NOT NULL,
Quantidade int NOT NULL,
Tipo VARCHAR(45),
`Centro de Operações` int NOT NULL,
PRIMARY KEY (Nome),
CONSTRAINT `fk_Alimento_Centro`
	FOREIGN KEY (`Centro de Operações`)
	REFERENCES `Centro de Operações` (id)
);

-- DROP TABLE Recolha;
CREATE TABLE Recolha (
idRecolha int NOT NULL,
Data Date,
Fonte int NOT NULL,
Voluntário int NOT NULL,
PRIMARY KEY (idRecolha),
CONSTRAINT `fk_Recolha_Fonte`
	FOREIGN KEY (Fonte)
	REFERENCES Fonte (idFonte),
CONSTRAINT `fk_Recolha_Voluntário`
	FOREIGN KEY (Voluntário)
	REFERENCES Voluntário (idVoluntário)
);

-- DROP TABLE `Recolha/Alimento`;
CREATE TABLE `Recolha/Alimento` (
`idRecolha/Alimento` int NOT NULL,
Quantidade int NOT NULL,
Recolha int NOT NULL,
Alimento VARCHAR(45) NOT NULL,
PRIMARY KEY(`idRecolha/Alimento`),
CONSTRAINT `fk_RA/Alimento`
	FOREIGN KEY (Alimento)
	REFERENCES Alimento (Nome),
CONSTRAINT `fk_RA/Recolha`
	FOREIGN KEY (Recolha)
    REFERENCES Recolha (idRecolha)
);

-- DROP TABLE `Alimento/Beneficiário`;
CREATE TABLE `Alimento/Beneficiário` (
id int NOT NULL,
Quantidade int NOT NULL,
Data Date,
Beneficiário int NOT NULL,
Alimento VARCHAR(45) NOT NULL,
PRIMARY KEY (id),
CONSTRAINT `fk_AB/Alimento`
	FOREIGN KEY (Alimento)
	REFERENCES Alimento (Nome),
CONSTRAINT `fk_AB/Beneficiario`
	FOREIGN KEY (Beneficiário)
    REFERENCES Beneficiário (idBeneficiário)
);

-- DROP TABLE Horário;
CREATE TABLE Horário (
idHorário int NOT NULL,
Inicio int NOT NULL,
Fim int NOT NULL,
`Dia Da Semana` int NOT NULL,
Voluntário int,
Fonte int,
PRIMARY KEY (idHorário),
CONSTRAINT `fk_Horario/Voluntário`
	FOREIGN KEY (Voluntário)
	REFERENCES Voluntário (idVoluntário),
CONSTRAINT `fk_Horario/Fonte`
	FOREIGN KEY (Fonte)
    REFERENCES Fonte (idFonte)
);
-- Popular Amostra

-- Popular Contactos
-- SELECT * FROM Contacto;
INSERT Into Contacto (idContacto,Email,Telefone) VALUES (1,"jose@hotmail.com","989767565");
INSERT Into Contacto (idContacto,Email,Telefone) VALUES (2,"a@hotmail.com","989767566");
INSERT Into Contacto (idContacto,Email,Telefone) VALUES (3,"b@hotmail.com","989767567");
INSERT Into Contacto (idContacto,Email,Telefone) VALUES (4,"c@hotmail.com","989767568");
INSERT Into Contacto (idContacto,Email,Telefone) VALUES (5,"d@hotmail.com","989767569");
INSERT Into Contacto (idContacto,Email,Telefone) VALUES (6,"e@hotmail.com","989767510");
INSERT Into Contacto (idContacto,Email,Telefone) VALUES (7,"f@hotmail.com","989767511");
INSERT Into Contacto (idContacto,Email,Telefone) VALUES (8,"g@hotmail.com","989767512");
INSERT Into Contacto (idContacto,Email,Telefone) VALUES (9,"h@hotmail.com","989767513");
INSERT Into Contacto (idContacto,Email,Telefone) VALUES (10,"i@hotmail.com","989767514");

-- Popular Endereços
-- SELECT * FROM Endereço;
INSERT Into Endereço (id,Rua,`Codigo-Postal`,Localidade) VALUES (1,"Rua 25 de Abril","4000-700","Lisboa");
INSERT Into Endereço (id,Rua,`Codigo-Postal`,Localidade) VALUES (2,"Rua 26 de Abril","4000-701","Lisboa");
INSERT Into Endereço (id,Rua,`Codigo-Postal`,Localidade) VALUES (3,"Rua 27 de Abril","4000-702","Lisboa");
INSERT Into Endereço (id,Rua,`Codigo-Postal`,Localidade) VALUES (4,"Rua 28 de Abril","4000-703","Lisboa");
INSERT Into Endereço (id,Rua,`Codigo-Postal`,Localidade) VALUES (5,"Rua 29 de Abril","4000-704","Lisboa");
INSERT Into Endereço (id,Rua,`Codigo-Postal`,Localidade) VALUES (6,"Rua 30 de Abril","4000-705","Lisboa");
INSERT Into Endereço (id,Rua,`Codigo-Postal`,Localidade) VALUES (7,"Rua 31 de Abril","4000-706","Lisboa");
INSERT Into Endereço (id,Rua,`Codigo-Postal`,Localidade) VALUES (8,"Rua 32 de Abril","4000-707","Lisboa");
INSERT Into Endereço (id,Rua,`Codigo-Postal`,Localidade) VALUES (9,"Rua 33 de Abril","4000-708","Lisboa");
INSERT Into Endereço (id,Rua,`Codigo-Postal`,Localidade) VALUES (10,"Rua 25 de Dezembro","4000-709","Lisboa");

-- Popular Centro de Observações
-- SELECT * FROM `Centro de Operações`;
INSERT Into `Centro de Operações` (id,Endereço) VALUES (1,1);

-- Popular Voluntários
-- SELECT * FROM Voluntário;
INSERT Into Voluntário (idVoluntário,Nome,Contacto,`Centro de Operações`) VALUES (1,"Sara Dias",1,1);
INSERT Into Voluntário (idVoluntário,Nome,Contacto,`Centro de Operações`) VALUES (2,"Sara1 Dias",2,1);
INSERT Into Voluntário (idVoluntário,Nome,Contacto,`Centro de Operações`) VALUES (3,"Sara2 Dias",3,1);

-- Popular Beneficiários
-- SELECT * FROM Beneficiário;
INSERT Into Beneficiário (idBeneficiário,Nome,`Restrições Alimentares`,Contacto,`Numero de Elementos`,`Centro de Operações`) VALUES (1,"Joel",NULL,4,10,1);
INSERT Into Beneficiário (idBeneficiário,Nome,`Restrições Alimentares`,Contacto,`Numero de Elementos`,`Centro de Operações`) VALUES (2,"Joel2","Lacticios",5,11,1);
INSERT Into Beneficiário (idBeneficiário,Nome,`Restrições Alimentares`,Contacto,`Numero de Elementos`,`Centro de Operações`) VALUES (3,"Joel3",NULL,6,11,1);

-- Popular Fontes
-- SELECT * FROM Fonte;
INSERT Into Fonte (idFonte,Nome,Endereço,`Centro de Operações`,Contacto) VALUES (1,"PizzaHut",2,1,7);
INSERT Into Fonte (idFonte,Nome,Endereço,`Centro de Operações`,Contacto) VALUES (2,"PizzaHut2",3,1,8);
INSERT Into Fonte (idFonte,Nome,Endereço,`Centro de Operações`,Contacto) VALUES (3,"PizzaHut3",4,1,9);

-- Popular Alimentos
-- SELECT * FROM Alimento;
INSERT Into Alimento (Nome,Quantidade,Tipo,`Centro de Operações`) VALUES ("Cenoura",100,"Vegetal",1);
INSERT Into Alimento (Nome,Quantidade,Tipo,`Centro de Operações`) VALUES ("Massa",5,"Processada",1);
INSERT Into Alimento (Nome,Quantidade,Tipo,`Centro de Operações`) VALUES ("Tomate",6,"Fruto",1);
INSERT Into Alimento (Nome,Quantidade,Tipo,`Centro de Operações`) VALUES ("Arroz",100,"Processada",1);
INSERT Into Alimento (Nome,Quantidade,Tipo,`Centro de Operações`) VALUES ("Chocolate",10,"Doce",1);
INSERT Into Alimento (Nome,Quantidade,Tipo,`Centro de Operações`) VALUES ("Leite",7,"Bebida",1);
INSERT Into Alimento (Nome,Quantidade,Tipo,`Centro de Operações`) VALUES ("Pizza",100,"Cozinhada",1);
INSERT Into Alimento (Nome,Quantidade,Tipo,`Centro de Operações`) VALUES ("Sopa",100,"Por Cozinhar",1);
INSERT Into Alimento (Nome,Quantidade,Tipo,`Centro de Operações`) VALUES ("Cogumelo",9,"Vegetal",1);
INSERT Into Alimento (Nome,Quantidade,Tipo,`Centro de Operações`) VALUES ("Banana",100,"Fruto",1);

-- Popular Horários
-- SELECT * FROM Horário;
INSERT Into Horário (idHorário,Inicio,Fim,`Dia Da Semana`,Voluntário,Fonte) VALUES (1,8,10,1,1,null);
INSERT Into Horário (idHorário,Inicio,Fim,`Dia Da Semana`,Voluntário,Fonte) VALUES (2,9,10,2,2,null);
INSERT Into Horário (idHorário,Inicio,Fim,`Dia Da Semana`,Voluntário,Fonte) VALUES (3,8,11,3,3,null);
INSERT Into Horário (idHorário,Inicio,Fim,`Dia Da Semana`,Voluntário,Fonte) VALUES (4,10,12,4,null,1);
INSERT Into Horário (idHorário,Inicio,Fim,`Dia Da Semana`,Voluntário,Fonte) VALUES (5,10,15,5,null,2);
INSERT Into Horário (idHorário,Inicio,Fim,`Dia Da Semana`,Voluntário,Fonte) VALUES (6,16,18,6,null,3);
INSERT Into Horário (idHorário,Inicio,Fim,`Dia Da Semana`,Voluntário,Fonte) VALUES (7,19,20,7,null,1);

-- Popular Recolhas
-- SELECT * FROM Recolha;
INSERT Into Recolha (idRecolha,Data,Fonte,Voluntário) VALUES (1,'2010-11-30',1,1);
INSERT Into Recolha (idRecolha,Data,Fonte,Voluntário) VALUES (2,'2010-11-29',2,1);
INSERT Into Recolha (idRecolha,Data,Fonte,Voluntário) VALUES (3,'2010-11-28',3,1);
INSERT Into Recolha (idRecolha,Data,Fonte,Voluntário) VALUES (4,'2010-11-27',1,2);
INSERT Into Recolha (idRecolha,Data,Fonte,Voluntário) VALUES (5,'2010-11-27',1,2);
INSERT Into Recolha (idRecolha,Data,Fonte,Voluntário) VALUES (6,'2010-11-26',1,2);

-- Popular Recolha/Alimento
-- SELECT * FROM `Recolha/Alimento`;
INSERT Into `Recolha/Alimento` (`idRecolha/Alimento`,Quantidade,Recolha,Alimento) VALUES (1,10,1,"Cenoura");
INSERT Into `Recolha/Alimento` (`idRecolha/Alimento`,Quantidade,Recolha,Alimento) VALUES (2,5,1,"Massa");
INSERT Into `Recolha/Alimento` (`idRecolha/Alimento`,Quantidade,Recolha,Alimento) VALUES (3,6,2,"Cenoura");
INSERT Into `Recolha/Alimento` (`idRecolha/Alimento`,Quantidade,Recolha,Alimento) VALUES (4,7,3,"Pizza");
INSERT Into `Recolha/Alimento` (`idRecolha/Alimento`,Quantidade,Recolha,Alimento) VALUES (5,8,4,"Leite");
INSERT Into `Recolha/Alimento` (`idRecolha/Alimento`,Quantidade,Recolha,Alimento) VALUES (6,9,5,"Sopa");
INSERT Into `Recolha/Alimento` (`idRecolha/Alimento`,Quantidade,Recolha,Alimento) VALUES (7,10,6,"Banana");
INSERT Into `Recolha/Alimento` (`idRecolha/Alimento`,Quantidade,Recolha,Alimento) VALUES (8,11,3,"Cogumelo");
INSERT Into `Recolha/Alimento` (`idRecolha/Alimento`,Quantidade,Recolha,Alimento) VALUES (9,12,3,"Tomate");
INSERT Into `Recolha/Alimento` (`idRecolha/Alimento`,Quantidade,Recolha,Alimento) VALUES (10,13,3,"Chocolate");

-- Popular Alimento/Beneficiário
-- SELECT * FROM `Alimento/Beneficiário`:
INSERT Into `Alimento/Beneficiário` (id,Quantidade,Data,Beneficiário,Alimento) VALUES (1,5,'2020-11-27',1,"Cenoura");
INSERT Into `Alimento/Beneficiário` (id,Quantidade,Data,Beneficiário,Alimento) VALUES (2,10,'2020-11-28',1,"Massa");
INSERT Into `Alimento/Beneficiário` (id,Quantidade,Data,Beneficiário,Alimento) VALUES (3,20,'2020-11-29',2,"Pizza");
INSERT Into `Alimento/Beneficiário` (id,Quantidade,Data,Beneficiário,Alimento) VALUES (4,25,'2020-11-30',2,"Chocolate");
INSERT Into `Alimento/Beneficiário` (id,Quantidade,Data,Beneficiário,Alimento) VALUES (5,30,'2020-01-03',3,"Leite");
INSERT Into `Alimento/Beneficiário` (id,Quantidade,Data,Beneficiário,Alimento) VALUES (6,35,'2020-02-04',3,"Tomate");

-- Criação de Indexes
-- Automatico para chaves estrangeiras, e chaves primárias
CREATE INDEX idx_DataRecolha on Recolha (Data);
CREATE INDEX idx_DataBeneficiário on `Alimento/Beneficiário` (Data);



-- Criação de Views

-- DROP VIEW view_fonte_Endereço;
-- SELECT * FROM view_fonte_Endereço;
CREATE VIEW view_fonte_Endereço AS
	SELECT Fonte.Nome,Rua,`Codigo-Postal`,Localidade,Inicio,Fim,`Dia Da Semana` From Fonte
		JOIN Endereço ON Fonte.Endereço=Endereço.id
		JOIN Horário ON Horário.Fonte=Fonte.idFonte
ORDER BY `Dia Da Semana`;

-- DROP VIEW fluxo_alimento;
-- SELECT * FROM fluxo_alimento;
CREATE VIEW fluxo_alimento AS
SELECT Alimento,Quantidade,Data FROM 
	Recolha JOIN `Recolha/Alimento` ON `Recolha/Alimento`.Recolha=Recolha.idRecolha 
		UNION SELECT Alimento,-Quantidade,Data FROM `Alimento/Beneficiário`
ORDER BY Data;

-- TRIGGERS ATUALIZAR AS QUANTIDADES NO ARMAZEM EM RECOLHAS E ENTREGAS;
-- DROP TRIGGER Recolha;
DELIMITER $$
CREATE TRIGGER Recolha
	AFTER INSERT ON `Recolha/Alimento`
    FOR EACH ROW
BEGIN
    UPDATE Alimento SET Alimento.Quantidade = Alimento.Quantidade + new.Quantidade
		where Alimento.Nome=new.Alimento;
END $$

-- DROP TRIGGER Entrega;
DELIMITER $$
CREATE TRIGGER Entrega
	AFTER INSERT ON `Alimento/Beneficiário`
    FOR EACH ROW
BEGIN
    UPDATE Alimento SET Alimento.Quantidade = Alimento.Quantidade - new.Quantidade
		where Alimento.Nome=new.Alimento;
END $$

/* 
-- Teste dos Triggerts
SELECT Nome,Quantidade FROM Alimento
	Order by Quantidade Desc;
INSERT Into `Recolha/Alimento` (`idRecolha/Alimento`,Quantidade,Recolha,Alimento) VALUES (12,200,1,"Chocolate");
INSERT INTO `Alimento/Beneficiário` (id,Quantidade,Data,Beneficiário,Alimento) VALUES (7,100,'2020-11-27',1,"Chocolate");
*/


-- Querys

-- O Voluntário pode verificar a lista de todos os alimentos armazenados
-- DROP PROCEDURE AlimentoArmazenado;
DELIMITER $$
CREATE PROCEDURE AlimentoArmazenado ()
BEGIN
	SELECT Nome,Quantidade FROM Alimento
		Order by Quantidade Desc;
END $$
-- CALL AlimentoArmazenado();

-- O Beneficiário pode verificar a lista de entregas que recebeu, por data.
-- DROP PROCEDURE BeneficiárioEntregas;
DELIMITER $$
CREATE PROCEDURE BeneficiárioEntregas (IN nome VarChar(45))
BEGIN
	SELECT Data,Alimento,Quantidade FROM `Alimento/Beneficiário`
		Join Beneficiário ON idBeneficiário=`Alimento/Beneficiário`.Beneficiário
			where Beneficiário.Nome=nome
			order by Data Desc;
END $$
-- CALL BeneficiárioEntregas("Joel");

-- O Voluntário pode verificar a lista de recolhas que realizou, por data.
-- DROP PROCEDURE BeneficiárioEntregas;
DELIMITER $$
CREATE PROCEDURE VoluntárioRecolhas (IN nome VarChar(45))
BEGIN
	SELECT IdRecolha,Data,Fonte.Nome FROM Recolha
	Join Voluntário ON IdVoluntário=Recolha.Voluntário
    Join Fonte ON idFonte=Recolha.Fonte
    where Voluntário.Nome=nome
    order by Data Desc;
END $$
-- CALL VoluntárioRecolhas("Sara Dias");

-- O Voluntário pode ver o horário de uma fonte.
-- DROP PROCEDURE HorárioFonte;
DELIMITER $$
CREATE PROCEDURE HorárioFonte (IN nome VarChar(45))
BEGIN
	SELECT Inicio,Fim,`Dia Da Semana` FROM Horário
	Join Fonte ON idFonte=Horário.Fonte
    Where Fonte.Nome=nome;
END $$
CALL HorárioFonte("PizzaHut");

-- O Voluntário pode ver todos os alimentos e quantidade recolhidos numa data.
-- DROP PROCEDURE RecolhasData;
DELIMITER $$
CREATE PROCEDURE RecolhasData (IN data1 Date)
BEGIN
	SELECT Alimento,Quantidade FROM Recolha
	Join `Recolha/Alimento` On Recolha=idRecolha
	Where Data=data1;
END $$
-- CALL RecolhasData('2010-11-27');