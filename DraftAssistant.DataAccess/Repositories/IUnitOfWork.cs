using System;

namespace DraftAssistant.DataAccess.Repositories
{
	public interface IUnitOfWork : IDisposable
	{
		void SaveChanges();
	}
}
