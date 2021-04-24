package org.g4studio.core.mvc.xstruts.chain.commands;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.g4studio.core.mvc.xstruts.action.Action;
import org.g4studio.core.mvc.xstruts.chain.contexts.ActionContext;
import org.g4studio.core.mvc.xstruts.config.ActionConfig;

/**
 * <p>
 * Create (if necessary) and cache an <code>Action</code> for this request.
 * </p>
 * 
 * @version $Rev: 421119 $ $Date: 2005-11-12 13:01:44 -0500 (Sat, 12 Nov 2005) $
 */
public abstract class AbstractCreateAction extends ActionCommandBase {
	// ------------------------------------------------------ Instance Variables

	/**
	 * Provide a Commons logging instance for this class.
	 */
	private static final Log LOG = LogFactory.getLog(AbstractCreateAction.class);

	// ---------------------------------------------------------- Public Methods

	/**
	 * <p>
	 * Create (if necessary) and cache an <code>Action</code> for this request.
	 * </p>
	 * 
	 * @param actionCtx
	 *            The <code>Context</code> for the current request
	 * @return <code>false</code> so that processing continues
	 * @throws Exception
	 *             if there are any problems instantiating the Action class.
	 */
	public boolean execute(ActionContext actionCtx) throws Exception {
		// Skip processing if the current request is not valid
		Boolean valid = actionCtx.getFormValid();

		if ((valid == null) || !valid.booleanValue()) {
			LOG.trace("Invalid form; not going to execute.");

			return (false);
		}

		// Check to see if an action has already been created
		if (actionCtx.getAction() != null) {
			LOG.trace("already have an action [" + actionCtx.getAction() + "]");

			return (false);
		}

		// Look up the class name for the desired Action
		ActionConfig actionConfig = actionCtx.getActionConfig();
		String type = actionConfig.getType();

		if (type == null) {
			LOG.trace("no type for " + actionConfig.getPath());

			return (false);
		}

		// Create (if necessary) and cache an Action instance
		Action action = getAction(actionCtx, type, actionConfig);

		if (LOG.isTraceEnabled()) {
			LOG.trace("setting action to " + action);
		}

		actionCtx.setAction(action);

		return (false);
	}

	// ------------------------------------------------------- Protected Methods

	protected abstract Action getAction(ActionContext context, String type, ActionConfig actionConfig) throws Exception;
}
