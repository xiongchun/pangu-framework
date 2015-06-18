package org.g4studio.core.orm.xibatis.support.bridge;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.support.lob.LobCreator;
import org.springframework.jdbc.support.lob.LobHandler;

/**
 * iBATIS TypeHandler implementation for byte arrays that get mapped to BLOBs.
 * Retrieves the LobHandler to use from SqlMapClientFactoryBean at config time.
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
public class BlobByteArrayTypeHandler extends AbstractLobTypeHandler {

	/**
	 * Constructor used by iBATIS: fetches config-time LobHandler from
	 * SqlMapClientFactoryBean.
	 */
	public BlobByteArrayTypeHandler() {
		super();
	}

	/**
	 * Constructor used for testing: takes an explicit LobHandler.
	 */
	protected BlobByteArrayTypeHandler(LobHandler lobHandler) {
		super(lobHandler);
	}

	protected void setParameterInternal(PreparedStatement ps, int index, Object value, String jdbcType,
			LobCreator lobCreator) throws SQLException {
		lobCreator.setBlobAsBytes(ps, index, (byte[]) value);
	}

	protected Object getResultInternal(ResultSet rs, int index, LobHandler lobHandler) throws SQLException {
		return lobHandler.getBlobAsBytes(rs, index);
	}

	public Object valueOf(String s) {
		return s.getBytes();
	}

}
