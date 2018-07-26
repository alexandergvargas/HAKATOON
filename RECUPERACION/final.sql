

create database RECUPERACION
USE RECUPERACION

CREATE TABLE Bus (
    id_bus int  NOT NULL,
    color_bus varchar(50)  NOT NULL,
    placa_bus varchar(50)  NOT NULL,
    cantida_bus char(99)  NOT NULL,
    destino_bus varchar(50)  NOT NULL,
    horasa_bus varchar(50)  NOT NULL,
    horalle_bus varchar(50)  NOT NULL,
    fechavi_bus date  NOT NULL,
    costvi_bus money  NOT NULL,
    poster_bus varchar(50)  NOT NULL,
    Trabajador_id_traba int  NOT NULL,
    PASAJERO_id_pasa int  NOT NULL,
    CONSTRAINT Bus_pk PRIMARY KEY (id_bus)
);

-- Table: PASAJERO
CREATE TABLE PASAJERO (
    id_pasa int  NOT NULL,
    nom_pasa varchar(50)  NOT NULL,
    ape_pasa varchar(50)  NOT NULL,
    dni_pasa char(8)  NOT NULL,
    cel_pasa char(9)  NOT NULL,
    dire_pasa varchar(50)  NOT NULL,
    raso_pasa varchar(50)  NOT NULL,
    CONSTRAINT PASAJERO_pk PRIMARY KEY (id_pasa)
);

-- Table: Sucursales
CREATE TABLE Sucursales (
    id_sucu int  NOT NULL,
    nom_sucu varchar(50)  NOT NULL,
    esta_sucu char(99)  NOT NULL,
    Bus_id_bus int  NOT NULL,
    CONSTRAINT Sucursales_pk PRIMARY KEY (id_sucu)
);

-- Table: Trabajador
CREATE TABLE Trabajador (
    id_traba int  NOT NULL,
    nom_traba varchar(50)  NOT NULL,
    ape_traba varchar(50)  NOT NULL,
    dire_traba varchar(50)  NOT NULL,
    dni_traba char(8)  NOT NULL,
    cel_traba char(9)  NOT NULL,
    area_tra varchar(50)  NOT NULL,
    eda_tra char(99)  NOT NULL,
    CONSTRAINT Trabajador_pk PRIMARY KEY (id_traba)
);

-- foreign keys
-- Reference: Bus_PASAJERO (table: Bus)
ALTER TABLE Bus ADD CONSTRAINT Bus_PASAJERO
    FOREIGN KEY (PASAJERO_id_pasa)
    REFERENCES PASAJERO (id_pasa)  
   
;

-- Reference: Bus_Trabajador (table: Bus)
ALTER TABLE Bus ADD CONSTRAINT Bus_Trabajador
    FOREIGN KEY (Trabajador_id_traba)
    REFERENCES Trabajador (id_traba)  

;

-- Reference: Sucursales_Bus (table: Sucursales)
ALTER TABLE Sucursales ADD CONSTRAINT Sucursales_Bus
    FOREIGN KEY (Bus_id_bus)
    REFERENCES Bus (id_bus)  
   
;




select * from  Trabajador


insert into trabajador (id_Traba,nom_Traba,ape_Traba,dire_Traba,dni_Traba,cel_Traba,area_tra,eda_tra)
values
('1','Alexander','Vargas','Mala','72252571','991915461','Contabilidad','25'),
('2','Lopez','Castilla','Mala','72252571','991915461','Estadistica','25'),
('3','Ramos','Saman','Mala','72252571','991915461','Administracion','30'),
('4','Paolo','Guerrero','Mala','72252571','991915461','Contabilidad','40'),
('5','Elsa','Vargas','Mala','72252571','991915461','Contabilidad','45')
go






select * from  PASAJERO

insert into PASAJERO(id_pasa,nom_pasa,ape_pasa,dni_pasa,cel_pasa,dire_pasa,raso_pasa)
values
('1','Sara','Sanches','72252571','991915461','Mala JR','I.E.P Valle Grande'),
('2','Tara','Rodriguez','72252571','991915461','Porvenir','Opcional'),
('3','Juana','Viscarra','72252571','991915461','Lima SJL','I.E.P Fractal'),
('4','Berta','Vilcherez','72252571','991915461','Callao','Opcional'),
('5','Pedro','Quispe','72252571','991915461','San Juan','E.T. Soyus')
go

select * from Sucursales

insert into Sucursales(id_sucu,nom_sucu,esta_sucu,Bus_id_bus)
values
('1','Ica','12','1'),
('2','Ica','12','2'),
('3','Ica','12','3'),
('4','Ica','12','4'),
('5','Ica','12','5')
go
  

select * from  Bus

insert into Bus (id_bus,color_bus,placa_bus,cantida_bus,destino_bus,horasa_bus,horalle_bus,fechavi_bus,costvi_bus,poster_bus)
values

('2','rojo','FRF25','3','CAÑETE','9:00AM','1:00PM','01/02/2000','50','NO'),
('3','amarillo','RDF13','8','CHINCHA','10:00AM','10:00PM','01/02/2000','100','NO'),
('4','rojo','DFE74','8','PISCO','1:00PM','8:00AM','01/02/2000','200','SI'),
('5','rojo','ASQ32','10','ICA','9:00PM','1:00AM','01/02/2000','50','SI')
go


CREATE PROCEDURE sp_Trabajador
    @NOMBRE VARCHAR(50),
    @APELLIDO VARCHAR(50)
AS
BEGIN
    INSERT INTO Trabajador
        (nom_traba,ape_traba) 
    VALUES
        (UPPER(@NOMBRE), UPPER(@APELLIDO))
END
GO




CREATE PROCEDURE sp_Trabajadora
    @NOMBRE VARCHAR(50),
    @DNI INT
	as
BEGIN
UPDATE Trabajador 
SET nom_traba = @NOMBRE  
WHERE dni_traba = @DNI
END

CREATE PROCEDURE sp_traba
    @NOMBRE VARCHAR(50),
    @APELLIDO VARCHAR(50),
    @DNI VARCHAR(50),
	@CELULAR CHAR (8)
	AS
 
BEGIN
    INSERT INTO Trabajador
        (nom_traba,ape_traba,dni_traba,cel_traba)
    VALUES
        (UPPER(@NOMBRE),UPPER(@APELLIDO),UPPER (@DNI),UPPER(@CELULAR))
END
GO



CREATE VIEW vw_listrabaja AS
SELECT nom_traba, ape_traba, dni_traba
FROM Trabajador
WHERE area_tra
like 'Recepcion'
GO

SELECT * FROM vw_listrabaja
GO



