


CREATE DATABASE Empresatra;
USE Empresatra;
-- tables



-- Table: PASAJERO
CREATE TABLE PASAJERO (
    id_pasaj int  NOT NULL IDENTITY,
    nom_pasaj varchar(50)  NOT NULL,
    ape_pasaj varchar(50)  NOT NULL,
	dni_pasaj char(8)  NOT NULL,
	cel_pasaj char(8)  NOT NULL,
	dire_pasaj char(8)  NOT NULL,
	razo_pasaj varchar(50)  NOT NULL,
    CONSTRAINT PASAJERO_pk PRIMARY KEY  (cod_pasaj)
);

-- Table: SERVICIOS
CREATE TABLE SERVICIOS (
    cod_servic int  NOT NULL IDENTITY,
    nom_servic varchar(50)  NOT NULL,
    estado_servic char(1)  NOT NULL,
    CONSTRAINT SERVICIOS_pk PRIMARY KEY  (cod_servic)
);

-- Table: SUCURSAL
CREATE TABLE SUCURSAL (
    cod_sucur int  NOT NULL IDENTITY,
    nom_sucur varchar(70)  NOT NULL,
    estado_surc char(1)  NOT NULL,
    CONSTRAINT SUCURSAL_pk PRIMARY KEY  (cod_sucur)
);

-- Table: USUARIO
CREATE TABLE USUARIO (
    cod_usua int  NOT NULL IDENTITY,
    nom_usua varchar(70)  NOT NULL,
    ape_usua varchar(70)  NOT NULL,
    dni_usua varchar(8)  NOT NULL,
    fef_nac_usua date  NOT NULL,
    estado_usua char(1)  NOT NULL,
    CONSTRAINT USUARIO_pk PRIMARY KEY  (cod_usua)
);

-- foreign keys
-- Reference: Boleta_PASAJERO (table: BOLETA)
ALTER TABLE BOLETA ADD CONSTRAINT Boleta_PASAJERO
    FOREIGN KEY (PASAJERO_cod_pasaj)
    REFERENCES PASAJERO (cod_pasaj);

-- Reference: Boleta_SUCURSALES (table: BOLETA)
ALTER TABLE BOLETA ADD CONSTRAINT Boleta_SUCURSALES
    FOREIGN KEY (SUCURSALES_cod_sucur)
    REFERENCES SUCURSAL (cod_sucur);

-- Reference: Manifiesto_SERVICIOS (table: MANIFIESTO)
ALTER TABLE MANIFIESTO ADD CONSTRAINT Manifiesto_SERVICIOS
    FOREIGN KEY (SERVICIOS_cod_servic)
    REFERENCES SERVICIOS (cod_servic);

-- Reference: Manifiesto_USUARIO (table: MANIFIESTO)
ALTER TABLE MANIFIESTO ADD CONSTRAINT Manifiesto_USUARIO
    FOREIGN KEY (USUARIO_cod_usua)
    REFERENCES USUARIO (cod_usua);

-- End of file.

CREATE PROCEDURE sp_regservicio
    @NOMBRE VARCHAR(50),
    @ESTADO CHAR(1)
AS
BEGIN
    INSERT INTO SERVICIOS
        (nom_servic,estado_servic) 
    VALUES
        (UPPER(@NOMBRE), UPPER(@ESTADO))
END
GO




CREATE PROCEDURE sp_actservicio
    @NOMBRE VARCHAR(50),
    @CODIGO INT
AS
BEGIN
UPDATE SERVICIOS 
SET nom_servic = @NOMBRE  
WHERE cod_servic = @CODIGO
END



CREATE VIEW vw_listUser AS
SELECT nom_usua, ape_usua, dni_usua, fef_nac_usua 
FROM USUARIO 
WHERE estado_usua 
like 'A'
GO

SELECT * FROM vw_listUser
GO



CREATE VIEW vw_listServ AS
SELECT * FROM SERVICIOS 
WHERE estado_servic like 'A'
GO

SELECT * FROM vw_listServ
GO

/*crear los strore procedure*/

GO
CREATE PROCEDURE sp_regusuario
    @NOMBRE VARCHAR(50),
    @APELLIDO VARCHAR(50),
    @DNI VARCHAR(50),
    @FECHA date,
    @ESTADO CHAR(1)
AS
BEGIN
    INSERT INTO USUARIO
        (nom_usua,ape_usua,dni_usua,fef_nac_usua,estado_usua)
    VALUES
        (UPPER(@NOMBRE),UPPER(@APELLIDO),@DNI,@FECHA, UPPER(@ESTADO))
END
GO




CREATE PROCEDURE sp_actusuario
    @NOMBRE VARCHAR(50),
    @APELLIDO VARCHAR(50),
    @DNI VARCHAR(8),
    @FECHA date,
    @CODIGO INT
AS
BEGIN
UPDATE USUARIO 
SET nom_usua = @NOMBRE, 
ape_usua = @APELLIDO,
dni_usua = @DNI,
fef_nac_usua = @FECHA
WHERE cod_usua = @CODIGO
END
GO