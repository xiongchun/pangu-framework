package org.g4studio.core.orm.xibatis.sqlmap.engine.type;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.g4studio.core.orm.xibatis.sqlmap.client.extensions.ParameterSetter;
import org.g4studio.core.orm.xibatis.sqlmap.client.extensions.ResultGetter;
import org.g4studio.core.orm.xibatis.sqlmap.client.extensions.TypeHandlerCallback;

/**
 * Custom type handler for adding a TypeHandlerCallback
 */
public class CustomTypeHandler extends BaseTypeHandler implements TypeHandler {

	private TypeHandlerCallback callback;

	/**
	 * Constructor to provide a TypeHandlerCallback instance
	 * 
	 * @param callback
	 *            - the TypeHandlerCallback instance
	 */
	public CustomTypeHandler(TypeHandlerCallback callback) {
		this.callback = callback;
	}

	public void setParameter(PreparedStatement ps, int i, Object parameter, String jdbcType) throws SQLException {
		ParameterSetter setter = new ParameterSetterImpl(ps, i);
		callback.setParameter(setter, parameter);
	}

	public Object getResult(ResultSet rs, String columnName) throws SQLException {
		ResultGetter getter = new ResultGetterImpl(rs, columnName);
		return callback.getResult(getter);
	}

	public Object getResult(ResultSet rs, int columnIndex) throws SQLException {
		ResultGetter getter = new ResultGetterImpl(rs, columnIndex);
		return callback.getResult(getter);
	}

	public Object getResult(CallableStatement cs, int columnIndex) throws SQLException {
		ResultGetter getter = new ResultGetterImpl(new CallableStatementResultSet(cs), columnIndex);
		return callback.getResult(getter);
	}

	public Object valueOf(String s) {
		return callback.valueOf(s);
	}

}
