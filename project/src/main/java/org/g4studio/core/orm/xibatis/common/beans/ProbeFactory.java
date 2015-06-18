package org.g4studio.core.orm.xibatis.common.beans;

/**
 * An abstract factory for getting Probe implementations.
 */
public class ProbeFactory {

	private static final Probe DOM = new DomProbe();
	private static final Probe BEAN = new ComplexBeanProbe();
	private static final Probe GENERIC = new GenericProbe();

	/**
	 * Factory method for getting a Probe object
	 * 
	 * @return An implementation of the Probe interface
	 */
	public static Probe getProbe() {
		return GENERIC;
	}

	/**
	 * Factory method for getting a Probe object that is the best choice for the
	 * type of object supplied by the object parameter.
	 * 
	 * @param object
	 *            The object to get a Probe for
	 * @return An implementation of the Probe interface
	 */
	public static Probe getProbe(Object object) {
		if (object instanceof org.w3c.dom.Document) {
			return DOM;
		} else {
			return BEAN;
		}
	}

}
