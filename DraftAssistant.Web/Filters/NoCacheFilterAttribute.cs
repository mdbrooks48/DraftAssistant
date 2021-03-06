﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DraftAssistant.Web.Filters
{
	[AttributeUsage(AttributeTargets.Method | AttributeTargets.Class)]
	public sealed class NoCacheFilterAttribute : FilterAttribute, IResultFilter
	{
		public void OnResultExecuting(ResultExecutingContext filterContext)
		{
		}

		public void OnResultExecuted(ResultExecutedContext filterContext)
		{
			var cache = filterContext.HttpContext.Response.Cache;
			cache.SetCacheability(HttpCacheability.NoCache);
			cache.SetValidUntilExpires(false);
			cache.SetRevalidation(HttpCacheRevalidation.ProxyCaches);
			cache.SetExpires(DateTime.Now.AddYears(-5));
			cache.AppendCacheExtension("private");
			cache.AppendCacheExtension("no-cache=Set-Cookie");
			cache.SetProxyMaxAge(TimeSpan.Zero);
		}
	}
}