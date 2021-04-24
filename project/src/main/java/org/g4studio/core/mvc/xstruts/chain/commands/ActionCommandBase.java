package org.g4studio.core.mvc.xstruts.chain.commands;

import org.apache.commons.chain.Context;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.g4studio.core.mvc.xstruts.chain.contexts.ActionContext;

/**
 * <p>
 * Simple abstract class which avoids frequent casting to
 * <code>ActionContext</code> in commands explicitly intended for use with that
 * class.
 * </p>
 */
public abstract class ActionCommandBase implements ActionCommand {

	/**
	 * <p>
	 * Provide Commons Logging instance for this class.
	 * </p>
	 */
	private static final Log LOG = LogFactory.getLog(ActionCommandBase.class);

	// See interface for Javadoc
	public abstract boolean execute(ActionContext actionContext) throws Exception;

	// See interface for Javadoc
	public boolean execute(Context context) throws Exception {
		if (LOG.isDebugEnabled()) {
			LOG.debug("Executing " + getClass().getName());
		}
		return execute((ActionContext) context);
	}
}
