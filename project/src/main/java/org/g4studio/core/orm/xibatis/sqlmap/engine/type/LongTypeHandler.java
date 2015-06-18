package org.g4studio.core.orm.xibatis.sqlmap.engine.type;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Long implementation of TypeHandler
 */
public class LongTypeHandler extends BaseTypeHandler implements TypeHandler {

	public void setParameter(PreparedStatement ps, int i, Object parameter, String jdbcType) throws SQLException {
		ps.setLong(i, ((Long) parameter).longValue());
	}

	public Object getResult(ResultSet rs, String columnName) throws SQLException {
		long l = rs.getLong(columnName);
		if (rs.wasNull()) {
			return null;
		} else {
			return new Long(l);
		}
	}

	public Object getResult(ResultSet rs, int columnIndex) throws SQLException {
		long l = rs.getLong(columnIndex);
		if (rs.wasNull()) {
			return null;
		} else {
			return new Long(l);
		}
	}

	public Object getResult(CallableStatement cs, int columnIndex) throws SQLException {
		long l = cs.getLong(columnIndex);
		if (cs.wasNull()) {
			return null;
		} else {
			return new Long(l);
		}
	}

	public Object valueOf(String s) {
		return Long.valueOf(s);
	}

}
