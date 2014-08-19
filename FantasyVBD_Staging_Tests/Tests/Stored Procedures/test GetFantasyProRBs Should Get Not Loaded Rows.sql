CREATE PROCEDURE [Tests].[test GetFantasyProRBs Should Get Not Loaded Rows]
AS
	SET NOCOUNT ON;

	-- Arrange
	Declare @rowCount int;
	Declare @expected int = 0;

	Create Table #GetFantasyProRbsResult 
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
	);

	-- Setup Fakes
	EXEC tSQLt.FakeTable 'FantasyPros_RB', 'dbo';

	INSERT INTO [dbo].[FantasyPros_RB] (id, PlayerName, TeamCode, IsLoaded) values (1, 'Earl Campbell', 'TEN', 1); 

	-- Act
	INSERT INTO #GetFantasyProRbsResult
	EXEC dbo.GetFantasyProRBs;
	SELECT @rowCount = count(1) from #GetFantasyProRbsResult;

	-- Assert
	EXEC tSQLt.AssertEquals @expected, @rowCount