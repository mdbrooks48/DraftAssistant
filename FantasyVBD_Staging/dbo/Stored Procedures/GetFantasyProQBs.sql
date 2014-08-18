CREATE PROCEDURE [dbo].[GetFantasyProQBs]
AS
	SELECT Id,
		[PlayerName],
		[TeamCode], 
		[PassAttempts], 
		[PassCompletions], 
		[PassYards], 
		[PassTDs], 
		[PassINTs], 
		[RushAttempts], 
		[RushYards], 
		[RushTDs], 
		[Fumbles], 
		[FantasyPoints]
	FROM [dbo].FantasyPros_QB
	WHERE IsLoaded = 0;	 

