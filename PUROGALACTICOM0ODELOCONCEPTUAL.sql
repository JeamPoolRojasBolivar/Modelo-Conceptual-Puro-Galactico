–código 1
-- Base de datos Super Giros
-- Puro galactico 🍫
-- 27/02/25 Cusco Peru

--Creacion de Operacion
drop table Operacion;
create table Operacion
(
	idOpe NUMBER primary key,
	tipoOpe varchar(50),
	fechaHoraOpe varchar(50),
	montoOpe decimal(8,2),
	comisionOpe decimal(8,2)
)
;

--Creacion de Cuenta
drop table Cuenta;
create table Cuenta
(
	idCuenta NUMBER primary key,
	nroCuenta varchar(50),
	saldoCuenta decimal(8,2),
	idOpe int,
	foreign key (idOpe) references Operacion(idOpe)
)
;

--Creacion de Banco
drop table Banco;
create table Banco
(
	idB NUMBER primary key,
	nombreB varchar(50),
	paginaWebB varchar(50), --tipo UNICODE multi-idioma
	idCuenta int,
	foreign key (idCuenta) references Cuenta(idCuenta)
)
;

--Creacion de Clinete
drop table Cliente;
create table Cliente
(
	idCliente char(9) primary key,
	tipoDocmC varchar (10) not null,
	nroDocmc char(8) not null,
	nombresC varchar(50) not null,
	paternoC varchar(50) not null,
	maternoC varchar(50) not null,
	celularC varchar(9) not null,
	idCuenta int,
	idOpe int,
	foreign key (idCliente) references Cliente(idCliente),
	foreign key (idCuenta) references Cuenta(idCuenta),
	foreign key (idOpe) references Operacion(idOpe)
)
;

--Creacion de Empleado
drop table Empleado;
create table Empleado
(
	idE char(9) primary key,
	tipoDocmE varchar (10) not null,
	nroDocmE char(8) not null,
	nombresE varchar(50) not null,
	paternoE varchar(50) not null,
	maternoE varchar(50) not null,
	celularE varchar(9) not null,
	idOpe int,
	foreign key (idOpe) references Operacion(idOpe)
)
;
–Código 2:
-- Base de datos Shalom
-- Puro galactico 🍫
-- 27/02/25 Cusco Peru

--Creacion de Clinete
drop table Cliente;
create table Cliente
(
	idCliente char(9) primary key,
	tipoDocmC varchar (10) not null,
	nroDocmc char(8) not null,
	nombresC varchar(50) not null,
	paternoC varchar(50) not null,
	maternoC varchar(50) not null,
	celularC varchar(9) not null,
	foreign key (idCliente) references Cliente(idCliente)
)
;

--Creacion de Paquete
drop table Paquete;
create table Paquete
(
	idP int primary key,
	descriptionP varchar(50),
	pesoP varchar(50) --tipo UNICODE multi-idioma
)
;

--Creacion de Comprobante
drop table Comprobante;
create table Comprobante
(
	idComp int primary key not null,
	fechaHoraComp datetime not null,
	totalComp decimal(8,2) not null,
	OrigenComp varchar(50) not null,
	DestinoComp varchar(50) not null,
	idCliente char(9),
	foreign key (idCliente) references Cliente(idCliente)
)
;

--Creacion de DetallaeDelComprobante
drop table DetalleDelComprobante;
create table DetalleDelComprobante
(
	idDet int primary key not null,
	precioPorKiloDet decimal(8,2) not null,
	subTotalDet decimal(8,2),
	idComp int,
	idP int,
	foreign key(idComp) references Comprobante(idComp),
	foreign key(idP) references Paquete(idP)
)
;
–Código 3
CREATE DATABASE Empresa;
USE Empresa;

-- Tabla Año
CREATE TABLE Año (
    IdAño INT PRIMARY KEY,
    InicioAño VARCHAR(10),
    FinAño VARCHAR(10)
);

