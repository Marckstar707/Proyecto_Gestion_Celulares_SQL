CREATE TABLE [dbo].[Productos] (
    [ProductoID]  INT             IDENTITY (1, 1) NOT NULL,
    [Nombre]      VARCHAR (100)   NOT NULL,
    [Precio]      DECIMAL (10, 2) NOT NULL,
    [Stock]       INT             NOT NULL,
    [CategoriaID] INT             NULL,
    PRIMARY KEY CLUSTERED ([ProductoID] ASC),
    FOREIGN KEY ([CategoriaID]) REFERENCES [dbo].[Categorias] ([CategoriaID])
);

