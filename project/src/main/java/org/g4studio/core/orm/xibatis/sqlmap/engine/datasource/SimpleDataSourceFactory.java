package org.g4studio.core.orm.xibatis.sqlmap.engine.datasource;

import java.util.Map;

import javax.sql.DataSource;

import org.g4studio.core.orm.xibatis.common.jdbc.SimpleDataSource;

/**
 * DataSourceFactory implementation for the iBATIS SimpleDataSource
 */
public class SimpleDataSourceFactory implements DataSourceFactory {

	private DataSource dataSource;

	public void initialize(Map map) {
		dataSource = new SimpleDataSource(map);
	}

	public DataSource getDataSource() {
		return dataSource;
	}

}
