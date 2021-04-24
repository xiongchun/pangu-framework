package org.g4studio.core.mvc.xstruts.chain.commands;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.g4studio.core.mvc.xstruts.chain.contexts.ActionContext;
import org.g4studio.core.mvc.xstruts.config.ActionConfig;

/**
 * <p>
 * Select and cache the include for this <code>ActionConfig</code> if specified.
 * </p>
 * 
 * @version $Rev: 421119 $ $Date: 2005-06-04 10:58:46 -0400 (Sat, 04 Jun 2005) $
 */
public class SelectInclude extends ActionCommandBase {
	// ------------------------------------------------------ Instance Variables

	/**
	 * <p>
	 * Provide Commons Logging instance for this class.
	 * </p>
	 */
	private static final Log LOG = LogFactory.getLog(SelectInclude.class);

	// ---------------------------------------------------------- Public Methods

	/**
	 * <p>
	 * Select and cache the include uri for this <code>ActionConfig</code> if
	 * specified.
	 * </p>
	 * 
	 * @param actionCtx
	 *            The <code>Context</code> for the current request
	 * @return <code>false</code> so that processing continues
	 * @throws Exception
	 *             on any error
	 */
	public boolean execute(ActionContext actionCtx) throws Exception {
		// Acquire configuration objects that we need
		ActionConfig actionConfig = actionCtx.getActionConfig();

		// Cache an include uri if found
		String include = actionConfig.getInclude();

		if (include != null) {
			if (LOG.isDebugEnabled()) {
				LOG.debug("Including " + include);
			}

			actionCtx.setInclude(include);
		}

		return (false);
	}
}
