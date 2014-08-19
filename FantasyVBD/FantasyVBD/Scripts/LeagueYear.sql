MERGE dbo.LeagueYear AS target
    USING (values
	(1, 1,'2013'),
	(2, 1, '2014')
	) 
	AS source (Id, LeagueId, Season)
    ON (target.Id = source.Id)
    WHEN MATCHED THEN 
        UPDATE SET Season = source.Season
	WHEN NOT MATCHED THEN	
	    INSERT (Id, LeagueId, Season)
	    VALUES (source.Id, source.LeagueId, source.Season);
