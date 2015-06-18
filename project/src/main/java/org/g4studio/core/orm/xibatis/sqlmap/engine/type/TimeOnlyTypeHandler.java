package org.g4studio.core.orm.xibatis.sqlmap.engine.type;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

/**
 * Time (only) implementation of TypeHandler
 */
public class TimeOnlyTypeHandler extends BaseTypeHandler implements TypeHandler {

	private static final String DATE_FORMAT = "hh:mm:ss";

	public void setParameter(PreparedStatement ps, int i, Object parameter, String jdbcType) throws SQLException {
		ps.setTime(i, new java.sql.Time(((Date) parameter).getTime()));
	}

	public Object getResult(ResultSet rs, String columnName) throws SQLException {
		java.sql.Time sqlTime = rs.getTime(columnName);
		if (rs.wasNull()) {
			return null;
		} else {
			return new java.util.Date(sqlTime.getTime());
		}
	}

	public Object getResult(ResultSet rs, int columnIndex) throws SQLException {
		java.sql.Time sqlTime = rs.getTime(columnIndex);
		if (rs.wasNull()) {
			return null;
		} else {
			return new java.util.Date(sqlTime.getTime());
		}
	}

	public Object getResult(CallableStatement cs, int columnIndex) throws SQLException {
		java.sql.Time sqlTime = cs.getTime(columnIndex);
		if (cs.wasNull()) {
			return null;
		} else {
			return new java.util.Date(sqlTime.getTime());
		}
	}

	public Object valueOf(String s) {
		return SimpleDateFormatter.format(DATE_FORMAT, s);
	}

}
