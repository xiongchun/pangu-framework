package org.g4studio.core.orm.xibatis.sqlmap.engine.exchange;

import org.g4studio.core.orm.xibatis.sqlmap.engine.cache.CacheKey;
import org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.parameter.ParameterMap;
import org.g4studio.core.orm.xibatis.sqlmap.engine.scope.StatementScope;

/**
 * Base implementation for the DataExchange interface
 */
public abstract class BaseDataExchange implements DataExchange {

	private DataExchangeFactory dataExchangeFactory;

	protected BaseDataExchange(DataExchangeFactory dataExchangeFactory) {
		this.dataExchangeFactory = dataExchangeFactory;
	}

	public CacheKey getCacheKey(StatementScope statementScope, ParameterMap parameterMap, Object parameterObject) {
		CacheKey key = new CacheKey();
		Object[] data = getData(statementScope, parameterMap, parameterObject);
		for (int i = 0; i < data.length; i++) {
			if (data[i] != null) {
				key.update(data[i]);
			}
		}
		return key;
	}

	/**
	 * Getter for the factory that created this object
	 * 
	 * @return - the factory
	 */
	public DataExchangeFactory getDataExchangeFactory() {
		return dataExchangeFactory;
	}

}
