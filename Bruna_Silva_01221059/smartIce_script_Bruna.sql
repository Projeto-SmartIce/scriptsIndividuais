create database smartIce;
use smartIce;

create table Cliente (
idCliente int primary key auto_increment,
razaoSocial varchar (80),
nomeFantasia varchar (45),
CNPJ varchar (30),
CEP varchar(30), 
enderecoMatriz varchar (80),
bairro varchar(45),
estado varchar(45),
UF char(2),
responsavel varchar (45),
telefone varchar (11),
email varchar (80)
);

insert into Cliente values 
(null, 'UNILEVER BRASIL LTDA', 'Kibon', '61.068.276/0001-04', '04543-011', 'Av. Presidente Juscelino Kubitschek, 1309, 12ºA', 'Itaim Bibi', 'São Paulo', 'SP',
'Renato Rodrigues','115897-8954', 'renato.rodrigues@kibon.com'),
(null, 'NESTLÉ BRASIL LTDA', 'Nestlé', '60.409.075/0001-52', '04730-090', 'Av. das Nações Unidas, 17007', 'Várzea de Baixo', 'São Paulo', 'SP',
'Natalia Sena', '115874-3216', 'natalia.senha@nestle.com'),
(null, 'OGGI SORVETES LTDA', 'Oggi Alimentos', '09.507.293/0001-72', '29111-175', 'Avenida Quinta, 30', 'COBILANDIA', 'VILA VELHA', 'ES', 
'Danielle Mauda', '115472-3986', 'daniele.mauda@oggi.com'),
(null, 'Euphoria Ice Cream Comercio de Alimentos LTDA', 'Ben & Jerry´s', '01426-003', '20.241.041/0001-87', 'Rua Oscar Freire, 957, Mznino Sala 1', 
'Cerqueira Cesar', 'São Paulo', 'SP', 'Luciana Panato', '115697-4321','luciana.panato@benejerrys.com');

create table veiculo (
idVeiculo int primary key auto_increment,
transportadora varchar(45),
empresaResponsavel varchar(45),
modelo varchar(45),
placa varchar (10)
);

insert into veiculo values 
(null, 'transtec', 'Kibon', 'mercedes', 'def5487'),
(null, 'transIce', 'Nestlé', 'mercades', 'ghi7845'),
(null, 'transgold', 'Ben & Jerry`s', 'fiat', 'abc1231'),
(null, 'transportz', 'Oggi', 'fiat', 'abw4572');

create table freezer (
idFreezer int primary key auto_increment,
empresaResponsavel varchar(45),
litros int,
marca varchar(45)
);

insert into freezer values 
(null, 'Kibon', 80, 'Brastemp'),
(null, 'Nestlé', 90, 'gelatec'),
(null, 'Ben & Jerry`s', 80, 'Brastemp'), 
(null, 'Oggi', 90, 'gelatec');

create table sensor (
idSensor int primary key auto_increment,
localizacao varchar (20),
check (localizacao = 'freezer' or localizacao = 'transporte'),
fkCliente int,
foreign key (fkCliente) references Cliente (idCliente),
fkFreezer int, 
foreign key (fkFreezer) references freezer (idFreezer),
fkVeiculo int,
foreign key (fkVeiculo) references veiculo (idVeiculo)
);

insert into sensor values 
(null, 'freezer', 1, 1, null),
(null, 'transporte', 2, null, 1),
(null, 'transporte', 3, null, 2),
(null, 'transporte', 4, null, 4),
(null, 'freezer', 2, 3, null),
(null, 'freezer', 4, 2, null),
(null, 'freezer', 3, 4, null),
(null, 'transporte', 1, null, 3); 

create table registro (
idRegistro int primary key auto_increment,
temperatura float,
dataHora datetime default current_timestamp,
fkSensor int,
foreign key (fkSensor) references sensor (idSensor)
);

insert into registro values
(null, 10.0, null, 1),
(null, 12.0, null, 3),
(null, 10.0, null, 2),
(null, 10.0, null, 4),
(null, 18.0, null, 4),
(null, 10.0, null, 2),
(null, 11.0, null, 1),
(null, 10.0, null, 3),
(null, 13.0, null, 1),
(null, 10.0, null, 2);

select * from sensor;
select * from cliente; 
select * from veiculo;
select * from freezer;
select * from registro;   
