package org.g4studio.core.mvc.xstruts.chain.commands;

import org.apache.commons.chain.Command;
import org.g4studio.core.mvc.xstruts.chain.contexts.ActionContext;
import org.g4studio.core.mvc.xstruts.config.ForwardConfig;

/**
 * <p>
 * Look up and execute a commons-chain <code>Command</code> based on properties
 * of the ActionContext's <code>forwardConfig</code> property.
 * </p>
 */
public class ExecuteForwardCommand extends ExecuteCommand {
	/**
	 * <p>
	 * Return the command specified by the <code>command</code> and
	 * <code>catalog</code> properties of the <code>forwardConfig</code>
	 * property of the given <code>ActionContext</code>. If
	 * <code>forwardConfig</code> is null, return null.
	 * </p>
	 * 
	 * @param context
	 *            Our ActionContext
	 * @return Command to execute or null
	 */
	protected Command getCommand(ActionContext context) {
		ForwardConfig forwardConfig = context.getForwardConfig();

		if (forwardConfig == null) {
			return null;
		}

		return getCommand(forwardConfig.getCommand(), forwardConfig.getCatalog());
	}

	/**
	 * <p>
	 * Determine whether the forwardConfig should be processed.
	 * </p>
	 * 
	 * @param context
	 *            The ActionContext we are processing
	 * @return <p>
	 *         <code>true</code> if the given <code>ActionContext</code> has a
	 *         non-null <code>forwardConfig</code> property.
	 *         </p>
	 */
	protected boolean shouldProcess(ActionContext context) {
		return (context.getForwardConfig() != null);
	}
}
