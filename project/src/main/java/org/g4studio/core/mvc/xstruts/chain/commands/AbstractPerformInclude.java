package org.g4studio.core.mvc.xstruts.chain.commands;

import org.g4studio.core.mvc.xstruts.chain.contexts.ActionContext;
import org.g4studio.core.mvc.xstruts.config.ModuleConfig;

/**
 * <p>
 * Perform forwarding or redirection based on the specified <code>String</code>
 * (if any).
 * </p>
 * 
 * @version $Rev: 421119 $ $Date: 2005-06-04 10:58:46 -0400 (Sat, 04 Jun 2005) $
 */
public abstract class AbstractPerformInclude extends ActionCommandBase {
	// ---------------------------------------------------------- Public Methods

	/**
	 * <p>
	 * Perform an include based on the specified include uri (if any).
	 * </p>
	 * 
	 * @param actionCtx
	 *            The <code>Context</code> for the current request
	 * @return <code>true</code> so that processing completes
	 * @throws Exception
	 *             if thrown by the <code>Action</code>
	 */
	public boolean execute(ActionContext actionCtx) throws Exception {
		ModuleConfig moduleConfig = actionCtx.getModuleConfig();

		// Is there an include to be performed?
		String include = actionCtx.getInclude();

		if (include == null) {
			return (false);
		}

		// Determine the currect uri
		String uri = moduleConfig.getPrefix() + include;

		// Perform the appropriate processing on this include uri
		perform(actionCtx, uri);

		return (true);
	}

	// ------------------------------------------------------- Protected Methods

	/**
	 * <p>
	 * Perform the appropriate processing on the specified include uri.
	 * </p>
	 * 
	 * @param context
	 *            The context for this request
	 * @param include
	 *            The forward to be performed
	 * @throws Exception
	 *             if thrown by the <code>Action</code>
	 */
	protected abstract void perform(ActionContext context, String include) throws Exception;
}
