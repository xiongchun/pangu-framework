package org.g4studio.core.orm.xibatis.sqlmap.engine.type;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * SQL timestamp implementation of TypeHandler
 */
public class SqlTimestampTypeHandler extends BaseTypeHandler implements TypeHandler {

	private static final String DATE_FORMAT = "yyyy/MM/dd hh:mm:ss";

	public void setParameter(PreparedStatement ps, int i, Object parameter, String jdbcType) throws SQLException {
		ps.setTimestamp(i, (java.sql.Timestamp) parameter);
	}

	public Object getResult(ResultSet rs, String columnName) throws SQLException {
		Object sqlTimestamp = rs.getTimestamp(columnName);
		if (rs.wasNull()) {
			return null;
		} else {
			return sqlTimestamp;
		}
	}

	public Object getResult(ResultSet rs, int columnIndex) throws SQLException {
		Object sqlTimestamp = rs.getTimestamp(columnIndex);
		if (rs.wasNull()) {
			return null;
		} else {
			return sqlTimestamp;
		}
	}

	public Object getResult(CallableStatement cs, int columnIndex) throws SQLException {
		Object sqlTimestamp = cs.getTimestamp(columnIndex);
		if (cs.wasNull()) {
			return null;
		} else {
			return sqlTimestamp;
		}
	}

	public Object valueOf(String s) {
		return SimpleDateFormatter.format(DATE_FORMAT, s);
	}

}
