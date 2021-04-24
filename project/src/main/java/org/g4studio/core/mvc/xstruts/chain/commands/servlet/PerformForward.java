package org.g4studio.core.mvc.xstruts.chain.commands.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.g4studio.core.mvc.xstruts.action.ActionServlet;
import org.g4studio.core.mvc.xstruts.chain.commands.AbstractPerformForward;
import org.g4studio.core.mvc.xstruts.chain.contexts.ActionContext;
import org.g4studio.core.mvc.xstruts.chain.contexts.ServletActionContext;
import org.g4studio.core.mvc.xstruts.config.ForwardConfig;
import org.g4studio.core.mvc.xstruts.config.ModuleConfig;
import org.g4studio.core.mvc.xstruts.util.MessageResources;
import org.g4studio.core.mvc.xstruts.util.ModuleUtils;
import org.g4studio.core.mvc.xstruts.util.RequestUtils;

/**
 * <p>
 * Perform forwarding or redirection based on the specified
 * <code>ForwardConfig</code> (if any).
 * </p>
 * 
 * @version $Rev: 421119 $ $Date: 2006-07-11 21:49:11 -0700 (Tue, 11 Jul 2006) $
 */
public class PerformForward extends AbstractPerformForward {
	private static final Log LOG = LogFactory.getLog(PerformForward.class);

	// ------------------------------------------------------- Protected Methods

	/**
	 * <p>
	 * Perform the appropriate processing on the specified
	 * <code>ForwardConfig</code>.
	 * </p>
	 * 
	 * @param context
	 *            The context for this request
	 * @param forwardConfig
	 *            The forward to be performed
	 */
	protected void perform(ActionContext context, ForwardConfig forwardConfig) throws Exception {
		ServletActionContext sacontext = (ServletActionContext) context;
		String uri = forwardConfig.getPath();

		if (uri == null) {
			ActionServlet servlet = sacontext.getActionServlet();
			MessageResources resources = servlet.getInternal();

			throw new IllegalArgumentException(resources.getMessage("forwardPathNull"));
		}

		HttpServletRequest request = sacontext.getRequest();
		ServletContext servletContext = sacontext.getContext();
		HttpServletResponse response = sacontext.getResponse();

		if (uri.startsWith("/")) {
			uri = resolveModuleRelativePath(forwardConfig, servletContext, request);
		}

		if (response.isCommitted() && !forwardConfig.getRedirect()) {
			handleAsInclude(uri, servletContext, request, response);
		} else if (forwardConfig.getRedirect()) {
			handleAsRedirect(uri, request, response);
		} else {
			handleAsForward(uri, servletContext, request, response);
		}
	}

	private String resolveModuleRelativePath(ForwardConfig forwardConfig, ServletContext servletContext,
			HttpServletRequest request) {
		String prefix = forwardConfig.getModule();
		ModuleConfig moduleConfig = ModuleUtils.getInstance().getModuleConfig(prefix, request, servletContext);
		return RequestUtils.forwardURL(request, forwardConfig, moduleConfig);
	}

	private void handleAsForward(String uri, ServletContext servletContext, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = servletContext.getRequestDispatcher(uri);

		if (LOG.isDebugEnabled()) {
			LOG.debug("Forwarding to " + uri);
		}

		rd.forward(request, response);
	}

	private void handleAsRedirect(String uri, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		if (uri.startsWith("/")) {
			uri = request.getContextPath() + uri;
		}

		if (LOG.isDebugEnabled()) {
			LOG.debug("Redirecting to " + uri);
		}

		response.sendRedirect(response.encodeRedirectURL(uri));
	}

	private void handleAsInclude(String uri, ServletContext servletContext, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		RequestDispatcher rd = servletContext.getRequestDispatcher(uri);

		if (rd == null) {
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error getting RequestDispatcher for "
					+ uri);
			return;
		}

		if (LOG.isDebugEnabled()) {
			LOG.debug("Including " + uri);
		}

		rd.include(request, response);
	}
}
