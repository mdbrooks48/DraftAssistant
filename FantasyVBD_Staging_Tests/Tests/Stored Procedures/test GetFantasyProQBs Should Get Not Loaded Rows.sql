CREATE PROCEDURE [Tests].[test GetFantasyProQBs Should Get Not Loaded Rows]
AS
	SET NOCOUNT ON;

	Declare @expected int = 0;
	Declare @actual int;

	-- Arrange
	-- Create Temp Table for Result Set
	Create Table #GetFantasyProQBsResult (
		Id int,
		PlayerName varchar(50),
		TeamCode char(5),
		PassAttempts NUMERIC(10, 2), 
		PassCompletions NUMERIC(10, 2), 
		PassYards NUMERIC(10, 2), 
		PassTDs NUMERIC(10, 2), 
		PassINTs NUMERIC(10, 2), 
		RushAttempts NUMERIC(10, 2), 
		RushYards NUMERIC(10, 2), 
		RushTDs NUMERIC(10, 2), 
		Fumbles NUMERIC(10, 2), 
		FantasyPoints NUMERIC(10, 2)
	);

	-- Setup data
	EXEC tSQLt.FakeTable 'dbo', 'FantasyPros_QB';

    INSERT INTO dbo.FantasyPros_QB(id, PlayerName, TeamCode, IsLoaded)
                                         VALUES (1, 'Joe Montana', 'SF', 1);
										 
	--Act
	INSERT INTO #GetFantasyProQBsResult
	EXEC dbo.GetFantasyProQBs;
    
	SELECT @actual = Count(1) from #GetFantasyProQBsResult;

	--Assert
    EXEC tSQLt.AssertEquals @expected, @actual;
