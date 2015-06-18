package org.g4studio.core.orm.xibatis.sqlmap.engine.accessplan;

import org.g4studio.core.orm.xibatis.common.beans.Probe;
import org.g4studio.core.orm.xibatis.common.beans.ProbeFactory;

/**
 * Access plan for working with beans
 */
public class ComplexAccessPlan extends BaseAccessPlan {

	private static final Probe PROBE = ProbeFactory.getProbe();

	ComplexAccessPlan(Class clazz, String[] propertyNames) {
		super(clazz, propertyNames);
	}

	public void setProperties(Object object, Object[] values) {
		for (int i = 0; i < propertyNames.length; i++) {
			PROBE.setObject(object, propertyNames[i], values[i]);
		}
	}

	public Object[] getProperties(Object object) {
		Object[] values = new Object[propertyNames.length];
		for (int i = 0; i < propertyNames.length; i++) {
			values[i] = PROBE.getObject(object, propertyNames[i]);
		}
		return values;
	}

}
