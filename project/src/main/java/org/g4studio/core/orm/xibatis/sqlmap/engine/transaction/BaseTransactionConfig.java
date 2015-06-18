package org.g4studio.core.orm.xibatis.sqlmap.engine.transaction;

import javax.sql.DataSource;
import java.util.Properties;
import java.sql.SQLException;

public abstract class BaseTransactionConfig implements TransactionConfig {

	protected DataSource dataSource;
	protected boolean forceCommit;

	public boolean isForceCommit() {
		return forceCommit;
	}

	public void setForceCommit(boolean forceCommit) {
		this.forceCommit = forceCommit;
	}

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource ds) {
		this.dataSource = ds;
	}

	/**
	 * @deprecated
	 * @return -1
	 */
	public int getMaximumConcurrentTransactions() {
		return -1;
	}

	/**
	 * @deprecated
	 * @param maximumConcurrentTransactions
	 *            - do not use here for Spring integration
	 */
	public void setMaximumConcurrentTransactions(int maximumConcurrentTransactions) {
	}

	/**
	 * @deprecated
	 * @param props
	 *            - propertes
	 */
	public void initialize(Properties props) throws SQLException, TransactionException {
		setProperties(props);
	}
}
