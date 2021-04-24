package org.g4studio.core.mvc.xstruts.action;

import java.io.Serializable;

import org.g4studio.core.mvc.xstruts.upload.MultipartRequestHandler;

/**
 * <p>
 * Provide a wrapper around an {@link ActionServlet} to expose only those
 * methods needed by other objects. When used with an {@link ActionForm},
 * subclasses must be careful that they do not return an object with public
 * getters and setters that could be exploited by automatic population of
 * properties.
 * </p>
 * 
 * @version $Rev: 421119 $ $Date: 2005-05-07 12:11:38 -0400 (Sat, 07 May 2005) $
 * @since Struts 1.0.1
 */
public class ActionServletWrapper implements Serializable {
	/**
	 * <p>
	 * The servlet instance to which we are attached.
	 * </p>
	 */
	protected transient ActionServlet servlet = null;

	/**
	 * <p>
	 * Create object and set <code>servlet</code> property.
	 * </p>
	 * 
	 * @param servlet
	 *            <code>ActionServlet</code> to wrap
	 */
	public ActionServletWrapper(ActionServlet servlet) {
		super();
		this.servlet = servlet;
	}

	/**
	 * <p>
	 * Set servlet to a <code>MultipartRequestHandler</code>.
	 * </p>
	 * 
	 * @param object
	 *            The MultipartRequestHandler
	 */
	public void setServletFor(MultipartRequestHandler object) {
		object.setServlet(this.servlet);

		// :FIXME: Should this be based on an "setServlet"
		// interface or introspection for a setServlet method?
		// Or, is it safer to just add the types we want as we want them?
	}
}
