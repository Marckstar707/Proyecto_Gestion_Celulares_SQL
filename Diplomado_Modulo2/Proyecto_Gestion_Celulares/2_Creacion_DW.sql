-- 1. Crear la base de datos del Data Warehouse
USE master;
GO
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'Celulares_DW')
    DROP DATABASE Celulares_DW;
GO
CREATE DATABASE Celulares_DW;
GO
USE Celulares_DW;
GO

-- 2. Crear Dimensiones
CREATE TABLE Dim_Producto (
    ProductoKey INT PRIMARY KEY IDENTITY(1,1),
    ProductoID_Origen INT,
    NombreProducto VARCHAR(100),
    Categoria VARCHAR(50)
);

CREATE TABLE Dim_Cliente (
    ClienteKey INT PRIMARY KEY IDENTITY(1,1),
    ClienteID_Origen INT,
    NombreCliente VARCHAR(100)
);

CREATE TABLE Dim_Tiempo (
    TiempoKey INT PRIMARY KEY,
    Fecha DATE,
    Anio INT,
    Mes INT,
    NombreMes VARCHAR(20)
);

-- 3. Crear Tabla de Hechos
CREATE TABLE Fact_Ventas (
    VentaID INT,
    ProductoKey INT FOREIGN KEY REFERENCES Dim_Producto(ProductoKey),
    ClienteKey INT FOREIGN KEY REFERENCES Dim_Cliente(ClienteKey),
    TiempoKey INT FOREIGN KEY REFERENCES Dim_Tiempo(TiempoKey),
    Cantidad INT,
    MontoTotal DECIMAL(10,2)
);
GO

-- 4. POBLAR EL DW (Proceso ETL)
-- Productos
INSERT INTO Dim_Producto (ProductoID_Origen, NombreProducto, Categoria)
SELECT p.ProductoID, p.Nombre, c.Nombre
FROM Celulares_OLTP.dbo.Productos p
JOIN Celulares_OLTP.dbo.Categorias c ON p.CategoriaID = c.CategoriaID;

-- Clientes
INSERT INTO Dim_Cliente (ClienteID_Origen, NombreCliente)
SELECT ClienteID, Nombre FROM Celulares_OLTP.dbo.Clientes;

-- Tiempo (Año 2026)
DECLARE @FechaInicio DATE = '2026-01-01';
WHILE @FechaInicio <= '2026-12-31'
BEGIN
    INSERT INTO Dim_Tiempo VALUES (
        CAST(CONVERT(VARCHAR(8), @FechaInicio, 112) AS INT),
        @FechaInicio, YEAR(@FechaInicio), MONTH(@FechaInicio), DATENAME(MONTH, @FechaInicio)
    );
    SET @FechaInicio = DATEADD(DAY, 1, @FechaInicio);
END

-- Hechos (Aquí estaba el error: PrecioUnitario en lugar de Subtotal)
INSERT INTO Fact_Ventas (VentaID, ProductoKey, ClienteKey, TiempoKey, Cantidad, MontoTotal)
SELECT 
    v.VentaID,
    dp.ProductoKey,
    dc.ClienteKey,
    dt.TiempoKey,
    dv.Cantidad,
    (dv.Cantidad * dv.PrecioUnitario) -- Calculamos el monto aquí
FROM Celulares_OLTP.dbo.Ventas v
JOIN Celulares_OLTP.dbo.Detalle_Ventas dv ON v.VentaID = dv.VentaID
JOIN Dim_Producto dp ON dv.ProductoID = dp.ProductoID_Origen
JOIN Dim_Cliente dc ON v.ClienteID = dc.ClienteID_Origen
JOIN Dim_Tiempo dt ON CAST(v.Fecha AS DATE) = dt.Fecha;

SELECT '¡DATA WAREHOUSE CREADO Y POBLADO!' AS Resultado;