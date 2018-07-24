
create database empresa

use empresa

CREATE TABLE Bus (
    id_bus int  NOT NULL,
    color_bus varchar(15)  NOT NULL,
    placa_bus varchar(15)  NOT NULL,
    cantida_bus int  NOT NULL,
    destinos_bus varchar(20)  NOT NULL,
    horasa_bus varchar(20)  NOT NULL,
    horalle_bus varchar(20)  NOT NULL,
    fechavia_bus date  NOT NULL,
    numeasi_bus char(50)  NOT NULL,
    costvi_bus money  NOT NULL,
    poster_bus varchar(50)  NOT NULL,
    CONSTRAINT Bus_pk PRIMARY KEY (id_bus)
);

-- Table: EmpresaTransporte
CREATE TABLE EmpresaTransporte (
    id_Em int  NOT NULL,
    nom_Em varchar(30)  NOT NULL,
    tiposer_Em varchar(50)  NOT NULL,
    sucur_Em varchar(30)  NOT NULL,
    dire_Em varchar(20)  NOT NULL,
    nuevasru_Em varchar(50)  NOT NULL,
    Bus_id_bus int  NOT NULL,
    Pasajeros_id_Pasa int  NOT NULL,
    Trabajador_id_Traba int  NOT NULL,
    CONSTRAINT EmpresaTransporte_pk PRIMARY KEY (id_Em)
);

-- Table: Pasajeros
CREATE TABLE Pasajeros (
    nom_Pasa varchar(30)  NOT NULL,
    ape_Pasa varchar(50)  NOT NULL,
    eda_Pasa char(2)  NOT NULL,
    dni_Pasa char(8)  NOT NULL,
    cel_Pasa char(9)  NOT NULL,
    dire_Pasa varchar(50)  NOT NULL,
    tipodoc_Pasa varchar(30)  NOT NULL,
    razonso_Pasa varchar(20)  NOT NULL,
    destino_Pasa varchar(20)  NOT NULL,
    id_Pasa int  NOT NULL,
    CONSTRAINT id_Pasa PRIMARY KEY (id_Pasa)
);

-- Table: Trabajador
CREATE TABLE Trabajador (
    id_Traba int  NOT NULL,
    nom_Traba varchar(30)  NOT NULL,
    ape_Traba varchar(50)  NOT NULL,
    dire_Traba varchar(50)  NOT NULL,
    dni_Traba char(8)  NOT NULL,
    cel_Traba char(9)  NOT NULL,
    aretra_Traba varchar(30)  NOT NULL,
    edad_Traba char(2)  NOT NULL,
    CONSTRAINT Trabajador_pk PRIMARY KEY (id_Traba)
);

-- foreign keys
-- Reference: EmpresaTransporte_Bus (table: EmpresaTransporte)
ALTER TABLE EmpresaTransporte ADD CONSTRAINT EmpresaTransporte_Bus
    FOREIGN KEY (Bus_id_bus)
    REFERENCES Bus (id_bus)  
  
;

-- Reference: EmpresaTransporte_Pasajeros (table: EmpresaTransporte)
ALTER TABLE EmpresaTransporte ADD CONSTRAINT EmpresaTransporte_Pasajeros
    FOREIGN KEY (Pasajeros_id_Pasa)
    REFERENCES Pasajeros (id_Pasa)  

;

-- Reference: EmpresaTransporte_Trabajador (table: EmpresaTransporte)
ALTER TABLE EmpresaTransporte ADD CONSTRAINT EmpresaTransporte_Trabajador
    FOREIGN KEY (Trabajador_id_Traba)
    REFERENCES Trabajador (id_Traba)  
 
;

select * from  Trabajador


