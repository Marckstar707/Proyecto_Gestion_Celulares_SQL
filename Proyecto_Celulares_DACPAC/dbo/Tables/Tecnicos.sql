CREATE TABLE [dbo].[Tecnicos] (
    [TecnicoID]    INT           IDENTITY (1, 1) NOT NULL,
    [Nombre]       VARCHAR (100) NOT NULL,
    [Especialidad] VARCHAR (50)  NULL,
    PRIMARY KEY CLUSTERED ([TecnicoID] ASC)
);

