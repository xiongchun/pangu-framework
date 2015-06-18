package org.g4studio.core.orm.xibatis.sqlmap.engine.transaction.jta;

import java.sql.SQLException;
import java.util.Properties;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.transaction.UserTransaction;

import org.g4studio.core.orm.xibatis.sqlmap.client.SqlMapException;
import org.g4studio.core.orm.xibatis.sqlmap.engine.transaction.BaseTransactionConfig;
import org.g4studio.core.orm.xibatis.sqlmap.engine.transaction.Transaction;
import org.g4studio.core.orm.xibatis.sqlmap.engine.transaction.TransactionException;

public class JtaTransactionConfig extends BaseTransactionConfig {

	private UserTransaction userTransaction;

	public Transaction newTransaction(int transactionIsolation) throws SQLException, TransactionException {
		return new JtaTransaction(userTransaction, dataSource, transactionIsolation);
	}

	public UserTransaction getUserTransaction() {
		return userTransaction;
	}

	public void setUserTransaction(UserTransaction userTransaction) {
		this.userTransaction = userTransaction;
	}

	public void setProperties(Properties props) throws SQLException, TransactionException {
		String utxName = null;
		try {
			utxName = (String) props.get("UserTransaction");
			InitialContext initCtx = new InitialContext();
			userTransaction = (UserTransaction) initCtx.lookup(utxName);
		} catch (NamingException e) {
			throw new SqlMapException("Error initializing JtaTransactionConfig while looking up UserTransaction ("
					+ utxName + ").  Cause: " + e);
		}
	}

}
