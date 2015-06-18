package org.g4studio.core.orm.xibatis.support.bridge;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.support.lob.LobCreator;
import org.springframework.jdbc.support.lob.LobHandler;

/**
 * iBATIS TypeHandler implementation for arbitrary objects that get serialized
 * to BLOBs. Retrieves the LobHandler to use from SqlMapClientFactoryBean at
 * config time.
 * 
 * <p>
 * Can also be defined in generic iBATIS mappings, as DefaultLobCreator will
 * work with most JDBC-compliant database drivers. In this case, the field type
 * does not have to be BLOB: For databases like MySQL and MS SQL Server, any
 * large enough binary type will work.
 * 
 * @author Juergen Hoeller
 * @since 1.1.5
 */
public class BlobSerializableTypeHandler extends AbstractLobTypeHandler {

	/**
	 * Constructor used by iBATIS: fetches config-time LobHandler from
	 * SqlMapClientFactoryBean.
	 */
	public BlobSerializableTypeHandler() {
		super();
	}

	/**
	 * Constructor used for testing: takes an explicit LobHandler.
	 */
	protected BlobSerializableTypeHandler(LobHandler lobHandler) {
		super(lobHandler);
	}

	protected void setParameterInternal(PreparedStatement ps, int index, Object value, String jdbcType,
			LobCreator lobCreator) throws SQLException, IOException {

		if (value != null) {
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			ObjectOutputStream oos = new ObjectOutputStream(baos);
			try {
				oos.writeObject(value);
				oos.flush();
				lobCreator.setBlobAsBytes(ps, index, baos.toByteArray());
			} finally {
				oos.close();
			}
		} else {
			lobCreator.setBlobAsBytes(ps, index, null);
		}
	}

	protected Object getResultInternal(ResultSet rs, int index, LobHandler lobHandler) throws SQLException, IOException {

		InputStream is = lobHandler.getBlobAsBinaryStream(rs, index);
		if (is != null) {
			ObjectInputStream ois = new ObjectInputStream(is);
			try {
				return ois.readObject();
			} catch (ClassNotFoundException ex) {
				throw new SQLException("Could not deserialize BLOB contents: " + ex.getMessage());
			} finally {
				ois.close();
			}
		} else {
			return null;
		}
	}

	public Object valueOf(String s) {
		return s;
	}

}
