MERGE dbo.FantasyTeam AS target
    USING (values
	(1, 'Evil Empire','Mike Brooks'),
	(2, 'Mad Forns','Joe Cline'),
	(3, 'Steel Panthers','David Potts'),
	(4, 'Teamsters','Jerry Cline'),
	(5, 'Flying Tigers','Tommy Cline'),
	(6, 'Gravediggers','Rich Cline'),
	(7, 'Anchormen','Chris Cline'),
	(8, 'Saxons','Jerry Cline'),
	(9, 'Rebels','Wayne Cline'),
	(10, 'Juggernauts','David Smalley')
	) 
	AS source (Id, Name, OwnerName)
    ON (target.Id = source.Id)
    WHEN MATCHED THEN 
        UPDATE SET Name = source.Name,
			OwnerName = source.OwnerName
	WHEN NOT MATCHED THEN	
	    INSERT (Id, Name, OwnerName)
	    VALUES (source.Id, source.Name, source.OwnerName);
