package org.g4studio.core.mvc.xstruts.actions;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.g4studio.core.mvc.xstruts.action.ActionForm;
import org.g4studio.core.mvc.xstruts.action.ActionForward;
import org.g4studio.core.mvc.xstruts.action.ActionMapping;

public class IncludeAction extends BaseAction {
	// ----------------------------------------------------- Instance Variables

	/**
	 * Process the specified HTTP request, and create the corresponding HTTP
	 * response (or forward to another web component that will create it).
	 * Return an <code>ActionForward</code> instance describing where and how
	 * control should be forwarded, or <code>null</code> if the response has
	 * already been completed.
	 * 
	 * @param mapping
	 *            The ActionMapping used to select this instance
	 * @param form
	 *            The optional ActionForm bean for this request (if any)
	 * @param request
	 *            The HTTP request we are processing
	 * @param response
	 *            The HTTP response we are creating
	 * @return The forward to which control should be transferred, or
	 *         <code>null</code> if the response has been completed.
	 * @throws Exception
	 *             if an error occurs
	 */
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// Create a RequestDispatcher the corresponding resource
		String path = mapping.getParameter();

		if (path == null) {
			throw new ServletException(messages.getMessage("include.path"));
		}

		RequestDispatcher rd = servlet.getServletContext().getRequestDispatcher(path);

		if (rd == null) {
			throw new ServletException(messages.getMessage("include.rd", path));
		}

		// Forward control to the specified resource
		rd.include(request, response);

		// Tell the controller servlet that the response has been created
		return (null);
	}
}
