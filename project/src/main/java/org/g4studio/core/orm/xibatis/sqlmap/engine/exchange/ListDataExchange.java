package org.g4studio.core.orm.xibatis.sqlmap.engine.exchange;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.g4studio.core.orm.xibatis.common.beans.ProbeFactory;
import org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.parameter.ParameterMap;
import org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.parameter.ParameterMapping;
import org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.result.ResultMap;
import org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.result.ResultMapping;
import org.g4studio.core.orm.xibatis.sqlmap.engine.scope.StatementScope;

/**
 * DataExchange implementation for List objects
 */
public class ListDataExchange extends BaseDataExchange implements DataExchange {

	protected ListDataExchange(DataExchangeFactory dataExchangeFactory) {
		super(dataExchangeFactory);
	}

	public void initialize(Map properties) {
	}

	public Object[] getData(StatementScope statementScope, ParameterMap parameterMap, Object parameterObject) {
		ParameterMapping[] mappings = parameterMap.getParameterMappings();
		Object[] data = new Object[mappings.length];
		for (int i = 0; i < mappings.length; i++) {
			String propName = mappings[i].getPropertyName();

			// parse on the '.' notation and get nested properties
			String[] propertyArray = propName.split("\\.");

			if (propertyArray.length > 0) {
				// iterate list of properties to discover values

				Object tempData = parameterObject;

				for (int x = 0; x < propertyArray.length; x++) {

					// is property an array reference
					int arrayStartIndex = propertyArray[x].indexOf('[');

					if (arrayStartIndex == -1) {

						// is a normal property
						tempData = ProbeFactory.getProbe().getObject(tempData, propertyArray[x]);

					} else {

						int index = Integer.parseInt(propertyArray[x].substring(arrayStartIndex + 1,
								propertyArray[x].length() - 1));
						tempData = ((List) tempData).get(index);

					}

				}

				data[i] = tempData;

			} else {

				int index = Integer.parseInt((propName.substring(propName.indexOf('[') + 1, propName.length() - 1)));
				data[i] = ((List) parameterObject).get(index);

			}

		}
		return data;
	}

	public Object setData(StatementScope statementScope, ResultMap resultMap, Object resultObject, Object[] values) {
		ResultMapping[] mappings = resultMap.getResultMappings();
		List data = new ArrayList();
		for (int i = 0; i < mappings.length; i++) {
			String propName = mappings[i].getPropertyName();
			int index = Integer.parseInt((propName.substring(1, propName.length() - 1)));
			data.set(index, values[i]);
		}
		return data;
	}

	public Object setData(StatementScope statementScope, ParameterMap parameterMap, Object parameterObject,
			Object[] values) {
		ParameterMapping[] mappings = parameterMap.getParameterMappings();
		List data = new ArrayList();
		for (int i = 0; i < mappings.length; i++) {
			if (mappings[i].isOutputAllowed()) {
				String propName = mappings[i].getPropertyName();
				int index = Integer.parseInt((propName.substring(1, propName.length() - 1)));
				data.set(index, values[i]);
			}
		}

		return data;
	}

}
