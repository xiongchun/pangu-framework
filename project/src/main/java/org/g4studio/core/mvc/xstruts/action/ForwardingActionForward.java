package org.g4studio.core.mvc.xstruts.action;

/**
 * <p>
 * A subclass of <code>ActionForward</code> that defaults the
 * <code>redirect</code> attribute to <code>false</code>.
 * </p>
 * 
 * @version $Rev: 421119 $ $Date: 2005-05-07 12:11:38 -0400 (Sat, 07 May 2005) $
 */
public class ForwardingActionForward extends ActionForward {
	// ----------------------------------------------------------- Constructors

	/**
	 * <p>
	 * Construct a new instance with default values.
	 * </p>
	 */
	public ForwardingActionForward() {
		this(null);
	}

	/**
	 * <P>
	 * Construct a new instance with the specified path.
	 * </p>
	 * 
	 * @param path
	 *            Path for this instance
	 */
	public ForwardingActionForward(String path) {
		super();
		setName(null);
		setPath(path);
		setRedirect(false);
	}
}