-- Tabla Empleado
CREATE TABLE Empleado (
    IdE INT PRIMARY KEY,
    TipoDocumE VARCHAR(20),
    NroDocumE VARCHAR(20),
    NombresE VARCHAR(50),
    PaternoE VARCHAR(50),
    MaternoE VARCHAR(50),
    CelularE VARCHAR(15)
);

-- Tabla Turno
CREATE TABLE Turno (
    IdT INT PRIMARY KEY,
    NombreT VARCHAR(50),
    InicioT VARCHAR(10),
    FinT VARCHAR(10),
    IdAño INT,
    FOREIGN KEY (IdAño) REFERENCES Año(IdAño)
);

-- Tabla Asistencia
CREATE TABLE Asistencia (
    IdA INT PRIMARY KEY,
    FechaA VARCHAR(20),
    DiaA VARCHAR(20),
    EsFeriadoA TINYINT,
    AsistioA TINYINT,
    TardoA TINYINT,
    HoraEntradaA VARCHAR(10),
    HoraSalidaA VARCHAR(10),
    IdE INT,
    IdT INT,
    FOREIGN KEY (IdE) REFERENCES Empleado(IdE),
    FOREIGN KEY (IdT) REFERENCES Turno(IdT)
);
–Código 4
CREATE DATABASE Tienda;
USE Tienda;

-- Tabla Cliente
CREATE TABLE Cliente (
    IdC INT PRIMARY KEY,
    TipoDocumC VARCHAR(20),
    NroDocumC VARCHAR(20),
    NombresC VARCHAR(50),
    PaternoC VARCHAR(50),
    MaternoC VARCHAR(50),
    CelularC VARCHAR(15)
);

-- Tabla Comprobante
CREATE TABLE Comprobante (
    IdComp INT PRIMARY KEY,
    FechaHoraComp VARCHAR(50),
    TotalComp DECIMAL(10,2),
    IdC INT,
    FOREIGN KEY (IdC) REFERENCES Cliente(IdC)
);

-- Tabla Categoría
CREATE TABLE Categoria (
    IdCat INT PRIMARY KEY,
    NombreCat VARCHAR(50),
    DescripcionCat TEXT
);

-- Tabla Producto
CREATE TABLE Producto (
    IdP INT PRIMARY KEY,
    NombreP VARCHAR(50),
    DescripcionP TEXT,
    PrecioReferencial DECIMAL(10,2),
    IdCat INT,
    FOREIGN KEY (IdCat) REFERENCES Categoria(IdCat)
);

-- Tabla Detalle
CREATE TABLE Detalle (
    IdDet INT PRIMARY KEY,
    CantidadDet INT,
    PrecioReaUnitario DECIMAL(10,2),
    SubtotalDet DECIMAL(10,2),
    IdComp INT,
    IdP INT,
    FOREIGN KEY (IdComp) REFERENCES Comprobante(IdComp),
    FOREIGN KEY (IdP) REFERENCES Producto(IdP)
);
–Código 5
-- Tabla: Producto
CREATE TABLE Producto (
    ProductoID INT PRIMARY KEY,
    Nombre TEXT,
    Descripcion TEXT,
    Precio DECIMAL(10, 2),
    Stock INT
);

-- Tabla: Categoria
CREATE TABLE Categoria (
    CategoriaID INT PRIMARY KEY,
    Nombre TEXT,
    Descripcion TEXT
);

-- Tabla: ProductoCategoria
CREATE TABLE ProductoCategoria (
    ProductoID INT,
    CategoriaID INT,
    PRIMARY KEY (ProductoID, CategoriaID),
    FOREIGN KEY (ProductoID) REFERENCES Producto(ProductoID),
    FOREIGN KEY (CategoriaID) REFERENCES Categoria(CategoriaID)
);

