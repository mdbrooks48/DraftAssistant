CREATE TABLE [dbo].[Player]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [FirstName] VARCHAR(50) NULL, 
    [LastName] VARCHAR(50) NULL, 
    [PositionId] int NOT NULL, 
    [TeamId] int NOT NULL, 
    CONSTRAINT [FK_Player_ToPosition] FOREIGN KEY ([PositionId]) REFERENCES [Position]([Id]), 
    CONSTRAINT [FK_Player_ToTeam] FOREIGN KEY ([TeamId]) REFERENCES [Team]([Id])
)
