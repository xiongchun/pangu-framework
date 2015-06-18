package org.g4studio.core.orm.xibatis.sqlmap.engine.type;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

/**
 * Date only implementation of TypeHandler
 */
public class DateOnlyTypeHandler extends BaseTypeHandler implements TypeHandler {

	private static final String DATE_FORMAT = "yyyy/MM/dd";

	public void setParameter(PreparedStatement ps, int i, Object parameter, String jdbcType) throws SQLException {
		ps.setDate(i, new java.sql.Date(((Date) parameter).getTime()));
	}

	public Object getResult(ResultSet rs, String columnName) throws SQLException {
		java.sql.Date sqlDate = rs.getDate(columnName);
		if (rs.wasNull()) {
			return null;
		} else {
			return new java.util.Date(sqlDate.getTime());
		}
	}

	public Object getResult(ResultSet rs, int columnIndex) throws SQLException {
		java.sql.Date sqlDate = rs.getDate(columnIndex);
		if (rs.wasNull()) {
			return null;
		} else {
			return new java.util.Date(sqlDate.getTime());
		}
	}

	public Object getResult(CallableStatement cs, int columnIndex) throws SQLException {
		java.sql.Date sqlDate = cs.getDate(columnIndex);
		if (cs.wasNull()) {
			return null;
		} else {
			return new java.util.Date(sqlDate.getTime());
		}
	}

	public Object valueOf(String s) {
		return SimpleDateFormatter.format(DATE_FORMAT, s);
	}

}
