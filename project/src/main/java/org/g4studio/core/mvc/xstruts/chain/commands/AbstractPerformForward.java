package org.g4studio.core.mvc.xstruts.chain.commands;

import org.g4studio.core.mvc.xstruts.chain.contexts.ActionContext;
import org.g4studio.core.mvc.xstruts.config.ForwardConfig;

/**
 * <p>
 * Perform forwarding or redirection based on the specified
 * <code>ForwardConfig</code> (if any).
 * </p>
 * 
 * @version $Rev: 421119 $ $Date: 2005-06-04 10:58:46 -0400 (Sat, 04 Jun 2005) $
 */
public abstract class AbstractPerformForward extends ActionCommandBase {
	// ---------------------------------------------------------- Public Methods

	/**
	 * <p>
	 * Perform forwarding or redirection based on the specified
	 * <code>ActionForward</code> (if any).
	 * </p>
	 * 
	 * @param actionCtx
	 *            The <code>Context</code> for the current request
	 * @return <code>true</code> so that processing completes
	 * @throws Exception
	 *             if thrown by the <code>Action</code>
	 */
	public boolean execute(ActionContext actionCtx) throws Exception {
		// Is there a ForwardConfig to be performed?
		ForwardConfig forwardConfig = actionCtx.getForwardConfig();

		if (forwardConfig == null) {
			return (false);
		}

		// Perform the appropriate processing on this ActionForward
		perform(actionCtx, forwardConfig);

		return (true);
	}

	// ------------------------------------------------------- Protected Methods

	/**
	 * <p>
	 * Perform the appropriate processing on the specified
	 * <code>ForwardConfig</code>.
	 * </p>
	 * 
	 * @param context
	 *            The context for this request
	 * @param forwardConfig
	 *            The forward to be performed
	 * @throws Exception
	 *             if thrown by the <code>Action</code>
	 */
	protected abstract void perform(ActionContext context, ForwardConfig forwardConfig) throws Exception;
}
