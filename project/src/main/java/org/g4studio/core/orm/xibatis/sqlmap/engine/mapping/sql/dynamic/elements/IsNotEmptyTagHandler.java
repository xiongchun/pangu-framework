package org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.sql.dynamic.elements;

public class IsNotEmptyTagHandler extends IsEmptyTagHandler {

	public boolean isCondition(SqlTagContext ctx, SqlTag tag, Object parameterObject) {
		return !super.isCondition(ctx, tag, parameterObject);
	}

}
