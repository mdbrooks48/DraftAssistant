using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;

namespace DraftAssistant.DataAccess.Repositories
{
	public class TradeRepository : EntityFrameworkRepository<Trade>, ITradeRepository
	{
		public TradeRepository(DbContext context)
			: base(context)
		{
		}

		public IList<Trade> GetByLeagueYear(LeagueYear leagueYear)
		{
			return _context.Set<Trade>().Where(x => x.LeagueYearId == leagueYear.Id).ToList();
		}
	}
}
