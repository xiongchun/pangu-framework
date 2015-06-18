package org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.sql.dynamic.elements;

import org.g4studio.core.orm.xibatis.common.beans.Probe;
import org.g4studio.core.orm.xibatis.common.beans.ProbeFactory;

public class IsNullTagHandler extends ConditionalTagHandler {

	private static final Probe PROBE = ProbeFactory.getProbe();

	public boolean isCondition(SqlTagContext ctx, SqlTag tag, Object parameterObject) {
		if (parameterObject == null) {
			return true;
		} else {
			String prop = getResolvedProperty(ctx, tag);
			Object value;
			if (prop != null) {
				value = PROBE.getObject(parameterObject, prop);
			} else {
				value = parameterObject;
			}
			return value == null;
		}
	}

}
