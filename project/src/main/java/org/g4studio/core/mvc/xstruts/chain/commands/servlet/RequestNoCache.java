package org.g4studio.core.mvc.xstruts.chain.commands.servlet;

import javax.servlet.http.HttpServletResponse;

import org.g4studio.core.mvc.xstruts.chain.commands.AbstractRequestNoCache;
import org.g4studio.core.mvc.xstruts.chain.contexts.ActionContext;
import org.g4studio.core.mvc.xstruts.chain.contexts.ServletActionContext;

/**
 * <p>
 * Check to see if the controller is configured to prevent caching, and if so,
 * set the no cache HTTP response headers.
 * </p>
 * 
 * @version $Rev: 421119 $ $Date: 2005-05-07 12:11:38 -0400 (Sat, 07 May 2005) $
 */
public class RequestNoCache extends AbstractRequestNoCache {
	// ------------------------------------------------------- Protected Methods
	protected void requestNoCache(ActionContext context) {
		ServletActionContext sacontext = (ServletActionContext) context;
		HttpServletResponse response = sacontext.getResponse();

		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache,no-store,max-age=0");
		response.setDateHeader("Expires", 1);
	}
}
