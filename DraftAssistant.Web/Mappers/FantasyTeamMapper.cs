using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DraftAssistant.Web.Mappers
{
	public static class FantasyTeamMapper
	{
		public static void Initialize()
		{
			Mapper.CreateMap<DataAccess.FantasyTeam, Models.FantasyTeamModel>()
				.ForMember(dest => dest.Id, opt => opt.MapFrom(src => src.Id))
				.ForMember(dest => dest.Name, opt => opt.MapFrom(src => src.Name))
				.ForMember(dest => dest.Owner, opt => opt.MapFrom(src => src.OwnerName));


			Mapper.AssertConfigurationIsValid();
		}
	}
}