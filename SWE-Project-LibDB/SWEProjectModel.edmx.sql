
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/27/2021 12:07:51
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

IF OBJECT_ID(N'[dbo].[FK_Autor]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Projekts] DROP CONSTRAINT [FK_Autor];
GO
IF OBJECT_ID(N'[dbo].[FK_Mitarbeiter_Projekt]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Mitarbeiter] DROP CONSTRAINT [FK_Mitarbeiter_Projekt];
GO
IF OBJECT_ID(N'[dbo].[FK_Mitarbeiter_User]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Mitarbeiter] DROP CONSTRAINT [FK_Mitarbeiter_User];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Mitarbeiter]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Mitarbeiter];
GO
IF OBJECT_ID(N'[dbo].[Projekts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Projekts];
GO
IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO

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

-- Creating table 'Kommentars'
CREATE TABLE [dbo].[Kommentars] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Inhalt] nvarchar(max)  NOT NULL,
    [ProjektId] int  NOT NULL,
    [UserUserId] int  NOT NULL
);
GO

-- Creating table 'Bewertungen'
CREATE TABLE [dbo].[Bewertungen] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Rating] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Skills'
CREATE TABLE [dbo].[Skills] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Beschreibung] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Mitarbeiter'
CREATE TABLE [dbo].[Mitarbeiter] (
    [ProjektMitarbeiter_Id] int  NOT NULL,
    [Mitarbeiter_UserId] int  NOT NULL
);
GO

-- Creating table 'ProjektBewertung'
CREATE TABLE [dbo].[ProjektBewertung] (
    [Projekt_Id] int  NOT NULL,
    [Bewertung_Id] int  NOT NULL
);
GO

-- Creating table 'ProjektSkill'
CREATE TABLE [dbo].[ProjektSkill] (
    [Projekts_Id] int  NOT NULL,
    [Skills_Id] int  NOT NULL
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

-- Creating primary key on [Id] in table 'Kommentars'
ALTER TABLE [dbo].[Kommentars]
ADD CONSTRAINT [PK_Kommentars]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Bewertungen'
ALTER TABLE [dbo].[Bewertungen]
ADD CONSTRAINT [PK_Bewertungen]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Skills'
ALTER TABLE [dbo].[Skills]
ADD CONSTRAINT [PK_Skills]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [ProjektMitarbeiter_Id], [Mitarbeiter_UserId] in table 'Mitarbeiter'
ALTER TABLE [dbo].[Mitarbeiter]
ADD CONSTRAINT [PK_Mitarbeiter]
    PRIMARY KEY CLUSTERED ([ProjektMitarbeiter_Id], [Mitarbeiter_UserId] ASC);
GO

-- Creating primary key on [Projekt_Id], [Bewertung_Id] in table 'ProjektBewertung'
ALTER TABLE [dbo].[ProjektBewertung]
ADD CONSTRAINT [PK_ProjektBewertung]
    PRIMARY KEY CLUSTERED ([Projekt_Id], [Bewertung_Id] ASC);
GO

-- Creating primary key on [Projekts_Id], [Skills_Id] in table 'ProjektSkill'
ALTER TABLE [dbo].[ProjektSkill]
ADD CONSTRAINT [PK_ProjektSkill]
    PRIMARY KEY CLUSTERED ([Projekts_Id], [Skills_Id] ASC);
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

-- Creating foreign key on [ProjektId] in table 'Kommentars'
ALTER TABLE [dbo].[Kommentars]
ADD CONSTRAINT [FK_ProjektKommentar]
    FOREIGN KEY ([ProjektId])
    REFERENCES [dbo].[Projekts]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProjektKommentar'
CREATE INDEX [IX_FK_ProjektKommentar]
ON [dbo].[Kommentars]
    ([ProjektId]);
GO

-- Creating foreign key on [UserUserId] in table 'Kommentars'
ALTER TABLE [dbo].[Kommentars]
ADD CONSTRAINT [FK_UserKommentar]
    FOREIGN KEY ([UserUserId])
    REFERENCES [dbo].[Users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserKommentar'
CREATE INDEX [IX_FK_UserKommentar]
ON [dbo].[Kommentars]
    ([UserUserId]);
GO

-- Creating foreign key on [Projekt_Id] in table 'ProjektBewertung'
ALTER TABLE [dbo].[ProjektBewertung]
ADD CONSTRAINT [FK_ProjektBewertung_Projekt]
    FOREIGN KEY ([Projekt_Id])
    REFERENCES [dbo].[Projekts]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Bewertung_Id] in table 'ProjektBewertung'
ALTER TABLE [dbo].[ProjektBewertung]
ADD CONSTRAINT [FK_ProjektBewertung_Bewertung]
    FOREIGN KEY ([Bewertung_Id])
    REFERENCES [dbo].[Bewertungen]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProjektBewertung_Bewertung'
CREATE INDEX [IX_FK_ProjektBewertung_Bewertung]
ON [dbo].[ProjektBewertung]
    ([Bewertung_Id]);
GO

-- Creating foreign key on [Projekts_Id] in table 'ProjektSkill'
ALTER TABLE [dbo].[ProjektSkill]
ADD CONSTRAINT [FK_ProjektSkill_Projekt]
    FOREIGN KEY ([Projekts_Id])
    REFERENCES [dbo].[Projekts]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Skills_Id] in table 'ProjektSkill'
ALTER TABLE [dbo].[ProjektSkill]
ADD CONSTRAINT [FK_ProjektSkill_Skill]
    FOREIGN KEY ([Skills_Id])
    REFERENCES [dbo].[Skills]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProjektSkill_Skill'
CREATE INDEX [IX_FK_ProjektSkill_Skill]
ON [dbo].[ProjektSkill]
    ([Skills_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------