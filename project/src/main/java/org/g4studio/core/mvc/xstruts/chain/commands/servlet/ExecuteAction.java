package org.g4studio.core.mvc.xstruts.chain.commands.servlet;

import org.g4studio.core.mvc.xstruts.action.Action;
import org.g4studio.core.mvc.xstruts.action.ActionForm;
import org.g4studio.core.mvc.xstruts.action.ActionMapping;
import org.g4studio.core.mvc.xstruts.chain.commands.AbstractExecuteAction;
import org.g4studio.core.mvc.xstruts.chain.contexts.ActionContext;
import org.g4studio.core.mvc.xstruts.chain.contexts.ServletActionContext;
import org.g4studio.core.mvc.xstruts.config.ActionConfig;
import org.g4studio.core.mvc.xstruts.config.ForwardConfig;

/**
 * <p>
 * Invoke the appropriate <code>Action</code> for this request, and cache the
 * returned <code>ActionForward</code>.
 * </p>
 * 
 * @version $Rev: 421119 $ $Date: 2005-05-07 12:11:38 -0400 (Sat, 07 May 2005) $
 */
public class ExecuteAction extends AbstractExecuteAction {
	// ------------------------------------------------------- Protected Methods

	/**
	 * <p>
	 * Execute the specified <code>Action</code>, and return the resulting
	 * <code>ActionForward</code>.
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
	 * @throws Exception
	 *             if thrown by the <code>Action</code>
	 */
	protected ForwardConfig execute(ActionContext context, Action action, ActionConfig actionConfig,
			ActionForm actionForm) throws Exception {
		ServletActionContext saContext = (ServletActionContext) context;

		return (action.execute((ActionMapping) actionConfig, actionForm, saContext.getRequest(),
				saContext.getResponse()));
	}
}
