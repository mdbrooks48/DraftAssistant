using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DraftAssistant.DataAccess.Repositories
{
	public class LeagueYearRepository : EntityFrameworkRepository<LeagueYear>, ILeagueYearRepository
	{
		public LeagueYearRepository(DbContext context)
			: base(context)
		{
		}
	}
}
