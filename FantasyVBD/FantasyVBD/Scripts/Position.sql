MERGE dbo.Position AS target
    USING (values
	(1, 'QB','Quarterback'),
	(2, 'RB','Runningback'),
	(3, 'WR','Wide Receiver'),
	(4, 'TE','Tight End'),
	(5, 'K','Kicker'),
	(6, 'DST','Deffense')
	) 
	AS source (Id, PositionCode, [Description])
    ON (target.Id = source.Id)
    WHEN MATCHED THEN 
        UPDATE SET PositionCode = source.PositionCode,
			[Description] = source.[Description]
	WHEN NOT MATCHED THEN	
	    INSERT (Id, PositionCode, [Description])
	    VALUES (source.Id, source.PositionCode, source.[Description]);