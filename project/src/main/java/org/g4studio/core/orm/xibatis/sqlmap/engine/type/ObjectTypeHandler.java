package org.g4studio.core.orm.xibatis.sqlmap.engine.type;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Object implementation of TypeHandler
 */
public class ObjectTypeHandler extends BaseTypeHandler implements TypeHandler {

	public void setParameter(PreparedStatement ps, int i, Object parameter, String jdbcType) throws SQLException {
		ps.setObject(i, parameter);
	}

	public Object getResult(ResultSet rs, String columnName) throws SQLException {
		Object object = rs.getObject(columnName);
		if (rs.wasNull()) {
			return null;
		} else {
			return object;
		}
	}

	public Object getResult(ResultSet rs, int columnIndex) throws SQLException {
		Object object = rs.getObject(columnIndex);
		if (rs.wasNull()) {
			return null;
		} else {
			return object;
		}
	}

	public Object getResult(CallableStatement cs, int columnIndex) throws SQLException {
		Object object = cs.getObject(columnIndex);
		if (cs.wasNull()) {
			return null;
		} else {
			return object;
		}
	}

	public Object valueOf(String s) {
		return s;
	}

}
