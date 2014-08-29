CREATE PROCEDURE [dbo].[GetFantasyProKs]
AS
	SET NOCOUNT ON;

	SELECT 	[Id], 
		[PlayerName], 
		[TeamCode],
		[FieldGoals], 
		[FieldGoalAttempts], 
		[ExtraPoints], 
		[FantasyPoints] 
	FROM [dbo].[FantasyPros_K]
	WHERE [IsLoaded] = 0;