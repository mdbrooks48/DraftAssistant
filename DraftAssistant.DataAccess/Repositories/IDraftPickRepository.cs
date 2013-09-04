using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DraftAssistant.DataAccess.Repositories
{
	public interface IDraftPickRepository : IRepository<DraftPick>
	{
		IList<DraftPick> GetDraftPicksByLeagueYear(LeagueYear leagueYear);
	}
}
