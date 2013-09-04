using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DraftAssistant.DataAccess.Repositories
{
	public class TeamByeWeekRepository : EntityFrameworkRepository<TeamByeWeek>, ITeamByeWeekRepository
	{
		public TeamByeWeekRepository(DbContext context):base(context)
		{
		}

		public IList<TeamByeWeek> GetByLeagueYear(LeagueYear leagueYear)
		{
			return _context.Set<TeamByeWeek>().Where(x => x.LeagueYearId == leagueYear.Id).ToList();
		}
	}
}
