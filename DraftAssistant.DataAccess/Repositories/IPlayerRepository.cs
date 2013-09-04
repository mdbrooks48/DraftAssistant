using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DraftAssistant.DataAccess.Repositories
{
	public interface IPlayerRepository : IRepository<Player>
	{
		IList<Player> GetAvailablePlayers(LeagueYear leagueYear);
		IList<Player> GetDraftedPlayers(LeagueYear leagueYear);
	}
}
