package org.g4studio.core.mvc.xstruts.chain.commands.servlet;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.g4studio.core.mvc.xstruts.action.Action;
import org.g4studio.core.mvc.xstruts.action.ActionServlet;
import org.g4studio.core.mvc.xstruts.chain.Constants;
import org.g4studio.core.mvc.xstruts.chain.commands.AbstractCreateAction;
import org.g4studio.core.mvc.xstruts.chain.commands.util.ClassUtils;
import org.g4studio.core.mvc.xstruts.chain.contexts.ActionContext;
import org.g4studio.core.mvc.xstruts.chain.contexts.ServletActionContext;
import org.g4studio.core.mvc.xstruts.config.ActionConfig;
import org.g4studio.core.mvc.xstruts.config.ModuleConfig;

/**
 * <p>
 * Concrete implementation of <code>AbstractCreateAction</code> for use in a
 * Servlet API chain. Expects that the ActionContext passed into it can safely
 * be cast to <code>ServletActionContext</code>.
 * </p>
 */
public class CreateAction extends AbstractCreateAction {
	// ------------------------------------------------------ Instance Variables
	private static final Log log = LogFactory.getLog(CreateAction.class);

	/*
	 * :TODO The Action class' dependency on having its "servlet" property set
	 * requires this API-dependent subclass of AbstractCreateAction.
	 */
	protected synchronized Action getAction(ActionContext context, String type, ActionConfig actionConfig)
			throws Exception {
		ModuleConfig moduleConfig = actionConfig.getModuleConfig();
		String actionsKey = Constants.ACTIONS_KEY + moduleConfig.getPrefix();
		Map actions = (Map) context.getApplicationScope().get(actionsKey);

		if (actions == null) {
			actions = new HashMap();
			context.getApplicationScope().put(actionsKey, actions);
		}

		Action action = null;

		synchronized (actions) {
			action = (Action) actions.get(type);

			if (action == null) {
				log.info("Initialize action of type: " + type);
				action = (Action) ClassUtils.getApplicationInstance(type);
				actions.put(type, action);
			}
		}

		if (action.getServlet() == null) {
			ServletActionContext saContext = (ServletActionContext) context;
			ActionServlet actionServlet = saContext.getActionServlet();

			action.setServlet(actionServlet);
		}

		return (action);
	}
}
