package org.g4studio.core.orm.xibatis.sqlmap.engine.type;

import java.io.StringReader;
import java.sql.Clob;
import java.sql.SQLException;
import java.sql.Types;

import org.g4studio.core.orm.xibatis.sqlmap.client.extensions.ParameterSetter;
import org.g4studio.core.orm.xibatis.sqlmap.client.extensions.ResultGetter;
import org.g4studio.core.orm.xibatis.sqlmap.client.extensions.TypeHandlerCallback;

public class ClobTypeHandlerCallback implements TypeHandlerCallback {

	public Object getResult(ResultGetter getter) throws SQLException {
		String value;
		Clob clob = getter.getClob();
		if (!getter.wasNull()) {
			int size = (int) clob.length();
			value = clob.getSubString(1, size);
		} else {
			value = null;
		}

		return value;
	}

	public void setParameter(ParameterSetter setter, Object parameter) throws SQLException {
		String s = (String) parameter;
		if (s != null) {
			StringReader reader = new StringReader(s);
			setter.setCharacterStream(reader, s.length());
		} else {
			setter.setNull(Types.CLOB);
		}
	}

	public Object valueOf(String s) {
		return s;
	}

}
