using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;

namespace DraftAssistant.DataAccess.Repositories
{
	public class LeagueYearDraftOrderRepository : EntityFrameworkRepository<LeagueYearDraftOrder>, ILeagueYearDraftOrderRepository
	{
		public LeagueYearDraftOrderRepository(DbContext context)
			: base(context)
		{
		}
		
		public IList<LeagueYearDraftOrder> GetByLeagueYear(LeagueYear leagueYear)
		{
			return _context.Set<LeagueYearDraftOrder>().Where(x => x.LeagueYearId == leagueYear.Id).ToList();
		}
	}
}
