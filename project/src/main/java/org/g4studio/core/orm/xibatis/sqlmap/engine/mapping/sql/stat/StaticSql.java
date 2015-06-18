package org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.sql.stat;

import org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.parameter.ParameterMap;
import org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.result.ResultMap;
import org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.sql.Sql;
import org.g4studio.core.orm.xibatis.sqlmap.engine.scope.StatementScope;

public class StaticSql implements Sql {

	private String sqlStatement;

	public StaticSql(String sqlStatement) {
		this.sqlStatement = sqlStatement.replace('\r', ' ').replace('\n', ' ');
	}

	public String getSql(StatementScope statementScope, Object parameterObject) {
		return sqlStatement;
	}

	public ParameterMap getParameterMap(StatementScope statementScope, Object parameterObject) {
		return statementScope.getParameterMap();
	}

	public ResultMap getResultMap(StatementScope statementScope, Object parameterObject) {
		return statementScope.getResultMap();
	}

	public void cleanup(StatementScope statementScope) {
	}

}
