package org.g4studio.core.orm.xibatis.sqlmap.engine.exchange;

import java.util.Map;

import org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.parameter.ParameterMap;
import org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.parameter.ParameterMapping;
import org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.result.ResultMap;
import org.g4studio.core.orm.xibatis.sqlmap.engine.scope.StatementScope;

/**
 * DataExchange implementation for primitive objects
 */
public class PrimitiveDataExchange extends BaseDataExchange implements DataExchange {

	protected PrimitiveDataExchange(DataExchangeFactory dataExchangeFactory) {
		super(dataExchangeFactory);
	}

	public void initialize(Map properties) {
	}

	public Object[] getData(StatementScope statementScope, ParameterMap parameterMap, Object parameterObject) {
		ParameterMapping[] mappings = parameterMap.getParameterMappings();
		Object[] data = new Object[mappings.length];
		for (int i = 0; i < mappings.length; i++) {
			data[i] = parameterObject;
		}
		return data;
	}

	public Object setData(StatementScope statementScope, ResultMap resultMap, Object resultObject, Object[] values) {
		return values[0];
	}

	public Object setData(StatementScope statementScope, ParameterMap parameterMap, Object parameterObject,
			Object[] values) {
		return values[0];
	}

}
