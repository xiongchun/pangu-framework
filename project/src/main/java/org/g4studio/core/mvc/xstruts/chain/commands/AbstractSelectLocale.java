package org.g4studio.core.mvc.xstruts.chain.commands;

import java.util.Locale;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.g4studio.core.mvc.xstruts.chain.contexts.ActionContext;
import org.g4studio.core.mvc.xstruts.config.ModuleConfig;

/**
 * <p>
 * Select the <code>Locale</code> to be used for this request.
 * </p>
 * 
 * @version $Rev: 421119 $ $Date: 2005-11-12 13:01:44 -0500 (Sat, 12 Nov 2005) $
 */
public abstract class AbstractSelectLocale extends ActionCommandBase {
	// ------------------------------------------------------ Instance Variables

	/**
	 * <p>
	 * Provide Commons Logging instance for this class.
	 * </p>
	 */
	private static final Log LOG = LogFactory.getLog(AbstractSelectLocale.class);

	// ---------------------------------------------------------- Public Methods

	/**
	 * <p>
	 * Select the <code>Locale</code> to be used for this request.
	 * </p>
	 * 
	 * @param actionCtx
	 *            The <code>Context</code> for the current request
	 * @return <code>false</code> so that processing continues
	 * @throws Exception
	 *             if thrown by the Action class
	 */
	public boolean execute(ActionContext actionCtx) throws Exception {
		// Are we configured to select Locale automatically?
		LOG.trace("retrieve config...");

		ModuleConfig moduleConfig = actionCtx.getModuleConfig();

		if (!moduleConfig.getControllerConfig().getLocale()) {
			if (LOG.isDebugEnabled()) {
				LOG.debug("module is not configured for a specific locale; " + "nothing to do");
			}

			return (false);
		}

		// Retrieve and cache appropriate Locale for this request
		Locale locale = getLocale(actionCtx);

		if (LOG.isDebugEnabled()) {
			LOG.debug("set context locale to " + locale);
		}

		actionCtx.setLocale(locale);

		return (false);
	}

	// ------------------------------------------------------- Protected Methods

	/**
	 * <p>
	 * Return the <code>Locale</code> to be used for this request.
	 * </p>
	 * 
	 * @param context
	 *            The <code>Context</code> for this request
	 * @return The Locale to be used for this request
	 */
	protected abstract Locale getLocale(ActionContext context);
}