-- Tabla: Proveedor
CREATE TABLE Proveedor (
    ProveedorID INT PRIMARY KEY,
    Nombre TEXT,
    Direccion TEXT,
    Telefono TEXT
);

-- Tabla: ProveedorProducto
CREATE TABLE ProveedorProducto (
    ProveedorID INT,
    ProductoID INT,
    PRIMARY KEY (ProveedorID, ProductoID),
    FOREIGN KEY (ProveedorID) REFERENCES Proveedor(ProveedorID),
    FOREIGN KEY (ProductoID) REFERENCES Producto(ProductoID)
);

-- Tabla: Cliente
CREATE TABLE Cliente (
    ClienteID INT PRIMARY KEY,
    Nombre TEXT,
    Apellido TEXT,
    Direccion TEXT,
    Telefono TEXT
);

-- Tabla: Orden
CREATE TABLE Orden (
    OrdenID INT PRIMARY KEY,
    ClienteID INT,
    FechaOrden DATE,
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID)
);

-- Tabla: DetalleOrden
CREATE TABLE DetalleOrden (
    DetalleOrdenID INT PRIMARY KEY,
    OrdenID INT,
    ProductoID INT,
    Cantidad INT,
    PrecioUnitario DECIMAL(10, 2),
    FOREIGN KEY (OrdenID) REFERENCES Orden(OrdenID),
    FOREIGN KEY (ProductoID) REFERENCES Producto(ProductoID)
);

-- Tabla: HuamaniJurado
CREATE TABLE HuamaniJurado (
    HuamaniJuradoID INT PRIMARY KEY,
    Nombre TEXT,
    Apellido TEXT,
    Especialidad TEXT
);

-- Tabla: ManuelLeonardo
CREATE TABLE ManuelLeonardo (
    ManuelLeonardoID INT PRIMARY KEY,
    Nombre TEXT,
    Apellido TEXT,
    Especialidad TEXT
);
–Código 6
-- Tabla: Enfermero
CREATE TABLE Enfermero (
    IdE TEXT PRIMARY KEY,
    tipoDocumento TEXT,
    nroDocumento INTEGER,
    NombresE TEXT,
    parternoE TEXT,
    maternoE TEXT,
    fechaNacimiento DATE,
    generoE TEXT
);

-- Tabla: Ambiente
CREATE TABLE Ambiente (
    idAmb TEXT PRIMARY KEY,
    nroAmb INTEGER,
    ubicacionAmb TEXT
);

-- Tabla: Calendario
CREATE TABLE Calendario (
    idc TEXT PRIMARY KEY,
    InicioC DATE,
    finC DATE,
    nombreC TEXT
);

-- Tabla: Asistencia
CREATE TABLE Asistencia (
    idA TEXT PRIMARY KEY,
    IdE TEXT,
    idAmb TEXT,
    idc TEXT,
    fechaA DATE,
    diaA TEXT,
    asistioA TEXT,
    tardoA TEXT,
    horaEntradaA TIME,
    horaSalidaA TIME,
    justificacionA TEXT,
    esDescansoA TEXT,
    FOREIGN KEY (IdE) REFERENCES Enfermero(IdE),
    FOREIGN KEY (idAmb) REFERENCES Ambiente(idAmb),
    FOREIGN KEY (idc) REFERENCES Calendario(idc)
);
–Código 7
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLESPACE tbAngeles INCLUDING CONTENTS AND DATAFILES';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/

-- Crear tablespace
CREATE TABLESPACE tbAngeles
DATAFILE 'C:\Oracle\tbAngeles.dbf' SIZE 100M
AUTOEXTEND ON NEXT 10M MAXSIZE 1000M;

-- Eliminar tablas si existen
DROP TABLE Detalle CASCADE CONSTRAINTS;
DROP TABLE Producto CASCADE CONSTRAINTS;
DROP TABLE Categoria CASCADE CONSTRAINTS;
DROP TABLE Comprobante CASCADE CONSTRAINTS;
DROP TABLE Cliente CASCADE CONSTRAINTS;

