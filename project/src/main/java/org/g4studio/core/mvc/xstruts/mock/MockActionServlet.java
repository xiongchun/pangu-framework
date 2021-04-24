package org.g4studio.core.mvc.xstruts.mock;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;

import org.g4studio.core.mvc.xstruts.action.ActionServlet;

/**
 * <p>
 * Mock <strong>ActionServlet</strong> object for low-level unit tests of Struts
 * controller components. Coarser grained tests should be implemented in terms
 * of the Cactus framework, instead of the mock object classes.
 * </p>
 * 
 * <p>
 * <strong>WARNING</strong> - Only getter methods for servletContext and
 * servletConfig are provided, plus additional methods to configure this object
 * as necessary. Methods for unsupported operations will throw
 * <code>UnsupportedOperationException</code>.
 * </p>
 * 
 * <p>
 * <strong>WARNING</strong> - Because unit tests operate in a single threaded
 * environment, no synchronization is performed.
 * </p>
 * 
 * @version $Rev: 421119 $ $Date: 2005-05-14 02:09:06 -0400 (Sat, 14 May 2005) $
 */
public class MockActionServlet extends ActionServlet {
	protected ServletContext servletContext;
	protected ServletConfig servletConfig;

	/**
	 * <p>
	 * Constructor.
	 * </p>
	 */
	public MockActionServlet(ServletContext servletContext, ServletConfig servletConfig) {
		this.servletContext = servletContext;
		this.servletConfig = servletConfig;
	}

	/**
	 * <p>
	 * Constructor.
	 * </p>
	 */
	public MockActionServlet() {
		; // do nothing
	}

	/**
	 * <p>
	 * Set property
	 * </p>
	 * 
	 * @param servletContext
	 */
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}

	/**
	 * <p>
	 * Get property
	 * </p>
	 * 
	 * @return
	 */
	public ServletContext getServletContext() {
		return servletContext;
	}

	/**
	 * <p>
	 * Set property
	 * 
	 * @param servletConfig
	 */
	public void setServletConfig(ServletConfig servletConfig) {
		this.servletConfig = servletConfig;
	}

	/**
	 * <p>
	 * Get property
	 * </p>
	 * 
	 * @return
	 */
	public ServletConfig getServletConfig() {
		return servletConfig;
	}

	/**
	 * <p>
	 * Expose as public so that test classes can exercise things which retrieve
	 * messages.
	 * </p>
	 */
	public void initInternal() throws ServletException {
		super.initInternal();
	}
}
