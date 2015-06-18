package org.g4studio.core.orm.xibatis.sqlmap.engine.type;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Float implementation of TypeHandler
 */
public class FloatTypeHandler extends BaseTypeHandler implements TypeHandler {

	public void setParameter(PreparedStatement ps, int i, Object parameter, String jdbcType) throws SQLException {
		ps.setFloat(i, ((Float) parameter).floatValue());
	}

	public Object getResult(ResultSet rs, String columnName) throws SQLException {
		float f = rs.getFloat(columnName);
		if (rs.wasNull()) {
			return null;
		} else {
			return new Float(f);
		}
	}

	public Object getResult(ResultSet rs, int columnIndex) throws SQLException {
		float f = rs.getFloat(columnIndex);
		if (rs.wasNull()) {
			return null;
		} else {
			return new Float(f);
		}
	}

	public Object getResult(CallableStatement cs, int columnIndex) throws SQLException {
		float f = cs.getFloat(columnIndex);
		if (cs.wasNull()) {
			return null;
		} else {
			return new Float(f);
		}
	}

	public Object valueOf(String s) {
		return Float.valueOf(s);
	}

}
