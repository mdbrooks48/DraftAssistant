using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DraftAssistant.Web.Models
{
	public class PlayerPickModel
	{
		public PlayerProjection Player { get; set; }
		public DraftOrderModel DraftPick { get; set; }
	}
}