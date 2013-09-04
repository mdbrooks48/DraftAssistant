CREATE TABLE [dbo].[DraftPicks]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [LeagueYearId] INT NOT NULL, 
    [FantasyTeamId] INT NOT NULL, 
    [PlayerId] INT NOT NULL, 
    [IsKeeper] BIT NOT NULL DEFAULT 0, 
    [RoundNumber] INT NULL, 
    CONSTRAINT [FK_DraftPicks_ToLeagueYear] FOREIGN KEY (LeagueYearId) REFERENCES [LeagueYear]([Id]), 
    CONSTRAINT [FK_DraftPicks_ToFantasyTeam] FOREIGN KEY (FantasyTeamId) REFERENCES [FantasyTeam]([Id]), 
    CONSTRAINT [FK_DraftPicks_ToPlayer] FOREIGN KEY (PlayerId) REFERENCES [Player]([Id])
)
