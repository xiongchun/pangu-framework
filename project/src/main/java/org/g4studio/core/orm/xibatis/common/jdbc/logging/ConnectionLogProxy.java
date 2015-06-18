package org.g4studio.core.orm.xibatis.common.jdbc.logging;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

import org.g4studio.core.orm.xibatis.common.beans.ClassInfo;
import org.g4studio.core.orm.xibatis.common.logging.Log;
import org.g4studio.core.orm.xibatis.common.logging.LogFactory;

/**
 * Connection proxy to add logging
 */
public class ConnectionLogProxy extends BaseLogProxy implements InvocationHandler {

	private static final Log log = LogFactory.getLog(Connection.class);

	private Connection connection;

	private ConnectionLogProxy(Connection conn) {
		super();
		this.connection = conn;
		if (log.isDebugEnabled()) {
			log.debug("{conn-" + id + "} Connection");
		}
	}

	public Object invoke(Object proxy, Method method, Object[] params) throws Throwable {
		try {
			if ("prepareStatement".equals(method.getName())) {
				if (log.isDebugEnabled()) {
					log.debug("{conn-" + id + "} Preparing Statement: " + removeBreakingWhitespace((String) params[0]));
				}
				PreparedStatement stmt = (PreparedStatement) method.invoke(connection, params);
				stmt = PreparedStatementLogProxy.newInstance(stmt, (String) params[0]);
				return stmt;
			} else if ("prepareCall".equals(method.getName())) {
				if (log.isDebugEnabled()) {
					log.debug("{conn-" + id + "} Preparing Call: " + removeBreakingWhitespace((String) params[0]));
				}
				PreparedStatement stmt = (PreparedStatement) method.invoke(connection, params);
				stmt = PreparedStatementLogProxy.newInstance(stmt, (String) params[0]);
				return stmt;
			} else if ("createStatement".equals(method.getName())) {
				Statement stmt = (Statement) method.invoke(connection, params);
				stmt = StatementLogProxy.newInstance(stmt);
				return stmt;
			} else {
				return method.invoke(connection, params);
			}
		} catch (Throwable t) {
			Throwable t1 = ClassInfo.unwrapThrowable(t);
			log.error("Error calling Connection." + method.getName() + ':', t1);
			throw t1;
		}

	}

	/**
	 * Creates a logging version of a connection
	 * 
	 * @param conn
	 *            - the original connection
	 * @return - the connection with logging
	 */
	public static Connection newInstance(Connection conn) {
		InvocationHandler handler = new ConnectionLogProxy(conn);
		ClassLoader cl = Connection.class.getClassLoader();
		return (Connection) Proxy.newProxyInstance(cl, new Class[] { Connection.class }, handler);
	}

	/**
	 * return the wrapped connection
	 * 
	 * @return the connection
	 */
	public Connection getConnection() {
		return connection;
	}

}
