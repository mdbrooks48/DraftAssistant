CREATE TABLE [dbo].[LeagueYearDraftOrder]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [FantasyTeamId] INT NOT NULL, 
    [LeagueYearId] INT NOT NULL, 
    [Position] SMALLINT NOT NULL, 
    CONSTRAINT [FK_LeagueYearDraftOrder_ToFantasyTeam] FOREIGN KEY ([FantasyTeamId]) REFERENCES [FantasyTeam]([Id]), 
    CONSTRAINT [FK_LeagueYearDraftOrder_ToLeagueYear] FOREIGN KEY ([LeagueYearId]) REFERENCES [LeagueYear]([Id])
)
