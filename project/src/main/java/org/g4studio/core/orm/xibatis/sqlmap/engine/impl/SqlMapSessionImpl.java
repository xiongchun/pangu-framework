package org.g4studio.core.orm.xibatis.sqlmap.engine.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.g4studio.core.orm.xibatis.common.jdbc.exception.NestedSQLException;
import org.g4studio.core.orm.xibatis.common.util.PaginatedList;
import org.g4studio.core.orm.xibatis.sqlmap.client.SqlMapSession;
import org.g4studio.core.orm.xibatis.sqlmap.client.event.RowHandler;
import org.g4studio.core.orm.xibatis.sqlmap.engine.execution.BatchException;
import org.g4studio.core.orm.xibatis.sqlmap.engine.execution.SqlExecutor;
import org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.statement.MappedStatement;
import org.g4studio.core.orm.xibatis.sqlmap.engine.scope.SessionScope;
import org.g4studio.core.orm.xibatis.sqlmap.engine.transaction.Transaction;
import org.g4studio.core.orm.xibatis.sqlmap.engine.transaction.TransactionException;

/**
 * Implementation of SqlMapSession
 */
public class SqlMapSessionImpl implements SqlMapSession {

	protected SqlMapExecutorDelegate delegate;
	protected SessionScope sessionScope;
	protected boolean closed;

	/**
	 * Constructor
	 * 
	 * @param client
	 *            - the client that will use the session
	 */
	public SqlMapSessionImpl(SqlMapClientImpl client) {
		this.delegate = client.getDelegate();
		this.sessionScope = this.delegate.beginSessionScope();
		this.sessionScope.setSqlMapClient(client);
		this.sessionScope.setSqlMapExecutor(client);
		this.sessionScope.setSqlMapTxMgr(client);
		this.closed = false;
	}

	/**
	 * Start the session
	 */
	public void open() {
		sessionScope.setSqlMapTxMgr(this);
	}

	/**
	 * Getter to tell if the session is still open
	 * 
	 * @return - the status of the session
	 */
	public boolean isClosed() {
		return closed;
	}

	public void close() {
		if (delegate != null && sessionScope != null)
			delegate.endSessionScope(sessionScope);
		if (sessionScope != null)
			sessionScope = null;
		if (delegate != null)
			delegate = null;
		if (!closed)
			closed = true;
	}

	public Object insert(String id, Object param) throws SQLException {
		return delegate.insert(sessionScope, id, param);
	}

	public Object insert(String id) throws SQLException {
		return insert(id, null);
	}

	public int update(String id, Object param) throws SQLException {
		return delegate.update(sessionScope, id, param);
	}

	public int update(String id) throws SQLException {
		return update(id, null);
	}

	public int delete(String id, Object param) throws SQLException {
		return delegate.delete(sessionScope, id, param);
	}

	public int delete(String id) throws SQLException {
		return delete(id, null);
	}

	public Object queryForObject(String id, Object paramObject) throws SQLException {
		return delegate.queryForObject(sessionScope, id, paramObject);
	}

	public Object queryForObject(String id) throws SQLException {
		return queryForObject(id, null);
	}

	public Object queryForObject(String id, Object paramObject, Object resultObject) throws SQLException {
		return delegate.queryForObject(sessionScope, id, paramObject, resultObject);
	}

	public List queryForList(String id, Object paramObject) throws SQLException {
		return delegate.queryForList(sessionScope, id, paramObject);
	}

	public List queryForList(String id) throws SQLException {
		return queryForList(id, null);
	}

	public List queryForList(String id, Object paramObject, int skip, int max) throws SQLException {
		return delegate.queryForList(sessionScope, id, paramObject, skip, max);
	}

	public List queryForList(String id, int skip, int max) throws SQLException {
		return queryForList(id, null, skip, max);
	}

	/**
	 * @deprecated All paginated list features have been deprecated
	 */
	public PaginatedList queryForPaginatedList(String id, Object paramObject, int pageSize) throws SQLException {
		return delegate.queryForPaginatedList(sessionScope, id, paramObject, pageSize);
	}

	/**
	 * @deprecated All paginated list features have been deprecated
	 */
	public PaginatedList queryForPaginatedList(String id, int pageSize) throws SQLException {
		return queryForPaginatedList(id, null, pageSize);
	}

	public Map queryForMap(String id, Object paramObject, String keyProp) throws SQLException {
		return delegate.queryForMap(sessionScope, id, paramObject, keyProp);
	}

	public Map queryForMap(String id, Object paramObject, String keyProp, String valueProp) throws SQLException {
		return delegate.queryForMap(sessionScope, id, paramObject, keyProp, valueProp);
	}

	public void queryWithRowHandler(String id, Object paramObject, RowHandler rowHandler) throws SQLException {
		delegate.queryWithRowHandler(sessionScope, id, paramObject, rowHandler);
	}

	public void queryWithRowHandler(String id, RowHandler rowHandler) throws SQLException {
		queryWithRowHandler(id, null, rowHandler);
	}

	public void startTransaction() throws SQLException {
		delegate.startTransaction(sessionScope);
	}

	public void startTransaction(int transactionIsolation) throws SQLException {
		delegate.startTransaction(sessionScope, transactionIsolation);
	}

	public void commitTransaction() throws SQLException {
		delegate.commitTransaction(sessionScope);
	}

	public void endTransaction() throws SQLException {
		delegate.endTransaction(sessionScope);
	}

	public void startBatch() throws SQLException {
		delegate.startBatch(sessionScope);
	}

	public int executeBatch() throws SQLException {
		return delegate.executeBatch(sessionScope);
	}

	public List executeBatchDetailed() throws SQLException, BatchException {
		return delegate.executeBatchDetailed(sessionScope);
	}

	public void setUserConnection(Connection connection) throws SQLException {
		delegate.setUserProvidedTransaction(sessionScope, connection);
	}

	/**
	 * TODO Deprecated
	 * 
	 * @return Current connection
	 * @throws SQLException
	 * @deprecated
	 */
	public Connection getUserConnection() throws SQLException {
		return getCurrentConnection();
	}

	public Connection getCurrentConnection() throws SQLException {
		try {
			Connection conn = null;
			Transaction trans = delegate.getTransaction(sessionScope);
			if (trans != null) {
				conn = trans.getConnection();
			}
			return conn;
		} catch (TransactionException e) {
			throw new NestedSQLException("Error getting Connection from Transaction.  Cause: " + e, e);
		}
	}

	public DataSource getDataSource() {
		return delegate.getDataSource();
	}

	/**
	 * Gets a mapped statement by ID
	 * 
	 * @param id
	 *            - the ID
	 * @return - the mapped statement
	 */
	public MappedStatement getMappedStatement(String id) {
		return delegate.getMappedStatement(id);
	}

	/**
	 * Get the status of lazy loading
	 * 
	 * @return - the status
	 */
	public boolean isLazyLoadingEnabled() {
		return delegate.isLazyLoadingEnabled();
	}

	/**
	 * Get the status of CGLib enhancements
	 * 
	 * @return - the status
	 */
	public boolean isEnhancementEnabled() {
		return delegate.isEnhancementEnabled();
	}

	/**
	 * Get the SQL executor
	 * 
	 * @return - the executor
	 */
	public SqlExecutor getSqlExecutor() {
		return delegate.getSqlExecutor();
	}

	/**
	 * Get the delegate
	 * 
	 * @return - the delegate
	 */
	public SqlMapExecutorDelegate getDelegate() {
		return delegate;
	}

}
