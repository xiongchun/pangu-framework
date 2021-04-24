package org.g4studio.core.mvc.xstruts.chain.commands;

import org.g4studio.core.mvc.xstruts.chain.contexts.ActionContext;
import org.g4studio.core.mvc.xstruts.config.ModuleConfig;

/**
 * <p>
 * Check to see if the content type is set, and if so, set it for this response.
 * </p>
 * 
 * @version $Rev: 421119 $ $Date: 2005-11-12 13:01:44 -0500 (Sat, 12 Nov 2005) $
 */
public abstract class AbstractSetContentType extends ActionCommandBase {
	// ---------------------------------------------------------- Public Methods

	/**
	 * <p>
	 * Check to see if the content type is set, and if so, set it for this
	 * response.
	 * </p>
	 * 
	 * @param actionCtx
	 *            The <code>Context</code> for the current request
	 * @return <code>false</code> so that processing continues
	 * @throws Exception
	 *             if thrown by the Action class
	 */
	public boolean execute(ActionContext actionCtx) throws Exception {
		// Retrieve the ModuleConfig instance
		ModuleConfig moduleConfig = actionCtx.getModuleConfig();

		// If the content type is configured, set it for the response
		String contentType = moduleConfig.getControllerConfig().getContentType();

		if (contentType != null) {
			setContentType(actionCtx, contentType);
		}

		return (false);
	}

	// ------------------------------------------------------- Protected Methods

	/**
	 * <p>
	 * Request no cache flags are set.
	 * </p>
	 * 
	 * @param context
	 *            The <code>Context</code> for this request
	 * @param contentType
	 *            The content type for the response
	 */
	protected abstract void setContentType(ActionContext context, String contentType);
}
