using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DraftAssistant.Web.Mappers
{
	public static class PlayerProjectionMapper
	{
		public static void Initialize()
		{
			Mapper.CreateMap<DataAccess.PlayerProjection, Models.PlayerProjection>()
				.ForMember(dest => dest.PlayerId, opt => opt.MapFrom(src => src.PlayerId))
				.ForMember(dest => dest.PassingYards, opt => opt.MapFrom(src => Math.Ceiling(src.PassingYards.Value)))
				.ForMember(dest => dest.PassingTDs, opt => opt.MapFrom(src => Math.Ceiling(src.PassingTDs.Value)))
				.ForMember(dest => dest.RushingYards, opt => opt.MapFrom(src => Math.Ceiling(src.RushYards.Value)))
				.ForMember(dest => dest.RushingTDs, opt => opt.MapFrom(src => Math.Ceiling(src.RushingTDs.Value)))
				.ForMember(dest => dest.ReceivingYards, opt => opt.MapFrom(src => Math.Ceiling(src.ReceivingYards.Value)))
				.ForMember(dest => dest.ReceivingTDs, opt => opt.MapFrom(src => Math.Ceiling(src.ReceivingTDs.Value)))
				.ForMember(dest => dest.FirstName, opt => opt.MapFrom(src => src.Player.FirstName))
				.ForMember(dest => dest.LastName, opt => opt.MapFrom(src => src.Player.LastName))
				.ForMember(dest => dest.PositionType, opt => opt.MapFrom(src => src.Player.PositionType))
				.ForMember(dest => dest.TeamName, opt => opt.MapFrom(src => src.Player.Team.Name))
				.ForMember(dest => dest.TeamCode, opt => opt.MapFrom(src => src.Player.Team.TeamCode))
				.ForMember(dest => dest.TeamId, opt => opt.MapFrom(src => src.Player.TeamId))
				.ForMember(dest => dest.ByeWeek, opt => opt.Ignore())
				.ForMember(dest => dest.PositionRank, opt => opt.MapFrom(src => src.Rank))
				.ForMember(dest => dest.FantasyPoints, opt => opt.MapFrom(src => Math.Ceiling(src.FantasyPoints.Value)))
				.ForMember(dest => dest.ValuePoints, opt => opt.MapFrom(src => Math.Ceiling(src.ValuePoints.Value)))
				.ForMember(dest => dest.ValueDelta, opt => opt.MapFrom(src => Math.Ceiling(src.ValueDeltaPoints.Value)))
				.ForMember(dest => dest.YardageBonusPoints, opt => opt.MapFrom(src => Math.Ceiling(src.YardageBonusPoints.Value)))
				.ForMember(dest => dest.IsDrafted, opt => opt.Ignore())
				.ForMember(dest => dest.DraftedBy, opt => opt.Ignore());


			Mapper.AssertConfigurationIsValid();
  //Mapper.CreateMap<CalendarEvent, CalendarEventForm>()
  //  .ForMember(dest => dest.EventDate, opt => opt.MapFrom(src => src.EventDate.Date))
  //  .ForMember(dest => dest.EventHour, opt => opt.MapFrom(src => src.EventDate.Hour))
  //  .ForMember(dest => dest.EventMinute, opt => opt.MapFrom(src => src.EventDate.Minute));

		}
	}
}