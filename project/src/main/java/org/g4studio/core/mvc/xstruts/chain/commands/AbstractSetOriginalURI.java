package org.g4studio.core.mvc.xstruts.chain.commands;

import org.g4studio.core.mvc.xstruts.Globals;
import org.g4studio.core.mvc.xstruts.chain.contexts.ActionContext;

/**
 * <p>
 * Check to original uri is set, and if not, set it for this request.
 * </p>
 * 
 * @version $Rev: 421119 $ $Date: 2005-06-04 07:58:46 -0700 (Sat, 04 Jun 2005) $
 */
public abstract class AbstractSetOriginalURI extends ActionCommandBase {
	// ---------------------------------------------------------- Public Methods

	/**
	 * <p>
	 * Check to original uri is set, and if not, set it for this request.
	 * </p>
	 * 
	 * @param actionCtx
	 *            The <code>Context</code> for the current request
	 * @return <code>false</code> so that processing continues
	 * @throws Exception
	 *             if thrown by the Action class
	 */
	public boolean execute(ActionContext actionCtx) throws Exception {
		// Set the original uri if not already set
		if (!actionCtx.getRequestScope().containsKey(Globals.ORIGINAL_URI_KEY)) {
			setOriginalURI(actionCtx);
		}

		return (false);
	}

	// ------------------------------------------------------- Protected Methods

	/**
	 * <p>
	 * Set the original uri.
	 * </p>
	 * 
	 * @param context
	 *            The <code>Context</code> for this request
	 */
	protected abstract void setOriginalURI(ActionContext context);
}
