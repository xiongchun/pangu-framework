package org.g4studio.core.resource;

import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.g4studio.core.resource.util.ResourceWebUtils;

/**
 * AbstractResourceServlet
 * 
 * @author HuangYunHui|XiongChun
 * @since 2009-11-01
 */
public abstract class AbstractResourceServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private static final long ONE_YEAR = 31536000000L;
	private static final long TEN_YEARS = ONE_YEAR * 10L;
	private final Log logger = LogFactory.getLog(this.getClass());

	private ResourceManager resourceManager;

	protected void doPost(HttpServletRequest pRequest, HttpServletResponse pResponse) throws ServletException,
			IOException {
		doGet(pRequest, pResponse);
	}

	protected void doGet(HttpServletRequest pRequest, HttpServletResponse pResponse) throws ServletException,
			IOException {
		try {
			HttpHolder.setRequest((HttpServletRequest) pRequest);
			HttpHolder.setResponse((HttpServletResponse) pResponse);
			handle(pRequest, pResponse);
		} finally {
			HttpHolder.setRequest(null);
			HttpHolder.setResponse(null);
		}
	}

	private void handle(HttpServletRequest pRequest, HttpServletResponse pResponse) throws ServletException,
			IOException {

		final String contextPath = pRequest.getContextPath();
		final String uri = pRequest.getRequestURI().substring(contextPath.length());
		Resource res = resourceManager.get(uri);
		// header 信息的设置是来自项目:http://sourceforge.net/projects/packtag
		// It won't be cached by proxies, because of the Cache-Control: private
		// header. Let the Browser cache the resource
		pResponse.setHeader("Cache-Control", "private");

		// Don't let the resource expire
		pResponse.setDateHeader("Expires", new Date().getTime() + TEN_YEARS); // Expires
																				// after
																				// ten
																				// year

		// Funny header, see here: http://en.wikipedia.org/wiki/HTTP_ETag
		pResponse.setHeader("ETag", "G4" + Long.toString(res.getLastModified()));
		pResponse.setHeader("power-by", "G4");
		// Check if the "If_None-Match" Header is send. When this equals to the
		// resource, it is not
		// modified, and hasn't to be delivered again (Status code 304: Not
		// modifed).
		// This happens when someone e.g. has the resource allready loaded, and
		// presses the reload-button.
		// (Doesn't seems to work on IE6, like always)
		StringBuffer selfMatch = new StringBuffer();
		selfMatch.append("G4");
		selfMatch.append(res.getLastModified());

		if (selfMatch.toString().equals(pRequest.getHeader("If-None-Match"))) {
			logger.debug("资源:" + uri + "未发生变化,直接使用客户端cache数据!");
			pResponse.setStatus(HttpServletResponse.SC_NOT_MODIFIED);
			pResponse.setHeader("Last-Modified", pRequest.getHeader("If-Modified-Since"));

		} else {// 不是来自cache
			final String contextType = res.getMimeType();
			if (contextType != null) {
				pResponse.setContentType(contextType);
			}
			final String charset = res.getCharset();
			if (charset != null) {
				pResponse.setCharacterEncoding(charset);
			}

			Date lastModified = new Date();
			pResponse.setDateHeader("Last-Modified", lastModified.getTime());

			OutputStream out = pResponse.getOutputStream();

			/**
			 * 注意:必须在这进行gzip判断,因为数据进行gzip cache处理,但是有的客户端支持,有的不支持gzip 所以每次都需要判断.
			 */
			if (ResourceWebUtils.isSupportedGzip(pRequest)) {// 客户端支持gzip压缩
				if (res.isGzip()) {// 已经过gzip压缩
					ResourceWebUtils.setGzipHeader(pResponse);// 设置gzip头
					out.write(res.getTreatedData());
				} else {
					out.write(res.getTreatedData());
				}
			} else {// 不支持gzip
				if (res.isGzip()) {// 已压缩，则用原始数据
					out.write(res.getData());
				} else {// 未压缩过，则使用处理过的数据（可能是做写混淆之类的处理
					out.write(res.getTreatedData());
				}
			}
			out.flush();
		}

	}

	protected abstract ResourceManager createResourceManager(ServletConfig pServletConfig);

	public void destroy() {
		super.destroy();
		resourceManager.destroy();
		HttpHolder.setServletContext(null);
	}

	public void init(ServletConfig pServletConfig) throws ServletException {
		super.init(pServletConfig);
		logger.info("正在创建G4.Resource静态资源管理器...");
		resourceManager = createResourceManager(pServletConfig);
		resourceManager.init();
		logger.info("创建G4.Resource静态资源管理器成功.");
	}

	public void init() throws ServletException {
		super.init();
		HttpHolder.setServletContext(this.getServletContext());
	}

}
