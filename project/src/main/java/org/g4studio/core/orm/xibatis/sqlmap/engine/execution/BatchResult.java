package org.g4studio.core.orm.xibatis.sqlmap.engine.execution;

import java.io.Serializable;

/**
 * This class holds the statement and row information for every successful batch
 * executed by iBATIS
 * 
 * @author Jeff Butler
 * 
 */
public class BatchResult implements Serializable {
	private String sql;
	private String statementId;
	private int[] updateCounts;

	/**
   * 
   */
	public BatchResult(String statementId, String sql) {
		super();
		this.statementId = statementId;
		this.sql = sql;
	}

	public String getSql() {
		return sql;
	}

	public int[] getUpdateCounts() {
		return updateCounts;
	}

	public void setUpdateCounts(int[] updateCounts) {
		this.updateCounts = updateCounts;
	}

	public String getStatementId() {
		return statementId;
	}
}
