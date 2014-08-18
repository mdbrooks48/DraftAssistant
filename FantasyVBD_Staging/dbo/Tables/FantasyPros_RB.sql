CREATE TABLE [dbo].[FantasyPros_RB]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [PlayerName] VARCHAR(50) NOT NULL, 
    [TeamCode] CHAR(5) NULL,
    [RushAttempts] NUMERIC(10, 2) NULL, 
    [RushYards] NUMERIC(10, 2) NULL, 
    [RushTDs] NUMERIC(10, 2) NULL, 
    [ReceiveAttempts] NUMERIC(10, 2) NULL, 
    [ReceiveYards] NUMERIC(10, 2) NULL, 
    [ReceiveTDs] NUMERIC(10, 2) NULL, 
    [Fumbles] NUMERIC(10, 2) NULL, 
    [FantasyPoints] NUMERIC(10, 2) NULL, 
    [AddStamp] DATETIME NOT NULL DEFAULT GetDate(), 
    [IsLoaded] BIT NOT NULL DEFAULT 0

)
