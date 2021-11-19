
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/19/2021 16:19:38
-- Generated from EDMX file: C:\Users\franz\source\repos\SWE-Project\SWE-Project-LibDB\SWEProjectModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [SWE];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Projekts'
CREATE TABLE [dbo].[Projekts] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Titel] nvarchar(max)  NOT NULL,
    [Beschreibung] nvarchar(max)  NOT NULL,
    [Autor_UserId] int  NOT NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [UserId] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Vorname] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Mitarbeiter'
CREATE TABLE [dbo].[Mitarbeiter] (
    [ProjektMitarbeiter_Id] int  NOT NULL,
    [Mitarbeiter_UserId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Projekts'
ALTER TABLE [dbo].[Projekts]
ADD CONSTRAINT [PK_Projekts]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [UserId] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([UserId] ASC);
GO

-- Creating primary key on [ProjektMitarbeiter_Id], [Mitarbeiter_UserId] in table 'Mitarbeiter'
ALTER TABLE [dbo].[Mitarbeiter]
ADD CONSTRAINT [PK_Mitarbeiter]
    PRIMARY KEY CLUSTERED ([ProjektMitarbeiter_Id], [Mitarbeiter_UserId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [ProjektMitarbeiter_Id] in table 'Mitarbeiter'
ALTER TABLE [dbo].[Mitarbeiter]
ADD CONSTRAINT [FK_Mitarbeiter_Projekt]
    FOREIGN KEY ([ProjektMitarbeiter_Id])
    REFERENCES [dbo].[Projekts]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Mitarbeiter_UserId] in table 'Mitarbeiter'
ALTER TABLE [dbo].[Mitarbeiter]
ADD CONSTRAINT [FK_Mitarbeiter_User]
    FOREIGN KEY ([Mitarbeiter_UserId])
    REFERENCES [dbo].[Users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Mitarbeiter_User'
CREATE INDEX [IX_FK_Mitarbeiter_User]
ON [dbo].[Mitarbeiter]
    ([Mitarbeiter_UserId]);
GO

-- Creating foreign key on [Autor_UserId] in table 'Projekts'
ALTER TABLE [dbo].[Projekts]
ADD CONSTRAINT [FK_Autor]
    FOREIGN KEY ([Autor_UserId])
    REFERENCES [dbo].[Users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Autor'
CREATE INDEX [IX_FK_Autor]
ON [dbo].[Projekts]
    ([Autor_UserId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------