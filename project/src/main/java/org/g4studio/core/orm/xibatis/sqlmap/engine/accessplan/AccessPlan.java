package org.g4studio.core.orm.xibatis.sqlmap.engine.accessplan;

/**
 * An interface to make access to resources consistent, regardless of type.
 */
public interface AccessPlan {

	/**
	 * Sets all of the properties of a bean
	 * 
	 * @param object
	 *            - the bean
	 * @param values
	 *            - the property values
	 */
	public void setProperties(Object object, Object[] values);

	/**
	 * Gets all of the properties of a bean
	 * 
	 * @param object
	 *            - the bean
	 * @return the properties
	 */
	public Object[] getProperties(Object object);

}
