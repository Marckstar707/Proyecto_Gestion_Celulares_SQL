-- 1. Crear la base de datos
CREATE DATABASE Celulares_OLTP;
GO
USE Celulares_OLTP;
GO

-- 2. Crear tablas (Normalización hasta 3FN)
CREATE TABLE Categorias (
    CategoriaID INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(50) NOT NULL
);

CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100) NOT NULL,
    NIT_CI VARCHAR(20),
    Telefono VARCHAR(15)
);

CREATE TABLE Tecnicos (
    TecnicoID INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100) NOT NULL,
    Especialidad VARCHAR(50)
);

CREATE TABLE Productos (
    ProductoID INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100) NOT NULL,
    Precio DECIMAL(10,2) NOT NULL,
    Stock INT NOT NULL,
    CategoriaID INT FOREIGN KEY REFERENCES Categorias(CategoriaID)
);

CREATE TABLE Ventas (
    VentaID INT PRIMARY KEY IDENTITY(1,1),
    Fecha DATETIME DEFAULT GETDATE(),
    ClienteID INT FOREIGN KEY REFERENCES Clientes(ClienteID),
    Total DECIMAL(10,2) DEFAULT 0
);

CREATE TABLE Detalle_Ventas (
    DetalleID INT PRIMARY KEY IDENTITY(1,1),
    VentaID INT FOREIGN KEY REFERENCES Ventas(VentaID),
    ProductoID INT FOREIGN KEY REFERENCES Productos(ProductoID),
    Cantidad INT NOT NULL,
    PrecioUnitario DECIMAL(10,2)
);
GO

-- 3. Insertar 20 registros por tabla (Puntos clave de tu tarea)
INSERT INTO Categorias (Nombre) VALUES ('Pantallas'), ('Baterias'), ('Pines de Carga'), ('Herramientas');

-- Insertar Clientes
DECLARE @i INT = 1;
WHILE @i <= 20
BEGIN
    INSERT INTO Clientes (Nombre, NIT_CI, Telefono) 
    VALUES ('Cliente ' + CAST(@i AS VARCHAR), 'CI-' + CAST(1000 + @i AS VARCHAR), '7' + CAST(1000000 + @i AS VARCHAR));
    SET @i = @i + 1;
END

-- Insertar Técnicos (Incluyéndote como experto)
INSERT INTO Tecnicos (Nombre, Especialidad) VALUES 
('Rodrigo Huanca', 'Sistemas y Microelectrónica'), 
('Oscar BoA', 'Hardware Móvil'), 
('Marcos BoA', 'Software y Flasheo');

-- Insertar 20 Productos de Repuestos
INSERT INTO Productos (Nombre, Precio, Stock, CategoriaID) VALUES 
('Pantalla Samsung A51', 350, 10, 1), ('Bateria iPhone 11', 250, 15, 2),
('Pin Carga Tipo C', 25, 50, 3), ('Pantalla Redmi Note 10', 400, 8, 1),
('Bateria Huawei P30', 180, 12, 2), ('Multimetro Digital', 150, 5, 4),
('Pantalla Poco X3', 450, 5, 1), ('Pin Carga Micro USB', 15, 100, 3),
('Kit Destornilladores', 80, 20, 4), ('Pantalla iPhone 12', 850, 3, 1),
('Bateria Moto G60', 190, 10, 2), ('Modulo Carga A30', 45, 20, 3),
('Flux Mechanic', 40, 30, 4), ('Pantalla Huawei Y9', 310, 7, 1),
('Bateria iPhone X', 220, 12, 2), ('Malla Desoldadora', 25, 40, 4),
('Pantalla Samsung S20', 700, 4, 1), ('Pin Carga J7', 10, 80, 3),
('Pegamento T7000', 35, 15, 4), ('Bateria Redmi 9', 160, 10, 2);

-- Insertar 20 Ventas para tener datos de análisis
SET @i = 1;
WHILE @i <= 20
BEGIN
    INSERT INTO Ventas (ClienteID) VALUES (ABS(CHECKSUM(NEWID()) % 20) + 1);
    INSERT INTO Detalle_Ventas (VentaID, ProductoID, Cantidad, PrecioUnitario) 
    VALUES (@i, ABS(CHECKSUM(NEWID()) % 20) + 1, 1, 100);
    SET @i = @i + 1;
END

-- Actualizar los totales de las ventas
UPDATE Ventas SET Total = (SELECT SUM(Cantidad * PrecioUnitario) FROM Detalle_Ventas WHERE Detalle_Ventas.VentaID = Ventas.VentaID);

SELECT '¡OLTP CREADO EXITOSAMENTE!' AS Mensaje;