-- Tabla Cliente
CREATE TABLE Cliente (
    idC INT PRIMARY KEY,
    tipoDocumC VARCHAR2(50),
    nroDocumC VARCHAR2(50) UNIQUE,
    nombresC VARCHAR2(100),
    paternoC VARCHAR2(50),
    maternoC VARCHAR2(50),
    celularC VARCHAR2(20)
);

-- Tabla Comprobante
CREATE TABLE Comprobante (
    idComp INT PRIMARY KEY,
    idC INT,
    fechaHoraComp TIMESTAMP,
    totalComp DECIMAL(10,2),
    CONSTRAINT fk_comprobante_cliente FOREIGN KEY (idC) REFERENCES Cliente(idC)
);

-- Tabla Categoria
CREATE TABLE Categoria (
    idCat INT PRIMARY KEY,
    nombreCat VARCHAR2(100),
    descripcionCat VARCHAR2(255)
);

-- Tabla Producto
CREATE TABLE Producto (
    idP INT PRIMARY KEY,
    idCat INT,
    nombreP VARCHAR2(100),
    descripcionP VARCHAR2(255),
    precioReferencialP DECIMAL(10,2),
    CONSTRAINT fk_producto_categoria FOREIGN KEY (idCat) REFERENCES Categoria(idCat)
);

-- Tabla Detalle
CREATE TABLE Detalle (
    idDet INT PRIMARY KEY,
    idComp INT,
    idP INT,
    cantidadDet INT,
    precioRealUnitarioDet DECIMAL(10,2),
    subtotalDet DECIMAL(10,2),
    CONSTRAINT fk_detalle_comprobante FOREIGN KEY (idComp) REFERENCES Comprobante(idComp),
    CONSTRAINT fk_detalle_producto FOREIGN KEY (idP) REFERENCES Producto(idP)
);

-- Insertar datos en Cliente
INSERT INTO Cliente VALUES (1, 'DNI', '12345678', 'Carlos', 'Fernandez', 'Gomez', '987654321');
INSERT INTO Cliente VALUES (2, 'DNI', '87654321', 'Ana', 'Lopez', 'Martinez', '912345678');

-- Insertar datos en Categoria
INSERT INTO Categoria VALUES (1, 'Pollo', 'Platos a base de pollo');
INSERT INTO Categoria VALUES (2, 'Bebidas', 'Refrescos y bebidas');

-- Insertar datos en Producto
INSERT INTO Producto VALUES (1, 1, 'Pollo a la brasa', 'Pollo entero con papas y ensalada', 55.00);
INSERT INTO Producto VALUES (2, 2, 'Chicha Morada', 'Jarra de chicha morada', 10.00);

-- Insertar datos en Comprobante
INSERT INTO Comprobante VALUES (1, 1, TO_DATE('2024-02-27', 'YYYY-MM-DD HH24:MI:SS'), 65.00);
INSERT INTO Comprobante VALUES (2, 2, TO_DATE('2024-02-28', 'YYYY-MM-DD HH24:MI:SS'), 10.00);

-- Insertar datos en Detalle
INSERT INTO Detalle VALUES (1, 1, 1, 1, 55.00, 55.00);
INSERT INTO Detalle VALUES (2, 2, 2, 1, 10.00, 10.00);
–Código 8
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLESPACE tbTitanium INCLUDING CONTENTS AND DATAFILES';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/

-- Crear tablespace
CREATE TABLESPACE tbTitanium
DATAFILE 'C:\Oracle\tbTitanium.dbf' SIZE 100M
AUTOEXTEND ON NEXT 10M MAXSIZE 1000M;

-- Asegurar eliminación de tablas
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Asistencia CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE Cliente CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE GrupoDisciplina CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE Disciplina CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/

