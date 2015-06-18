package org.g4studio.core.orm.xibatis.support;

import java.sql.SQLException;

import org.g4studio.core.orm.xibatis.sqlmap.client.SqlMapExecutor;

/**
 * Callback interface for data access code that works with the iBATIS with
 * {@link SqlMapClientTemplate}'s <code>execute</code> method, assumably often
 * as anonymous classes within a method implementation.
 * 
 * @author Juergen Hoeller
 * @since 24.02.2004
 * @see SqlMapClientTemplate
 * @see org.springframework.jdbc.datasource.DataSourceTransactionManager
 */
public interface SqlMapClientCallback {

	/**
	 * Gets called by <code>SqlMapClientTemplate.execute</code> with an active
	 * <code>SqlMapExecutor</code>. Does not need to care about activating or
	 * closing the <code>SqlMapExecutor</code>, or handling transactions.
	 * 
	 * <p>
	 * If called without a thread-bound JDBC transaction (initiated by
	 * DataSourceTransactionManager), the code will simply get executed on the
	 * underlying JDBC connection with its transactional semantics. If using a
	 * JTA-aware DataSource, the JDBC connection and thus the callback code will
	 * be transactional if a JTA transaction is active.
	 * 
	 * <p>
	 * Allows for returning a result object created within the callback, i.e. a
	 * domain object or a collection of domain objects. A thrown custom
	 * RuntimeException is treated as an application exception: It gets
	 * propagated to the caller of the template.
	 * 
	 * @param executor
	 *            an active iBATIS SqlMapSession, passed-in as SqlMapExecutor
	 *            interface here to avoid manual lifecycle handling
	 * @return a result object, or <code>null</code> if none
	 * @throws SQLException
	 *             if thrown by the iBATIS SQL Maps API
	 * @see SqlMapClientTemplate#execute
	 * @see SqlMapClientTemplate#executeWithListResult
	 * @see SqlMapClientTemplate#executeWithMapResult
	 */
	Object doInSqlMapClient(SqlMapExecutor executor) throws SQLException;

}
