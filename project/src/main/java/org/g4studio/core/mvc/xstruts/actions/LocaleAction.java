package org.g4studio.core.mvc.xstruts.actions;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.g4studio.core.mvc.xstruts.Globals;
import org.g4studio.core.mvc.xstruts.action.ActionForm;
import org.g4studio.core.mvc.xstruts.action.ActionForward;
import org.g4studio.core.mvc.xstruts.action.ActionMapping;

/**
 * Implementation of <strong>Action</strong> that changes the user's
 * {@link java.util.Locale} and forwards to a page, based on request level
 * parameters that are set (language, country, &amp; page).
 */
public final class LocaleAction extends BaseAction {

	/**
	 * Commons Logging instance.
	 */
	private Log log = LogFactory.getFactory().getInstance(this.getClass().getName());

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// Extract attributes we will need
		HttpSession session = request.getSession();
		Locale locale = getLocale(request);

		String language = null;
		String country = null;
		String page = null;

		try {
			language = (String) PropertyUtils.getSimpleProperty(form, "language");
			country = (String) PropertyUtils.getSimpleProperty(form, "country");
			page = (String) PropertyUtils.getSimpleProperty(form, "page");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}

		boolean isLanguage = ((language != null) && (language.length() > 0));
		boolean isCountry = ((country != null) && (country.length() > 0));

		if ((isLanguage) && (isCountry)) {
			locale = new java.util.Locale(language, country);
		} else if (isLanguage) {
			locale = new java.util.Locale(language, "");
		}

		session.setAttribute(Globals.LOCALE_KEY, locale);

		if (null == page) {
			return mapping.findForward("success");
		} else {
			return new ActionForward(page);
		}
	}
}
