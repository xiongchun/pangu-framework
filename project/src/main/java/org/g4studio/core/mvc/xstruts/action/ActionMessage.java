package org.g4studio.core.mvc.xstruts.action;

import java.io.Serializable;

/**
 * <p>
 * An encapsulation of an individual message returned by the
 * <code>validate</code> method of an <code>ActionForm</code>, consisting of a
 * message key (to be used to look up message text in an appropriate message
 * resources database) plus up to four placeholder objects that can be used for
 * parametric replacement in the message text.
 * </p>
 * 
 * @version $Rev: 421119 $ $Date: 2005-05-14 01:09:32 -0400 (Sat, 14 May 2005) $
 * @since Struts 1.1
 */
public class ActionMessage implements Serializable {
	// ----------------------------------------------------- Instance Variables

	/**
	 * <p>
	 * The message key for this message.
	 * </p>
	 */
	protected String key = null;

	/**
	 * <p>
	 * The replacement values for this mesasge.
	 * </p>
	 */
	protected Object[] values = null;

	/**
	 * <p>
	 * Indicates whether the key is taken to be as a bundle key [true] or
	 * literal value [false].
	 * </p>
	 */
	protected boolean resource = true;

	// ----------------------------------------------------------- Constructors

	/**
	 * <p>
	 * Construct an action message with no replacement values.
	 * </p>
	 * 
	 * @param key
	 *            Message key for this message
	 */
	public ActionMessage(String key) {
		this(key, null);
	}

	/**
	 * <p>
	 * Construct an action message with the specified replacement values.
	 * </p>
	 * 
	 * @param key
	 *            Message key for this message
	 * @param value0
	 *            First replacement value
	 */
	public ActionMessage(String key, Object value0) {
		this(key, new Object[] { value0 });
	}

	/**
	 * <p>
	 * Construct an action message with the specified replacement values.
	 * </p>
	 * 
	 * @param key
	 *            Message key for this message
	 * @param value0
	 *            First replacement value
	 * @param value1
	 *            Second replacement value
	 */
	public ActionMessage(String key, Object value0, Object value1) {
		this(key, new Object[] { value0, value1 });
	}

	/**
	 * <p>
	 * Construct an action message with the specified replacement values.
	 * </p>
	 * 
	 * @param key
	 *            Message key for this message
	 * @param value0
	 *            First replacement value
	 * @param value1
	 *            Second replacement value
	 * @param value2
	 *            Third replacement value
	 */
	public ActionMessage(String key, Object value0, Object value1, Object value2) {
		this(key, new Object[] { value0, value1, value2 });
	}

	/**
	 * <p>
	 * Construct an action message with the specified replacement values.
	 * </p>
	 * 
	 * @param key
	 *            Message key for this message
	 * @param value0
	 *            First replacement value
	 * @param value1
	 *            Second replacement value
	 * @param value2
	 *            Third replacement value
	 * @param value3
	 *            Fourth replacement value
	 */
	public ActionMessage(String key, Object value0, Object value1, Object value2, Object value3) {
		this(key, new Object[] { value0, value1, value2, value3 });
	}

	/**
	 * <p>
	 * Construct an action message with the specified replacement values.
	 * </p>
	 * 
	 * @param key
	 *            Message key for this message
	 * @param values
	 *            Array of replacement values
	 */
	public ActionMessage(String key, Object[] values) {
		this.key = key;
		this.values = values;
		this.resource = true;
	}

	/**
	 * <p>
	 * Construct an action message with the specified replacement values.
	 * </p>
	 * 
	 * @param key
	 *            Message key for this message
	 * @param resource
	 *            Indicates whether the key is a bundle key or literal value
	 */
	public ActionMessage(String key, boolean resource) {
		this.key = key;
		this.resource = resource;
	}

	// --------------------------------------------------------- Public Methods

	/**
	 * <p>
	 * Get the message key for this message.
	 * </p>
	 * 
	 * @return The message key for this message.
	 */
	public String getKey() {
		return (this.key);
	}

	/**
	 * <p>
	 * Get the replacement values for this message.
	 * </p>
	 * 
	 * @return The replacement values for this message.
	 */
	public Object[] getValues() {
		return (this.values);
	}

	/**
	 * <p>
	 * Indicate whether the key is taken to be as a bundle key [true] or literal
	 * value [false].
	 * </p>
	 * 
	 * @return <code>true</code> if the key is a bundle key; <code>false</code>
	 *         otherwise.
	 */
	public boolean isResource() {
		return (this.resource);
	}

	/**
	 * <p>
	 * Returns a String in the format: key[value1, value2, etc].
	 * </p>
	 * 
	 * @return String representation of this message
	 * @see java.lang.Object#toString()
	 */
	public String toString() {
		StringBuffer buff = new StringBuffer();

		buff.append(this.key);
		buff.append("[");

		if (this.values != null) {
			for (int i = 0; i < this.values.length; i++) {
				buff.append(this.values[i]);

				// don't append comma to last entry
				if (i < (this.values.length - 1)) {
					buff.append(", ");
				}
			}
		}

		buff.append("]");

		return buff.toString();
	}
}
