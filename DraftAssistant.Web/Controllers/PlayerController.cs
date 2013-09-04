using DraftAssistant.DataAccess;
using DraftAssistant.DataAccess.Enums;
using DraftAssistant.DataAccess.Repositories;
using DraftAssistant.Web.Business;
using DraftAssistant.Web.Mappers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DraftAssistant.Web.Controllers
{
    public class PlayerController : Controller
    {
		public FantasyVBDEntities Context { get; set; }
		public IPlayerProjectionRepository PlayerRepository { get; set; }
		public ILeagueYearRepository LeagueYearRepository { get; set; }
		public IMapper<List<Models.PlayerProjection>, IList<DataAccess.PlayerProjection>> PlayerMapper { get; set; }

		public PlayerController()
		{
			Context = new FantasyVBDEntities();
			PlayerRepository = new PlayerProjectionRepository(Context);
			LeagueYearRepository = new LeagueYearRepository(Context);
			PlayerMapper = new AutoMapperHelper<List<Models.PlayerProjection>, IList<DataAccess.PlayerProjection>>();
		}
        //
        // GET: /Player/		
        public ActionResult Index()
        {
            return View();
        }

		//[HttpGet]
		//public JsonResult Available(PositionType? positionType)
		//{
		//	var context = LeagueYearRepository.GetById(1);
		//	var players = PlayerRepository.GetAvailablePlayerProjections(context);
		//	var availablePlayers = PlayerMapper.MapToSource(players);
		//	if (positionType.HasValue) { return Json(availablePlayers.Where(x => x.PositionType == positionType).ToList(), JsonRequestBehavior.AllowGet); }
		//	return Json(availablePlayers, JsonRequestBehavior.AllowGet);	
		//}

		[HttpGet]
		public JsonResult Available(PositionType? positionType, int? rowCount)
		{
			var context = LeagueYearRepository.GetById(1);
			var players = PlayerRepository.GetAvailablePlayerProjections(context);
			var availablePlayers = PlayerMapper.MapToSource(players).OrderByDescending(x => x.ValuePoints).ToList();

			// All Positions
			if (!positionType.HasValue) 
			{
				if (!rowCount.HasValue)
				{
					// All Players
					return Json(availablePlayers.ToList(), JsonRequestBehavior.AllowGet);
				}
				// Top rowCount players ordered by ValueDelta
				return Json(availablePlayers.Take(rowCount.Value).OrderByDescending(x => x.ValueDelta).ToList(), JsonRequestBehavior.AllowGet);	
			}

			if (rowCount.HasValue)
			{
				// Top rowCount of players at a specific position
				return Json(availablePlayers.Where(x => x.PositionType == positionType).Take(rowCount.Value).ToList(), JsonRequestBehavior.AllowGet);
			}
			// all players at a position
			return Json(availablePlayers.Where(x => x.PositionType == positionType).ToList(), JsonRequestBehavior.AllowGet);
		}
    }
}
