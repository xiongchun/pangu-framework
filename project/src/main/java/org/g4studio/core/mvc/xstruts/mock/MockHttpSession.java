package org.g4studio.core.mvc.xstruts.mock;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;

import java.util.Enumeration;
import java.util.HashMap;

/**
 * <p>
 * Mock <strong>HttpSession</strong> object for low-level unit tests of Struts
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
public class MockHttpSession implements HttpSession {
	// ----------------------------------------------------- Instance Variables

	/**
	 * <p>
	 * The set of session attributes.
	 * </p>
	 */
	protected HashMap attributes = new HashMap();

	/**
	 * <p>
	 * The ServletContext with which we are associated.
	 * </p>
	 */
	protected ServletContext servletContext = null;

	// ----------------------------------------------------------- Constructors
	public MockHttpSession() {
		super();
	}

	public MockHttpSession(ServletContext servletContext) {
		super();
		setServletContext(servletContext);
	}

	// --------------------------------------------------------- Public Methods
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}

	// ---------------------------------------------------- HttpSession Methods
	public Object getAttribute(String name) {
		return (attributes.get(name));
	}

	public Enumeration getAttributeNames() {
		return (new MockEnumeration(attributes.keySet().iterator()));
	}

	public long getCreationTime() {
		throw new UnsupportedOperationException();
	}

	public String getId() {
		throw new UnsupportedOperationException();
	}

	public long getLastAccessedTime() {
		throw new UnsupportedOperationException();
	}

	public int getMaxInactiveInterval() {
		throw new UnsupportedOperationException();
	}

	public ServletContext getServletContext() {
		return (this.servletContext);
	}

	public HttpSessionContext getSessionContext() {
		throw new UnsupportedOperationException();
	}

	public Object getValue(String name) {
		throw new UnsupportedOperationException();
	}

	public String[] getValueNames() {
		throw new UnsupportedOperationException();
	}

	public void invalidate() {
		throw new UnsupportedOperationException();
	}

	public boolean isNew() {
		throw new UnsupportedOperationException();
	}

	public void putValue(String name, Object value) {
		throw new UnsupportedOperationException();
	}

	public void removeAttribute(String name) {
		attributes.remove(name);
	}

	public void removeValue(String name) {
		throw new UnsupportedOperationException();
	}

	public void setAttribute(String name, Object value) {
		if (value == null) {
			attributes.remove(name);
		} else {
			attributes.put(name, value);
		}
	}

	public void setMaxInactiveInterval(int interval) {
		throw new UnsupportedOperationException();
	}
}
