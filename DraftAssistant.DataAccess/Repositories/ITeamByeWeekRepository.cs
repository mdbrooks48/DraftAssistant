﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DraftAssistant.DataAccess.Repositories
{
	public interface ITeamByeWeekRepository
	{
		IList<TeamByeWeek> GetByLeagueYear(LeagueYear leagueYear);
	}
}
