using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;

namespace DraftAssistant.DataAccess.Repositories
{
	public class EntityFrameworkRepository<TEntity> : IRepository<TEntity> where TEntity : class
	{
		protected readonly DbContext _context;

		public EntityFrameworkRepository(DbContext context)
		{
			_context = context;
		}

		public TEntity GetById(int id)
		{
			return _context.Set<TEntity>().Find(id);
		}

		public IList<TEntity> GetAll()
		{
			return _context.Set<TEntity>().ToList();
		}

		public void Add(TEntity entity)
		{
			if (entity == null) { throw new ArgumentNullException("entity"); }
			_context.Set<TEntity>().Add(entity);
		}

		public void Update(TEntity entity)
		{
			if (entity == null) { throw new ArgumentNullException("entity"); }
			_context.Set<TEntity>().Attach(entity);
			_context.Entry(entity).State = EntityState.Modified;
		}

		public void Delete(TEntity entity)
		{
			if (entity == null) { throw new ArgumentNullException("entity"); }
			_context.Set<TEntity>().Attach(entity);
			_context.Set<TEntity>().Remove(entity);
		}


	}
}
