package org.g4studio.core.mvc.xstruts.chain.commands;

import org.g4studio.core.mvc.xstruts.chain.contexts.ActionContext;
import org.g4studio.core.mvc.xstruts.config.ModuleConfig;

/**
 * <p>
 * Check to see if the controller is configured to prevent caching, and if so,
 * request no cache flags to be set.
 * </p>
 * 
 * @version $Rev: 421119 $ $Date: 2005-06-04 10:58:46 -0400 (Sat, 04 Jun 2005) $
 */
public abstract class AbstractRequestNoCache extends ActionCommandBase {
	// ---------------------------------------------------------- Public Methods

	/**
	 * <p>
	 * Check to see if the controller is configured to prevent caching, and if
	 * so, request no cache flags to be set.
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

		// If the module is configured for no caching, request no caching
		if (moduleConfig.getControllerConfig().getNocache()) {
			requestNoCache(actionCtx);
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
	 */
	protected abstract void requestNoCache(ActionContext context);
}
