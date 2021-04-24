package org.g4studio.core.mvc.xstruts.mock;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;

import java.util.Enumeration;
import java.util.HashMap;

/**
 * <p>
 * Mock <strong>ServletConfig</strong> object for low-level unit tests of Struts
 * controller components. Coarser grained tests should be implemented in terms
 * of the Cactus framework, instead of the mock object classes.
 * </p>
 * 
 * <p>
 * <strong>WARNING</strong> - Only the minimal set of methods needed to create
 * unit tests is provided, plus additional methods to configure this object as
 * necessary. Methods for unsupported operations will throw
 * <code>UnsupportedOperationException</code>.
 * </p>
 * 
 * <p>
 * <strong>WARNING</strong> - Because unit tests operate in a single threaded
 * environment, no synchronization is performed.
 * </p>
 * 
 * @version $Rev: 421119 $ $Date: 2005-05-07 12:11:38 -0400 (Sat, 07 May 2005) $
 */
public class MockServletConfig implements ServletConfig {
	// ----------------------------------------------------- Instance Variables
	protected ServletContext context = null;
	protected HashMap parameters = new HashMap();

	// ----------------------------------------------------------- Constructors
	public MockServletConfig() {
		super();
	}

	public MockServletConfig(ServletContext context) {
		super();
		setServletContext(context);
	}

	// --------------------------------------------------------- Public Methods
	public void addInitParameter(String name, String value) {
		parameters.put(name, value);
	}

	public void setServletContext(ServletContext context) {
		this.context = context;
	}

	// ------------------------------------------------- ServletContext Methods
	public String getInitParameter(String name) {
		return ((String) parameters.get(name));
	}

	public Enumeration getInitParameterNames() {
		return (new MockEnumeration(parameters.keySet().iterator()));
	}

	public ServletContext getServletContext() {
		return (this.context);
	}

	public String getServletName() {
		return ("action");
	}
}
