MERGE dbo.[FantasyPros_TeamCodeMap] AS target
    USING (values
	(1, 'ARI', 'ARI'),
	(2, 'ATL', 'ATL'),
	(3, 'BAL', 'BAL'), 
	(4, 'BUF', 'BUF'), 
	(5, 'CAR', 'CAR'), 
	(6, 'CHI', 'CHI'), 
	(7, 'CIN', 'CIN'),
	(8, 'CLE', 'CLE'),
	(9, 'DAL', 'DAL'), 
	(10, 'DEN', 'DEN'),  
	(11, 'DET', 'DET'), 
	(12, 'FA', 'FA'),  
	(13, 'GB', 'GB'), 
	(14, 'HOU', 'HOU'), 
	(15, 'IND', 'IND'), 
	(16, 'JAC', 'JAC'), 
	(17, 'KC',   'KC'),
	(18, 'MIA', 'MIA'), 
	(19, 'MIN', 'MIN'), 
	(20, 'NE', 'NE'),  
	(21, 'NO', 'NO'),   
	(22, 'NYG', 'NYG'), 
	(23, 'NYJ', 'NYJ'), 
	(24, 'OAK', 'OAK'), 
	(25, 'PHI', 'PHI'), 
	(26, 'PIT', 'PIT'), 
	(27, 'SD',  'SD'),  
	(28, 'SEA', 'SEA'), 
	(29, 'SF', 'SF'),   
	(30, 'STL', 'STL'), 
	(31, 'TB', 'TB'),   
	(32, 'TEN', 'TEN'),  
	(33, 'WAS', 'WAS')
	)
	AS source (Id, [FantasyProsTeamCode], [FantasyVBDTeamCode])
    ON (target.Id = source.Id)
    WHEN MATCHED THEN 
        UPDATE SET [FantasyProsTeamCode] = source.[FantasyProsTeamCode],
			[FantasyVBDTeamCode] = source.[FantasyVBDTeamCode]
	WHEN NOT MATCHED THEN	
	    INSERT (Id, [FantasyProsTeamCode], [FantasyVBDTeamCode])
	    VALUES (source.Id, source.[FantasyProsTeamCode], source.[FantasyVBDTeamCode]);






