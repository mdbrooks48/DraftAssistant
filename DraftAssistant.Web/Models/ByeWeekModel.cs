using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DraftAssistant.Web.Models
{
	public class ByeWeekModel
	{
		public int ByeWeekId { get; set; }
		public int WeekNumber { get; set; }
		public int TeamId { get; set; }
		public string TeamName { get; set; }
		public string TeamCode { get; set; }
	}
}