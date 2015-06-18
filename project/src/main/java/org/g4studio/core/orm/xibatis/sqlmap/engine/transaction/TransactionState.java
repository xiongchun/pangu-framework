package org.g4studio.core.orm.xibatis.sqlmap.engine.transaction;

public class TransactionState {

	public static final TransactionState STATE_STARTED = new TransactionState();
	public static final TransactionState STATE_COMMITTED = new TransactionState();
	public static final TransactionState STATE_ENDED = new TransactionState();
	public static final TransactionState STATE_USER_PROVIDED = new TransactionState();

	private TransactionState() {
	}

}
