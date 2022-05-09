-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/* para workbench - local - desenvolvimento */
CREATE DATABASE Allincare;
USE Allincare;

CREATE TABLE Transportadora(
	idTransportadora INT PRIMARY KEY AUTO_INCREMENT,
	nomeFantasia VARCHAR(40),
    razaoSocial VARCHAR(40),
    cnpjTransportadora VARCHAR(20) UNIQUE,
    nomeRepresentante VARCHAR(40)
);

CREATE TABLE UsuarioTransp(
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    fkTransportadora INT,
    FOREIGN KEY (fkTransportadora) REFERENCES Transportadora(idTransportadora),
    nomeUsuario VARCHAR(40),
    cargoUsuario VARCHAR(13),
    CHECK (cargoUsuario = 'Administrador' OR cargoUsuario = 'Funcionário'),
    cpfUsuario VARCHAR(14) UNIQUE,
    numCelular VARCHAR(11) UNIQUE,
    emailUsuario VARCHAR(50) UNIQUE,
    senhaUsuario VARCHAR(20)
);

CREATE TABLE EnderecoTransp(
	idEnd INT PRIMARY KEY AUTO_INCREMENT,
    fkTransportadora INT,
    FOREIGN KEY (fkTransportadora) REFERENCES Transportadora(idTransportadora),
    cepEnd VARCHAR(10),
    numEnd INT,
    complementoEnd VARCHAR(20)
);

CREATE TABLE ContatoTransp(
	idContato INT PRIMARY KEY AUTO_INCREMENT,
    fkTransportadora INT,
    FOREIGN KEY (fkTransportadora) REFERENCES Transportadora(idTransportadora),
    numeroContato VARCHAR(11) UNIQUE,
    tipoNum VARCHAR(9),
    CHECK (tipoNum = 'Fixo' OR tipoNum = 'Celular' OR tipoNum = 'Whatsapp' OR tipoNum = 'Comercial')
); 

CREATE TABLE Veiculo(
	idVeiculo INT PRIMARY KEY AUTO_INCREMENT,
    fkTransportadora INT,
    FOREIGN KEY (fkTransportadora) REFERENCES Transportadora(idTransportadora),
	gps VARCHAR(3),
    CHECK (gps = 'ON' OR gps = 'OFF'),
	placa VARCHAR(10) UNIQUE,
	qtdLotesVacina INT,
    qtdDispositivos INT,
	modelo VARCHAR(20)
);

CREATE TABLE Sensor(
	idSensor INT PRIMARY KEY AUTO_INCREMENT,
	fkVeiculo INT,
    FOREIGN KEY (fkVeiculo) REFERENCES Veiculo(idVeiculo),
	nomeDispositivo VARCHAR(20),
    localidade VARCHAR(20),
	situacao VARCHAR(3),
    CHECK (situacao = "ON" OR situacao = "OFF"),
    tipoSensor VARCHAR(10),
    nomeSensor VARCHAR(20)
);

CREATE TABLE Medida(
	idMedida INT PRIMARY KEY AUTO_INCREMENT,
	fkSensor INT,
    FOREIGN KEY (fkSensor) REFERENCES Sensor(idSensor),
    valorTemperatura VARCHAR(40),
	dataHora DATETIME DEFAULT CURRENT_TIMESTAMP
);





/* para sql server - remoto - produção */

CREATE TABLE usuario (
	id INT PRIMARY KEY IDENTITY(1,1),
	nome VARCHAR(50),
	email VARCHAR(50),
	senha VARCHAR(50),
);

CREATE TABLE aviso (
	id INT PRIMARY KEY IDENTITY(1,1),
	titulo VARCHAR(100),
    descricao VARCHAR(150),
	fk_usuario INT FOREIGN KEY REFERENCES usuario(id)
); 

CREATE TABLE medida (
	id INT PRIMARY KEY IDENTITY(1,1),
	temperatura DECIMAL,
	umidade DECIMAL,
	momento DATETIME,
	fk_aquario INT
);


