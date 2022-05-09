CREATE DATABASE Allincare;
USE Allincare;

CREATE TABLE Transportadora(
	idTransportadora INT PRIMARY KEY AUTO_INCREMENT,
	nomeFantasia VARCHAR(50),
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

SELECT * FROM Transportadora;
SELECT * FROM UsuarioTransp;
SELECT * FROM EnderecoTransp;
SELECT * FROM ContatoTransp;
SELECT * FROM Veiculo;
SELECT * FROM Sensor;
SELECT * FROM Medida;

INSERT INTO Transportadora
VALUES (NULL,'FreteBras','FreteBras Internet e Serviços LTDA','11.111.111/0001-11','Larissa Freitas'),
		(NULL,'Loggi','Loggi Tecnologia LTDA','22.222.222/0001-22','Fabiano Rodrigues'),
        (NULL,'Lalamove','LALAMOVE TECNOLOGIA (BRASIL) LTDA','33.333.333/0001-33','Cecília Almeida');
        
INSERT INTO UsuarioTransp
VALUES (NULL,'1','Edson Feitoza','Administrador','111.111.111-11','11982993672','edson.feitoza@gmail.com','123edson'),
		(NULL,'1','Guilherme Tarifa','Funcionário','111.111.111-00','11982133672','guilherme.tarifa@gmail.com','123guilherme'),
		(NULL,'2','Paula Cristina','Administrador','222.222.222-22','11953660154','paula.cristina@gmail.com','123paula'),
        (NULL,'2','Kauan Mendes','Funcionário','222.222.222-00','11953987154','kauan.mendes@gmail.com','123kauan'),
        (NULL,'3','Alice Santos','Administrador','333.333.333-33','11980213320','alice.santos@gmail.com','123alice'),
        (NULL,'3','Emilly Dantas','Funcionário','333.333.333-00','11980998320','emilly.dantas@gmail.com','123emilly');
        
INSERT INTO EnderecoTransp
VALUES (NULL,'1','89872-000','123','12º Andar'),
		(NULL,'2','89843-000','87','Bloco 5'),
        (NULL,'3','89859-000','3245','3º Andar');
        
INSERT INTO ContatoTransp
VALUES (NULL,'1','11954678342','Comercial'),
		(NULL,'1','11923779342','Whatsapp'),
        (NULL,'2','1123383427','Fixo'),
        (NULL,'2','11954627653','Celular'),
        (NULL,'3','11922278342','Whatsapp');
        
INSERT INTO Veiculo
VALUES (NULL,'1','ON','QPR3C77','50','2','VUC'),
		(NULL,'1','ON','ASD4G56','100','2','Caminhão ¾'),
        (NULL,'2','ON','LKJ1O98','150','2','Toco'),
        (NULL,'2','ON','BGC5H90','200','2','Truck'),
        (NULL,'3','ON','OKJ7L43','250','2','Carreta'),
        (NULL,'3','ON','UHJ9M32','300','2','Caminhão combinado');
        
INSERT INTO Sensor
VALUES (NULL,'1','Arduíno UNO','Carroceria','ON','LM35','Temperatura'),
		(NULL,'2','Arduíno UNO','Traseira','ON','LM35','Temperatura'),
        (NULL,'3','Arduíno UNO','Carroceria','ON','LM35','Temperatura'),
        (NULL,'4','Arduíno UNO','Traseira','ON','LM35','Temperatura'),
        (NULL,'5','Arduíno UNO','Carroceria','ON','LM35','Temperatura'),
        (NULL,'6','Arduíno UNO','Traseira','ON','LM35','Temperatura');
        
INSERT INTO Medida
VALUES (NULL,'1','32°',CURRENT_TIMESTAMP),
		(NULL,'1','3°',CURRENT_TIMESTAMP),
        (NULL,'2','12°',CURRENT_TIMESTAMP),
        (NULL,'2','40°',CURRENT_TIMESTAMP),
        (NULL,'3','7°',CURRENT_TIMESTAMP),
        (NULL,'3','15°',CURRENT_TIMESTAMP);
