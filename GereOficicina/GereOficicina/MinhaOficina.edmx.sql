
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 06/26/2022 00:22:08
-- Generated from EDMX file: D:\Users\Mariana\Visual Studio Projects\GereOficicina\GereOficicina\MinhaOficina.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [MinhaOficinaDB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_ClienteCarro]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Carroes] DROP CONSTRAINT [FK_ClienteCarro];
GO
IF OBJECT_ID(N'[dbo].[FK_CarroServico]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Servicos] DROP CONSTRAINT [FK_CarroServico];
GO
IF OBJECT_ID(N'[dbo].[FK_ServicoParcela]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Parcelas] DROP CONSTRAINT [FK_ServicoParcela];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Clientes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Clientes];
GO
IF OBJECT_ID(N'[dbo].[Carroes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Carroes];
GO
IF OBJECT_ID(N'[dbo].[Servicos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Servicos];
GO
IF OBJECT_ID(N'[dbo].[Parcelas]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Parcelas];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Clientes'
CREATE TABLE [dbo].[Clientes] (
    [IdCliente] int IDENTITY(1,1) NOT NULL,
    [Nome] nvarchar(max)  NOT NULL,
    [NIF] nvarchar(9)  NOT NULL
);
GO

-- Creating table 'Carroes'
CREATE TABLE [dbo].[Carroes] (
    [IdCarro] int IDENTITY(1,1) NOT NULL,
    [Matricula] nvarchar(max)  NOT NULL,
    [ClienteIdCliente] int  NOT NULL
);
GO

-- Creating table 'Servicos'
CREATE TABLE [dbo].[Servicos] (
    [IdServico] int IDENTITY(1,1) NOT NULL,
    [Data] datetime  NOT NULL,
    [Tipo] nvarchar(max)  NOT NULL,
    [CarroIdCarro] int  NOT NULL
);
GO

-- Creating table 'Parcelas'
CREATE TABLE [dbo].[Parcelas] (
    [IdParcela] int IDENTITY(1,1) NOT NULL,
    [Valor] float  NOT NULL,
    [Descricao] nvarchar(max)  NOT NULL,
    [ServicoIdServico] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [IdCliente] in table 'Clientes'
ALTER TABLE [dbo].[Clientes]
ADD CONSTRAINT [PK_Clientes]
    PRIMARY KEY CLUSTERED ([IdCliente] ASC);
GO

-- Creating primary key on [IdCarro] in table 'Carroes'
ALTER TABLE [dbo].[Carroes]
ADD CONSTRAINT [PK_Carroes]
    PRIMARY KEY CLUSTERED ([IdCarro] ASC);
GO

-- Creating primary key on [IdServico] in table 'Servicos'
ALTER TABLE [dbo].[Servicos]
ADD CONSTRAINT [PK_Servicos]
    PRIMARY KEY CLUSTERED ([IdServico] ASC);
GO

-- Creating primary key on [IdParcela] in table 'Parcelas'
ALTER TABLE [dbo].[Parcelas]
ADD CONSTRAINT [PK_Parcelas]
    PRIMARY KEY CLUSTERED ([IdParcela] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [ClienteIdCliente] in table 'Carroes'
ALTER TABLE [dbo].[Carroes]
ADD CONSTRAINT [FK_ClienteCarro]
    FOREIGN KEY ([ClienteIdCliente])
    REFERENCES [dbo].[Clientes]
        ([IdCliente])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ClienteCarro'
CREATE INDEX [IX_FK_ClienteCarro]
ON [dbo].[Carroes]
    ([ClienteIdCliente]);
GO

-- Creating foreign key on [CarroIdCarro] in table 'Servicos'
ALTER TABLE [dbo].[Servicos]
ADD CONSTRAINT [FK_CarroServico]
    FOREIGN KEY ([CarroIdCarro])
    REFERENCES [dbo].[Carroes]
        ([IdCarro])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CarroServico'
CREATE INDEX [IX_FK_CarroServico]
ON [dbo].[Servicos]
    ([CarroIdCarro]);
GO

-- Creating foreign key on [ServicoIdServico] in table 'Parcelas'
ALTER TABLE [dbo].[Parcelas]
ADD CONSTRAINT [FK_ServicoParcela]
    FOREIGN KEY ([ServicoIdServico])
    REFERENCES [dbo].[Servicos]
        ([IdServico])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ServicoParcela'
CREATE INDEX [IX_FK_ServicoParcela]
ON [dbo].[Parcelas]
    ([ServicoIdServico]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------