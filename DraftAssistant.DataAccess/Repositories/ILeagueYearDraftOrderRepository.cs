using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DraftAssistant.DataAccess.Repositories
{
	public interface ILeagueYearDraftOrderRepository : IRepository<LeagueYearDraftOrder>
	{
		IList<LeagueYearDraftOrder> GetByLeagueYear(LeagueYear leagueYear);
	}
}
