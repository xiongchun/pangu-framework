package org.g4studio.core.orm.xibatis.sqlmap.engine.transaction.jdbc;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.g4studio.core.orm.xibatis.common.jdbc.logging.ConnectionLogProxy;
import org.g4studio.core.orm.xibatis.common.logging.Log;
import org.g4studio.core.orm.xibatis.common.logging.LogFactory;
import org.g4studio.core.orm.xibatis.sqlmap.engine.transaction.IsolationLevel;
import org.g4studio.core.orm.xibatis.sqlmap.engine.transaction.Transaction;
import org.g4studio.core.orm.xibatis.sqlmap.engine.transaction.TransactionException;

public class JdbcTransaction implements Transaction {

	private static final Log connectionLog = LogFactory.getLog(Connection.class);

	private DataSource dataSource;
	private Connection connection;
	private IsolationLevel isolationLevel = new IsolationLevel();

	public JdbcTransaction(DataSource ds, int isolationLevel) throws TransactionException {
		// Check Parameters
		dataSource = ds;
		if (dataSource == null) {
			throw new TransactionException("JdbcTransaction initialization failed.  DataSource was null.");
		}
		this.isolationLevel.setIsolationLevel(isolationLevel);
	}

	private void init() throws SQLException, TransactionException {
		// Open JDBC Transaction
		connection = dataSource.getConnection();
		if (connection == null) {
			throw new TransactionException(
					"JdbcTransaction could not start transaction.  Cause: The DataSource returned a null connection.");
		}
		// Isolation Level
		isolationLevel.applyIsolationLevel(connection);
		// AutoCommit
		if (connection.getAutoCommit()) {
			connection.setAutoCommit(false);
		}
		// Debug
		if (connectionLog.isDebugEnabled()) {
			connection = ConnectionLogProxy.newInstance(connection);
		}
	}

	public void commit() throws SQLException, TransactionException {
		if (connection != null) {
			connection.commit();
		}
	}

	public void rollback() throws SQLException, TransactionException {
		if (connection != null) {
			connection.rollback();
		}
	}

	public void close() throws SQLException, TransactionException {
		if (connection != null) {
			try {
				isolationLevel.restoreIsolationLevel(connection);
			} finally {
				connection.close();
				connection = null;
			}
		}
	}

	public Connection getConnection() throws SQLException, TransactionException {
		if (connection == null) {
			init();
		}
		return connection;
	}

}