insert into trabajador (id_Traba,nom_Traba,ape_Traba,dire_Traba,dni_Traba,cel_Traba,aretra_Traba,edad_Traba)
values
('1','Alexander','Vargas','Mala','72252571','991915461','Contabilidad','25'),
('2','Lopez','Castilla','Mala','72252571','991915461','Estadistica','25'),
('3','Ramos','Saman','Mala','72252571','991915461','Administracion','30'),
('4','Paolo','Guerrero','Mala','72252571','991915461','Contabilidad','40'),
('5','Elsa','Vargas','Mala','72252571','991915461','Contabilidad','45')
go

select * from  bus

insert into bus (id_bus,color_bus,placa_bus,cantida_bus,destinos_bus,horasa_bus,horalle_bus,fechavia_bus,numeasi_bus,costvi_bus,poster_bus)
values
('1','rojo','AGS21','2','LIMA','8:00AM','9:00PM','01/02/2000','64','10','NO'),
('2','rojo','FRF25','3','CAÑETE','9:00AM','1:00PM','01/02/2000','70','50','NO'),
('3','amarillo','RDF13','8','CHINCHA','10:00AM','10:00PM','01/02/2000','80','100','NO'),
('4','rojo','DFE74','8','PISCO','1:00PM','8:00AM','01/02/2000','50','200','SI'),
('5','rojo','ASQ32','10','ICA','9:00PM','1:00AM','01/02/2000','40','50','SI')
go

select * from  Pasajeros

insert into Pasajeros (nom_Pasa,ape_Pasa,eda_Pasa,dni_Pasa,cel_Pasa,dire_Pasa,tipodoc_Pasa,razonso_Pasa,destino_Pasa,id_Pasa)
values
('Sara','Sanches','22','72252571','991915461','Mala Jr','DNI','I.E.P Valle Grande','CAÑETE','1'),
('Tara','Rodriguez','25','72252571','991915461','Porvenir','DNI','Opcional','ICA','2'),
('Juana','Viscarra','18','72252571','991915461','Lima SJL','DNI','I.E.P Fractal','LIMA','3'),
('Berta','Vilcherez','22','72252571','991915461','Callao','DNI','Opcional','Pisco','4'),
('Pedro','Quispe','17','72252571','991915461','San Juan','DNI','E.T. Soyus','Chincha','5')
go

select * from EmpresaTransporte

insert into EmpresaTransporte (id_Em,nom_Em,tiposer_Em,sucur_Em,dire_Em,nuevasru_Em,Bus_id_bus,Pasajeros_id_Pasa,Trabajador_id_Traba)
values
('1','San Benito','Transporte Interprovincial','LIMA','Av. Salaverry','Arequipa','1','1','1'),
('2','San Benito','Transporte Interprovincia','CAÑETE','San Vicente','Arequipa','2','2','2'),
('3','San Benito','Transporte Interprovincia','PISCO','Av. Pisco','Arequipa','3','3','3'),
('4','San Benito','Transporte Interprovincia','CHINCHA','Nuevo Chincha','Arequipa','4','4','4'),
('5','San Benito','Transporte Interprovincia','ICA','Los Alamos','Arequipa','5','5','5')
go
  
  select * from Pasajeros 

  /*crear vista de pasajeros nombre, apellido, numero de celular y su destino final*/

CREATE VIEW vw_Names  
   AS  
   SELECT nom_Pasa, ape_Pasa, cel_Pasa, destino_Pasa FROM Pasajeros;  
GO  

select * from vw_Names

  /*crear vista de pasajeros  numero de dni, tipo de documento, razon social*/

  CREATE VIEW vw_Pasajeros
   AS  
   SELECT dni_Pasa, tipodoc_Pasa, razonso_Pasa FROM Pasajeros;  
GO  

select * from vw_Pasajeros



select * from Bus
  /*crear vista de Bus  numero de placa, destinos , hora de salida, costo de viaje y hora de llegada*/

    CREATE VIEW vw_Bus
   AS  
   SELECT placa_bus, destinos_bus, horasa_bus, costvi_bus, horalle_bus FROM Bus;  
GO  

select * from vw_Bus


select * from Bus