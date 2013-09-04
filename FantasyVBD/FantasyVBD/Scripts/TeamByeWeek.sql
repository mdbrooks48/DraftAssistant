MERGE dbo.TeamByeWeek AS target
    USING (values
	(1, 1, 6),
	(2, 1, 5),
	(3, 1, 9),
	(4, 1, 9),
	(5, 1, 6),
	(6, 1, 7),
	(7, 1, 2),
	(8, 1, 6),
	(9, 1, 5),
	(10, 1,7),
	(11, 1,5),
	(12, 1,8),
	(13, 1,3),
	(14, 1,9),
	(15, 1,3),
	(16, 1,6),
	(17, 1,6),
	(18, 1,7),
	(19, 1,6),
	(20, 1, 1),
	(21, 1,1),
	(22, 1,7),
	(23, 1,4),
	(24, 1,8),
	(25, 1,5),
	(26, 1,2),
	(27, 1,4),
	(28, 1,9),
	(29, 1,2),
	(30, 1,5),
	(31, 1,5),
	(32, 1,5)
	) 
	AS source (TeamId, LeagueYearId, ByeWeekId)
    ON (target.TeamId = source.TeamId and target.LeagueYearId = source.LeagueYearId)
    WHEN MATCHED THEN 
        UPDATE SET ByeWeekId = source.ByeWeekId
	WHEN NOT MATCHED THEN	
	    INSERT (TeamId, LeagueYearId, ByeWeekId)
	    VALUES (source.TeamId, source.LeagueYearId, source.ByeWeekId);
