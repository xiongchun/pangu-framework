package org.g4studio.core.mvc.xstruts.chain.commands;

/**
 * <p>
 * Exception thrown when no mapping can be found for the specified path.
 * </p>
 * 
 * @version $Rev: 376862 $ $Date: 2005-11-05 21:44:59 -0500 (Sat, 05 Nov 2005) $
 */
public class InvalidPathException extends Exception {
	/**
	 * Field for Path property.
	 */
	private String path;

	/**
	 * <p>
	 * Default, no-argument constructor.
	 * </p>
	 */
	public InvalidPathException() {
		super();
	}

	/**
	 * <p>
	 * Constructor to inject message and path upon instantiation.
	 * </p>
	 * 
	 * @param message
	 *            The error or warning message.
	 * @param path
	 *            The invalid path.
	 */
	public InvalidPathException(String message, String path) {
		super(message);
		this.path = path;
	}

	/**
	 * <p>
	 * Return the invalid path causing the exception.
	 * </p>
	 * 
	 * @return The invalid path causing the exception.
	 */
	public String getPath() {
		return path;
	}
}
