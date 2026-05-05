CREATE TABLE [dbo].[Ventas] (
    [VentaID]   INT             IDENTITY (1, 1) NOT NULL,
    [Fecha]     DATETIME        DEFAULT (getdate()) NULL,
    [ClienteID] INT             NULL,
    [Total]     DECIMAL (10, 2) DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([VentaID] ASC),
    FOREIGN KEY ([ClienteID]) REFERENCES [dbo].[Clientes] ([ClienteID])
);

