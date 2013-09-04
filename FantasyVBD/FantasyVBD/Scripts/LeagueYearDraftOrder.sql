MERGE dbo.LeagueYearDraftOrder AS target
    USING (values
	(1, 1, 10),
	(2, 1, 3),
	(3, 1, 5),
	(4, 1, 1),
	(5, 1, 8),
	(6, 1, 6),
	(7, 1, 7),
	(8, 1, 2),
	(9, 1, 4),
	(10, 1, 9)
	) 
	AS source ([FantasyTeamId],[LeagueYearId],[Position])
    ON (target.[FantasyTeamId] = source.[FantasyTeamId] and target.[LeagueYearId] = source.[LeagueYearId])
    WHEN MATCHED THEN 
        UPDATE SET [Position] = source.[Position]
	WHEN NOT MATCHED THEN	
	    INSERT ([FantasyTeamId],[LeagueYearId],[Position])
	    VALUES (source.[FantasyTeamId], source.[LeagueYearId], source.[Position]);