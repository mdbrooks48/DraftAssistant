using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DraftAssistant.DataAccess.Repositories
{
	public class DraftPickRepository : EntityFrameworkRepository<DraftPick>, IDraftPickRepository
	{
		public DraftPickRepository(DbContext context) : base(context) 
		{ 
		}

		public IList<DraftPick> GetDraftPicksByLeagueYear(LeagueYear leagueYear)
		{
			return _context.Set<DraftPick>().Where(x => x.LeagueYearId == leagueYear.Id).ToList();
		}
	}
}
