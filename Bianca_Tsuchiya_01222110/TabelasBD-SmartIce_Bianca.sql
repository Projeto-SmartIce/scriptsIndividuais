CREATE DATABASE SmartIce;
Use SmartIce;

/*CHAVE ESTRANGEIRA FREEZER, TRANSPORTE, SENSOR*/
CREATE TABLE cliente (
idCliente int primary key auto_increment,
razao_social varchar(50),
nome_fantasia varchar(50),
cnpj varchar(20),
responsavel varchar(50),
endereco varchar(100),
telefone varchar(14),
email varchar(50),
tipo varchar(50) constraint chkTipo CHECK
	(tipo in('matriz', 'filial'))
);

/* CHAVE ESTRANGEIRA FREEZER OU TRANSPORTE - Tirar campo localização*/
CREATE TABLE sensor (
idSensor char(5) primary key,
localizacao varchar(50) constraint chkLocal CHECK
	(localizacao in('freezer', 'transporte'))
);

/* TEREMOS QUE CRIAR UMA TABELA ASSOCIATIVA - sensor_temperatura (relacionamento N,N)*/
CREATE TABLE temperatura (
idtemperatura int primary key auto_increment,
celsius decimal(5,1),
dt_registro datetime
);

/* CHAVE ESTRANGEIRA CLIENTE */
CREATE TABLE freezer
(
	idFreezer int primary key,
    temperatura_ideal decimal(5,2)
);

/* CHAVE ESTRANGEIRA CLIENTE */
CREATE TABLE transporte
(
	idCarreta int primary key,
    temperatura_ideal decimal(5,2),
    placa_veiculo int
);
/*(?)Duvida sobre placa_veiculo int ou varchar*/


INSERT INTO cliente VALUES
(null, 'OGGI COMERCIO DE SORVETES LTDA', 'LOJA DA FABRICA OGGI SORVETES & CIA', '23.321.726/0001-21', 'Eliane Rodrigues','Rua Jorge Rizk, 108 - Praia das Gaivotas, Vila Velha - ES', '(27)99914-5028','e.rodrigues@oggi.com', 'matriz'),
(null, 'UNILEVER BRASIL LTDA', 'Kibon', '61.068.276/0001-04', 'Renato Rodrigues', 'Av. Presidente Juscelino Kubitschek - 1309, Itaim Bibi, São Paulo - SP', '(11)5897-8954', 'renato.rodrigues@kibon.com', 'filial'),
(null, 'NESTLÉ BRASIL LTDA', 'Nestlé', '60.409.075/0001-52', 'Natalia Sena', 'Av. das Nações Unidas, 17007 - Várzea de Baixo, São Paulo - SP', '(11)5874-3216', 'natalia.senha@nestle.com', 'matriz'),
(null, 'Euphoria Ice Cream Comercio de Alimentos LTDA', 'Ben & Jerrys', '20.241.041/0001-87 ', 'Susana Vieira', 'Rua Oscar Freire, 957 - Cerqueira Cesar, São Paulo - SP', '(11) 3218-2622', 'susana.vieira@benejerrys.com','matriz');

INSERT INTO sensor VALUES
('1456F', 'freezer'),
('5298T', 'transporte'),
('3789F', 'freezer'),
('2998F', 'freezer'),
('2343T', 'transporte');

INSERT INTO temperatura VALUES
(null, -12.81, '2022-09-06 08:00:00'),
(null, -12.74, '2022-09-06 08:05:00'),
(null, -12.78, '2022-09-06 08:10:00'),
(null, -13.10, '2022-09-06 08:15:00'),
(null, -13.16, '2022-09-06 08:20:00');

INSERT INTO freezer VALUES
('78907', -13.02),
('98776', -15.40),
('13475', -12.00);

INSERT INTO transporte VALUES
('98346', -25.02, 231075),
('13445', -18.02, 303256);

SELECT * FROM cliente;
SELECT * FROM sensor;
SELECT * FROM temperatura;
SELECT * FROM freezer;
SELECT * FROM transporte;

