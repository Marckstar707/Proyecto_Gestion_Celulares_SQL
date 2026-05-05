CREATE TABLE [dbo].[Dim_Producto] (
    [ProductoKey]    INT             IDENTITY (1, 1) NOT NULL,
    [ProductoID]     INT             NULL,
    [NombreProducto] VARCHAR (40)    NULL,
    [Categoria]      VARCHAR (15)    NULL,
    [PrecioUnitario] DECIMAL (10, 2) NULL,
    PRIMARY KEY CLUSTERED ([ProductoKey] ASC)
);

