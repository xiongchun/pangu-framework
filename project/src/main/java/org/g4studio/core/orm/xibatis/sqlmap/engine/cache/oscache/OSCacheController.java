package org.g4studio.core.orm.xibatis.sqlmap.engine.cache.oscache;

import java.util.Properties;

import org.g4studio.core.orm.xibatis.sqlmap.engine.cache.CacheController;
import org.g4studio.core.orm.xibatis.sqlmap.engine.cache.CacheModel;

import com.opensymphony.oscache.base.NeedsRefreshException;
import com.opensymphony.oscache.general.GeneralCacheAdministrator;

/**
 * Cache implementation for using OSCache with iBATIS
 */
public class OSCacheController implements CacheController {

	private static final GeneralCacheAdministrator CACHE = new GeneralCacheAdministrator();

	public void flush(CacheModel cacheModel) {
		CACHE.flushGroup(cacheModel.getId());
	}

	public Object getObject(CacheModel cacheModel, Object key) {
		String keyString = key.toString();
		try {
			int refreshPeriod = (int) (cacheModel.getFlushIntervalSeconds());
			return CACHE.getFromCache(keyString, refreshPeriod);
		} catch (NeedsRefreshException e) {
			CACHE.cancelUpdate(keyString);
			return null;
		}
	}

	public Object removeObject(CacheModel cacheModel, Object key) {
		Object result;
		String keyString = key.toString();
		try {
			int refreshPeriod = (int) (cacheModel.getFlushIntervalSeconds());
			Object value = CACHE.getFromCache(keyString, refreshPeriod);
			if (value != null) {
				CACHE.flushEntry(keyString);
			}
			result = value;
		} catch (NeedsRefreshException e) {
			try {
				CACHE.flushEntry(keyString);
			} finally {
				CACHE.cancelUpdate(keyString);
				result = null;
			}
		}
		return result;
	}

	public void putObject(CacheModel cacheModel, Object key, Object object) {
		String keyString = key.toString();
		CACHE.putInCache(keyString, object, new String[] { cacheModel.getId() });
	}

	public void setProperties(Properties props) {
	}

}
