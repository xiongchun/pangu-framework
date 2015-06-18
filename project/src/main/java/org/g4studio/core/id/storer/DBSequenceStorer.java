package org.g4studio.core.id.storer;

import org.g4studio.core.id.SequenceStorer;
import org.g4studio.core.id.StoreSequenceException;

/**
 * DBSequenceStorer
 * 此代码源于开源项目E3,原作者：黄云辉
 * 
 * @author XiongChun
 * @since 2010-03-17
 * @see SequenceStorer
 */
public class DBSequenceStorer implements SequenceStorer{

	private javax.sql.DataSource dataSource;
	private String tableName;
	private String idColumnName;
	private String valueColumnName;
	public long load(String sequenceID) throws StoreSequenceException {
		// TODO Auto-generated method stub
		return 0;
	}

	public void updateMaxValueByFieldName(long sequence, String sequenceID)
			throws StoreSequenceException {
		// TODO Auto-generated method stub

	}

	public javax.sql.DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(javax.sql.DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public String getIdColumnName() {
		return idColumnName;
	}

	public void setIdColumnName(String idColumnName) {
		this.idColumnName = idColumnName;
	}

	public String getValueColumnName() {
		return valueColumnName;
	}

	public void setValueColumnName(String valueColumnName) {
		this.valueColumnName = valueColumnName;
	}

}
