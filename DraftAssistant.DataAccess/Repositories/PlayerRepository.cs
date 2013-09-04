using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DraftAssistant.DataAccess.Repositories
{
	public class PlayerRepository : EntityFrameworkRepository<Player> ,IPlayerRepository
	{
		public PlayerRepository(DbContext context):base(context)
		{
		}

		public IList<Player> GetAvailablePlayers(LeagueYear leagueYear)
		{
			return (from player in _context.Set<Player>()
					where !(player.DraftPicks.Any(x => x.LeagueYearId == leagueYear.Id))
					select player).ToList();
		}
		
		public IList<Player> GetDraftedPlayers(LeagueYear leagueYear)
		{
			return (from player in _context.Set<Player>()
					where (from draft in _context.Set<DraftPick>() select draft.LeagueYear).Equals(leagueYear)
					select player).ToList();
		}
	}
}
