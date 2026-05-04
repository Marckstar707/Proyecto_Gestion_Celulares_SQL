CREATE TABLE [dbo].[Detalle_Ventas] (
    [DetalleID]      INT             IDENTITY (1, 1) NOT NULL,
    [VentaID]        INT             NULL,
    [ProductoID]     INT             NULL,
    [Cantidad]       INT             NOT NULL,
    [PrecioUnitario] DECIMAL (10, 2) NULL,
    PRIMARY KEY CLUSTERED ([DetalleID] ASC),
    FOREIGN KEY ([ProductoID]) REFERENCES [dbo].[Productos] ([ProductoID]),
    FOREIGN KEY ([VentaID]) REFERENCES [dbo].[Ventas] ([VentaID])
);

