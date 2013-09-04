using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DraftAssistant.Web.Mappers
{
	public interface IMapper<TSource, TDest>
	{
		void MapToSource(TSource source, TDest dest);
		void MapToDestination(TSource source, TDest dest);
		TDest MapToDestination(TSource source);
		TSource MapToSource(TDest dest);
	}
}
