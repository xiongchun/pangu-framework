package org.g4studio.core.orm.xibatis.sqlmap.engine.type;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * String implementation of TypeHandler
 */
public class StringTypeHandler extends BaseTypeHandler implements TypeHandler {

	public void setParameter(PreparedStatement ps, int i, Object parameter, String jdbcType) throws SQLException {
		ps.setString(i, ((String) parameter));
	}

	public Object getResult(ResultSet rs, String columnName) throws SQLException {
		Object s = rs.getString(columnName);
		if (rs.wasNull()) {
			return null;
		} else {
			return s;
		}
	}

	public Object getResult(ResultSet rs, int columnIndex) throws SQLException {
		Object s = rs.getString(columnIndex);
		if (rs.wasNull()) {
			return null;
		} else {
			return s;
		}
	}

	public Object getResult(CallableStatement cs, int columnIndex) throws SQLException {
		Object s = cs.getString(columnIndex);
		if (cs.wasNull()) {
			return null;
		} else {
			return s;
		}
	}

	public Object valueOf(String s) {
		return s;
	}

}
