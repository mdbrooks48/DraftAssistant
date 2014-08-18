CREATE TABLE [dbo].[FantasyPros_TE]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [PlayerName] VARCHAR(50) NOT NULL, 
    [TeamCode] CHAR(5) NULL,
    [ReceiveAttempts] NUMERIC(10, 2) NULL, 
    [ReceiveYards] NUMERIC(10, 2) NULL, 
    [ReceiveTDs] NUMERIC(10, 2) NULL, 
    [Fumbles] NUMERIC(10, 2) NULL, 
    [FantasyPoints] NUMERIC(10, 2) NULL, 
    [AddStamp] DATETIME NOT NULL DEFAULT GetDate(), 
    [IsLoaded] BIT NOT NULL DEFAULT 0
)
