CREATE TABLE [dbo].[Clientes] (
    [ClienteID] INT           IDENTITY (1, 1) NOT NULL,
    [Nombre]    VARCHAR (100) NOT NULL,
    [NIT_CI]    VARCHAR (20)  NULL,
    [Telefono]  VARCHAR (15)  NULL,
    PRIMARY KEY CLUSTERED ([ClienteID] ASC)
);

