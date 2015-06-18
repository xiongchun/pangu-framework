package org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.statement;

import java.sql.Connection;
import java.sql.SQLException;

import org.g4studio.core.orm.xibatis.sqlmap.engine.scope.StatementScope;

public class ProcedureStatement extends MappedStatement {

	protected void postProcessParameterObject(StatementScope statementScope, Object parameterObject, Object[] parameters) {
		statementScope.getParameterMap().refreshParameterObjectValues(statementScope, parameterObject, parameters);
	}

	protected int sqlExecuteUpdate(StatementScope statementScope, Connection conn, String sqlString, Object[] parameters)
			throws SQLException {
		if (statementScope.getSession().isInBatch()) {
			getSqlExecutor().addBatch(statementScope, conn, sqlString, parameters);
			return 0;
		} else {
			return getSqlExecutor().executeUpdateProcedure(statementScope, conn, sqlString.trim(), parameters);
		}
	}

	protected void sqlExecuteQuery(StatementScope statementScope, Connection conn, String sqlString,
			Object[] parameters, int skipResults, int maxResults, RowHandlerCallback callback) throws SQLException {
		getSqlExecutor().executeQueryProcedure(statementScope, conn, sqlString.trim(), parameters, skipResults,
				maxResults, callback);
	}

	public StatementType getStatementType() {
		return StatementType.PROCEDURE;
	}
}
