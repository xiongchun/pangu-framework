package org.g4studio.core.mvc.xstruts.chain.commands;

import org.g4studio.core.mvc.xstruts.chain.contexts.ActionContext;
import org.g4studio.core.mvc.xstruts.config.ActionConfig;
import org.g4studio.core.mvc.xstruts.config.ModuleConfig;

/**
 * <p>
 * Cache the <code>ActionConfig</code> instance for the action to be used for
 * processing this request.
 * </p>
 * 
 * @version $Rev: 421119 $ $Date: 2005-11-05 21:44:59 -0500 (Sat, 05 Nov 2005) $
 */
public abstract class AbstractSelectAction extends ActionCommandBase {
	// ---------------------------------------------------------- Public Methods

	/**
	 * <p>
	 * Cache the <code>ActionConfig</code> instance for the action to be used
	 * for processing this request.
	 * </p>
	 * 
	 * @param actionCtx
	 *            The <code>Context</code> for the current request
	 * @return <code>false</code> so that processing continues
	 * @throws InvalidPathException
	 *             if no valid action can be identified for this request
	 * @throws Exception
	 *             if thrown by the Action class
	 */
	public boolean execute(ActionContext actionCtx) throws Exception {
		// Identify the matching path for this request
		String path = getPath(actionCtx);

		// Cache the corresponding ActonConfig instance
		ModuleConfig moduleConfig = actionCtx.getModuleConfig();
		ActionConfig actionConfig = moduleConfig.findActionConfig(path);

		if (actionConfig == null) {
			// NOTE Shouldn't this be the responsibility of ModuleConfig?
			// Locate the mapping for unknown paths (if any)
			ActionConfig[] configs = moduleConfig.findActionConfigs();

			for (int i = 0; i < configs.length; i++) {
				if (configs[i].getUnknown()) {
					actionConfig = configs[i];

					break;
				}
			}
		}

		if (actionConfig == null) {
			throw new InvalidPathException("No action config found for the specified url.", path);
		}

		actionCtx.setActionConfig(actionConfig);

		return (false);
	}

	// ------------------------------------------------------- Protected Methods

	/**
	 * <p>
	 * Return the path to be used to select the <code>ActionConfig</code> for
	 * this request.
	 * </p>
	 * 
	 * @param context
	 *            The <code>Context</code> for this request
	 * @return Path to be used to select the ActionConfig
	 */
	protected abstract String getPath(ActionContext context);
}
