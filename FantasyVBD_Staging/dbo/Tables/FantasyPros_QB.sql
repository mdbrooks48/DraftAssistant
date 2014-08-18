CREATE TABLE [dbo].[FantasyPros_QB]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [PlayerName] VARCHAR(50) NOT NULL, 
    [TeamCode] CHAR(5) NOT NULL, 
    [PassAttempts] NUMERIC(10, 2) NULL, 
    [PassCompletions] NUMERIC(10, 2) NULL, 
    [PassYards] NUMERIC(10, 2) NULL, 
    [PassTDs] NUMERIC(10, 2) NULL, 
    [PassINTs] NUMERIC(10, 2) NULL, 
    [RushAttempts] NUMERIC(10, 2) NULL, 
    [RushYards] NUMERIC(10, 2) NULL, 
    [RushTDs] NUMERIC(10, 2) NULL, 
    [Fumbles] NUMERIC(10, 2) NULL, 
    [FantasyPoints] NUMERIC(10, 2) NULL, 
    [AddStamp] DATETIME NOT NULL DEFAULT GetDate(), 
    [IsLoaded] BIT NOT NULL DEFAULT 0
)
