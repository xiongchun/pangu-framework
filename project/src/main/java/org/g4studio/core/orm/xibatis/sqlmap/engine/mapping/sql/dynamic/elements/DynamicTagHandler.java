package org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.sql.dynamic.elements;

public class DynamicTagHandler extends BaseTagHandler {

	public int doStartFragment(SqlTagContext ctx, SqlTag tag, Object parameterObject) {
		ctx.pushRemoveFirstPrependMarker(tag);
		return BaseTagHandler.INCLUDE_BODY;
	}

}
