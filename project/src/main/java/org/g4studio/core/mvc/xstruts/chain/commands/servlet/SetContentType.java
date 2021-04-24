package org.g4studio.core.mvc.xstruts.chain.commands.servlet;

import javax.servlet.http.HttpServletResponse;

import org.g4studio.core.mvc.xstruts.chain.commands.AbstractSetContentType;
import org.g4studio.core.mvc.xstruts.chain.contexts.ActionContext;
import org.g4studio.core.mvc.xstruts.chain.contexts.ServletActionContext;

/**
 * <p>
 * Check to see if the content type is set, and if so, set it for this response.
 * </p>
 * 
 * @version $Rev: 421119 $ $Date: 2005-06-04 10:58:46 -0400 (Sat, 04 Jun 2005) $
 */
public class SetContentType extends AbstractSetContentType {
	// ------------------------------------------------------- Protected Methods
	protected void setContentType(ActionContext context, String contentType) {
		ServletActionContext swcontext = (ServletActionContext) context;
		HttpServletResponse response = swcontext.getResponse();

		response.setContentType(contentType);
	}
}
