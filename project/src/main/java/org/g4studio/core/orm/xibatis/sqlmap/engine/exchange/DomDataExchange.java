package org.g4studio.core.orm.xibatis.sqlmap.engine.exchange;

import java.util.Map;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.g4studio.core.orm.xibatis.common.beans.Probe;
import org.g4studio.core.orm.xibatis.common.beans.ProbeFactory;
import org.g4studio.core.orm.xibatis.sqlmap.client.SqlMapException;
import org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.parameter.ParameterMap;
import org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.parameter.ParameterMapping;
import org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.result.ResultMap;
import org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.result.ResultMapping;
import org.g4studio.core.orm.xibatis.sqlmap.engine.scope.StatementScope;
import org.w3c.dom.Document;

/**
 * A DataExchange implemtation for working with DOM objects
 */
public class DomDataExchange extends BaseDataExchange implements DataExchange {

	/**
	 * Constructor for the factory
	 * 
	 * @param dataExchangeFactory
	 *            - the factory
	 */
	public DomDataExchange(DataExchangeFactory dataExchangeFactory) {
		super(dataExchangeFactory);
	}

	public void initialize(Map properties) {
	}

	public Object[] getData(StatementScope statementScope, ParameterMap parameterMap, Object parameterObject) {
		Probe probe = ProbeFactory.getProbe(parameterObject);

		ParameterMapping[] mappings = parameterMap.getParameterMappings();
		Object[] values = new Object[mappings.length];

		for (int i = 0; i < mappings.length; i++) {
			values[i] = probe.getObject(parameterObject, mappings[i].getPropertyName());
		}

		return values;
	}

	public Object setData(StatementScope statementScope, ResultMap resultMap, Object resultObject, Object[] values) {

		String name = ((ResultMap) resultMap).getXmlName();
		if (name == null) {
			name = "result";
		}

		if (resultObject == null) {
			try {
				Document doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().newDocument();
				doc.appendChild(doc.createElement(name));
				resultObject = doc;
			} catch (ParserConfigurationException e) {
				throw new SqlMapException("Error creating new Document for DOM result.  Cause: " + e, e);
			}
		}

		Probe probe = ProbeFactory.getProbe(resultObject);

		ResultMapping[] mappings = resultMap.getResultMappings();

		for (int i = 0; i < mappings.length; i++) {
			if (values[i] != null) {
				probe.setObject(resultObject, mappings[i].getPropertyName(), values[i]);
			}
		}

		return resultObject;
	}

	public Object setData(StatementScope statementScope, ParameterMap parameterMap, Object parameterObject,
			Object[] values) {
		Probe probe = ProbeFactory.getProbe(parameterObject);

		ParameterMapping[] mappings = parameterMap.getParameterMappings();

		for (int i = 0; i < mappings.length; i++) {
			if (values[i] != null) {
				if (mappings[i].isOutputAllowed()) {
					probe.setObject(parameterObject, mappings[i].getPropertyName(), values[i]);
				}
			}
		}

		return parameterObject;
	}

}
