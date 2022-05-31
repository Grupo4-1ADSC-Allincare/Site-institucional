CREATE DATABASE Allincare;
USE Allincare;

CREATE TABLE Transportadora(
	idTransportadora INT PRIMARY KEY AUTO_INCREMENT,
	nomeFantasia VARCHAR(45),
    razaoSocial VARCHAR(45),
    nomeRepresentante VARCHAR(45)
);

CREATE TABLE UsuarioTransp(
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nomeUsuario VARCHAR(45),
    cpfUsuario VARCHAR(14) UNIQUE,
    numCelular VARCHAR(14) UNIQUE,
    emailUsuario VARCHAR(45) UNIQUE,
    senhaUsuario VARCHAR(45)
);

CREATE TABLE CargoUsuario(
	fkUsuario INT,
    FOREIGN KEY (fkUsuario) REFERENCES UsuarioTransp(idUsuario),
    fkTransportadora INT,
    FOREIGN KEY (fkTransportadora) REFERENCES Transportadora(idTransportadora),
    nomeCargo VARCHAR(11),
    CHECK (nomeCargo = 'Coordenador' OR nomeCargo = 'Supervisor' OR nomeCargo = 'Estagiário'),
    cargaHoraria TIME
);

CREATE TABLE EnderecoTransp(
	idEnd INT PRIMARY KEY AUTO_INCREMENT,
    fkTransportadora INT,
    FOREIGN KEY (fkTransportadora) REFERENCES Transportadora(idTransportadora),
    cepEnd VARCHAR(9),
    numEnd INT,
    complementoEnd VARCHAR(45),
    cnpjTransportadora VARCHAR(18) UNIQUE
);

CREATE TABLE ContatoTransp(
	idContato INT PRIMARY KEY AUTO_INCREMENT,
    fkTransportadora INT,
    FOREIGN KEY (fkTransportadora) REFERENCES Transportadora(idTransportadora),
    numeroContato VARCHAR(14) UNIQUE,
    tipoNum VARCHAR(9),
    CHECK (tipoNum = 'Fixo' OR tipoNum = 'Celular' OR tipoNum = 'Whatsapp' OR tipoNum = 'Comercial')
); 

CREATE TABLE Veiculo(
	idVeiculo INT PRIMARY KEY AUTO_INCREMENT,
    fkTransportadora INT,
    FOREIGN KEY (fkTransportadora) REFERENCES Transportadora(idTransportadora),
	gps VARCHAR(3),
    CHECK (gps = 'ON' OR gps = 'OFF'),
	placa VARCHAR(6) UNIQUE,
	qtdLotesVacina INT,
	modelo VARCHAR(45)
);

CREATE TABLE HistMedida(
	idHistMedida INT PRIMARY KEY AUTO_INCREMENT,
	fkVeiculo INT,
    FOREIGN KEY (fkVeiculo) REFERENCES Veiculo(idVeiculo),
    valorTemperatura INT,
	dataHora DATETIME DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM Transportadora;
SELECT * FROM UsuarioTransp;
SELECT * FROM CargoUsuario;
SELECT * FROM EnderecoTransp;
SELECT * FROM ContatoTransp;
SELECT * FROM Veiculo;
SELECT * FROM HistMedida;

INSERT INTO Transportadora
VALUES (NULL,'FreteBras','FreteBras Internet e Serviços LTDA','Larissa Freitas'),
		(NULL,'Loggi','Loggi Tecnologia LTDA','Fabiano Rodrigues'),
        (NULL,'Lalamove','LALAMOVE TECNOLOGIA (BRASIL) LTDA','Cecília Almeida');

INSERT INTO UsuarioTransp
VALUES (NULL,'Edson Feitoza','111.111.111-11','11982993672','edson.f@gmail.com','123edson'),
		(NULL,'Guilherme Tarifa','111.111.111-00','11982133672','guilherme.t@gmail.com','123guilherme'),
		(NULL,'Paula Cristina','222.222.222-22','11953660154','paula.c@gmail.com','123paula'),
        (NULL,'Kauan Mendes','222.222.222-00','11953987154','kauan.m@gmail.com','123kauan'),
        (NULL,'Alice Santos','333.333.333-33','11980213320','alice.s@gmail.com','123alice'),
        (NULL,'Emilly Dantas','333.333.333-00','11980998320','emilly.d@gmail.com','123emilly');
        
INSERT INTO CargoUsuario
VALUES ('1','2','Coordenador','08:00:00'),
		('2','3','Supervisor','10:00:00'),
        ('3','1','Estagiário','06:00:00'),
        ('4','2','Coordenador','08:00:00'),
        ('5','3','Supervisor','10:00:00'),
        ('6','1','Estagiário','06:00:00');
        
INSERT INTO EnderecoTransp
VALUES (NULL,'1','89872-000','123','12º Andar','00000000000'),
		(NULL,'2','89843-000','87','Bloco 5','11111111111'),
        (NULL,'3','89859-000','3245','3º Andar','22222222222');
        
INSERT INTO ContatoTransp
VALUES (NULL,'1','11954678342','Comercial'),
		(NULL,'1','11923779342','Whatsapp'),
        (NULL,'2','1123383427','Fixo'),
        (NULL,'2','11954627653','Celular'),
        (NULL,'3','11922278342','Whatsapp');
        
INSERT INTO Veiculo
VALUES (NULL,'1','ON','KRF395','2','Volks'),
		(NULL,'1','ON','HOA639','2','Volks'),
		(NULL,'1','ON','PHF245','2','Mercedes'),
		(NULL,'2','ON','JÇS846','2','Mercedes'),
		(NULL,'2','ON','IHF465','2','Volks'),
		(NULL,'2','ON','XCH824','2','Volvo'),
        (NULL,'3','ON','PHF321','2','Mercedes'),
		(NULL,'3','ON','JDN846','2','Volvo'),
		(NULL,'3','ON','LKO465','2','Mercedes'),
		(NULL,'3','ON','XCB634','2','Volvo');
        
INSERT INTO HistMedida
VALUES (NULL,'1','26',CURRENT_TIMESTAMP);