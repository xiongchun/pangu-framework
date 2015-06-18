package org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.sql.dynamic.elements;

import java.util.Map;

import org.g4studio.core.orm.xibatis.common.beans.Probe;
import org.g4studio.core.orm.xibatis.common.beans.ProbeFactory;

public class IsPropertyAvailableTagHandler extends ConditionalTagHandler {

	private static final Probe PROBE = ProbeFactory.getProbe();

	public boolean isCondition(SqlTagContext ctx, SqlTag tag, Object parameterObject) {
		if (parameterObject == null) {
			return false;
		} else if (parameterObject instanceof Map) {
			return ((Map) parameterObject).containsKey(tag.getPropertyAttr());
		} else {
			String property = getResolvedProperty(ctx, tag);
			// if this is a compound property, then we need to get the next to
			// the last
			// value from the parameter object, and then see if there is a
			// readable property
			// for the last value. This logic was added for IBATIS-281 and
			// IBATIS-293
			int lastIndex = property.lastIndexOf('.');
			if (lastIndex != -1) {
				String firstPart = property.substring(0, lastIndex);
				String lastPart = property.substring(lastIndex + 1);
				parameterObject = PROBE.getObject(parameterObject, firstPart);
				property = lastPart;
			}

			if (parameterObject instanceof Map) {
				// we do this because the PROBE always returns true for
				// properties in Maps and that's not the behavior we want here
				return ((Map) parameterObject).containsKey(property);
			} else {
				return PROBE.hasReadableProperty(parameterObject, property);
			}
		}
	}
}
