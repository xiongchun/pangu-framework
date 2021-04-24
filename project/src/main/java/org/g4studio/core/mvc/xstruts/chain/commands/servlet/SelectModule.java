package org.g4studio.core.mvc.xstruts.chain.commands.servlet;

import javax.servlet.http.HttpServletRequest;

import org.g4studio.core.mvc.xstruts.Globals;
import org.g4studio.core.mvc.xstruts.chain.Constants;
import org.g4studio.core.mvc.xstruts.chain.commands.AbstractSelectModule;
import org.g4studio.core.mvc.xstruts.chain.contexts.ActionContext;
import org.g4studio.core.mvc.xstruts.chain.contexts.ServletActionContext;

/**
 * <p>
 * Cache the <code>ModuleConfig</code> and <code>MessageResources</code>
 * instances for the sub-application module to be used for processing this
 * request.
 * </p>
 * 
 * @version $Rev: 421119 $ $Date: 2005-06-04 10:58:46 -0400 (Sat, 04 Jun 2005) $
 */
public class SelectModule extends AbstractSelectModule {
	// ------------------------------------------------------- Protected Methods
	protected String getPrefix(ActionContext context) {
		// Identify the URI from which we will match a module prefix
		ServletActionContext sacontext = (ServletActionContext) context;
		HttpServletRequest request = sacontext.getRequest();
		String uri = (String) request.getAttribute(Constants.INCLUDE_SERVLET_PATH);

		if (uri == null) {
			uri = request.getServletPath();
		}

		if (uri == null) {
			throw new IllegalArgumentException("No path information in request");
		}

		// Identify the module prefix for the current module
		String prefix = ""; // Initialize to default prefix
		String[] prefixes = (String[]) sacontext.getApplicationScope().get(Globals.MODULE_PREFIXES_KEY);
		int lastSlash = 0;

		while (prefix.equals("") && ((lastSlash = uri.lastIndexOf("/")) > 0)) {
			uri = uri.substring(0, lastSlash);

			for (int i = 0; i < prefixes.length; i++) {
				if (uri.equals(prefixes[i])) {
					prefix = prefixes[i];

					break;
				}
			}
		}

		return (prefix);
	}
}
