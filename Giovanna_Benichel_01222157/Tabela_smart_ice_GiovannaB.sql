create database SmartIce;
use SmartIce;

Create table cliente (  
id_cliente int primary key auto_increment,
cnpj char (20),
razao_social varchar (60),
nome_fantasia varchar (60),
endereco varchar (50),
contato varchar (30),
email varchar (30)
-- ver se precisa realemnte colocar o tipo constraint chkTipo Check (faz a validaçao do que está sendo inserido no campo, ou seja, qualquer coisa que nao esteja inserido, ele dá erro). 
);
 
 create table usuario (
 id_Usuario int primary key auto_increment,
 login varchar (30),
 senha varchar (30),
 id_cliente int,
 -- fazando uma chave estrangeira para referenciar o id da outra tabela (para saber qual cliente esse usuário está relacionando - Kibon, Nestle..etc).
 foreign key (id_cliente) references cliente (id_cliente)  
 );
  create table sensor_smart_ice (
 id_smart_ice int primary key auto_increment,
 id_cliente int,
 foreign key (id_cliente) references cliente (id_cliente)
 );
 
 create table transporte (
 id_caminhao int primary key auto_increment,
 placa_veiculo varchar (10),
 id_cliente int,
 -- aqui nos estamos colocando qual sensor esse transporte está usando, (exemplo - caminhao da kibon esta com o sensor 157).
 id_smart_ice int,
 foreign key (id_cliente) references cliente (id_cliente),
 foreign key (id_smart_ice) references sensor_smart_ice (id_smart_ice)
 );
 
 create table temperatura (
 id_temperatura int primary key auto_increment,
 celsius decimal (5,1),
 dt_medicao datetime
 ); 
 
 create table freezer ( 
 id_freezer int primary key auto_increment,
 id_cliente int,
 id_smart_ice int,
 foreign key (id_cliente) references cliente (id_cliente),
 foreign key (id_smart_ice) references sensor_smart_ice (id_smart_ice)
 );
 
 create table medicoes_ideais ( 
 id_medicao_ideal int primary key auto_increment,
 temperatura_max decimal (5,2),
 temperatura_min decimal (5,2),
  id_cliente int,
 foreign key (id_cliente) references cliente (id_cliente)
 );
 
 -- TABELAS 
 
 insert into cliente (cnpj, razao_social, nome_fantasia, endereco, contato, email) values 
 ('15.640.971/0001-73','sapori del giorno gastronomia ltda','Gelato Boutique','Rua Pamplona, 1021','(11) 3974-1173','boutique@gmail.com.br'),
 ('20.241.041/0032-83','Euphoria Ice Cream Comercio De Alimentos Ltda','Ben & Jerrys',' R. Oscar Freire, 957','(11) 3213-9127','ben@gmail.com.br'),
 ('32.798.454/0001-46','M.t. Fontenele Comercio de Alimentos','Casa Toffo',' Rua Paulo Orozimbo, 613','(11) 3271-8331','casatoffo@gmail.com.br'),
 ('61.068.276/0001-04','DAMP SORVETES LTDA','Damp Sorvetes','Rua do Manifesto, 1937','(11) 2274-0746','sorvetesdamp@gmail.com.br'),
 ('11.950.487/0066-35','Milano comercio varejista de alimentos s.a','Bacio di Latte','Av Doutor Antonio Maria Laet, N. 566','(11) 3083-6478','baciodilatte@gmail.com.br');
 
 INSERT INTO usuario (login, senha, id_cliente) values
('Gelato','Gelato123',1),              
('Benjerrys','Benjerrys123',2),
('Casatoffo','Casatoffo123',3),
('Dampsorvetes','Dampsorvetes123',4),
('Baciodi','Baciodi123',5); 

INSERT INTO sensor_smart_ice (id_cliente) values
('1'),
('2'),
('3'),
('4'),
('5');

INSERT INTO transporte (placa_veiculo, id_cliente, id_smart_ice) values
('ADS-0409','1','1'),
('KNO-9990','2','2'),
('MML-9450','3','3'),
('MLC-1578','4','4'),
('GIB-1111','5','5');

INSERT INTO temperatura (celsius, dt_medicao) values
(-12.81, '2022-09-06 08:00:00'),
(-12.74, '2022-09-06 08:05:00'),
(-12.78, '2022-09-06 08:10:00'),
(-13.10, '2022-09-06 08:15:00'),
(-13.16, '2022-09-06 08:20:00');

INSERT INTO freezer (id_cliente, id_smart_ice) values
('1','1'),
('2','2'),
('3','3'),
('4','4'),
('5','5');
-- Coloquei numeros ficticios, mas iremos auterar para as temperaturas reais de acordo com a pesquisa
INSERT INTO medicoes_ideais (temperatura_max, temperatura_min, id_cliente) values
(-25.02, -25.02,'1'),
(-17.02, -17.02,'2'),
(-17.02, -17.02,'3'),
(-18.02, -18.02,'4'),
(-18.02, -18.02,'5');

select * from cliente;  
select * from usuario;
select * from transporte;
select * from sensor_smart_ice;
select * from temperatura;
select * from freezer;
select * from medicoes_ideais;
