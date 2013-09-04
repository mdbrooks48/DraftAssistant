using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DraftAssistant.DataAccess.Repositories
{
	public interface ITradeRepository : IRepository<Trade>
	{
		IList<Trade> GetByLeagueYear(LeagueYear leagueYear);
	}
}
