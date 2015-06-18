package org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.statement;

import java.sql.SQLException;
import java.util.List;

import org.g4studio.core.orm.xibatis.sqlmap.client.event.RowHandler;
import org.g4studio.core.orm.xibatis.sqlmap.engine.scope.StatementScope;
import org.g4studio.core.orm.xibatis.sqlmap.engine.transaction.Transaction;

public class SelectKeyStatement extends SelectStatement {

	private String keyProperty;
	private boolean runAfterSQL;

	public String getKeyProperty() {
		return keyProperty;
	}

	public void setKeyProperty(String keyProperty) {
		this.keyProperty = keyProperty;
	}

	public boolean isRunAfterSQL() {
		return runAfterSQL;
	}

	public void setRunAfterSQL(boolean runAfterSQL) {
		this.runAfterSQL = runAfterSQL;
	}

	public List executeQueryForList(StatementScope statementScope, Transaction trans, Object parameterObject,
			int skipResults, int maxResults) throws SQLException {
		throw new SQLException("Select Key statements cannot be executed for a list.");
	}

	public void executeQueryWithRowHandler(StatementScope statementScope, Transaction trans, Object parameterObject,
			RowHandler rowHandler) throws SQLException {
		throw new SQLException("Select Key statements cannot be executed with a row handler.");
	}

}
