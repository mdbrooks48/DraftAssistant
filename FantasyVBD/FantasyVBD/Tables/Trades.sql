CREATE TABLE [dbo].[Trades]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [LeagueYearId] INT NULL, 
    [TraderFantasyTeamId] INT NULL, 
    [DraftRound] SMALLINT NULL, 
    [TradeeFantasyTeamId] INT NULL, 
    CONSTRAINT [FK_Trades_ToLeagueYear] FOREIGN KEY (LeagueYearId) REFERENCES [LeagueYear]([Id]), 
    CONSTRAINT [FK_Trades_ToTraderFantasyTeam] FOREIGN KEY ([TraderFantasyTeamId]) REFERENCES [FantasyTeam]([Id]), 
    CONSTRAINT [FK_Trades_ToTradeeFantasyTeam] FOREIGN KEY ([TradeeFantasyTeamId]) REFERENCES [FantasyTeam]([Id])
)
