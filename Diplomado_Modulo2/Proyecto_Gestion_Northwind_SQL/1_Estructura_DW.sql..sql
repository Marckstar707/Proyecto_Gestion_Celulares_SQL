-- 1. Crear la base de datos del Data Warehouse
CREATE DATABASE Northwind_DW;
GO
USE Northwind_DW;
GO

-- 2. Crear Dimensión de Productos
CREATE TABLE Dim_Producto (
    ProductoKey INT PRIMARY KEY IDENTITY(1,1),
    ProductoID INT,
    NombreProducto VARCHAR(40),
    Categoria VARCHAR(15),
    PrecioUnitario DECIMAL(10,2)
);

-- 3. Crear Dimensión de Clientes
CREATE TABLE Dim_Cliente (
    ClienteKey INT PRIMARY KEY IDENTITY(1,1),
    ClienteID NVARCHAR(5),
    NombreContacto VARCHAR(30),
    Ciudad VARCHAR(15),
    Pais VARCHAR(15)
);

-- 4. Crear Tabla de Hechos (Ventas)
CREATE TABLE Fact_Ventas (
    VentaKey INT PRIMARY KEY IDENTITY(1,1),
    ProductoKey INT,
    ClienteKey INT,
    FechaID INT, -- Relacionado con una dimensión tiempo si se desea
    Cantidad INT,
    MontoTotal DECIMAL(18,2),
    FOREIGN KEY (ProductoKey) REFERENCES Dim_Producto(ProductoKey),
    FOREIGN KEY (ClienteKey) REFERENCES Dim_Cliente(ClienteKey)
);
GO