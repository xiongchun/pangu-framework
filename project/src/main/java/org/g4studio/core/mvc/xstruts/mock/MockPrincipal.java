package org.g4studio.core.mvc.xstruts.mock;

import java.security.Principal;

/**
 * <p>
 * Mock <strong>Principal</strong> object for low-level unit tests of Struts
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
public class MockPrincipal implements Principal {
	protected String name = null;
	protected String[] roles = null;

	public MockPrincipal() {
		super();
		this.name = "";
		this.roles = new String[0];
	}

	public MockPrincipal(String name) {
		super();
		this.name = name;
		this.roles = new String[0];
	}

	public MockPrincipal(String name, String[] roles) {
		super();
		this.name = name;
		this.roles = roles;
	}

	public String getName() {
		return (this.name);
	}

	public boolean isUserInRole(String role) {
		for (int i = 0; i < roles.length; i++) {
			if (role.equals(roles[i])) {
				return (true);
			}
		}

		return (false);
	}

	public boolean equals(Object o) {
		if (o == null) {
			return (false);
		}

		if (!(o instanceof Principal)) {
			return (false);
		}

		Principal p = (Principal) o;

		if (name == null) {
			return (p.getName() == null);
		} else {
			return (name.equals(p.getName()));
		}
	}

	public int hashCode() {
		if (name == null) {
			return ("".hashCode());
		} else {
			return (name.hashCode());
		}
	}
}
