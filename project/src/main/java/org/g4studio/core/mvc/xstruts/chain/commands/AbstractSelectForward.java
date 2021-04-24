package org.g4studio.core.mvc.xstruts.chain.commands;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.g4studio.core.mvc.xstruts.chain.contexts.ActionContext;
import org.g4studio.core.mvc.xstruts.config.ActionConfig;
import org.g4studio.core.mvc.xstruts.config.ForwardConfig;
import org.g4studio.core.mvc.xstruts.config.ModuleConfig;

/**
 * <p>
 * Select and cache the <code>ActionForward</code> for this
 * <code>ActionConfig</code> if specified.
 * </p>
 * 
 * @version $Rev: 421119 $ $Date: 2005-06-04 10:58:46 -0400 (Sat, 04 Jun 2005) $
 */
public abstract class AbstractSelectForward extends ActionCommandBase {
	// ------------------------------------------------------ Instance Variables

	/**
	 * <p>
	 * Provide Commons Logging instance for this class.
	 * </p>
	 */
	private static final Log LOG = LogFactory.getLog(AbstractSelectForward.class);

	// ---------------------------------------------------------- Public Methods

	/**
	 * <p>
	 * Select and cache the <code>ActionForward</code> for this
	 * <code>ActionConfig</code> if specified.
	 * </p>
	 * 
	 * @param actionCtx
	 *            The <code>Context</code> for the current request
	 * @return <code>false</code> so that processing continues
	 * @throws Exception
	 *             if thrown by the Action class
	 */
	public boolean execute(ActionContext actionCtx) throws Exception {
		// Skip processing if the current request is not valid
		Boolean valid = actionCtx.getFormValid();

		if ((valid == null) || !valid.booleanValue()) {
			return (false);
		}

		// Acquire configuration objects that we need
		ActionConfig actionConfig = actionCtx.getActionConfig();
		ModuleConfig moduleConfig = actionConfig.getModuleConfig();

		ForwardConfig forwardConfig = null;
		String forward = actionConfig.getForward();

		if (forward != null) {
			forwardConfig = forward(actionCtx, moduleConfig, forward);

			if (LOG.isDebugEnabled()) {
				LOG.debug("Forwarding to " + forwardConfig);
			}

			actionCtx.setForwardConfig(forwardConfig);
		}

		return (false);
	}

	// ------------------------------------------------------- Protected Methods

	/**
	 * <p>
	 * Create and return a <code>ForwardConfig</code> representing the specified
	 * module-relative destination.
	 * </p>
	 * 
	 * @param context
	 *            The context for this request
	 * @param moduleConfig
	 *            The <code>ModuleConfig</code> for this request
	 * @param uri
	 *            The module-relative URI to be the destination
	 * @return ForwwardConfig representing the destination
	 */
	protected abstract ForwardConfig forward(ActionContext context, ModuleConfig moduleConfig, String uri);
}
