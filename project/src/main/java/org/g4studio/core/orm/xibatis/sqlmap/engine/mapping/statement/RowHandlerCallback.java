package org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.statement;

import java.io.StringWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.g4studio.core.orm.xibatis.sqlmap.client.event.RowHandler;
import org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.result.ResultMap;
import org.g4studio.core.orm.xibatis.sqlmap.engine.scope.StatementScope;
import org.g4studio.core.orm.xibatis.sqlmap.engine.type.XmlTypeMarker;
import org.w3c.dom.Document;

/**
 * Class to manager row handler access
 */
public class RowHandlerCallback {

	private RowHandler rowHandler;
	private ResultMap resultMap;
	private Object resultObject;

	/**
	 * Constructor
	 * 
	 * @param resultMap
	 *            - the result map
	 * @param resultObject
	 *            - the result object
	 * @param rowHandler
	 *            - the row handler object
	 */
	public RowHandlerCallback(ResultMap resultMap, Object resultObject, RowHandler rowHandler) {
		this.rowHandler = rowHandler;
		this.resultMap = resultMap;
		this.resultObject = resultObject;
	}

	/**
	 * Prepares the row object, and passes it to the row handler
	 * 
	 * @param statementScope
	 *            - the request scope
	 * @param results
	 *            - the result data
	 */
	public void handleResultObject(StatementScope statementScope, Object[] results, ResultSet rs) throws SQLException {
		Object object;

		statementScope.setCurrentNestedKey(null);
		object = resultMap.resolveSubMap(statementScope, rs).setResultObjectValues(statementScope, resultObject,
				results);

		if (object != ResultMap.NO_VALUE) {
			// XML Only special processing. (converts elements to string for
			// easy insertion).
			int stackDepth = statementScope.getSession().getRequestStackDepth();
			if (stackDepth == 1) {
				Class targetType = statementScope.getResultMap().getResultClass();
				if (XmlTypeMarker.class.isAssignableFrom(targetType) && object instanceof Document) {
					object = documentToString((Document) object);
				}
			}

			rowHandler.handleRow(object);
		}
	}

	private String documentToString(Document document) {
		String s = null;

		try {
			TransformerFactory tFactory = TransformerFactory.newInstance();
			Transformer transformer = tFactory.newTransformer();

			DOMSource source = new DOMSource(document);
			StringWriter writer = new StringWriter();
			StreamResult result = new StreamResult(writer);
			transformer.transform(source, result);
			s = writer.getBuffer().toString();

		} catch (TransformerException e) {
			throw new RuntimeException("Error occurred.  Cause: " + e, e);
		}

		return s;
	}

	public RowHandler getRowHandler() {
		return rowHandler;
	}

}
