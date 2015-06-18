package org.g4studio.core.orm.xibatis.sqlmap.engine.accessplan;

import org.g4studio.core.orm.xibatis.common.beans.ClassInfo;
import org.g4studio.core.orm.xibatis.common.beans.Invoker;

/**
 * Property access plan (for working with beans)
 */
public class PropertyAccessPlan extends BaseAccessPlan {

	protected static final Object[] NO_ARGUMENTS = new Object[0];

	protected Invoker[] setters;
	protected Invoker[] getters;

	PropertyAccessPlan(Class clazz, String[] propertyNames) {
		super(clazz, propertyNames);
		setters = getSetters(propertyNames);
		getters = getGetters(propertyNames);
	}

	public void setProperties(Object object, Object[] values) {
		int i = 0;
		try {
			Object[] arg = new Object[1];
			for (i = 0; i < propertyNames.length; i++) {
				arg[0] = values[i];
				try {
					setters[i].invoke(object, arg);
				} catch (Throwable t) {
					throw ClassInfo.unwrapThrowable(t);
				}
			}
		} catch (Throwable t) {
			throw new RuntimeException("Error setting property '" + setters[i].getName() + "' of '" + object
					+ "'.  Cause: " + t, t);
		}
	}

	public Object[] getProperties(Object object) {
		int i = 0;
		Object[] values = new Object[propertyNames.length];
		try {
			for (i = 0; i < propertyNames.length; i++) {
				try {
					values[i] = getters[i].invoke(object, NO_ARGUMENTS);
				} catch (Throwable t) {
					throw ClassInfo.unwrapThrowable(t);
				}
			}
		} catch (Throwable t) {
			throw new RuntimeException("Error getting property '" + getters[i].getName() + "' of '" + object
					+ "'.  Cause: " + t, t);
		}
		return values;
	}

}
