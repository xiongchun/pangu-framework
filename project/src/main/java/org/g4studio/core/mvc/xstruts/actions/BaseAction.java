package org.g4studio.core.mvc.xstruts.actions;

import org.g4studio.core.mvc.xstruts.action.Action;
import org.g4studio.core.mvc.xstruts.util.MessageResources;

/**
 * <p>
 * BaseAction is provided as an intermediate class for shared funtionality
 * between <code>Action</code> and any stock implementation provided in this
 * package.
 * </p>
 * 
 * @version $Rev$ $Date$
 * @since Struts 1.3
 */
public abstract class BaseAction extends Action {
	/**
	 * The message resources for this package.
	 */
	protected static MessageResources messages = MessageResources
			.getMessageResources("org.g4studio.core.mvc.xstruts.actions.LocalStrings");
}
