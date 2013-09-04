using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DraftAssistant.Web.Models
{
	public class DraftOrderModel
	{
		public int FantasyTeamId { get; set; }
		public string FantasyTeamName { get; set; }
		public int RoundNumber { get; set; }
		public int PickNumber { get; set; }
	}
}