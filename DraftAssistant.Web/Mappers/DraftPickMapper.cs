using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DraftAssistant.Web.Mappers
{
	public static class DraftPickMapper
	{
		public static void Initialize()
		{
			Mapper.CreateMap<DataAccess.DraftPick, Models.DraftPickModel>()
				.ForMember(dest => dest.Id, opt => opt.MapFrom(src => src.Id))
				.ForMember(dest => dest.FantasyTeamId, opt => opt.MapFrom(src => src.FantasyTeamId))
				.ForMember(dest => dest.FantasyTeamName, opt => opt.MapFrom(src => src.FantasyTeam.Name))
				.ForMember(dest => dest.IsKeeper, opt => opt.MapFrom(src => src.IsKeeper))
				.ForMember(dest => dest.LeagueYearId, opt => opt.MapFrom(src => src.LeagueYearId))
				.ForMember(dest => dest.PickNumber, opt => opt.Ignore())
				.ForMember(dest => dest.PlayerId, opt => opt.MapFrom(src => src.PlayerId))
				.ForMember(dest => dest.FirstName, opt => opt.MapFrom(src => src.Player.FirstName))
				.ForMember(dest => dest.LastName, opt => opt.MapFrom(src => src.Player.LastName))
				.ForMember(dest => dest.PositionType, opt => opt.MapFrom(src => src.Player.PositionType))
				.ForMember(dest => dest.RoundNumber, opt => opt.MapFrom(src => src.RoundNumber))
				.ForMember(dest => dest.TeamId, opt => opt.MapFrom(src => src.Player.TeamId))
				.ForMember(dest => dest.TeamCode, opt => opt.MapFrom(src => src.Player.Team.TeamCode))
				.ForMember(dest => dest.TeamName, opt => opt.MapFrom(src => src.Player.Team.Name));
			
			Mapper.AssertConfigurationIsValid();
		}
	}
}