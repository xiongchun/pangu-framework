package org.g4studio.core.mvc.xstruts.chain.contexts;

import java.util.HashMap;
import java.util.Map;

//  ISSUE: Are there any useful "assert" type methods we could add to this?

/**
 * <p>
 * Implement <code>ActionContext</code> with empty maps for
 * <code>applicationScope</code>, <code>sessionScope</code>,
 * <code>requestScope</code>, and <code>parameterMap</code> properties.
 * </p>
 */
public class MockActionContext extends ActionContextBase {
	private Map applicationScope = new HashMap();
	private Map requestScope = new HashMap();
	private Map sessionScope = new HashMap();
	private Map parameterMap = new HashMap();

	public Map getApplicationScope() {
		return applicationScope;
	}

	public void setApplicationScope(Map applicationScope) {
		this.applicationScope = applicationScope;
	}

	public Map getParameterMap() {
		return parameterMap;
	}

	public void setParameterMap(Map parameterMap) {
		this.parameterMap = parameterMap;
	}

	public Map getRequestScope() {
		return requestScope;
	}

	public void setRequestScope(Map requestScope) {
		this.requestScope = requestScope;
	}

	public Map getSessionScope() {
		return sessionScope;
	}

	public void setSessionScope(Map sessionScope) {
		this.sessionScope = sessionScope;
	}
}
