package org.g4studio.core.mvc.xstruts.chain.commands.servlet;

import javax.servlet.http.HttpServletRequest;

import org.g4studio.core.mvc.xstruts.chain.Constants;
import org.g4studio.core.mvc.xstruts.chain.commands.AbstractSelectAction;
import org.g4studio.core.mvc.xstruts.chain.contexts.ActionContext;
import org.g4studio.core.mvc.xstruts.chain.contexts.ServletActionContext;
import org.g4studio.core.mvc.xstruts.config.ModuleConfig;

/**
 * <p>
 * Cache the <code>ActionConfig</code> instance for the action to be used for
 * processing this request.
 * </p>
 * 
 * @version $Rev: 421119 $ $Date: 2005-05-07 12:11:38 -0400 (Sat, 07 May 2005) $
 */
public class SelectAction extends AbstractSelectAction {
	// ------------------------------------------------------- Protected Methods
	protected String getPath(ActionContext context) {
		ServletActionContext saContext = (ServletActionContext) context;
		HttpServletRequest request = saContext.getRequest();
		String path = null;
		boolean extension = false;

		// For prefix matching, match on the path info
		path = (String) request.getAttribute(Constants.INCLUDE_PATH_INFO);

		if (path == null) {
			path = request.getPathInfo();
		}

		// For extension matching, match on the servlet path
		if (path == null) {
			path = (String) request.getAttribute(Constants.INCLUDE_SERVLET_PATH);

			if (path == null) {
				path = request.getServletPath();
			}

			if (path == null) {
				throw new IllegalArgumentException("No path information in request");
			}

			extension = true;
		}

		// Strip the module prefix and extension (if any)
		ModuleConfig moduleConfig = saContext.getModuleConfig();
		String prefix = moduleConfig.getPrefix();

		if (!path.startsWith(prefix)) {
			throw new IllegalArgumentException("Path does not start with '" + prefix + "'");
		}

		path = path.substring(prefix.length());

		if (extension) {
			int slash = path.lastIndexOf("/");
			int period = path.lastIndexOf(".");

			if ((period >= 0) && (period > slash)) {
				path = path.substring(0, period);
			}
		}

		return (path);
	}
}
