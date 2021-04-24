package org.g4studio.core.mvc.xstruts.action;

import java.util.ArrayList;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.g4studio.core.mvc.xstruts.config.ActionConfig;
import org.g4studio.core.mvc.xstruts.config.ForwardConfig;

public class ActionMapping extends ActionConfig {
	/**
	 * <p>
	 * Commons Logging instance.
	 * </p>
	 * 
	 * @since Struts 1.2.8
	 */
	private static Log log = LogFactory.getLog(ActionMapping.class);

	/**
	 * <p>
	 * Find and return the <code>ForwardConfig</code> instance defining how
	 * forwarding to the specified logical name should be handled. This is
	 * performed by checking local and then global configurations for the
	 * specified forwarding configuration. If no forwarding configuration can be
	 * found, return <code>null</code>.
	 * </p>
	 * 
	 * @param forwardName
	 *            Logical name of the forwarding instance to be returned
	 * @return The local or global forward with the specified name.
	 */
	public ActionForward findForward(String forwardName) {
		ForwardConfig config = findForwardConfig(forwardName);

		if (config == null) {
			config = getModuleConfig().findForwardConfig(forwardName);
		}

		if (config == null) {
			if (log.isWarnEnabled()) {
				log.warn("Unable to find '" + forwardName + "' forward.");
			}
		}

		return ((ActionForward) config);
	}

	/**
	 * <p>
	 * Return the logical names of all locally defined forwards for this
	 * mapping. If there are no such forwards, a zero-length array is returned.
	 * </p>
	 * 
	 * @return The forward names for this action mapping.
	 */
	public String[] findForwards() {
		ArrayList results = new ArrayList();
		ForwardConfig[] fcs = findForwardConfigs();

		for (int i = 0; i < fcs.length; i++) {
			results.add(fcs[i].getName());
		}

		return ((String[]) results.toArray(new String[results.size()]));
	}

	/**
	 * <p>
	 * Create (if necessary) and return an {@link ActionForward} that
	 * corresponds to the <code>input</code> property of this Action.
	 * </p>
	 * 
	 * @return The input forward for this action mapping.
	 * @since Struts 1.1
	 */
	public ActionForward getInputForward() {
		if (getModuleConfig().getControllerConfig().getInputForward()) {
			return (findForward(getInput()));
		} else {
			return (new ActionForward(getInput()));
		}
	}
}
