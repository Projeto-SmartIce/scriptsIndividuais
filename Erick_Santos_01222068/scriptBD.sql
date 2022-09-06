CREATE DATABASE prototiposprint;
USE prototiposprint;

CREATE TABLE tipoPessoa(
  id_tipo_pessoa INT NOT NULL,
  tipo VARCHAR(45) NULL
  );

CREATE TABLE Cliente(
  idCliente INT NOT NULL,
  nome VARCHAR(45) NULL,
  email VARCHAR(250) NULL,
  telefone VARCHAR(20) NULL,
  cpf_cnpj VARCHAR(50) NULL,
  rg VARCHAR(50) NULL,
  endereco VARCHAR(150) NULL,
  cidade VARCHAR(60) NULL,
  estado VARCHAR(30) NULL,
  cep INT(8) NULL,
  obs VARCHAR(255) NULL,
  telefone2 VARCHAR(20) NULL,
  numero VARCHAR(100) NULL,
  bairro VARCHAR(60) NULL,
  tipo_pessoa INT NULL,
  tipo_pessoa_id_tipo_pessoa INT
);

CREATE TABLE freezer(
  idfreezer INT NOT NULL,
  descricao VARCHAR(120) NULL,
  dta DATETIME NULL,
  fornecedor_id INT
);

CREATE TABLE filiais(
  idfornecedor INT NOT NULL,
  cpf_cnpf INT(25) NULL,
  rg VARCHAR(25) NULL,
  nome VARCHAR(45) NULL,
  bairro VARCHAR(150) NULL,
  endereco VARCHAR(100) NULL,
  numero DECIMAL(10,0) NULL,
  cep INT(10) NULL,
  cidade VARCHAR(60) NULL,
  estado VARCHAR(30) NULL,
  telefone INT(15) NULL,
  telefone2 INT(15) NULL,
  contato VARCHAR(45) NULL,
  email VARCHAR(120) NULL,
  obs VARCHAR(120) NULL,
  tipo_pessoa INT(11) NULL,
  tipo_pessoa_id_tipo_pessoa INT NOT NULL,
  freezer_idfreezer INT NOT NULL
);

CREATE TABLE usuario(
  idusuario INT NOT NULL,
  nome VARCHAR(60) NULL,
  senha VARCHAR(35) NULL
);

ALTER TABLE Cliente ADD FOREIGN KEY (tipo_pessoa_id_tipo_pessoa) REFERENCES tipoPessoa(id_tipo_pessoa);
ALTER TABLE filiais ADD FOREIGN KEY (freezer_idfreezer) REFERENCES freezer(idfreezer);

INSERT INTO Cliente (idCliente, nome, email, telefone, cpf_cnpj, rg, endereco, cidade, estado, cep, obs, telefone2, numero, bairro, tipo_pessoa, tipo_pessoa_id_tipo_pessoa) VALUES
	(1,'Erick','erick@gmail.com','11956797898','56997832507','54313688X','Rua 2','São Paulo', 'SP', '0476420', 'prx a praça','1195632-8745',151,'Eldorado',1,1);
    
INSERT INTO usuario (idusuario, nome, senha) VALUES
	(1,'Erick','abc20200');
    
INSERT INTO tipoPessoa (id_tipo_pessoa, tipo) VALUES
    (1,'Fornecedor');
    
INSERT INTO freezer (idfreezer, descricao, dta, forncedor_id) VALUES
	(100,'Trasnporte A','2016-01-01 08:00:00',5);
    
INSERT INTO filiais (idfornecedor, cpf_cnpf,rg,nome,bairro,endereco,numero,cep,cidade,estado,telefone,telefone2,contato,email,obs,tipo_pessoa,tipo_pessoa_id_tipo_pessoa,freezer_idfreezer) VALUES
	(10,63489700295,694241667,'COMPANYB','Jardim Europa', 'Rua Paris',147,06687430,'São Pualo','SP',1195648785,11936597512,'b@gmail.com','company@gmail.com','prx padaria',1,10,5);
	



