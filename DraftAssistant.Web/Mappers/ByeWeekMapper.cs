using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DraftAssistant.Web.Mappers
{
	public static class ByeWeekMapper
	{
		public static void Initialize()
		{
			Mapper.CreateMap<DataAccess.TeamByeWeek, Models.ByeWeekModel>()
				.ForMember(dest => dest.ByeWeekId, opt => opt.MapFrom(src => src.ByeWeekId))
				.ForMember(dest => dest.WeekNumber, opt => opt.MapFrom(src => src.ByeWeek.WeekNumber))
				.ForMember(dest => dest.TeamCode, opt => opt.MapFrom(src => src.Team.TeamCode))
				.ForMember(dest => dest.TeamId, opt => opt.MapFrom(src => src.Team.Id))
				.ForMember(dest => dest.TeamName, opt => opt.MapFrom(src => src.Team.Name));


			Mapper.AssertConfigurationIsValid();
		}
	}
}