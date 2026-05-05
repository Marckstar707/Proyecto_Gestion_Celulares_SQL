CREATE TABLE [dbo].[Fact_Ventas] (
    [VentaKey]    INT             IDENTITY (1, 1) NOT NULL,
    [ProductoKey] INT             NULL,
    [ClienteKey]  INT             NULL,
    [FechaID]     INT             NULL,
    [Cantidad]    INT             NULL,
    [MontoTotal]  DECIMAL (18, 2) NULL,
    PRIMARY KEY CLUSTERED ([VentaKey] ASC),
    FOREIGN KEY ([ClienteKey]) REFERENCES [dbo].[Dim_Cliente] ([ClienteKey]),
    FOREIGN KEY ([ProductoKey]) REFERENCES [dbo].[Dim_Producto] ([ProductoKey])
);

