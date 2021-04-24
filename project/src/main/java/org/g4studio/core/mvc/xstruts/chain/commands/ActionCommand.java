package org.g4studio.core.mvc.xstruts.chain.commands;

import org.apache.commons.chain.Command;
import org.g4studio.core.mvc.xstruts.chain.contexts.ActionContext;

/**
 * <p>
 * Marks a commons-chain <code>Command</code> which expects to operate upon a
 * Struts <code>ActionContext</code>.
 * </p>
 */
public interface ActionCommand extends Command {
	/**
	 * @param actionContext
	 *            The <code>Context</code> for the current request
	 * @return TRUE if processing should halt
	 * @throws Exception
	 *             On any error
	 */
	boolean execute(ActionContext actionContext) throws Exception;
}
