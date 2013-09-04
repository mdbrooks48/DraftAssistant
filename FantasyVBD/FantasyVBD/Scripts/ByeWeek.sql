MERGE dbo.ByeWeek AS target
    USING (values
	(1, 4),
	(2, 5),
	(3, 6),
	(4, 7),
	(5, 8),
	(6, 9),
	(7, 10),
	(8, 11),
	(9, 12)
	) 
	AS source (Id, WeekNumber)
    ON (target.Id = source.Id)
    WHEN MATCHED THEN 
        UPDATE SET WeekNumber = source.WeekNumber
	WHEN NOT MATCHED THEN	
	    INSERT (Id, WeekNumber)
	    VALUES (source.Id, source.WeekNumber);
