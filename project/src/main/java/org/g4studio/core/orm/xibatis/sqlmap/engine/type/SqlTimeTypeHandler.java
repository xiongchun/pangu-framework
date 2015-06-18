package org.g4studio.core.orm.xibatis.sqlmap.engine.type;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * SQL time implementation of TypeHandler
 */
public class SqlTimeTypeHandler extends BaseTypeHandler implements TypeHandler {

	private static final String DATE_FORMAT = "hh:mm:ss";

	public void setParameter(PreparedStatement ps, int i, Object parameter, String jdbcType) throws SQLException {
		ps.setTime(i, (java.sql.Time) parameter);
	}

	public Object getResult(ResultSet rs, String columnName) throws SQLException {
		Object sqlTime = rs.getTime(columnName);
		if (rs.wasNull()) {
			return null;
		} else {
			return sqlTime;
		}
	}

	public Object getResult(ResultSet rs, int columnIndex) throws SQLException {
		Object sqlTime = rs.getTime(columnIndex);
		if (rs.wasNull()) {
			return null;
		} else {
			return sqlTime;
		}
	}

	public Object getResult(CallableStatement cs, int columnIndex) throws SQLException {
		Object sqlTime = cs.getTime(columnIndex);
		if (cs.wasNull()) {
			return null;
		} else {
			return sqlTime;
		}
	}

	public Object valueOf(String s) {
		return SimpleDateFormatter.format(DATE_FORMAT, s);
	}

}
