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
using DraftAssistant.Web.Filters;
using DraftAssistant.Web.Models;

namespace DraftAssistant.Web.Controllers
{
	[NoCacheFilter()]
    public class PlayerController : Controller
    {
		public FantasyVBDEntities Context { get; set; }
		public IPlayerProjectionRepository PlayerRepository { get; set; }
		public ILeagueYearRepository LeagueYearRepository { get; set; }
		public IDraftPickRepository DraftPickRepository { get; set; }
		public IMapper<List<Models.PlayerProjection>, IList<DataAccess.PlayerProjection>> PlayerMapper { get; set; }

		public PlayerController()
		{
			Context = new FantasyVBDEntities();
			PlayerRepository = new PlayerProjectionRepository(Context);
			LeagueYearRepository = new LeagueYearRepository(Context);
			DraftPickRepository = new DraftPickRepository(Context);
			PlayerMapper = new AutoMapperHelper<List<Models.PlayerProjection>, IList<DataAccess.PlayerProjection>>();
		}
        //
        // GET: /Player/		
        public ActionResult Index()
        {
			var leagueYear = LeagueYearRepository.GetById(1);
			ViewBag.NextPickNumber = DraftPickRepository.GetLastPickNumber(leagueYear) + 1;
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


		[HttpPost]
		public JsonResult Draft(PlayerPickModel model)
		{
			if (ModelState.IsValid)
			{
				var leagueYear = LeagueYearRepository.GetById(1);
				var pick = new DraftPick()
				{
					FantasyTeamId = model.DraftPick.FantasyTeamId,
					IsKeeper = false,
					LeagueYearId = leagueYear.Id,
					PickNumber = model.DraftPick.PickNumber,
					PlayerId = model.Player.PlayerId,
					RoundNumber = model.DraftPick.RoundNumber
				};
				DraftPickRepository.Add(pick);
				Context.SaveChanges();
				return Json(new { Success = true });
			}
			return Json(new { Success=false } );
		}

		[HttpPost]
		public JsonResult UnDraft(Models.PlayerProjection player, DraftOrderModel draftPick)
		{
			return Json(null);
		}
    }
}
