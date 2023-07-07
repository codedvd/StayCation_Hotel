CREATE TABLE [dbo].[RegisteredUser]
(
	[Id] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY, 
    [FirstName] varchar(50) not null,
    [LastName] VARCHAR(50) NULL, 
    [Email] VARCHAR(100) NOT NULL, 
    [UPassword] VARCHAR(50) NOT NULL, 
    [UserName] VARCHAR(50) NOT NULL, 
    [Phone] VARCHAR(20) NULL, 
    [DateTime] DATETIME NOT NULL
)
