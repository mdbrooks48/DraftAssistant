CREATE PROCEDURE [dbo].[GetFantasyProWRs]
AS
	SET NOCOUNT ON;

	SELECT ID,
		[PlayerName], 
		[TeamCode],
		[RushAttempts], 
		[RushYards], 
		[RushTDs], 
		[ReceiveAttempts], 
		[ReceiveYards], 
		[ReceiveTDs], 
		[Fumbles], 
		[FantasyPoints]
	FROM [dbo].[FantasyPros_WR]
	WHERE [IsLoaded] = 0;