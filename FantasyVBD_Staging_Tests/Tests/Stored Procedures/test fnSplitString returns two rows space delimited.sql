CREATE PROCEDURE [Tests].[test fnSplitString returns two rows space delimited]
AS
	-- Arrange
	Declare @resultset TABLE(splitdata NVARCHAR(MAX));
	Declare @rowCount int;
	Declare @firstName NVARCHAR(MAX), @lastName NVARCHAR(MAX);
	
	-- Act
	INSERT INTO @resultset select * from dbo.fnSplitString('Joe Montana', ' ');
	Select @rowCount = count(1) from @resultset;
	Select top 1 @firstName = splitData from @resultset;
	Select @lastName = T.splitData from (select row_number() over (order by (select 1)) RowNumber, splitData from @resultset) T order by T.[RowNumber] offset 1 rows fetch next 1 rows only;

	-- Assert
	EXEC tSQLt.AssertEquals 2, @rowCount;
	EXEC tSQLt.AssertEqualsString N'Joe', @firstName;
	EXEC tSQLt.AssertEqualsString N'Montana', @lastName;
	 