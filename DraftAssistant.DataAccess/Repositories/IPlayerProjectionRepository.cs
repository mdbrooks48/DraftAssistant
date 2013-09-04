using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DraftAssistant.DataAccess.Repositories
{
	public interface IPlayerProjectionRepository : IRepository<PlayerProjection>
	{
		IList<PlayerProjection> GetAvailablePlayerProjections(LeagueYear leagueYear);
		IList<PlayerProjection> GetUnAvailablePlayerProjections(LeagueYear leagueYear);
	}
}
