CREATE PROCEDURE [dbo].[GetFantasyProTEs]
AS
	SET NOCOUNT ON;

	SELECT 	[Id], 
		[PlayerName], 
		[TeamCode],
		[ReceiveAttempts], 
		[ReceiveYards], 
		[ReceiveTDs], 
		[Fumbles], 
		[FantasyPoints] 
	FROM [dbo].[FantasyPros_TE]
	WHERE [IsLoaded] = 0;