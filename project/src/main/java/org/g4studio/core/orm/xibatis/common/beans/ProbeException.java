package org.g4studio.core.orm.xibatis.common.beans;

/**
 * BeansException for use for by BeanProbe and StaticBeanProbe.
 */
public class ProbeException extends RuntimeException {

	/**
	 * Default constructor
	 */
	public ProbeException() {
	}

	/**
	 * Constructor to set the message for the exception
	 * 
	 * @param msg
	 *            - the message for the exception
	 */
	public ProbeException(String msg) {
		super(msg);
	}

	/**
	 * Constructor to create a nested exception
	 * 
	 * @param cause
	 *            - the reason the exception is being thrown
	 */
	public ProbeException(Throwable cause) {
		super(cause);
	}

	/**
	 * Constructor to create a nested exception with a message
	 * 
	 * @param msg
	 *            - the message for the exception
	 * @param cause
	 *            - the reason the exception is being thrown
	 */
	public ProbeException(String msg, Throwable cause) {
		super(msg, cause);
	}

}
