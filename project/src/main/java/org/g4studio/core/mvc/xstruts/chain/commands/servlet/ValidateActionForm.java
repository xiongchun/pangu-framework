package org.g4studio.core.mvc.xstruts.chain.commands.servlet;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.g4studio.core.mvc.xstruts.action.ActionErrors;
import org.g4studio.core.mvc.xstruts.action.ActionForm;
import org.g4studio.core.mvc.xstruts.action.ActionMapping;
import org.g4studio.core.mvc.xstruts.chain.commands.AbstractValidateActionForm;
import org.g4studio.core.mvc.xstruts.chain.contexts.ActionContext;
import org.g4studio.core.mvc.xstruts.chain.contexts.ServletActionContext;
import org.g4studio.core.mvc.xstruts.config.ActionConfig;

/**
 * <p>
 * Validate the properties of the form bean for this request. If there are any
 * validation errors, execute the child commands in our chain; otherwise,
 * proceed normally. Also, if any errors are found and the request is a
 * multipart request, rollback the <code>MultipartRequestHandler</code>.
 * </p>
 * 
 * @version $Rev: 421119 $ $Date: 2005-06-04 10:58:46 -0400 (Sat, 04 Jun 2005) $
 */
public class ValidateActionForm extends AbstractValidateActionForm {
	// ------------------------------------------------------ Instance Variables
	private static final Log log = LogFactory.getLog(ValidateActionForm.class);

	// ------------------------------------------------------- Protected Methods

	/**
	 * <p>
	 * Call the <code>validate()</code> method of the specified form bean, and
	 * return the resulting <code>ActionErrors</code> object.
	 * </p>
	 * 
	 * @param context
	 *            The context for this request
	 * @param actionForm
	 *            The form bean for this request
	 */
	protected ActionErrors validate(ActionContext context, ActionConfig actionConfig, ActionForm actionForm) {
		ServletActionContext saContext = (ServletActionContext) context;
		ActionErrors errors = (actionForm.validate((ActionMapping) actionConfig, saContext.getRequest()));

		// Special handling for multipart request
		if ((errors != null) && !errors.isEmpty()) {
			if (actionForm.getMultipartRequestHandler() != null) {
				if (log.isTraceEnabled()) {
					log.trace("  Rolling back multipart request");
				}

				actionForm.getMultipartRequestHandler().rollback();
			}
		}

		return errors;
	}
}
