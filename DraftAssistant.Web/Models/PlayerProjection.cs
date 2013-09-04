using DraftAssistant.DataAccess.Enums;
using DraftAssistant.Web.Business;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DraftAssistant.Web.Models
{
	public class PlayerProjection : PlayerModel
	{
		public int PassingYards { get; set; }
		public int PassingTDs { get; set; }
		public int RushingYards { get; set; }
		public int RushingTDs { get; set; }
		public int ReceivingYards { get; set; }
		public int ReceivingTDs { get; set; }
		public int FantasyPoints { get; set; }
		public int PositionRank { get; set; }
		public int ValuePoints { get; set; }
		public int ValueDelta { get; set; }
		public int YardageBonusPoints { get; set; }
		public bool IsDrafted { get; set; }
		public string DraftedBy { get; set; }
		public int ByeWeek { get; set; }
		public string TeamName { get; set; }
		public string TeamCode { get; set; }
		public int TeamId { get; set; }
		public int Rank { get; set; }

		public void CalculatePoints(IPointsCalculator calculator) 
		{
			FantasyPoints = calculator.CalculateFantasyPoints(this);
		}

		public void CalculateValue(IValueCalculator calculator, int basisPoints)
		{
			ValueDelta = calculator.CalculateValue(this, basisPoints);
		}
	}
}