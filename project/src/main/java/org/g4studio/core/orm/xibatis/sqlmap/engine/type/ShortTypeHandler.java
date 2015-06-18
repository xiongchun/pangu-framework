package org.g4studio.core.orm.xibatis.sqlmap.engine.type;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Short implementation of TypeHandler
 */
public class ShortTypeHandler extends BaseTypeHandler implements TypeHandler {

	public void setParameter(PreparedStatement ps, int i, Object parameter, String jdbcType) throws SQLException {
		ps.setShort(i, ((Short) parameter).shortValue());
	}

	public Object getResult(ResultSet rs, String columnName) throws SQLException {
		short s = rs.getShort(columnName);
		if (rs.wasNull()) {
			return null;
		} else {
			return new Short(s);
		}
	}

	public Object getResult(ResultSet rs, int columnIndex) throws SQLException {
		short s = rs.getShort(columnIndex);
		if (rs.wasNull()) {
			return null;
		} else {
			return new Short(s);
		}
	}

	public Object getResult(CallableStatement cs, int columnIndex) throws SQLException {
		short s = cs.getShort(columnIndex);
		if (cs.wasNull()) {
			return null;
		} else {
			return new Short(s);
		}
	}

	public Object valueOf(String s) {
		return Short.valueOf(s);
	}

}
