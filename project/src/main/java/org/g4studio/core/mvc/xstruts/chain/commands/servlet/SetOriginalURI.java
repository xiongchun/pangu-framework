package org.g4studio.core.mvc.xstruts.chain.commands.servlet;

import javax.servlet.http.HttpServletRequest;

import org.g4studio.core.mvc.xstruts.Globals;
import org.g4studio.core.mvc.xstruts.chain.commands.AbstractSetOriginalURI;
import org.g4studio.core.mvc.xstruts.chain.contexts.ActionContext;
import org.g4studio.core.mvc.xstruts.chain.contexts.ServletActionContext;

/**
 * <p>
 * Set the servlet path.
 * </p>
 * 
 * @version $Rev: 421119 $ $Date: 2005-06-04 07:58:46 -0700 (Sat, 04 Jun 2005) $
 */
public class SetOriginalURI extends AbstractSetOriginalURI {
	// ------------------------------------------------------- Protected Methods
	protected void setOriginalURI(ActionContext context) {
		ServletActionContext swcontext = (ServletActionContext) context;
		HttpServletRequest request = swcontext.getRequest();

		request.setAttribute(Globals.ORIGINAL_URI_KEY, request.getServletPath());
	}
}
