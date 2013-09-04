using DraftAssistant.DataAccess.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DraftAssistant.Web.Models
{
	public class DraftPickModel : PlayerModel
	{
		public int Id { get; set; }
		public int FantasyTeamId { get; set; }
		public string FantasyTeamName { get; set; }
		public int TeamId { get; set; }
		public string TeamCode { get; set; }
		public string TeamName { get; set; }
		public bool IsKeeper { get; set; }
		public int RoundNumber { get; set; }
		public int PickNumber { get; set; }
		public int LeagueYearId { get; set; }
	}
}