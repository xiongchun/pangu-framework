package org.g4studio.core.orm.xibatis.sqlmap.engine.exchange;

import java.util.HashMap;
import java.util.Map;

import org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.parameter.ParameterMap;
import org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.parameter.ParameterMapping;
import org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.result.ResultMap;
import org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.result.ResultMapping;
import org.g4studio.core.orm.xibatis.sqlmap.engine.scope.StatementScope;

/**
 * DataExchange implementation for Map objects
 */
public class MapDataExchange extends BaseDataExchange implements DataExchange {

	protected MapDataExchange(DataExchangeFactory dataExchangeFactory) {
		super(dataExchangeFactory);
	}

	public void initialize(Map properties) {
	}

	public Object[] getData(StatementScope statementScope, ParameterMap parameterMap, Object parameterObject) {
		if (!(parameterObject instanceof Map)) {
			throw new RuntimeException("Error.  Object passed into MapDataExchange was not an instance of Map.");
		}

		Object[] data = new Object[parameterMap.getParameterMappings().length];
		Map map = (Map) parameterObject;
		ParameterMapping[] mappings = parameterMap.getParameterMappings();
		for (int i = 0; i < mappings.length; i++) {
			data[i] = map.get(mappings[i].getPropertyName());
		}
		return data;
	}

	public Object setData(StatementScope statementScope, ResultMap resultMap, Object resultObject, Object[] values) {
		if (!(resultObject == null || resultObject instanceof Map)) {
			throw new RuntimeException("Error.  Object passed into MapDataExchange was not an instance of Map.");
		}

		Map map = (Map) resultObject;
		if (map == null) {
			map = new HashMap();
		}

		ResultMapping[] mappings = resultMap.getResultMappings();
		for (int i = 0; i < mappings.length; i++) {
			map.put(mappings[i].getPropertyName(), values[i]);
		}

		return map;
	}

	public Object setData(StatementScope statementScope, ParameterMap parameterMap, Object parameterObject,
			Object[] values) {
		if (!(parameterObject == null || parameterObject instanceof Map)) {
			throw new RuntimeException("Error.  Object passed into MapDataExchange was not an instance of Map.");
		}

		Map map = (Map) parameterObject;
		if (map == null) {
			map = new HashMap();
		}

		ParameterMapping[] mappings = parameterMap.getParameterMappings();
		for (int i = 0; i < mappings.length; i++) {
			if (mappings[i].isOutputAllowed()) {
				map.put(mappings[i].getPropertyName(), values[i]);
			}
		}

		return map;
	}

}
