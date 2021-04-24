package org.g4studio.core.mvc.xstruts.chain.commands;

import org.g4studio.core.mvc.xstruts.action.Action;
import org.g4studio.core.mvc.xstruts.action.ActionForm;
import org.g4studio.core.mvc.xstruts.chain.contexts.ActionContext;
import org.g4studio.core.mvc.xstruts.config.ActionConfig;
import org.g4studio.core.mvc.xstruts.config.ForwardConfig;

/**
 * <p>
 * Invoke the appropriate <code>Action</code> for this request, and cache the
 * returned <code>ActionForward</code>.
 * </p>
 * 
 * @version $Rev: 421119 $ $Date: 2005-06-04 10:58:46 -0400 (Sat, 04 Jun 2005) $
 */
public abstract class AbstractExecuteAction extends ActionCommandBase {
	// ---------------------------------------------------------- Public Methods

	/**
	 * <p>
	 * Invoke the appropriate <code>Action</code> for this request, and cache
	 * the returned <code>ActionForward</code>.
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

		// Acquire the resources we will need to send to the Action
		Action action = actionCtx.getAction();

		if (action == null) {
			return (false);
		}

		ActionConfig actionConfig = actionCtx.getActionConfig();
		ActionForm actionForm = actionCtx.getActionForm();

		// Execute the Action for this request, caching returned ActionForward
		ForwardConfig forwardConfig = execute(actionCtx, action, actionConfig, actionForm);

		actionCtx.setForwardConfig(forwardConfig);

		return (false);
	}

	// ------------------------------------------------------- Protected Methods

	/**
	 * <p>
	 * Execute the specified <code>Action</code>, and return the resulting
	 * <code>ForwardConfig</code>.
	 * </p>
	 * 
	 * @param context
	 *            The <code>Context</code> for this request
	 * @param action
	 *            The <code>Action</code> to be executed
	 * @param actionConfig
	 *            The <code>ActionConfig</code> defining this action
	 * @param actionForm
	 *            The <code>ActionForm</code> (if any) for this action
	 * @return ForwardConfig The next location, or null
	 * @throws Exception
	 *             if thrown by the <code>Action</code>
	 */
	protected abstract ForwardConfig execute(ActionContext context, Action action, ActionConfig actionConfig,
			ActionForm actionForm) throws Exception;
}
