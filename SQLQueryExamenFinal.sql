CREATE DATABASE ExamenFinal
GO

USE ExamenFinal
GO

CREATE TABLE PartidoPolitico
(
	SiglasPartido varchar(7) PRIMARY KEY,
	NombrePartido varchar(50)
)
GO

CREATE TABLE Encuestas (
    NumeroEncuesta int identity(1,1) PRIMARY KEY,
    Nombre varchar(50) NOT NULL,
    Edad int NOT NULL,
	CorreoElectronico varchar(50) NOT NULL,
	PartidoP varchar(7) NOT NULL,
	CONSTRAINT UQ_Correo UNIQUE (CorreoElectronico),
	CONSTRAINT fk_siglaspartido FOREIGN KEY(PartidoP) REFERENCES PartidoPolitico(SiglasPartido)
)
GO

INSERT INTO PartidoPolitico(SiglasPartido, NombrePartido) VALUES
('PUSC', 'Partido Unidad Social Cristiana'),
('PAC', 'Partido Acción Ciudadana'),
('PLN', 'Partido Liberación Nacional'),
('FA', 'Frente Amplio'),
('PNG', 'Partido Nueva Generación')
GO

SELECT * FROM PartidoPolitico
GO

INSERT INTO Encuestas(Nombre, Edad, CorreoElectronico, PartidoP) VALUES
('Oscar Isaac', 44, 'oscar@examenfinal.net', 'PAC'),
('Jose Pedro', 48, 'pedro@examenfinal.net', 'PLN'),
('Tom Holland', 27, 'tom@examenfinal.net', 'PNG'),
('Zendaya', 27, 'zendaya@examenfinal.net', 'FA')
GO

SELECT * FROM Encuestas
GO

CREATE PROCEDURE INSERTAR_ENCUESTA
@NOMBRE VARCHAR(50),
@EDAD int,
@CORREOELECTRONICO VARCHAR(50),
@PARTIDOP VARCHAR(7)
 AS 
	BEGIN
		INSERT INTO Encuestas(Nombre, Edad, CorreoElectronico, PartidoP) VALUES (@NOMBRE, @EDAD, @CORREOELECTRONICO, @PARTIDOP)
	END
GO

CREATE PROCEDURE ReporteGeneral
	AS
		BEGIN
			SELECT E.NumeroEncuesta as [Número de Encuesta], E.Nombre as [Nombre Encuestante], E.Edad, E.CorreoElectronico as [Correo Electrónico], PartidoP + ' - ' + NombrePartido as [Partido Político]
			FROM Encuestas E
			INNER JOIN PartidoPolitico P ON E.PartidoP = P.SiglasPartido
		END
GO

CREATE PROCEDURE CONSULTA_PARTIDOS
AS
	BEGIN
		SELECT SiglasPartido + ' - ' + NombrePartido as Partido, SiglasPartido from PartidoPolitico
	END
GO

