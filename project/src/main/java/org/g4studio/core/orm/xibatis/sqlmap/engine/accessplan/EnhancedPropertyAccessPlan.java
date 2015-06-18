package org.g4studio.core.orm.xibatis.sqlmap.engine.accessplan;

import net.sf.cglib.beans.BulkBean;

/**
 * Enhanced PropertyAccessPlan (for working with beans using CG Lib)
 */
public class EnhancedPropertyAccessPlan extends BaseAccessPlan {

	private BulkBean bulkBean;

	EnhancedPropertyAccessPlan(Class clazz, String[] propertyNames) {
		super(clazz, propertyNames);
		bulkBean = BulkBean.create(clazz, getGetterNames(propertyNames), getSetterNames(propertyNames),
				getTypes(propertyNames));
	}

	public void setProperties(Object object, Object[] values) {
		bulkBean.setPropertyValues(object, values);
	}

	public Object[] getProperties(Object object) {
		return bulkBean.getPropertyValues(object);
	}

}
