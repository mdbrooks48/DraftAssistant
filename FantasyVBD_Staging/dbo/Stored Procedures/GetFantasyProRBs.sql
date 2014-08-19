CREATE PROCEDURE [dbo].[GetFantasyProRBs]
AS
	SET NOCOUNT ON;

	SELECT 	Id,
		PlayerName,
		TeamCode,
		[RushAttempts], 
		[RushYards], 
		[RushTDs], 
		[ReceiveAttempts], 
		[ReceiveYards], 
		[ReceiveTDs], 
		[Fumbles], 
		[FantasyPoints] 
	FROM [dbo].[FantasyPros_RB]
	WHERE IsLoaded = 0;