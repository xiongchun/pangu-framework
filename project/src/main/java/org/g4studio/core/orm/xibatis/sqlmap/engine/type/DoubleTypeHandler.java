package org.g4studio.core.orm.xibatis.sqlmap.engine.type;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Double implementation of TypeHandler
 */
public class DoubleTypeHandler extends BaseTypeHandler implements TypeHandler {

	public void setParameter(PreparedStatement ps, int i, Object parameter, String jdbcType) throws SQLException {
		ps.setDouble(i, ((Double) parameter).doubleValue());
	}

	public Object getResult(ResultSet rs, String columnName) throws SQLException {
		double d = rs.getDouble(columnName);
		if (rs.wasNull()) {
			return null;
		} else {
			return new Double(d);
		}
	}

	public Object getResult(ResultSet rs, int columnIndex) throws SQLException {
		double d = rs.getDouble(columnIndex);
		if (rs.wasNull()) {
			return null;
		} else {
			return new Double(d);
		}
	}

	public Object getResult(CallableStatement cs, int columnIndex) throws SQLException {
		double d = cs.getDouble(columnIndex);
		if (cs.wasNull()) {
			return null;
		} else {
			return new Double(d);
		}
	}

	public Object valueOf(String s) {
		return Double.valueOf(s);
	}

}
