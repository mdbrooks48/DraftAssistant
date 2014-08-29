CREATE PROCEDURE [Tests].[test GetFantasyProKs Should Get Not Loaded Rows]
AS
	SET NOCOUNT ON;

	-- Arrange
	DECLARE @expected int = 0, @actual int;

	Create Table #GetFantasyProKResult
	(
		[Id] INT, 
		[PlayerName] VARCHAR(50), 
		[TeamCode] CHAR(5),
		[FieldGoals] NUMERIC(10, 2) NULL, 
		[FieldGoalAttempts] NUMERIC(10, 2) NULL, 
		[ExtraPoints] NUMERIC(10, 2) NULL, 
		[FantasyPoints] NUMERIC(10, 2) NULL, 
	)

	EXEC tSQLt.FakeTable 'FantasyPros_K', 'dbo';

	INSERT INTO [dbo].[FantasyPros_K] (Id, PlayerName, TeamCode, IsLoaded) values (1, 'Tom Tupa', 'K', 1);

	-- Act
	INSERT INTO #GetFantasyProKResult
	EXEC dbo.GetFantasyProKs;
	SELECT @actual = count(1) from #GetFantasyProKResult;

	-- Assert
	EXEC tSQLt.AssertEquals @expected, @actual;
