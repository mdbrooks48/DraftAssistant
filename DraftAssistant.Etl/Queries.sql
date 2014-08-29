SELECT lyp.[LeagueYearId],lyp.[NumberOfStarters], p.PositionCode
from dbo.[LeagueYearPosition] lyp INNER JOIN dbo.[Position] p ON lyp.PositionId = p.Id

select [dbo].[CalculateFantasyPoints](1000, 10, 100, 1, 0, 0) as Points

delete from dbo.PlayerProjection;
delete from dbo.Player;
delete from [FantasyVBD_Staging].dbo.[FantasyPros_K];
delete from [FantasyVBD_Staging].dbo.[FantasyPros_QB];
delete from [FantasyVBD_Staging].dbo.[FantasyPros_WR];
delete from [FantasyVBD_Staging].dbo.[FantasyPros_RB];
delete from [FantasyVBD_Staging].dbo.[FantasyPros_TE];
select * from dbo.Player
select * from dbo.PlayerProjection

SELECT rtrim(PositionCode) as [PositionCode], Id
from [dbo].[Position]


UPDATE P  
SET P.[Rank] = SUB.PositionRank
select P.*
from dbo.[PlayerProjection] P INNER JOIN
(select Row_Number() OVER (Partition By Proj.LeagueYearID, POS.[NormalizedPositionCode] order by FantasyPoints DESC) as [PositionRank],
 Player.Id as [PlayerId],
 FantasyPoints,
 Player.PositionId,
 Proj.LeagueYearId
 from [dbo].[PlayerProjection] PROJ INNER JOIN dbo.[Player] Player ON PROJ.PlayerId = Player.Id
 INNER JOIN dbo.[Position] POS ON Player.PositionId = POS.Id) SUB
 ON P.PLayerId = SUB.PlayerID and P.LeagueYearId = Sub.LeagueYearId
 INNER JOIN dbo.LeagueYear LY ON P.LeagueYearId = LY.Id 
Where Ly.Season = ?

 UPDATE Projection
 SET Projection.VALUEPOINTS = Projection.FantasyPoints - T.ValuePoints
 from dbo.PlayerProjection Projection 
 INNER JOIN dbo.[Player] Player ON Player.Id = Projection.PlayerId
 INNER JOIN dbo.[Position] Position ON Player.PositionId = Position.Id
 INNER JOIN dbo.[LeagueYear] LeagueYear ON Projection.LeagueYearId = LeagueYear.Id
 INNER JOIN 
 (Select lyp.LeagueYearId, normpos.NormalizedPositionCode, pp.FantasyPoints as [ValuePoints]
 from dbo.[PlayerProjection] pp
 INNER JOIN dbo.[Player] p ON pp.PlayerId = p.Id
 INNER JOIN dbo.[Position] pos on p.PositionId = pos.Id
 INNER JOIN dbo.[Position] normpos on normpos.PositionCode = pos.NormalizedPositionCode
 INNER JOIN dbo.[LeagueYearPosition] lyp ON  pp.LeagueYearId = lyp.LeagueYearId and lyp.PositionId = normpos.Id
 Where [Rank] = (10 * lyp.NumberOfStarters)) T
 ON Projection.LeagueYearID = T.LeagueYearId and Position.NormalizedPositionCode = T.NormalizedPositionCode
 Where LeagueYear.Season = ?

UPDATE Projection
SET Projection.ValueDeltaPoints = Projection.ValuePoints - NextProjection.ValuePoints
from dbo.[PlayerProjection] Projection
INNER JOIN dbo.[Player] Player ON Projection.PlayerId = [Player].Id
INNER JOIN dbo.[Position] Position ON Player.PositionId = Position.Id
INNER JOIN dbo.[LeagueYear] LeagueYear ON Projection.LeagueYearId = LeagueYear.Id
INNER JOIN dbo.[PlayerProjection] NextProjection ON NextProjection.[Rank] = Projection.[Rank] + 1 AND NextProjection.LeagueYearId = Projection.LeagueYearId
INNER JOIN dbo.[Player] NextPlayer ON NextProjection.PlayerID = NextPlayer.Id
INNER JOIN dbo.[Position] NextPosition ON NextPlayer.PositionId = NextPosition.Id
WHERE Position.NormalizedPositionCode = NextPosition.NormalizedPositionCode AND
LeagueYear.Season = ?

		-- Update ValueDeltaPoints
		UPDATE curr
			Set curr.ValueDeltaPoints = curr.ValuePoints - nextRow.ValuePoints
		FROM	@TempTable curr Inner Join @TempTable nextRow On				
				nextRow.[Rank] = curr.[Rank] + 1;	

SELECT P.FirstName, P.LastName, Pos.NormalizedPositionCode, Proj.FantasyPoints, Proj.[Rank], Proj.ValuePoints, Proj.ValueDeltaPoints
from dbo.Player P INNER JOIN dbo.[Position] Pos ON p.PositionId = Pos.Id
INNER JOIN dbo.[PlayerProjection] Proj ON P.id = Proj.PlayerId
order by Pos.NormalizedPositionCode, Proj.[Rank]


 @valuePoints = FantasyPoints from @TempTable Where [Rank] = (@teamCount * @numberOfStarters);