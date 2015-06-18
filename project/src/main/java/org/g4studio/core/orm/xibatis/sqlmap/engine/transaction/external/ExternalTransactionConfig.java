package org.g4studio.core.orm.xibatis.sqlmap.engine.transaction.external;

import java.sql.SQLException;
import java.util.Properties;

import org.g4studio.core.orm.xibatis.sqlmap.engine.transaction.BaseTransactionConfig;
import org.g4studio.core.orm.xibatis.sqlmap.engine.transaction.Transaction;
import org.g4studio.core.orm.xibatis.sqlmap.engine.transaction.TransactionException;

public class ExternalTransactionConfig extends BaseTransactionConfig {

	private boolean defaultAutoCommit = false;
	private boolean setAutoCommitAllowed = true;

	public Transaction newTransaction(int transactionIsolation) throws SQLException, TransactionException {
		return new ExternalTransaction(dataSource, defaultAutoCommit, setAutoCommitAllowed, transactionIsolation);
	}

	public boolean isDefaultAutoCommit() {
		return defaultAutoCommit;
	}

	public void setDefaultAutoCommit(boolean defaultAutoCommit) {
		this.defaultAutoCommit = defaultAutoCommit;
	}

	public boolean isSetAutoCommitAllowed() {
		return setAutoCommitAllowed;
	}

	public void setSetAutoCommitAllowed(boolean setAutoCommitAllowed) {
		this.setAutoCommitAllowed = setAutoCommitAllowed;
	}

	public void setProperties(Properties props) throws SQLException, TransactionException {
		String dacProp = props.getProperty("DefaultAutoCommit");
		String sacaProp = props.getProperty("SetAutoCommitAllowed");
		defaultAutoCommit = "true".equals(dacProp);
		setAutoCommitAllowed = "true".equals(sacaProp) || sacaProp == null;
	}

}
