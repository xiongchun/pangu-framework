package org.g4studio.core.mvc.xstruts.action;

/**
 * <p>
 * Subclass of <code>ActionMapping</code> that defaults the form bean scope to
 * <code>session</code>.
 * </p>
 * 
 * @version $Rev: 421119 $ $Date: 2005-05-07 12:11:38 -0400 (Sat, 07 May 2005) $
 */
public class SessionActionMapping extends ActionMapping {
	/**
	 * <p>
	 * Construct a new instance of this class with the desired default form bean
	 * scope.
	 * </p>
	 */
	public SessionActionMapping() {
		super();
		setScope("session");
	}
}
