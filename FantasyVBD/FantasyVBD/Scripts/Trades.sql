DELETE FROM [dbo].[Trades];

INSERT INTO [dbo].[Trades] 
([LeagueYearId], [TraderFantasyTeamId], [DraftRound], [TradeeFantasyTeamId])
values
	(1, 10, 2, 2),
	(1, 2, 6, 1),
	(1, 1, 14, 2),
	(1, 7, 8, 2),
	(1, 1, 7, 3),
	(1, 9, 1, 6),
	(1, 6, 1, 9)
;
