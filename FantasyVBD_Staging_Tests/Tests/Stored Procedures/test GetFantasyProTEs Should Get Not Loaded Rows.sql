CREATE PROCEDURE [Tests].[test GetFantasyProTEs Should Get Not Loaded Rows]
AS
	SET NOCOUNT ON;

	-- Arrange
	DECLARE @expected int = 0, @actual int;

	Create Table #GetFantasyProTEResult
	(
		[Id] INT, 
		[PlayerName] VARCHAR(50), 
		[TeamCode] CHAR(5),
		[ReceiveAttempts] NUMERIC(10, 2), 
		[ReceiveYards] NUMERIC(10, 2), 
		[ReceiveTDs] NUMERIC(10, 2), 
		[Fumbles] NUMERIC(10, 2), 
		[FantasyPoints] NUMERIC(10, 2) 
	)

	EXEC tSQLt.FakeTable 'FantasyPros_TE', 'dbo';

	INSERT INTO [dbo].[FantasyPros_TE] (Id, PlayerName, TeamCode, IsLoaded) values (1, 'Tony Gonzalez', 'TE', 1);

	-- Act
	INSERT INTO #GetFantasyProTEResult
	EXEC dbo.GetFantasyProTEs;
	SELECT @actual = count(1) from #GetFantasyProTEResult;

	-- Assert
	EXEC tSQLt.AssertEquals @expected, @actual;
