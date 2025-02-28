EJEMPLO 4
CREATE TABlESPACE tbEjemplo
DATAFILE 'D:\Oracle\tbDonGallino.dbf' SIZE 100M
AUTOEXTEND ON NEXT 10M MAXSIZE 1000M;
CREATE DATABASE Tienda;
USE Tienda;

-- Tabla Cliente
DROP TABLE Cliente;
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
DROP TABLE Comprobante;
CREATE TABLE Comprobante (
    IdComp INT PRIMARY KEY,
    FechaHoraComp VARCHAR(50),
    TotalComp DECIMAL(10,2),
    IdC INT,
    FOREIGN KEY (IdC) REFERENCES Cliente(IdC)
);

-- Tabla Categoría
DROP TABLE Categoria;
CREATE TABLE Categoria (
    IdCat INT PRIMARY KEY,
    NombreCat VARCHAR(50),
    DescripcionCat TEXT
);

-- Tabla Producto
DROP TABLE Producto;
CREATE TABLE Producto (
    IdP INT PRIMARY KEY,
    NombreP VARCHAR(50),
    DescripcionP TEXT,
    PrecioReferencial DECIMAL(10,2),
    IdCat INT,
    FOREIGN KEY (IdCat) REFERENCES Categoria(IdCat)
);

-- Tabla Detalle
DROP TABLE Detalle;
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
EJEMPLO 3
CREATE TABlESPACE tbEjemplo
DATAFILE 'D:\Oracle\tbINPE.dbf' SIZE 100M
AUTOEXTEND ON NEXT 10M MAXSIZE 1000M;
CREATE DATABASE INPE;
USE INPE;

-- Tabla Año
DROP TABLE Año;
CREATE TABLE Año (
    IdAño INT PRIMARY KEY,
    InicioAño VARCHAR(10),
    FinAño VARCHAR(10)
);

-- Tabla Empleado
DROP TABLE Empleado;
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
DROP TABLE Turno;
CREATE TABLE Turno (
    IdT INT PRIMARY KEY,
    NombreT VARCHAR(50),
    InicioT VARCHAR(10),
    FinT VARCHAR(10),
    IdAño INT,
    FOREIGN KEY (IdAño) REFERENCES Año(IdAño)
);

-- Tabla Asistencia
DROP TABLE Asistencia;
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
EJEMPLO6
CREATE TABlESPACE tbEjemplo
DATAFILE 'D:\Oracle\tbMacSalud.dbf' SIZE 100M
AUTOEXTEND ON NEXT 10M MAXSIZE 1000M;

-- Tabla: Enfermero
DROP TABLE Emfermero;
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
DROP TABLE Ambiente;
CREATE TABLE Ambiente (
    idAmb TEXT PRIMARY KEY,
    nroAmb INTEGER,
    ubicacionAmb TEXT
);

-- Tabla: Calendario
DROP TABLE Calendario;
CREATE TABLE Calendario (
    idc TEXT PRIMARY KEY,
    InicioC DATE,
    finC DATE,
    nombreC TEXT
);

-- Tabla: Asistencia
DROP TABLE Asistencia;
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
EJEMPLO5
CREATE TABlESPACE tbEjemplo
DATAFILE 'D:\Oracle\tbElectroTrack.dbf' SIZE 100M
AUTOEXTEND ON NEXT 10M MAXSIZE 1000M;

-- Tabla: Producto
DROP TABLE  Producto;
CREATE TABLE Producto (
    ProductoID INT PRIMARY KEY,
    Nombre TEXT,
    Descripcion TEXT,
    Precio DECIMAL(10, 2),
    Stock INT
);

-- Tabla: Categoria
DROP TABLE  Categoria;
CREATE TABLE Categoria (
    CategoriaID INT PRIMARY KEY,
    Nombre TEXT,
    Descripcion TEXT
);

-- Tabla: ProductoCategoria
DROP TABLE  ProductoCategoria;
CREATE TABLE ProductoCategoria (
    ProductoID INT,
    CategoriaID INT,
    PRIMARY KEY (ProductoID, CategoriaID),
    FOREIGN KEY (ProductoID) REFERENCES Producto(ProductoID),
    FOREIGN KEY (CategoriaID) REFERENCES Categoria(CategoriaID)
);

-- Tabla: Proveedor
DROP TABLE  Proveedor;
CREATE TABLE Proveedor (
    ProveedorID INT PRIMARY KEY,
    Nombre TEXT,
    Direccion TEXT,
    Telefono TEXT
);

-- Tabla: ProveedorProducto
DROP TABLE  ProveedorProducto;
CREATE TABLE ProveedorProducto (
    ProveedorID INT,
    ProductoID INT,
    PRIMARY KEY (ProveedorID, ProductoID),
    FOREIGN KEY (ProveedorID) REFERENCES Proveedor(ProveedorID),
    FOREIGN KEY (ProductoID) REFERENCES Producto(ProductoID)
);

-- Tabla: Cliente
DROP TABLE  Cliente;
CREATE TABLE Cliente (
    ClienteID INT PRIMARY KEY,
    Nombre TEXT,
    Apellido TEXT,
    Direccion TEXT,
    Telefono TEXT
);

-- Tabla: Orden
DROP TABLE  Orden;
CREATE TABLE Orden (
    OrdenID INT PRIMARY KEY,
    ClienteID INT,
    FechaOrden DATE,
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID)
);

-- Tabla: DetalleOrden
DROP TABLE  DetalleOrden;
CREATE TABLE DetalleOrden (
    DetalleOrdenID INT PRIMARY KEY,
    OrdenID INT,
    ProductoID INT,
    Cantidad INT,
    PrecioUnitario DECIMAL(10, 2),
    FOREIGN KEY (OrdenID) REFERENCES Orden(OrdenID),
    FOREIGN KEY (ProductoID) REFERENCES Producto(ProductoID)
);