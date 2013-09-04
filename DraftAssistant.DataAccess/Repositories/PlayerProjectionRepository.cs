using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DraftAssistant.DataAccess.Repositories
{
	public class PlayerProjectionRepository : EntityFrameworkRepository<PlayerProjection>, IPlayerProjectionRepository
	{
		public PlayerProjectionRepository(DbContext context)
			: base(context)
		{
		}

		public IList<PlayerProjection> GetAvailablePlayerProjections(LeagueYear leagueYear)
		{
			return (from playerProjection in _context.Set<PlayerProjection>()					
					where !(playerProjection.Player.DraftPicks.Any(x => x.LeagueYearId == leagueYear.Id))
					select playerProjection).ToList();
		}

		public IList<PlayerProjection> GetUnAvailablePlayerProjections(LeagueYear leagueYear)
		{
			return (from playerProjection in _context.Set<PlayerProjection>()
					join player in _context.Set<Player>() on playerProjection.PlayerId equals player.Id
					join draftPick in _context.Set<DraftPick>() on player.Id equals draftPick.PlayerId
					where draftPick.LeagueYearId == leagueYear.Id
					select playerProjection).ToList();
		}
	}
}
