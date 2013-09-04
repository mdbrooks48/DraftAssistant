CREATE FUNCTION [dbo].[CalculatePlayerProjections]
(
	@positionType char(3),
	@leagueYearId int
)
RETURNS @returntable TABLE
(
	[LeagueYearId] int, 
	[PlayerId] int,
	[Attempts] DECIMAL(18, 1), 
	[Completions] DECIMAL(18, 1), 
	[PassingYards] DECIMAL(18, 1), 
	[PassingTDs] DECIMAL(18, 1), 
	[PassingAvg] DECIMAL(18, 1),
	[Interceptions] DECIMAL(18, 1), 
	[PasserRating] DECIMAL(18, 1), 
	[RushAttempts] DECIMAL(18, 1), 
	[RushYards] DECIMAL(18, 1), 
	[RushAvg] DECIMAL(18, 1), 
	[RushingTDs] DECIMAL(18, 1), 
	[Targets] DECIMAL(18, 1), 
	[Receptions] DECIMAL(18, 1), 
	[ReceivingYards] DECIMAL(18, 1), 
	[ReceivingAvg] DECIMAL(18, 1), 
	[ReceivingTDs] DECIMAL(18, 1), 
	[FumblesLost] DECIMAL(18, 1), 
	[FantasyPoints] DECIMAL(18, 1), 
	[Rank] int, 
	[ValuePoints]  DECIMAL(18, 1),
	[ValueDeltaPoints] DECIMAL(18, 1), 
    [YardageBonusPoints] DECIMAL(18, 1)
)
AS
BEGIN
	DECLARE @TempTable table ([LeagueYearId] int, [PlayerId] DECIMAL(18, 1),[Attempts] DECIMAL(18, 1), 
	[Completions] DECIMAL(18, 1), [PassingYards] DECIMAL(18, 1), [PassingTDs] DECIMAL(18, 1), [PassingAvg] DECIMAL(18, 1),
	[Interceptions] DECIMAL(18, 1), [PasserRating] DECIMAL(18, 1), [RushAttempts] DECIMAL(18, 1), 
	[RushYards] DECIMAL(18, 1), [RushAvg] DECIMAL(18, 1), [RushingTDs] DECIMAL(18, 1), [Targets] DECIMAL(18, 1), 
	[Receptions] DECIMAL(18, 1), [ReceivingYards] DECIMAL(18, 1), 	[ReceivingAvg] DECIMAL(18, 1), [ReceivingTDs] DECIMAL(18, 1), 
	[FumblesLost] DECIMAL(18, 1), [FantasyPoints] DECIMAL(18, 1), [Rank] DECIMAL(18, 1), [ValuePoints] DECIMAL(18, 1), [ValueDeltaPoints] DECIMAL(18, 1), 
    [YardageBonusPoints] DECIMAL(18, 1)) 
	
	DECLARE @teamCount int;
	DECLARE @numberOfStarters int;
	DECLARE @valuePoints DECIMAL(18, 1);

	INSERT INTO @TempTable
	SELECT
		@leagueYearId,
		p.Id,
		r.[Attempts], r.[Completions], r.[PassingYards], r.[PassingTDs], r.[PassingAvg], r.[Interceptions], r.[PasserRating], r.[RushAttempts], r.[RushYards], 
		r.[RushAvg], r.[RushingTDs], r.[Targets], r.[Receptions], r.[ReceivingYards], r.[ReceivingAvg], r.[ReceivingTDs], r.[FumblesLost], 
		r.CalcPoints,
		Row_Number() OVER (partition by r.[NormalizedPositionType] order by r.[CalcPoints] DESC) as Rnk,
		0 as [ValuePoints],
		0 as [ValueDeltaPoints],
		0 as [YardageBonusPoints]
	FROM
		(SELECT rs.*,
		CASE rs.PositionType 
			WHEN 'K' THEN rs.FantasyPoints
			WHEN 'DST' THEN rs.FantasyPoints
			ELSE 
				[dbo].[CalculateFantasyPoints](rs.[PassingYards], rs.[PassingTDs],rs.[RushYards], rs.[RushingTDs],rs.[ReceivingYards],rs.[ReceivingTDs]) +
				(CASE when Completions > 0 then (case when (PassingYards / Completions) > 10 then PassingTDs * 3 else 0 end) else 0 end) + 
				(Case when RushAvg > 10 then RushingTDs * 3 else 0 end) + 
				(Case when ReceivingAvg > 10 then ReceivingTDs * 3 else 0 end)
			END as CalcPoints,
		CASE rs.PositionType
			WHEN 'TE' THEN 'WR'
			ELSE rs.PositionType
			END as NormalizedPositionType,
		CASE
			when Completions > 0 THEN PassingYards / Completions
			else 0
			end as PassingAvg
		FROM [dbo].[RawStats] rs) r
		INNER JOIN [dbo].[Player] p ON ((r.FirstName = p.FirstName) OR (r.FirstName is null and p.FirstName is null)) and r.LastName = p.LastName
		INNER JOIN [dbo].[Team] t ON r.TeamCode = t.TeamCode and p.TeamId = t.Id
		WHERE CASE r.PositionType
			WHEN 'TE' THEN 'WR'
			ELSE r.PositionType
			END = @positionType;
		
		-- Calculate Bonus Yards
		Update @TempTable
			Set [YardageBonusPoints] = (CASE when PassingAvg > 10 then PassingTDs * 3 else 0 end) + 
			(Case when RushAvg > 10 then RushingTDs * 3 else 0 end) + 
			(Case when ReceivingAvg > 10 then ReceivingTDs * 3 else 0 end);

		Select @teamCount = count(1) from [dbo].[FantasyTeam] ft;
		Select @numberOfStarters = lyp.NumberOfStarters from [dbo].[LeagueYearPosition] lyp 
				INNER JOIN [dbo].[Position] p ON lyp.PositionId = p.Id 
				where lyp.LeagueYearId = @leagueYearId and p.PositionCode = @positionType;
	
		-- Calculate Value Points
		Select @valuePoints = FantasyPoints from @TempTable Where [Rank] = (@teamCount * @numberOfStarters);
		-- Update ValuePoints
		UPDATE @TempTable Set ValuePoints = [FantasyPoints] - @valuePoints;
		-- Update ValueDeltaPoints
		UPDATE curr
			Set curr.ValueDeltaPoints = curr.ValuePoints - nextRow.ValuePoints
		FROM	@TempTable curr Inner Join @TempTable nextRow On				
				nextRow.[Rank] = curr.[Rank] + 1;			

	INSERT @returntable
	SELECT * from @TempTable
	RETURN
END
