package org.g4studio.core.orm.xibatis.sqlmap.engine.config;

import java.util.Properties;

import org.g4studio.core.orm.xibatis.sqlmap.engine.cache.CacheController;
import org.g4studio.core.orm.xibatis.sqlmap.engine.cache.CacheModel;
import org.g4studio.core.orm.xibatis.sqlmap.engine.impl.SqlMapClientImpl;
import org.g4studio.core.orm.xibatis.sqlmap.engine.scope.ErrorContext;

public class CacheModelConfig {
	private ErrorContext errorContext;
	private CacheModel cacheModel;

	CacheModelConfig(SqlMapConfiguration config, String id, CacheController controller, boolean readOnly,
			boolean serialize) {
		this.errorContext = config.getErrorContext();
		this.cacheModel = new CacheModel();
		SqlMapClientImpl client = config.getClient();
		errorContext.setActivity("building a cache model");
		cacheModel.setReadOnly(readOnly);
		cacheModel.setSerialize(serialize);
		errorContext.setObjectId(id + " cache model");
		errorContext.setMoreInfo("Check the cache model type.");
		cacheModel.setId(id);
		cacheModel.setResource(errorContext.getResource());
		try {
			cacheModel.setCacheController(controller);
		} catch (Exception e) {
			throw new RuntimeException("Error setting Cache Controller Class.  Cause: " + e, e);
		}
		errorContext.setMoreInfo("Check the cache model configuration.");
		if (client.getDelegate().isCacheModelsEnabled()) {
			client.getDelegate().addCacheModel(cacheModel);
		}
		errorContext.setMoreInfo(null);
		errorContext.setObjectId(null);
	}

	public void setFlushInterval(long hours, long minutes, long seconds, long milliseconds) {
		errorContext.setMoreInfo("Check the cache model flush interval.");
		long t = 0L;
		t += milliseconds;
		t += seconds * 1000L;
		t += minutes * 60L * 1000L;
		t += hours * 60L * 60L * 1000L;
		if (t < 1L)
			throw new RuntimeException(
					"A flush interval must specify one or more of milliseconds, seconds, minutes or hours.");
		cacheModel.setFlushInterval(t);
	}

	public void addFlushTriggerStatement(String statement) {
		errorContext.setMoreInfo("Check the cache model flush on statement elements.");
		cacheModel.addFlushTriggerStatement(statement);
	}

	public CacheModel getCacheModel() {
		return cacheModel;
	}

	public void setControllerProperties(Properties cacheProps) {
		cacheModel.setControllerProperties(cacheProps);
	}
}
