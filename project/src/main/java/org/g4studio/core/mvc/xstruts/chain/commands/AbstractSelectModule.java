package org.g4studio.core.mvc.xstruts.chain.commands;

import org.g4studio.core.mvc.xstruts.Globals;
import org.g4studio.core.mvc.xstruts.chain.contexts.ActionContext;
import org.g4studio.core.mvc.xstruts.config.ModuleConfig;
import org.g4studio.core.mvc.xstruts.util.MessageResources;

/**
 * <p>
 * Cache the <code>ModuleConfig</code> and <code>MessageResources</code>
 * instances for the sub-application module to be used for processing this
 * request.
 * </p>
 * 
 * @version $Rev: 421119 $ $Date: 2005-11-12 13:01:44 -0500 (Sat, 12 Nov 2005) $
 */
public abstract class AbstractSelectModule extends ActionCommandBase {
	// ------------------------------------------------------ Instance Variables
	// ---------------------------------------------------------- Public Methods

	/**
	 * <p>
	 * Cache the <code>ModuleConfig</code> and <code>MessageResources</code>
	 * instances for the sub-application module to be used for processing this
	 * request.
	 * </p>
	 * 
	 * @param actionCtx
	 *            The <code>Context</code> for the current request
	 * @return <code>false</code> so that processing continues
	 * @throws IllegalArgumentException
	 *             if no valid ModuleConfig or MessageResources can be
	 *             identified for this request
	 * @throws Exception
	 *             if thrown by the Action class
	 */
	public boolean execute(ActionContext actionCtx) throws Exception {
		String prefix = getPrefix(actionCtx);

		// Cache the corresponding ModuleConfig and MessageResources instances
		ModuleConfig moduleConfig = (ModuleConfig) actionCtx.getApplicationScope().get(Globals.MODULE_KEY + prefix);

		if (moduleConfig == null) {
			throw new IllegalArgumentException("No module config for prefix '" + prefix + "'");
		}

		actionCtx.setModuleConfig(moduleConfig);

		String key = Globals.MESSAGES_KEY + prefix;
		MessageResources messageResources = (MessageResources) actionCtx.getApplicationScope().get(key);

		if (messageResources == null) {
			throw new IllegalArgumentException("No message resources found in application scope under " + key);
		}

		actionCtx.setMessageResources(messageResources);

		return (false);
	}

	// ------------------------------------------------------- Protected Methods

	/**
	 * <p>
	 * Calculate and return the module prefix for the module to be selected for
	 * this request.
	 * </p>
	 * 
	 * @param context
	 *            The <code>Context</code> for this request
	 * @return Module prefix to be used with this request
	 * @throws IllegalArgumentException
	 *             if no valid ModuleConfig or MessageResources can be
	 *             identified for this request
	 */
	protected abstract String getPrefix(ActionContext context);
}
