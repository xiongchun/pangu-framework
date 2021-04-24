package org.g4studio.core.mvc.xstruts.chain.commands;

/**
 * <p>
 * Exception thrown when the chosen action mapping is not authorized for the
 * current request.
 * </p>
 * 
 * @version $Rev: 421119 $ $Date: 2005-06-04 10:58:46 -0400 (Sat, 04 Jun 2005) $
 */
public class UnauthorizedActionException extends Exception {
	/**
	 * <p>
	 * Default no-argument constructor.
	 * </p>
	 */
	public UnauthorizedActionException() {
		super();
	}

	/**
	 * <p>
	 * Constructor to set message on instantiation.
	 * </p>
	 * 
	 * @param message
	 *            The error or warning message.
	 */
	public UnauthorizedActionException(String message) {
		super(message);
	}
}
