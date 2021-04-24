package org.g4studio.core.mvc.xstruts.chain.commands;

import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.g4studio.core.mvc.xstruts.action.ActionForm;
import org.g4studio.core.mvc.xstruts.chain.contexts.ActionContext;
import org.g4studio.core.mvc.xstruts.chain.contexts.ServletActionContext;
import org.g4studio.core.mvc.xstruts.config.ActionConfig;
import org.g4studio.core.mvc.xstruts.config.FormBeanConfig;

/**
 * <p>
 * Create (if necessary) and cache a form bean for this request.
 * </p>
 * 
 * @version $Id: CreateActionForm.java 376300 2006-02-09 14:11:07Z husted $
 */
public class CreateActionForm extends ActionCommandBase {
	// ------------------------------------------------------ Instance Variables

	/**
	 * <p>
	 * Provide Commons Logging instance for this class.
	 * </p>
	 */
	private static final Log LOG = LogFactory.getLog(CreateActionForm.class);

	// ---------------------------------------------------------- Public Methods

	/**
	 * <p>
	 * Create (if necessary) and cache a form bean for this request.
	 * </p>
	 * 
	 * @param actionCtx
	 *            The <code>Context</code> for the current request
	 * @return <code>false</code> so that processing continues
	 * @throws Exception
	 *             on any error
	 */
	public boolean execute(ActionContext actionCtx) throws Exception {
		// Is there a form bean associated with this ActionConfig?
		ActionConfig actionConfig = actionCtx.getActionConfig();
		String name = actionConfig.getName();

		if (name == null) {
			actionCtx.setActionForm(null);

			return (false);
		}

		if (LOG.isTraceEnabled()) {
			LOG.trace("Look up form-bean " + name);
		}

		// Look up the corresponding FormBeanConfig (if any)
		FormBeanConfig formBeanConfig = actionConfig.getModuleConfig().findFormBeanConfig(name);

		if (formBeanConfig == null) {
			LOG.warn("No FormBeanConfig found in module " + actionConfig.getModuleConfig().getPrefix() + " under name "
					+ name);
			actionCtx.setActionForm(null);

			return (false);
		}

		Map scope = actionCtx.getScope(actionConfig.getScope());

		ActionForm instance;

		instance = (ActionForm) scope.get(actionConfig.getAttribute());

		// Can we recycle the existing instance (if any)?
		if (!formBeanConfig.canReuse(instance)) {
			instance = formBeanConfig.createActionForm(actionCtx);
		}

		// TODO: Remove ServletActionContext when ActionForm no longer
		// directly depends on ActionServlet
		if (actionCtx instanceof ServletActionContext) {
			// The servlet property of ActionForm is transient, so
			// ActionForms which are restored from a serialized state
			// need to have their servlet restored.
			ServletActionContext sac = (ServletActionContext) actionCtx;

			instance.setServlet(sac.getActionServlet());
		}

		actionCtx.setActionForm(instance);

		scope.put(actionConfig.getAttribute(), instance);

		return (false);
	}
}
