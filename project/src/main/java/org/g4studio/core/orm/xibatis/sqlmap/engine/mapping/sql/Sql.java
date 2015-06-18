package org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.sql;

import org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.parameter.ParameterMap;
import org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.result.ResultMap;
import org.g4studio.core.orm.xibatis.sqlmap.engine.scope.StatementScope;

public interface Sql {

	public String getSql(StatementScope statementScope, Object parameterObject);

	public ParameterMap getParameterMap(StatementScope statementScope, Object parameterObject);

	public ResultMap getResultMap(StatementScope statementScope, Object parameterObject);

	public void cleanup(StatementScope statementScope);

}
