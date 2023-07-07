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




DELETE FROM dbo.PictureDb
 
 -- First Images on home page

INSERT INTO dbo.PictureDb (hotelImageUrl, hotelName, hotelLocation, hotelPrice, hotelDescription, hotelGroup, hotelPopularity, IsPopular)
VALUES ('https://staycations.blob.core.windows.net/staycation/Blueoriginfams.svg', 'Blue Origin Fams', 'Jakarta Indonesia', 50, 'null', 'null', 'Most Picks', 'false')

INSERT INTO dbo.PictureDb (hotelImageUrl, hotelName, hotelLocation, hotelPrice, hotelDescription, hotelGroup, hotelPopularity, IsPopular)
VALUES ('https://staycations.blob.core.windows.net/staycation/Oceanland.svg', 'Ocean Land', 'Bandung Indonesia', 22, 'null', 'null', 'Most Picks', 'false')

INSERT INTO dbo.PictureDb (hotelImageUrl, hotelName, hotelLocation, hotelPrice, hotelDescription, hotelGroup, hotelPopularity, IsPopular)
VALUES ('https://staycations.blob.core.windows.net/staycation/Starkhouse.svg', 'Stark House', 'Malang Indonesia', 856, 'null', 'null', 'Most Picks', 'false')

INSERT INTO dbo.PictureDb (hotelImageUrl, hotelName, hotelLocation, hotelPrice, hotelDescription, hotelGroup, hotelPopularity, IsPopular)
VALUES ('https://staycations.blob.core.windows.net/staycation/Vinnavill.svg', 'Vinna Vill', 'Malang Indonesia', 62, 'null', 'null', 'Most Picks', 'false')

INSERT INTO dbo.PictureDb (hotelImageUrl, hotelName, hotelLocation, hotelPrice, hotelDescription, hotelGroup, hotelPopularity, IsPopular)
VALUES ('https://staycations.blob.core.windows.net/staycation/Bobox.svg', 'Bobox', 'Medan Indonesia', 72, 'null', 'null', 'Most Picks', 'false')

-- First After Top

INSERT INTO dbo.PictureDb (hotelImageUrl, hotelName, hotelLocation, hotelPrice, hotelDescription, hotelGroup, hotelPopularity, IsPopular)
VALUES ('https://staycations.blob.core.windows.net/staycation/Tabby.svg', 'Tabby Town', 'Gunung Batu Indonesia', 'null', 'beauty backyard', 'Houses with beauty backyard', 'Popular Choice', 'true')

INSERT INTO dbo.PictureDb (hotelImageUrl, hotelName, hotelLocation, hotelPrice, hotelDescription, hotelGroup, hotelPopularity, IsPopular)
VALUES ('https://staycations.blob.core.windows.net/staycation/Anggana.svg', 'Anggana', 'Bogar Indonesia', 'null', 'beauty backyard', 'Houses with beauty backyard', 'null', 'false')

INSERT INTO dbo.PictureDb (hotelImageUrl, hotelName, hotelLocation, hotelPrice, hotelDescription, hotelGroup, hotelPopularity, IsPopular)
VALUES ('https://staycations.blob.core.windows.net/staycation/Seatle.svg', 'Seatle Rain', 'Jakarta Indonesia', 'null', 'beauty backyard', 'Houses with beauty backyard', 'null', 'false')

INSERT INTO dbo.PictureDb (hotelImageUrl, hotelName, hotelLocation, hotelPrice, hotelDescription, hotelGroup, hotelPopularity, IsPopular)
VALUES ('https://staycations.blob.core.windows.net/staycation/wooden.svg', 'Woonden Pit', 'Wonobo Indonesia', 'null', 'beauty backyard', 'Houses with beauty backyard', 'null', 'false')

-- Second from Top

INSERT INTO dbo.PictureDb (hotelImageUrl, hotelName, hotelLocation, hotelPrice, hotelDescription, hotelGroup, hotelPopularity, IsPopular)
VALUES ('https://staycations.blob.core.windows.net/staycation/Greenpark.svg', 'Green Park', 'Tangerang Indonesia', 'null', 'living room', 'Hotels with large living rooms', 'null', 'false')

INSERT INTO dbo.PictureDb (hotelImageUrl, hotelName, hotelLocation, hotelPrice, hotelDescription, hotelGroup, hotelPopularity, IsPopular)
VALUES ('https://staycations.blob.core.windows.net/staycation/Podo-wae.svg', 'Podo Wae', 'Madium Indonesia', 'null', 'living room', 'Hotels with large living rooms', 'null', 'false')

INSERT INTO dbo.PictureDb (hotelImageUrl, hotelName, hotelLocation, hotelPrice, hotelDescription, hotelGroup, hotelPopularity, IsPopular)
VALUES ('https://staycations.blob.core.windows.net/staycation/Silver.svg', 'Silver Rain', 'Bandung Indonesia', 'null', 'living room', 'Hotels with large living rooms', 'Popular Choice', 'true')

INSERT INTO dbo.PictureDb (hotelImageUrl, hotelName, hotelLocation, hotelPrice, hotelDescription, hotelGroup, hotelPopularity, IsPopular)
VALUES ('https://staycations.blob.core.windows.net/staycation/Cashville.svg', 'Cashville', 'Bogar Indonesia', 'null', 'living room', 'Hotels with large living rooms', 'null', 'false')

-- Third from top

INSERT INTO dbo.PictureDb (hotelImageUrl, hotelName, hotelLocation, hotelPrice, hotelDescription, hotelGroup, hotelPopularity, IsPopular)
VALUES ('https://staycations.blob.core.windows.net/staycation/Ps-wood.svg', 'Ps Wood', 'Depok Indonesia', 'null', 'Apartment', 'Apartment with kitchen set', 'null', 'false')

INSERT INTO dbo.PictureDb (hotelImageUrl, hotelName, hotelLocation, hotelPrice, hotelDescription, hotelGroup, hotelPopularity, IsPopular)
VALUES ('https://staycations.blob.core.windows.net/staycation/One-five.svg', 'One Five', 'Jakarta Indonesia', 'null', 'Apartment', 'Apartment with kitchen set', 'null', 'false')

INSERT INTO dbo.PictureDb (hotelImageUrl, hotelName, hotelLocation, hotelPrice, hotelDescription, hotelGroup, hotelPopularity, IsPopular)
VALUES ('https://staycations.blob.core.windows.net/staycation/Minimal.svg', 'Minimal', 'Bogor Indonesia', 'null', 'Apartment', 'Apartment with kitchen set', 'null', 'false')

INSERT INTO dbo.PictureDb (hotelImageUrl, hotelName, hotelLocation, hotelPrice, hotelDescription, hotelGroup, hotelPopularity, IsPopular)
VALUES ('https://staycations.blob.core.windows.net/staycation/stayshome.svg', 'Stays Home', 'wonsobo Indonesia', 'null', 'Apartment', 'Apartment with kitchen set', 'Popular Choice', 'true')

GO

GO
PRINT N'Update complete.';


GO
