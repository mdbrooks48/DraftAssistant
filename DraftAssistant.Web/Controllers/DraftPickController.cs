using DraftAssistant.DataAccess;
using DraftAssistant.DataAccess.Repositories;
using DraftAssistant.Web.Mappers;
using DraftAssistant.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DraftAssistant.Web.Controllers
{
    public class DraftPickController : Controller
    {
		private readonly IDraftPickRepository DraftPickRepo; 
		private readonly ILeagueYearRepository LeagueYearRepo;
		private readonly ILeagueYearDraftOrderRepository LeagueYearDraftOrderRepo;
		private readonly ITradeRepository TradeRepo;
		private readonly IMapper<List<Models.DraftPickModel>, IList<DataAccess.DraftPick>> DraftPickkMapper;

		public DraftPickController()
		{
			var context = new FantasyVBDEntities();
			DraftPickRepo = new DraftPickRepository(context);
			LeagueYearRepo = new LeagueYearRepository(context);
			LeagueYearDraftOrderRepo = new LeagueYearDraftOrderRepository(context);
			TradeRepo = new TradeRepository(context);
			DraftPickkMapper = new AutoMapperHelper<List<Models.DraftPickModel>, IList<DataAccess.DraftPick>>();
		}

        //
        // GET: /DraftPick/
        public JsonResult Index(int? fantasyTeamId)
        {
			var leagueYear = LeagueYearRepo.GetById(1);
			var draftPicks = DraftPickRepo.GetDraftPicksByLeagueYear(leagueYear);
			var model = DraftPickkMapper.MapToSource(draftPicks);

			if (fantasyTeamId.HasValue) { return Json(model.Where(x => x.FantasyTeamId == fantasyTeamId.Value).ToList(), JsonRequestBehavior.AllowGet); }
			return Json(model, JsonRequestBehavior.AllowGet);
        }

		public JsonResult DraftOrder()
		{
			var leagueYear = LeagueYearRepo.GetById(1);
			var trades = TradeRepo.GetByLeagueYear(leagueYear);
			var draftOrder = LeagueYearDraftOrderRepo.GetByLeagueYear(leagueYear);

			var result = BuildDraftOrderList(draftOrder, 14);
			ApplyTrades(result, trades);

			return Json(result, JsonRequestBehavior.AllowGet);
		}

		private void ApplyTrades(List<DraftOrderModel> result, IList<Trade> trades)
		{
			//TODO implement
		}

		private List<DraftOrderModel> BuildDraftOrderList(IList<LeagueYearDraftOrder> order, int rounds)
		{
			var sortedPicks = order.OrderBy(x => x.Position);
			var orderLength = order.Count;
			var output = (from od in sortedPicks
						  from round in Enumerable.Range(1, rounds)
						  select new DraftOrderModel
						  {
							  FantasyTeamId = od.FantasyTeamId,
							  FantasyTeamName = od.FantasyTeam.Name,
							  RoundNumber = round,
							  PickNumber = (round % 2 == 1) ? (round - 1) * orderLength + od.Position : (round - 1) * orderLength + orderLength - od.Position + 1
						  }).OrderBy(x => x.PickNumber).ToList();

			return output;
		}
    }
}
