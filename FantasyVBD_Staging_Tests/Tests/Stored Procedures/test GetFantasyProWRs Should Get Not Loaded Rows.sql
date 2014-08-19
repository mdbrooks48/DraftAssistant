CREATE PROCEDURE [Tests].[test GetFantasyProWRs Should Get Not Loaded Rows]
AS
	SET NOCOUNT ON;

	-- Arrange
	DECLARE @expected int = 0, @actual int;

	CREATE Table #GetFantasyProWRsResult
	(
		[Id] INT, 
		[PlayerName] VARCHAR(50), 
		[TeamCode] CHAR(5),
		[RushAttempts] NUMERIC(10, 2), 
		[RushYards] NUMERIC(10, 2), 
		[RushTDs] NUMERIC(10, 2), 
		[ReceiveAttempts] NUMERIC(10, 2), 
		[ReceiveYards] NUMERIC(10, 2), 
		[ReceiveTDs] NUMERIC(10, 2), 
		[Fumbles] NUMERIC(10, 2), 
		[FantasyPoints] NUMERIC(10, 2)
	)

	EXEC tSQLt.FakeTable 'FantasyPros_WR', 'dbo';
	INSERT INTO dbo.FantasyPros_WR (ID, PlayerName, TeamCode, IsLoaded) values (1, 'Jerry Rice', 'SF', 1);

	-- Act
	INSERT INTO #GetFantasyProWRsResult
	EXEC dbo.GetFantasyProWRs;
	SELECT @actual = count(1) from #GetFantasyProWRsResult;

	-- Assert
	EXEC tSQLt.AssertEquals @expected, @actual;