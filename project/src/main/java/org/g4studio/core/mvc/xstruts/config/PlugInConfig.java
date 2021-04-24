package org.g4studio.core.mvc.xstruts.config;

import java.io.Serializable;

import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 * A JavaBean representing the configuration information of a
 * <code>&lt;plug-in&gt;</code> element in a Struts configuration file.
 * </p>
 * <p>
 * Note that this class does not extend <code>BaseConfig</code> because it is
 * more "internal" than the other classes which do, and because this class has
 * an existing "properties" object which collides with the one in
 * <code>BaseConfig</code>. Also, since one always writes a concrete PlugIn
 * implementation, there seems to be less call for an arbitrary property map;
 * one can simply use bean properties instead.
 * </p>
 * 
 * @version $Rev: 421119 $ $Date: 2005-05-12 18:41:19 -0400 (Thu, 12 May 2005) $
 * @since Struts 1.1
 */
public class PlugInConfig implements Serializable {
	// ----------------------------------------------------- Instance Variables

	/**
	 * Has this component been completely configured?
	 */
	protected boolean configured = false;

	/**
	 * A <code>Map</code> of the name-value pairs that will be used to configure
	 * the property values of a <code>PlugIn</code> instance.
	 */
	protected Map properties = new HashMap();

	// ------------------------------------------------------------- Properties

	/**
	 * The fully qualified Java class name of the <code>PlugIn</code>
	 * implementation class being configured.
	 */
	protected String className = null;

	public String getClassName() {
		return (this.className);
	}

	public void setClassName(String className) {
		this.className = className;
	}

	// --------------------------------------------------------- Public Methods

	/**
	 * Add a new property name and value to the set that will be used to
	 * configure the <code>PlugIn</code> instance.
	 * 
	 * @param name
	 *            Property name
	 * @param value
	 *            Property value
	 */
	public void addProperty(String name, String value) {
		if (configured) {
			throw new IllegalStateException("Configuration is frozen");
		}

		properties.put(name, value);
	}

	/**
	 * Freeze the configuration of this component.
	 */
	public void freeze() {
		configured = true;
	}

	/**
	 * Return the properties that will be used to configure a
	 * <code>PlugIn</code> instance.
	 */
	public Map getProperties() {
		return (properties);
	}
}
