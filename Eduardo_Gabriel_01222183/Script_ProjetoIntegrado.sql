-- Database ProjetoIntegrado
CREATE DATABASE ProjetoIntegrado;
use ProjetoIntegrado;

-- Tabela Fornecedor
CREATE TABLE Fornecedor (
  idFornecedor INT PRIMARY KEY AUTO_INCREMENT,
  Social VARCHAR(35) NOT NULL,
  Fantasi VARCHAR(35) NOT NULL,
  Cnpj VARCHAR(14) NOT NULL UNIQUE,
  Telefone VARCHAR(11) NOT NULL,
  Representante VARCHAR(25) NOT NULL,
  Email VARCHAR(25) NOT NULL UNIQUE,
  Senha VARCHAR(25) NOT NULL);

-- Tabela Vendedor
CREATE TABLE Vendedor(
  idVendedor INT PRIMARY KEY AUTO_INCREMENT,
  Social VARCHAR(35) NOT NULL,
  Fantasia VARCHAR(35) NOT NULL,
  Cnpj VARCHAR(14) NOT NULL,
  Telefone VARCHAR(11) NOT NULL,
  Representante VARCHAR(25) NOT NULL,
  Email VARCHAR(25) NOT NULL,
  fkFornecedor INT NOT NULL,
  CONSTRAINT fkFornecedorVendedor FOREIGN KEY (`fkFornecedor`) REFERENCES Fornecedor (`idFornecedor`));
    
-- Tabela Sensor
CREATE TABLE Sensor (
  idSensor INT PRIMARY KEY AUTO_INCREMENT,
  SensorStatus VARCHAR(13) NOT NULL,
  CONSTRAINT chkStatus CHECK(SensorStatus IN('Ativo', 'Desativo', 'Em Trasnporte')));


-- Tabela Freezer
CREATE TABLE Freezer (
  idFreezer INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  NumeroSerie VARCHAR(16) NOT NULL,
  Marca VARCHAR(20) NOT NULL,
  TempMax DECIMAL(4,2) NOT NULL,
  TempMin DECIMAL(4,2) NOT NULL,
  fkFornecedor INT NOT NULL,
  fkVendedor INT NULL,
  fkSensor INT NULL UNIQUE,
  CONSTRAINT fkFornecedorFreezer FOREIGN KEY (`fkFornecedor`) REFERENCES Fornecedor(`idFornecedor`),
  CONSTRAINT fkVendedorFreezer FOREIGN KEY (`fkVendedor`) REFERENCES Vendedor(`idVendedor`),
  CONSTRAINT fkSensorFreezer FOREIGN KEY (`fkSensor`) REFERENCES Sensor(`idSensor`));
   


-- Tabela Temperatura
CREATE TABLE Temperatura (
  idTemperatura INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  Temperatura DECIMAL(4,2) NOT NULL,
  DataHora DATETIME NOT NULL,
  fkSensor INT NOT NULL,
  CONSTRAINT fkSensorTemperatura FOREIGN KEY (`fkSensor`) REFERENCES Sensor (`idSensor`));


-- Tabela Endereco
CREATE TABLE Endereco (
  idEndereco INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  CEP CHAR(9) NOT NULL,
  Bairro VARCHAR(45) NOT NULL,
  Rua VARCHAR(45) NOT NULL,
  Numero INT NOT NULL,
  Complemento VARCHAR(10) NULL,
  Localidade VARCHAR(30) NOT NULL,
  UF CHAR(2) NOT NULL,
  fkFornecedor INT NULL,
  fkVendedor INT NULL,
  CONSTRAINT fkFornecedorEndereco FOREIGN KEY (`fkFornecedor`)REFERENCES Fornecedor (`idFornecedor`),
  CONSTRAINT fkVendedorEndereco FOREIGN KEY (`fkVendedor`) REFERENCES Vendedor (`idVendedor`));
    



-- Tabela Veiculo
CREATE TABLE Veiculo (
  idVeiculo INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  Modelo VARCHAR(30) NOT NULL,
  Placa CHAR(7) NOT NULL,
  fkVendedor INT NOT NULL,
  fkSensor INT NULL,
  CONSTRAINT fkSensorVeiculo FOREIGN KEY (`fkSensor`) REFERENCES Sensor(`idSensor`),
  CONSTRAINT fkVendedorVeiculo FOREIGN KEY (`fkVendedor`) REFERENCES Vendedor(`idVendedor`));
  
  show tables;
   
-- inseri dados em Fornecedor   
INSERT INTO Fornecedor(Social,Fantasi,Cnpj,Telefone,Representante,Email,Senha) VALUES
   ('UNILEVER BRASIL LTDA','KIBON','11111111000111','11911111111','Pedro Miguel','kibom@gmail.com','123'),
   ('Ben & Jerrys Homemade Holdings','Ben & Jerrys','33222222000122','11922222222','Felipe','benejerrys@gmail.com','123'),
   ('DISTRIBUIDORA CORNETTO LTDA','Cornetto','33333333000133','11933333333','Aline','cornetto@gmail.com','123');
   
-- inseri dados em Vendedor
INSERT INTO Vendedor(Social,Fantasia,Cnpj,Telefone,Representante,Email,fkFornecedor) VALUES
   ('MERCADO LTDA','Mercados D&B','44444444000144','11944444444','Luan','debmercados@gmail.com',3),
   ('PADARIA LTDA','Padaria Doce Mel','55555555000155','11955555555','Maria','docemel@gmail.com',1),
   ('BANCA LTDA','Banca do seu Ze','66666666000166','11966666666','Ze','seuze@gmail.com',2);

-- inseri dados em Sensor
INSERT INTO Sensor (SensorStatus) VALUES
('Ativo'),
('Desativo'),
('Em Trasnporte'),
('Ativo'),
('Desativo'),
('Em Trasnporte');

-- inseri dados em Freezer
INSERT INTO Freezer(NumeroSerie,Marca,TempMax,TempMin,fkFornecedor,fkVendedor,fkSensor) VALUES
   ('A256da156974q1','Frezino',20.00,-50.00,1,null,1),
   ('A231a5qe4f1v3a','Frezino',20.00,-50.00,1,3,2),
   ('A23a4984rn361A','Frezino',20.00,-50.00,3,2,3);
   
   -- inseri dados em Temperatura
INSERT INTO Temperatura(Temperatura ,DataHora,fkSensor) VALUES
   (-02.25,'2022-09-06 10:11:00.000',1),
   (-05.70,'2022-09-06 12:00:09.000',2),
   (-04.99,'2022-09-06 11:59:50.000',3);   
   
   -- inseri dados em Endereco
INSERT INTO Endereco(CEP,Bairro,Rua,Numero,Complemento,Localidade,UF,fkFornecedor, fkVendedor) VALUES
   ('065894138','Jardin do Limoeiro','Santo Miguel',98,'','Sao Paulo','SP',null,3),
   ('123456789','Jardin Melo','Londrina',3001,'Predio A','Sao Paulo','SP',1,null),
   ('157965483','Jardina Inapolis','Merge Verde',08,'','Sao Paulo','SP',2,null);
   
   -- inseri dados em Veiculo
INSERT INTO Veiculo(Modelo,Placa,fkVendedor,fkSensor) VALUES
   ('Scania','DOG1234',1,3),
   ('Scania','CAT5656',3,4),
   ('Scania','LOL1313',3,5);     
   

   
   
   
   
