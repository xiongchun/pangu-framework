package org.g4studio.core.orm.xibatis.sqlmap.engine.type;

import java.io.ByteArrayInputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.sql.Types;

import org.g4studio.core.orm.xibatis.sqlmap.client.extensions.ParameterSetter;
import org.g4studio.core.orm.xibatis.sqlmap.client.extensions.ResultGetter;
import org.g4studio.core.orm.xibatis.sqlmap.client.extensions.TypeHandlerCallback;

public class BlobTypeHandlerCallback implements TypeHandlerCallback {

	public Object getResult(ResultGetter getter) throws SQLException {
		Blob blob = getter.getBlob();
		byte[] returnValue;
		if (!getter.wasNull()) {
			returnValue = blob.getBytes(1, (int) blob.length());
		} else {
			returnValue = null;
		}
		return returnValue;
	}

	public void setParameter(ParameterSetter setter, Object parameter) throws SQLException {
		if (null != parameter) {
			byte[] bytes = (byte[]) parameter;
			ByteArrayInputStream bis = new ByteArrayInputStream(bytes);
			setter.setBinaryStream(bis, (int) (bytes.length));
		} else {
			setter.setNull(Types.BLOB);
		}
	}

	public Object valueOf(String s) {
		return s;
	}

}