MERGE dbo.League AS target
    USING (values
	(1, 'FFL/NJ - Cline Family League')
	) 
	AS source (Id, Name)
    ON (target.Id = source.Id)
    WHEN MATCHED THEN 
        UPDATE SET Name = source.Name
	WHEN NOT MATCHED THEN	
	    INSERT (Id, Name)
	    VALUES (source.Id, source.Name);
