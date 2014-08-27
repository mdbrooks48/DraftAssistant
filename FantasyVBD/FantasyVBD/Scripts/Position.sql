MERGE dbo.Position AS target
    USING (values
	(1, 'QB','Quarterback', 'QB'),
	(2, 'RB','Runningback', 'RB'),
	(3, 'WR','Wide Receiver', 'WR'),
	(4, 'TE','Tight End', 'WR'),
	(5, 'K','Kicker', 'K'),
	(6, 'DST','Deffense', 'DST')
	) 
	AS source (Id, PositionCode, [Description], [NormalizedPositionCode])
    ON (target.Id = source.Id)
    WHEN MATCHED THEN 
        UPDATE SET PositionCode = source.PositionCode,
			[Description] = source.[Description],
			[NormalizedPositionCode] = source.[NormalizedPositionCode]
	WHEN NOT MATCHED THEN	
	    INSERT (Id, PositionCode, [Description],[NormalizedPositionCode])
	    VALUES (source.Id, source.PositionCode, source.[Description],[NormalizedPositionCode]);