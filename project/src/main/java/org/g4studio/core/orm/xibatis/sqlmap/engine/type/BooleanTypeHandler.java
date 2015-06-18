package org.g4studio.core.orm.xibatis.sqlmap.engine.type;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Boolean implementation of TypeHandler
 */
public class BooleanTypeHandler extends BaseTypeHandler implements TypeHandler {

	public void setParameter(PreparedStatement ps, int i, Object parameter, String jdbcType) throws SQLException {
		ps.setBoolean(i, ((Boolean) parameter).booleanValue());
	}

	public Object getResult(ResultSet rs, String columnName) throws SQLException {
		boolean b = rs.getBoolean(columnName);
		if (rs.wasNull()) {
			return null;
		} else {
			return new Boolean(b);
		}
	}

	public Object getResult(ResultSet rs, int columnIndex) throws SQLException {
		boolean b = rs.getBoolean(columnIndex);
		if (rs.wasNull()) {
			return null;
		} else {
			return new Boolean(b);
		}
	}

	public Object getResult(CallableStatement cs, int columnIndex) throws SQLException {
		boolean b = cs.getBoolean(columnIndex);
		if (cs.wasNull()) {
			return null;
		} else {
			return new Boolean(b);
		}
	}

	public Object valueOf(String s) {
		return Boolean.valueOf(s);
	}

}
