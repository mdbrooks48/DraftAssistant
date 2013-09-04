using DraftAssistant.DataAccess.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DraftAssistant.Web.Models
{
	public class PlayerModel
	{
		public int PlayerId { get; set; }
		public string FirstName { get; set; }
		public string LastName { get; set; }
		public string FullName
		{
			get
			{
				return string.IsNullOrEmpty(FirstName) ? LastName : FirstName + " " + LastName;
			}
		}
		public PositionType PositionType { get; set; }
		public string Position { get { return PositionType.ToString(); } }
	}
}