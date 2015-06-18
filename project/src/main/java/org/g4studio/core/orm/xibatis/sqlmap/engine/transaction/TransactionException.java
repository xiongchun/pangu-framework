package org.g4studio.core.orm.xibatis.sqlmap.engine.transaction;

public class TransactionException extends Exception {

	public TransactionException() {
	}

	public TransactionException(String msg) {
		super(msg);
	}

	public TransactionException(Throwable cause) {
		super(cause);
	}

	public TransactionException(String msg, Throwable cause) {
		super(msg, cause);
	}

}
