using DraftAssistant.DataAccess;
using DraftAssistant.DataAccess.Repositories;
using DraftAssistant.Web.Mappers;
using System.Collections.Generic;
using System.Web.Mvc;
using System.Linq;

namespace DraftAssistant.Web.Controllers
{
    public class ByeWeekController : Controller
    {
		private readonly ITeamByeWeekRepository TeamByeWeekRepo;
		private readonly ILeagueYearRepository LeagueYearRepo;
		private readonly IMapper<List<Models.ByeWeekModel>, IList<DataAccess.TeamByeWeek>> ByeWeekMapper;

		public ByeWeekController()
		{
			var context = new FantasyVBDEntities();
			TeamByeWeekRepo = new TeamByeWeekRepository(context);
			LeagueYearRepo = new LeagueYearRepository(context);
			ByeWeekMapper = new AutoMapperHelper<List<Models.ByeWeekModel>, IList<DataAccess.TeamByeWeek>>();
		}

        //
        // GET: /ByeWeek/
		public JsonResult Index()
		{
			var leagueYear = LeagueYearRepo.GetById(1);
			var byeWeeks = TeamByeWeekRepo.GetByLeagueYear(leagueYear);
			var model = ByeWeekMapper.MapToSource(byeWeeks).OrderBy(x => x.WeekNumber);

			var result2 = model.GroupBy(x => x.WeekNumber)
				.Select(group => new
				{
					WeekNumber = group.Key,
					Teams = model.Where(c => c.WeekNumber == group.Key)
					.Select(c => new { TeamId = c.TeamId, TeamName = c.TeamName, TeamCode = c.TeamCode }).OrderBy(x => x.TeamName).ToList()
				}).ToList();

			return Json(result2, JsonRequestBehavior.AllowGet);
		}

    }
}
