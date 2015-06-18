package org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.sql.simple;

import java.util.StringTokenizer;

import org.g4studio.core.orm.xibatis.common.beans.Probe;
import org.g4studio.core.orm.xibatis.common.beans.ProbeFactory;
import org.g4studio.core.orm.xibatis.sqlmap.client.SqlMapException;
import org.g4studio.core.orm.xibatis.sqlmap.engine.impl.SqlMapExecutorDelegate;
import org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.parameter.ParameterMap;
import org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.result.ResultMap;
import org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.sql.Sql;
import org.g4studio.core.orm.xibatis.sqlmap.engine.scope.StatementScope;

public class SimpleDynamicSql implements Sql {

	private static final Probe PROBE = ProbeFactory.getProbe();

	private static final String ELEMENT_TOKEN = "$";

	private String sqlStatement;

	private SqlMapExecutorDelegate delegate;

	public SimpleDynamicSql(SqlMapExecutorDelegate delegate, String sqlStatement) {
		this.delegate = delegate;
		this.sqlStatement = sqlStatement;
	}

	public String getSql(StatementScope statementScope, Object parameterObject) {
		return processDynamicElements(sqlStatement, parameterObject);
	}

	public ParameterMap getParameterMap(StatementScope statementScope, Object parameterObject) {
		return statementScope.getParameterMap();
	}

	public ResultMap getResultMap(StatementScope statementScope, Object parameterObject) {
		return statementScope.getResultMap();
	}

	public void cleanup(StatementScope statementScope) {
	}

	public static boolean isSimpleDynamicSql(String sql) {
		return sql != null && sql.indexOf(ELEMENT_TOKEN) > -1;
	}

	private String processDynamicElements(String sql, Object parameterObject) {
		StringTokenizer parser = new StringTokenizer(sql, ELEMENT_TOKEN, true);
		StringBuffer newSql = new StringBuffer();

		String token = null;
		String lastToken = null;
		while (parser.hasMoreTokens()) {
			token = parser.nextToken();

			if (ELEMENT_TOKEN.equals(lastToken)) {
				if (ELEMENT_TOKEN.equals(token)) {
					newSql.append(ELEMENT_TOKEN);
					token = null;
				} else {

					Object value = null;
					if (parameterObject != null) {
						if (delegate.getTypeHandlerFactory().hasTypeHandler(parameterObject.getClass())) {
							value = parameterObject;
						} else {
							value = PROBE.getObject(parameterObject, token);
						}
					}
					if (value != null) {
						newSql.append(String.valueOf(value));
					}

					token = parser.nextToken();
					if (!ELEMENT_TOKEN.equals(token)) {
						throw new SqlMapException("Unterminated dynamic element in sql (" + sql + ").");
					}
					token = null;
				}
			} else {
				if (!ELEMENT_TOKEN.equals(token)) {
					newSql.append(token);
				}
			}

			lastToken = token;
		}

		return newSql.toString();
	}

}
