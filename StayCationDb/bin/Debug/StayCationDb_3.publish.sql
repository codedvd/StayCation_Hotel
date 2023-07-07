﻿/*
Deployment script for Staycation

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "Staycation"
:setvar DefaultFilePrefix "Staycation"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
/*
The column [dbo].[PictureDb].[ImgName] is being dropped, data loss could occur.

The type for column Price in table [dbo].[PictureDb] is currently  VARCHAR (50) NULL but is being changed to  DECIMAL (18) NULL. Data loss could occur and deployment may fail if the column contains data that is incompatible with type  DECIMAL (18) NULL.
*/

IF EXISTS (select top 1 1 from [dbo].[PictureDb])
    RAISERROR (N'Rows were detected. The schema update is terminating because data loss might occur.', 16, 127) WITH NOWAIT

GO
PRINT N'Starting rebuilding table [dbo].[PictureDb]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_PictureDb] (
    [ImgUrl]      VARCHAR (200) NULL,
    [City]        VARCHAR (200) NULL,
    [Location]    VARCHAR (200) NULL,
    [Price]       DECIMAL (18)  NULL,
    [Description] VARCHAR (200) NULL,
    [Type]        VARCHAR (200) NULL,
    [Popularity]  VARCHAR (200) NULL,
    [IsPopular]   VARCHAR (100) NULL
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[PictureDb])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_PictureDb] ([City], [Location], [Price], [Description], [Type], [Popularity], [IsPopular])
        SELECT [City],
               [Location],
               [Price],
               [Description],
               [Type],
               [Popularity],
               [IsPopular]
        FROM   [dbo].[PictureDb];
    END

DROP TABLE [dbo].[PictureDb];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_PictureDb]', N'PictureDb';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/




--DELETE FROM dbo.PictureDb
 
--INSERT INTO dbo.PictureDb (hotelImageURL, hotelName, hotelLocation, hotelPrice, hotelDescription, hotelPopularity)
--VALUES ('https://hotelapp.blob.core.windows.net/staycation/overlay1.png', 'Blue Origin Fams', 'Jakarta', 50, 'null', 'Most Picks')
GO

GO
PRINT N'Update complete.';


GO
