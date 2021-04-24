package org.g4studio.core.mvc.xstruts.action;

/**
 * <p>
 * Subclass of <code>ActionMapping</code> that defaults the form bean scope to
 * <code>request</code>.
 * </p>
 * 
 * @version $Rev: 421119 $ $Date: 2005-05-07 12:11:38 -0400 (Sat, 07 May 2005) $
 */
public class RequestActionMapping extends ActionMapping {
	/**
	 * <p>
	 * Construct a new instance of this class with the desired default form bean
	 * scope.
	 * </p>
	 */
	public RequestActionMapping() {
		super();
		setScope("request");
	}
}
