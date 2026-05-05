USE Northwind_DW;
GO

-- Intentar la carga de la tabla de hechos forzando el cotejamiento (Collation)
INSERT INTO Fact_Ventas (ProductoKey, ClienteKey, Cantidad, MontoTotal)
SELECT TOP 25 p.ProductoKey, c.ClienteKey, od.Quantity, (od.Quantity * od.UnitPrice)
FROM NorthWind.dbo.OrderDetails od
JOIN Dim_Producto p ON od.ProductID = p.ProductoID
JOIN NorthWind.dbo.Orders o ON od.OrderID = o.OrderID
-- Aquí añadimos COLLATE DATABASE_DEFAULT para resolver el conflicto de idioma
JOIN Dim_Cliente c ON o.CustomerID COLLATE DATABASE_DEFAULT = c.ClienteID COLLATE DATABASE_DEFAULT;
GO