package org.g4studio.core.orm.xibatis.sqlmap.engine.transaction;

import java.sql.Connection;
import java.sql.SQLException;

public interface Transaction {

	public void commit() throws SQLException, TransactionException;

	public void rollback() throws SQLException, TransactionException;

	public void close() throws SQLException, TransactionException;

	public Connection getConnection() throws SQLException, TransactionException;

}
