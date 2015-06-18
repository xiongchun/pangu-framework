package org.g4studio.core.orm.xibatis.common.logging.nologging;

import org.g4studio.core.orm.xibatis.common.logging.Log;

public class NoLoggingImpl implements Log {

	public NoLoggingImpl(Class clazz) {
	}

	public boolean isDebugEnabled() {
		return false;
	}

	public void error(String s, Throwable e) {
	}

	public void error(String s) {
	}

	public void debug(String s) {
	}

	public void warn(String s) {
	}

}
