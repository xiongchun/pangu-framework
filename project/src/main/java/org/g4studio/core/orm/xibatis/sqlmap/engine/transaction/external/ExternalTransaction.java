package org.g4studio.core.orm.xibatis.sqlmap.engine.transaction.external;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.g4studio.core.orm.xibatis.common.jdbc.logging.ConnectionLogProxy;
import org.g4studio.core.orm.xibatis.common.logging.Log;
import org.g4studio.core.orm.xibatis.common.logging.LogFactory;
import org.g4studio.core.orm.xibatis.sqlmap.engine.transaction.IsolationLevel;
import org.g4studio.core.orm.xibatis.sqlmap.engine.transaction.Transaction;
import org.g4studio.core.orm.xibatis.sqlmap.engine.transaction.TransactionException;

public class ExternalTransaction implements Transaction {

	private static final Log connectionLog = LogFactory.getLog(Connection.class);

	private DataSource dataSource;
	private boolean defaultAutoCommit;
	private boolean setAutoCommitAllowed;
	private Connection connection;
	private IsolationLevel isolationLevel = new IsolationLevel();

	public ExternalTransaction(DataSource ds, boolean defaultAutoCommit, boolean setAutoCommitAllowed,
			int isolationLevel) throws TransactionException {
		// Check Parameters
		dataSource = ds;
		if (dataSource == null) {
			throw new TransactionException("ExternalTransaction initialization failed.  DataSource was null.");
		}

		this.defaultAutoCommit = defaultAutoCommit;
		this.setAutoCommitAllowed = setAutoCommitAllowed;
		this.isolationLevel.setIsolationLevel(isolationLevel);
	}

	private void init() throws SQLException, TransactionException {
		// Open JDBC Transaction
		connection = dataSource.getConnection();
		if (connection == null) {
			throw new TransactionException(
					"ExternalTransaction could not start transaction.  Cause: The DataSource returned a null connection.");
		}
		// Isolation Level
		isolationLevel.applyIsolationLevel(connection);
		// AutoCommit
		if (setAutoCommitAllowed) {
			if (connection.getAutoCommit() != defaultAutoCommit) {
				connection.setAutoCommit(defaultAutoCommit);
			}
		}
		// Debug
		if (connectionLog.isDebugEnabled()) {
			connection = ConnectionLogProxy.newInstance(connection);
		}
	}

	public void commit() throws SQLException, TransactionException {
	}

	public void rollback() throws SQLException, TransactionException {
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
