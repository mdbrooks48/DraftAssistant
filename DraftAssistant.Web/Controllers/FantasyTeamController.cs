using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DraftAssistant.DataAccess.Repositories;
using DraftAssistant.DataAccess;
using DraftAssistant.Web.Mappers;

namespace DraftAssistant.Web.Controllers
{
    public class FantasyTeamController : Controller
    {
		private readonly IFantasyTeamRepository FantasyTeamRepo;
		private readonly IMapper<List<Models.FantasyTeamModel>, IList<DataAccess.FantasyTeam>> FantasyTeamkMapper;

		public FantasyTeamController()
		{
			var context = new FantasyVBDEntities();
			FantasyTeamRepo = new FantasyTeamRepository(context);
			FantasyTeamkMapper = new AutoMapperHelper<List<Models.FantasyTeamModel>, IList<DataAccess.FantasyTeam>>();
		}

        //
        // GET: /FantasyTeam/

        public JsonResult Index()
        {
			var fantasyTeams = FantasyTeamRepo.GetAll();
			var model = FantasyTeamkMapper.MapToSource(fantasyTeams);
			return Json(model, JsonRequestBehavior.AllowGet);
        }

    }
}
