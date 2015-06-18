package org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.statement;

import java.sql.SQLException;

import org.g4studio.core.orm.xibatis.sqlmap.engine.scope.StatementScope;
import org.g4studio.core.orm.xibatis.sqlmap.engine.transaction.Transaction;

public class SelectStatement extends MappedStatement {

	public StatementType getStatementType() {
		return StatementType.SELECT;
	}

	public int executeUpdate(StatementScope statementScope, Transaction trans, Object parameterObject)
			throws SQLException {
		throw new SQLException("Select statements cannot be executed as an update.");
	}

}
