using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DraftAssistant.Web.Mappers
{
	public class AutoMapperHelper<TSource, TDest> : IMapper<TSource, TDest>
	{
		public void MapToSource(TSource source, TDest dest)
		{
			Mapper.Map<TDest, TSource>(dest, source);
		}

		public void MapToDestination(TSource source, TDest dest)
		{
			Mapper.Map<TSource, TDest>(source, dest);
		}

		public TDest MapToDestination(TSource source)
		{
			return Mapper.Map<TDest>(source);
		}

		public TSource MapToSource(TDest dest)
		{
			return Mapper.Map<TSource>(dest);
		}
	}
}