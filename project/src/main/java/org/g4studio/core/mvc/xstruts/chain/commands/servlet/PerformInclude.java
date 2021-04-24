package org.g4studio.core.mvc.xstruts.chain.commands.servlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.g4studio.core.mvc.xstruts.chain.commands.AbstractPerformInclude;
import org.g4studio.core.mvc.xstruts.chain.contexts.ActionContext;
import org.g4studio.core.mvc.xstruts.chain.contexts.ServletActionContext;

/**
 * <p>
 * Perform forwarding or redirection based on the specified include uri (if
 * any).
 * </p>
 * 
 * @version $Rev: 421119 $ $Date: 2005-11-09 00:11:45 -0500 (Wed, 09 Nov 2005) $
 */
public class PerformInclude extends AbstractPerformInclude {
	// ------------------------------------------------------- Protected Methods

	/**
	 * <p>
	 * Perform the appropriate processing on the specified include uri.
	 * </p>
	 * 
	 * @param context
	 *            The context for this request
	 * @param uri
	 *            The uri to be included
	 */
	protected void perform(ActionContext context, String uri) throws Exception {
		ServletActionContext swcontext = (ServletActionContext) context;

		HttpServletRequest request = swcontext.getRequest();

		RequestDispatcher rd = swcontext.getContext().getRequestDispatcher(uri);

		rd.forward(request, swcontext.getResponse());
	}
}
