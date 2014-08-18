CREATE TABLE [dbo].[FantasyPros_K]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [PlayerName] VARCHAR(50) NOT NULL, 
    [TeamCode] CHAR(5) NOT NULL, 
    [FieldGoals] NUMERIC(10, 2) NULL, 
    [FieldGoalAttempts] NUMERIC(10, 2) NULL, 
    [ExtraPoints] NUMERIC(10, 2) NULL, 
    [FantasyPoints] NUMERIC(10, 2) NULL, 
    [AddStamp] DATETIME NOT NULL DEFAULT GetDate(), 
    [IsLoaded] BIT NOT NULL DEFAULT 0
)
