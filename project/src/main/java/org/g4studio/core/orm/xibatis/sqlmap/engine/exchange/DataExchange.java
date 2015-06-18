package org.g4studio.core.orm.xibatis.sqlmap.engine.exchange;

import java.util.Map;

import org.g4studio.core.orm.xibatis.sqlmap.engine.cache.CacheKey;
import org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.parameter.ParameterMap;
import org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.result.ResultMap;
import org.g4studio.core.orm.xibatis.sqlmap.engine.scope.StatementScope;

/**
 * Interface for exchanging data between a parameter map/result map and the
 * related objects
 */
public interface DataExchange {

	/**
	 * Initializes the data exchange instance.
	 * 
	 * @param properties
	 */
	public void initialize(Map properties);

	/**
	 * Gets a data array from a parameter object.
	 * 
	 * @param statementScope
	 *            - the scope of the request
	 * @param parameterMap
	 *            - the parameter map
	 * @param parameterObject
	 *            - the parameter object
	 * 
	 * @return - the objects
	 */
	public Object[] getData(StatementScope statementScope, ParameterMap parameterMap, Object parameterObject);

	/**
	 * Sets values from a data array into a result object.
	 * 
	 * @param statementScope
	 *            - the request scope
	 * @param resultMap
	 *            - the result map
	 * @param resultObject
	 *            - the result object
	 * @param values
	 *            - the values to be mapped
	 * 
	 * @return the resultObject
	 */
	public Object setData(StatementScope statementScope, ResultMap resultMap, Object resultObject, Object[] values);

	/**
	 * Sets values from a data array into a parameter object
	 * 
	 * @param statementScope
	 *            - the request scope
	 * @param parameterMap
	 *            - the parameter map
	 * @param parameterObject
	 *            - the parameter object
	 * @param values
	 *            - the values to set
	 * 
	 * @return parameterObject
	 */
	public Object setData(StatementScope statementScope, ParameterMap parameterMap, Object parameterObject,
			Object[] values);

	/**
	 * Returns an object capable of being a unique cache key for a parameter
	 * object.
	 * 
	 * @param statementScope
	 *            - the request scope
	 * @param parameterMap
	 *            - the parameter map
	 * @param parameterObject
	 *            - the parameter object
	 * 
	 * @return - a cache key
	 */
	public CacheKey getCacheKey(StatementScope statementScope, ParameterMap parameterMap, Object parameterObject);

}
