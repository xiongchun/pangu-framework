package org.g4studio.core.orm.xibatis.common.jdbc.logging;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.sql.ResultSet;

import org.g4studio.core.orm.xibatis.common.beans.ClassInfo;
import org.g4studio.core.orm.xibatis.common.logging.Log;
import org.g4studio.core.orm.xibatis.common.logging.LogFactory;

/**
 * ResultSet proxy to add logging
 */
public class ResultSetLogProxy extends BaseLogProxy implements InvocationHandler {

	private static final Log log = LogFactory.getLog(ResultSet.class);

	boolean first = true;
	private ResultSet rs;

	private ResultSetLogProxy(ResultSet rs) {
		super();
		this.rs = rs;
		if (log.isDebugEnabled()) {
			log.debug("{rset-" + id + "} ResultSet");
		}
	}

	public Object invoke(Object proxy, Method method, Object[] params) throws Throwable {
		try {
			Object o = method.invoke(rs, params);
			if (GET_METHODS.contains(method.getName())) {
				if (params[0] instanceof String) {
					if (rs.wasNull()) {
						setColumn(params[0], null);
					} else {
						setColumn(params[0], o);
					}
				}
			} else if ("next".equals(method.getName()) || "close".equals(method.getName())) {
				String s = getValueString();
				if (!"[]".equals(s)) {
					if (first) {
						first = false;
						if (log.isDebugEnabled()) {
							log.debug("{rset-" + id + "} Header: " + getColumnString());
						}
					}
					if (log.isDebugEnabled()) {
						log.debug("{rset-" + id + "} Result: " + s);
					}
				}
				clearColumnInfo();
			}
			return o;
		} catch (Throwable t) {
			throw ClassInfo.unwrapThrowable(t);
		}
	}

	/**
	 * Creates a logging version of a ResultSet
	 * 
	 * @param rs
	 *            - the ResultSet to proxy
	 * @return - the ResultSet with logging
	 */
	public static ResultSet newInstance(ResultSet rs) {
		InvocationHandler handler = new ResultSetLogProxy(rs);
		ClassLoader cl = ResultSet.class.getClassLoader();
		return (ResultSet) Proxy.newProxyInstance(cl, new Class[] { ResultSet.class }, handler);
	}

	/**
	 * Get the wrapped result set
	 * 
	 * @return the resultSet
	 */
	public ResultSet getRs() {
		return rs;
	}

}
