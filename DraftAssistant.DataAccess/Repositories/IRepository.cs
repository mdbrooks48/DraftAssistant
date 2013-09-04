
using System.Collections.Generic;
namespace DraftAssistant.DataAccess.Repositories
{
	public interface IRepository<TEntity>
	{
		TEntity GetById(int id);
		IList<TEntity> GetAll();
		void Add(TEntity entity);
		void Update(TEntity entity);
		void Delete(TEntity entity);
	}
}
