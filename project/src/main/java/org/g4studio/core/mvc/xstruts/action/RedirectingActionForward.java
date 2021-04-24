package org.g4studio.core.mvc.xstruts.action;

/**
 * <p>
 * A subclass of <strong>ActionForward</strong> that defaults the
 * <code>redirect</code> attribute to <code>true</code>.
 * </p>
 * 
 * @version $Rev: 421119 $ $Date: 2005-05-07 12:11:38 -0400 (Sat, 07 May 2005) $
 */
public class RedirectingActionForward extends ActionForward {
	// ----------------------------------------------------------- Constructors

	/**
	 * <p>
	 * Construct a new instance with default values.
	 * </p>
	 */
	public RedirectingActionForward() {
		this(null);
	}

	/**
	 * <p>
	 * Construct a new instance with the specified path.
	 * </p>
	 * 
	 * @param path
	 *            Path for this instance
	 */
	public RedirectingActionForward(String path) {
		super();
		setName(null);
		setPath(path);
		setRedirect(true);
	}
}
