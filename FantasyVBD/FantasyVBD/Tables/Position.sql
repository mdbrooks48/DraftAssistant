CREATE TABLE [dbo].[Position]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [PositionCode] CHAR(3) NOT NULL, 
    [Description] VARCHAR(50) NULL, 
    [NormalizedPositionCode] CHAR(3) NULL
)
