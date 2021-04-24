package org.g4studio.core.mvc.xstruts.chain.commands.servlet;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.g4studio.core.mvc.xstruts.Globals;
import org.g4studio.core.mvc.xstruts.chain.commands.AbstractSelectLocale;
import org.g4studio.core.mvc.xstruts.chain.contexts.ActionContext;
import org.g4studio.core.mvc.xstruts.chain.contexts.ServletActionContext;

/**
 * <p>
 * Select the <code>Locale</code> to be used for this request.
 * </p>
 * 
 * @version $Rev: 421119 $ $Date: 2005-05-07 12:11:38 -0400 (Sat, 07 May 2005) $
 */
public class SelectLocale extends AbstractSelectLocale {
	private static final Log log = LogFactory.getLog(SelectLocale.class);

	// ------------------------------------------------------- Protected Methods

	/**
	 * <p>
	 * Return the <code>Locale</code> to be used for this request.
	 * </p>
	 * 
	 * @param context
	 *            The <code>Context</code> for this request
	 */
	protected Locale getLocale(ActionContext context) {
		ServletActionContext saContext = (ServletActionContext) context;

		// Has a Locale already been selected?
		HttpSession session = saContext.getRequest().getSession();
		Locale locale = (Locale) session.getAttribute(Globals.LOCALE_KEY);

		if (locale != null) {
			return (locale);
		}

		// Select and cache the Locale to be used
		locale = saContext.getRequest().getLocale();

		if (locale == null) {
			locale = Locale.getDefault();
		}

		session.setAttribute(Globals.LOCALE_KEY, locale);

		return (locale);
	}
}
