using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DraftAssistant.Web.Business
{
	public class PointsCalculator : IPointsCalculator
	{

		public int CalculateFantasyPoints(Models.PlayerProjection projection)
		{
			var points = 0;
			points += CalculateTDPoints(projection.PassingTDs);
			points += CalculateYardagePoints(projection.PassingYards, 25);
			points += CalculateTDPoints(projection.RushingTDs);
			points += CalculateYardagePoints(projection.RushingYards, 10);
			points += CalculateTDPoints(projection.ReceivingTDs);
			points += CalculateYardagePoints(projection.ReceivingYards, 10);
			return points;
		}

		public int CalculateTDPoints(int count)
		{
			return count * 6;
		}

		public int CalculateYardagePoints(int yards, int yardsPerPoint)
		{
			var decimalYards = (decimal)yards;
			var decimalYardsPerPoint = (decimal)yardsPerPoint;
			var rawPoints = Math.Floor(decimalYards / decimalYardsPerPoint);
			return System.Convert.ToInt32(rawPoints);
		}
	}
}