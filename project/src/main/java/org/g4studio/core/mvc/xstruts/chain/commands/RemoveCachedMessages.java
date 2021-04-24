package org.g4studio.core.mvc.xstruts.chain.commands;

import java.util.Map;

import org.g4studio.core.mvc.xstruts.Globals;
import org.g4studio.core.mvc.xstruts.action.ActionMessages;
import org.g4studio.core.mvc.xstruts.chain.contexts.ActionContext;

/**
 * <p>
 * Remove cached messages stored in the session.
 * </p>
 * 
 * @version $Id: RemoveCachedMessages.java 421117 2006-07-12 04:35:47Z wsmoak $
 * @since Struts 1.3.5
 */
public class RemoveCachedMessages extends ActionCommandBase {

	/**
	 * <p>
	 * Removes any <code>ActionMessages</code> object stored in the session
	 * under <code>Globals.MESSAGE_KEY</code> and <code>Globals.ERROR_KEY</code>
	 * if the messages' <code>isAccessed</code> method returns true. This allows
	 * messages to be stored in the session, displayed one time, and be released
	 * here.
	 * </p>
	 * 
	 * @param actionCtx
	 *            The <code>Context</code> for the current request
	 * @return <code>false</code> so that processing continues
	 * @throws Exception
	 *             on any error
	 */
	public boolean execute(ActionContext actionCtx) throws Exception {

		// Get session scope
		Map session = actionCtx.getSessionScope();

		// Remove messages as needed
		removeAccessedMessages(session, Globals.MESSAGE_KEY);

		// Remove error messages as needed
		removeAccessedMessages(session, Globals.ERROR_KEY);

		return false;
	}

	/**
	 * <p>
	 * Removes any <code>ActionMessages</code> object from the specified scope
	 * stored under the specified key if the messages' <code>isAccessed</code>
	 * method returns true.
	 * 
	 * @param scope
	 *            The scope to check for messages in.
	 * @param key
	 *            The key the messages are stored under.
	 */
	private void removeAccessedMessages(Map scope, String key) {
		ActionMessages messages = (ActionMessages) scope.get(key);
		if (messages != null && messages.isAccessed()) {
			scope.remove(key);
		}
	}
}