-- Crear Tabla Cliente
CREATE TABLE Cliente (
    idC NUMBER PRIMARY KEY,
    tipoDocumC VARCHAR2(50),
    nroDocumC VARCHAR2(50),
    nombresC VARCHAR2(100),
    paternoC VARCHAR2(50),
    maternoC VARCHAR2(50),
    generoC VARCHAR2(10),
    fechaNacimC DATE,
    enfermedadesC VARCHAR2(255),
    celularC VARCHAR2(20)
);

-- Crear Tabla Disciplina
CREATE TABLE Disciplina (
    idD NUMBER PRIMARY KEY,
    nombreD VARCHAR2(100),
    descripcionD VARCHAR2(255)
);

-- Crear Tabla GrupoDisciplina
CREATE TABLE GrupoDisciplina (
    idG NUMBER PRIMARY KEY,
    idD NUMBER,
    nombreG VARCHAR2(100),
    fechaInicioG DATE,
    fechaFinG DATE,
    CONSTRAINT fk_grupo_disciplina FOREIGN KEY (idD) REFERENCES Disciplina(idD)
);

-- Crear Tabla Asistencia
CREATE TABLE Asistencia (
    idA NUMBER PRIMARY KEY,
    idC NUMBER,
    fechaA DATE,
    diaA VARCHAR2(20),
    esFeriadoA VARCHAR2(10),
    asisteA VARCHAR2(10),
    horaEntradaA TIMESTAMP,
    CONSTRAINT fk_asistencia_cliente FOREIGN KEY (idC) REFERENCES Cliente(idC)
);

-- Insertar datos en Cliente (corregido)
INSERT INTO Cliente (idC, tipoDocumC, nroDocumC, nombresC, paternoC, maternoC, generoC, fechaNacimC, enfermedadesC, celularC)
VALUES (1, 'DNI', '12345678', 'Juan', 'Perez', 'Lopez', 'Masculino', TO_DATE('1995-06-15', 'YYYY-MM-DD'), 'Ninguna', '987654321');

INSERT INTO Cliente (idC, tipoDocumC, nroDocumC, nombresC, paternoC, maternoC, generoC, fechaNacimC, enfermedadesC, celularC)
VALUES (2, 'DNI', '87654321', 'María', 'Gonzalez', 'Diaz', 'Femenino', TO_DATE('1998-03-22', 'YYYY-MM-DD'), 'Asma', '912345678');

-- Insertar datos en Disciplina
INSERT INTO Disciplina VALUES (1, 'Yoga', 'Ejercicios de estiramiento y relajación');
INSERT INTO Disciplina VALUES (2, 'CrossFit', 'Entrenamiento de alta intensidad');

-- Insertar datos en GrupoDisciplina
INSERT INTO GrupoDisciplina VALUES (1, 1, 'Yoga Mañana', TO_DATE('2024-01-10', 'YYYY-MM-DD'), TO_DATE('2024-06-10', 'YYYY-MM-DD'));
INSERT INTO GrupoDisciplina VALUES (2, 2, 'CrossFit Avanzado', TO_DATE('2024-02-15', 'YYYY-MM-DD'), TO_DATE('2024-07-15', 'YYYY-MM-DD'));

-- Insertar datos en Asistencia (solo si la tabla existe)
INSERT INTO Asistencia (idA, idC, fechaA, diaA, esFeriadoA, asisteA, horaEntradaA)
VALUES (1, 1, TO_DATE('2024-02-27', 'YYYY-MM-DD'), 'Martes', 'No', 'Si', TO_TIMESTAMP('2024-02-27 07:30:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Asistencia (idA, idC, fechaA, diaA, esFeriadoA, asisteA, horaEntradaA)
VALUES (2, 2, TO_DATE('2024-02-28', 'YYYY-MM-DD'), 'Miércoles', 'No', 'Si', TO_TIMESTAMP('2024-02-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS'));
