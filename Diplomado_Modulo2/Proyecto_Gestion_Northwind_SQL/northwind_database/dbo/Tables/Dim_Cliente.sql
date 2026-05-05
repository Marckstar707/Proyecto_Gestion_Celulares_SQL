CREATE TABLE [dbo].[Dim_Cliente] (
    [ClienteKey]     INT          IDENTITY (1, 1) NOT NULL,
    [ClienteID]      NVARCHAR (5) NULL,
    [NombreContacto] VARCHAR (30) NULL,
    [Ciudad]         VARCHAR (15) NULL,
    [Pais]           VARCHAR (15) NULL,
    PRIMARY KEY CLUSTERED ([ClienteKey] ASC)
);

