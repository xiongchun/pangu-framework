package org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.sql.dynamic.elements;

import java.lang.reflect.Array;
import java.util.Collection;

import org.g4studio.core.orm.xibatis.common.beans.Probe;
import org.g4studio.core.orm.xibatis.common.beans.ProbeFactory;

public class IsEmptyTagHandler extends ConditionalTagHandler {

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
			if (value instanceof Collection) {
				return value == null || ((Collection) value).size() < 1;
			} else if (value != null && value.getClass().isArray()) {
				return Array.getLength(value) == 0;
			} else {
				return value == null || String.valueOf(value).equals("");
			}
		}
	}

}
