MERGE dbo.LeagueYearPosition AS target
    USING (values
	(1, 1, 1), -- QB
	(1, 2, 2), -- RB
	(1, 3, 4), -- WR/TE
	(1, 5, 1), -- K
	(1, 6, 1), -- DST
	(2, 1, 1), -- QB
	(2, 2, 2), -- RB
	(2, 3, 4), -- WR/TE
	(2, 5, 1), -- K
	(2, 6, 1) -- DST
	) 
	AS source (LeagueYearId, PositionId, [NumberOfStarters])
    ON (target.LeagueYearId = source.LeagueYearId and target.PositionId = source.PositionId)
    WHEN MATCHED THEN 
        UPDATE SET [NumberOfStarters] = source.[NumberOfStarters]
	WHEN NOT MATCHED THEN	
	    INSERT (LeagueYearId, PositionId, [NumberOfStarters])
	    VALUES (source.LeagueYearId, source.PositionId, source.[NumberOfStarters]);