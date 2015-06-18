package org.g4studio.core.orm.xibatis.sqlmap.engine.type;

import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * BigDecimal implementation of TypeHandler
 */
public class BigDecimalTypeHandler extends BaseTypeHandler implements TypeHandler {

	public void setParameter(PreparedStatement ps, int i, Object parameter, String jdbcType) throws SQLException {
		ps.setBigDecimal(i, ((BigDecimal) parameter));
	}

	public Object getResult(ResultSet rs, String columnName) throws SQLException {
		Object bigdec = rs.getBigDecimal(columnName);
		if (rs.wasNull()) {
			return null;
		} else {
			return bigdec;
		}
	}

	public Object getResult(ResultSet rs, int columnIndex) throws SQLException {
		Object bigdec = rs.getBigDecimal(columnIndex);
		if (rs.wasNull()) {
			return null;
		} else {
			return bigdec;
		}
	}

	public Object getResult(CallableStatement cs, int columnIndex) throws SQLException {
		Object bigdec = cs.getBigDecimal(columnIndex);
		if (cs.wasNull()) {
			return null;
		} else {
			return bigdec;
		}
	}

	public Object valueOf(String s) {
		return java.math.BigDecimal.valueOf(Long.valueOf(s).longValue());
	}

}
