package org.g4studio.core.mvc.xstruts.config;

import org.g4studio.core.mvc.xstruts.Globals;

/**
 * <p>
 * A JavaBean representing the configuration information of a
 * <code>&lt;message-resources&gt;</code> element in a Struts configuration
 * file.
 * </p>
 * 
 * @version $Rev: 421119 $ $Date: 2005-08-29 23:57:50 -0400 (Mon, 29 Aug 2005) $
 * @since Struts 1.1
 */
public class MessageResourcesConfig extends BaseConfig {
	// ------------------------------------------------------------- Properties

	/**
	 * Fully qualified Java class name of the MessageResourcesFactory class we
	 * should use.
	 */
	protected String factory = "org.g4studio.core.mvc.xstruts.util.PropertyMessageResourcesFactory";

	/**
	 * The servlet context attributes key under which this MessageResources
	 * instance is stored.
	 */
	protected String key = Globals.MESSAGES_KEY;

	/**
	 * Should we return <code>null</code> for unknown message keys?
	 */
	protected boolean nullValue = true;

	/**
	 * Indicates whether 'escape processing' should be performed on the error
	 * message string.
	 */
	private boolean escape = true;

	/**
	 * Parameter that is passed to the <code>createResources()</code> method of
	 * our MessageResourcesFactory implementation.
	 */
	protected String parameter = null;

	public String getFactory() {
		return (this.factory);
	}

	public void setFactory(String factory) {
		if (configured) {
			throw new IllegalStateException("Configuration is frozen");
		}

		this.factory = factory;
	}

	public String getKey() {
		return (this.key);
	}

	public void setKey(String key) {
		if (configured) {
			throw new IllegalStateException("Configuration is frozen");
		}

		this.key = key;
	}

	public boolean getNull() {
		return (this.nullValue);
	}

	public void setNull(boolean nullValue) {
		if (configured) {
			throw new IllegalStateException("Configuration is frozen");
		}

		this.nullValue = nullValue;
	}

	/**
	 * Indicates whether 'escape processing' should be performed on the error
	 * message string.
	 * 
	 * @since Struts 1.2.8
	 */
	public boolean isEscape() {
		return escape;
	}

	/**
	 * Set whether 'escape processing' should be performed on the error message
	 * string.
	 * 
	 * @since Struts 1.2.8
	 */
	public void setEscape(boolean escape) {
		this.escape = escape;
	}

	public String getParameter() {
		return (this.parameter);
	}

	public void setParameter(String parameter) {
		if (configured) {
			throw new IllegalStateException("Configuration is frozen");
		}

		this.parameter = parameter;
	}

	// --------------------------------------------------------- Public Methods

	/**
	 * Return a String representation of this object.
	 */
	public String toString() {
		StringBuffer sb = new StringBuffer("MessageResourcesConfig[");

		sb.append("factory=");
		sb.append(this.factory);
		sb.append(",null=");
		sb.append(this.nullValue);
		sb.append(",escape=");
		sb.append(this.escape);
		sb.append(",parameter=");
		sb.append(this.parameter);
		sb.append("]");

		return (sb.toString());
	}
}
