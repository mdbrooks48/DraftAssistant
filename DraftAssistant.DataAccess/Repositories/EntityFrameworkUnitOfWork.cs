using System.Data.Entity;

namespace DraftAssistant.DataAccess.Repositories
{
	public class EntityFrameworkUnitOfWork : IUnitOfWork
	{
		private readonly DbContext _context;

		public EntityFrameworkUnitOfWork(DbContext context)
		{
			_context = context;
		}

		public void SaveChanges()
		{
			_context.SaveChanges();
		}

		public void Dispose()
		{
			_context.Dispose();
		}
	}
}
