using System.Data.Entity;

namespace DraftAssistant.DataAccess.Repositories
{
	public class FantasyTeamRepository : EntityFrameworkRepository<FantasyTeam>, IFantasyTeamRepository
	{
		public FantasyTeamRepository(DbContext context)
			: base(context)
		{
		}
	}
}
