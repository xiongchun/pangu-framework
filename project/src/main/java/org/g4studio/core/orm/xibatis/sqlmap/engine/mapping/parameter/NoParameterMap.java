package org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.parameter;

import org.g4studio.core.orm.xibatis.sqlmap.engine.impl.SqlMapExecutorDelegate;
import org.g4studio.core.orm.xibatis.sqlmap.engine.scope.StatementScope;

public class NoParameterMap extends ParameterMap {

	private static final ParameterMapping[] NO_PARAMETERS = new ParameterMapping[0];
	private static final Object[] NO_DATA = new Object[0];

	public NoParameterMap(SqlMapExecutorDelegate delegate) {
		super(delegate);
	}

	public ParameterMapping[] getParameterMappings() {
		return NO_PARAMETERS;
	}

	public Object[] getParameterObjectValues(StatementScope statementScope, Object parameterObject) {
		return NO_DATA;
	}

}
