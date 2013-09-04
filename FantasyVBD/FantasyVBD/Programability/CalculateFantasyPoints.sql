CREATE FUNCTION [dbo].[CalculateFantasyPoints]
(
	@passingYards decimal(18,1),
	@passingTDs decimal(18,1),
	@rushingYards decimal(18,1),
	@rushingTDs decimal(18,1),
	@receivingYards decimal(18,1),
	@receivingTDs decimal(18,1)
)
RETURNS INTEGER
AS
BEGIN
	DECLARE @points INT;
	SET @points = Cast((@passingYards / 25) as INT);
	SET @points = @points + Cast((@passingTDs * 6) as INT);
	SET @points = @points + Cast((@rushingYards / 10) as INT);
	SET @points = @points + Cast((@rushingTDs * 6) as INT);
	SET @points = @points + Cast((@receivingYards / 10) as INT);
	SET @points = @points + Cast((@receivingTDs * 6) as INT);

	RETURN @points;
END
