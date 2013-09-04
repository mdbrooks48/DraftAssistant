MERGE dbo.Team AS target
    USING (values
	(1, '49ers','SF'),
	(2, 'Bears','CHI'),
	(3, 'Bengals','CIN'),
	(4, 'Bills','BUF'),
	(5, 'Broncos','DEN'),
	(6, 'Browns','CLE'),
	(7, 'Buccaneers','TB'),
	(8, 'Cardinals','ARI'),
	(9, 'Chargers','SD'),
	(10, 'Chiefs','KC'),
	(11, 'Colts','IND'),
	(12, 'Cowboys','DAL'),
	(13, 'Dolphins','MIA'),
	(14, 'Eagles','PHI'),
	(15, 'Falcons','ATL'),
	(16, 'Giants','NYG'),
	(17, 'Jaguars','JAC'),
	(18, 'Jets','NYJ'),
	(19, 'Lions','DET'),
	(20, 'Packers','GB'),
	(21, 'Panthers','CAR'),
	(22, 'Patriots','NE'),
	(23, 'Raiders','OAK'),
	(24, 'Rams','STL'),
	(25, 'Ravens','BAL'),
	(26, 'Redskins','WAS'),
	(27, 'Saints','NO'),
	(28, 'Seahawks','SEA'),
	(29, 'Steelers','PIT'),
	(30, 'Texans','HOU'),
	(31, 'Titans','TEN'),
	(32, 'Vikings','MIN'),
	(33, 'Free Agent', 'FA')
	) 
	AS source (Id, Name, TeamCode)
    ON (target.Id = source.Id)
    WHEN MATCHED THEN 
        UPDATE SET Name = source.Name,
			TeamCode = source.TeamCode
	WHEN NOT MATCHED THEN	
	    INSERT (Id, Name, TeamCode)
	    VALUES (source.Id, source.Name, source.TeamCode);
