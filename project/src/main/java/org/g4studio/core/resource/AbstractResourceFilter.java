package org.g4studio.core.resource;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.g4studio.core.resource.util.ResourceWebUtils;

/**
 * AbstractResourceFilter
 * 
 * @author HuangYunHui|XiongChun
 * @since 2009-11-01
 */
public abstract class AbstractResourceFilter implements Filter {

	private static final long serialVersionUID = 1L;

	private final Log logger = LogFactory.getLog(this.getClass());
	private static final long ONE_YEAR = 31536000000L;
	private static final long TEN_YEARS = ONE_YEAR * 10L;

	private ResourceManager resourceManager;

	public void destroy() {
		resourceManager.destroy();
		HttpHolder.setServletContext(null);
	}

	public void doFilter(ServletRequest pRequest, ServletResponse pResponse, FilterChain pFilterChain)
			throws IOException, ServletException {
		try {
			HttpHolder.setRequest((HttpServletRequest) pRequest);
			HttpHolder.setResponse((HttpServletResponse) pResponse);
			HttpHolder.setFilterChain(pFilterChain);
			executeFilter(pRequest, pResponse, pFilterChain);
		} finally {
			HttpHolder.setRequest(null);
			HttpHolder.setResponse(null);
			HttpHolder.setFilterChain(null);
		}

	}

	protected void executeFilter(ServletRequest pRequest, ServletResponse pResponse, FilterChain pFilterChain)
			throws IOException, ServletException {
		handle((HttpServletRequest) pRequest, (HttpServletResponse) pResponse, pFilterChain);
	}

	private String newURI(String pUri) {
		if (pUri == null) {
			return null;
		}
		for (int i = 0; i < oldPrefixs.size(); i++) {
			String oldPrefix = (String) oldPrefixs.get(i);
			if (pUri.startsWith(oldPrefix)) {
				String newPrefix = (String) newPrefixs.get(i);
				if (newPrefix == null) {
					continue;
				}
				return newPrefix + pUri.substring(oldPrefix.length());
			}
		}
		return pUri;
	}

	private void handle(HttpServletRequest pRequest, HttpServletResponse pResponse, FilterChain pFilterChain)
			throws ServletException, IOException {
		final String contextPath = pRequest.getContextPath();
		final String uri = pRequest.getRequestURI().substring(contextPath.length());
		Resource res = resourceManager.get(uri);
		// 说明没有找到对应的资源装载配置
		if (res == null) {
			pFilterChain.doFilter(pRequest, pResponse);
			return;
		}
		// header 信息的设置是来自项目:http://sourceforge.net/projects/packtag
		// It won't be cached by proxies, because of the Cache-Control: private
		// header. Let the Browser cache the resource
		// / pResponse.setHeader("Cache-Control", "private");
		//
		// // Don't let the resource expire
		// pResponse.setDateHeader("Expires", new Date().getTime() + TEN_YEARS);
		pResponse.setDateHeader("Expires", 0);

		// Funny header, see here: http://en.wikipedia.org/wiki/HTTP_ETag
		// 必须在引号内
		String token = '"' + res.getResourceCode() + '"';
		pResponse.setHeader("ETag", token);
		pResponse.setHeader("power-by", "G4");

		String ifNoneMatch = pRequest.getHeader("If-None-Match");
		String ifModifiedSince = pRequest.getHeader("If-Modified-Since");

		if (logger.isDebugEnabled()) {
			logger.debug("ifNoneMatch=" + ifNoneMatch);
			logger.debug("ifModifiedSince=" + ifModifiedSince);
		}

		boolean isNotModified = false;
		if (token.equals(ifNoneMatch)) {// etag匹配了，内容没修改
			isNotModified = true;
		} else {
			// 为0是时认为修改了，
			if (res.getLastModified() != 0) {// 检查时间是否匹配，如果修改时间不是0时，因为是0时，无法判断是否修改了
				long lastModified = pRequest.getDateHeader("If-Modified-Since");
				if (lastModified == res.getLastModified()) {
					isNotModified = true;
				} else {
					isNotModified = false;
				}
			}
		}

		/**
		 * FIXME: IE6时,当启用gzip压缩时,pRequest.getHeader("If-None-Match")返回值是null,
		 * 这样就每次都会下载文件. 性能表现就不好.
		 */
		if (isNotModified) {
			logger.debug("资源:" + uri + "未发生变化,直接使用客户端cache数据!");
			pResponse.sendError(HttpServletResponse.SC_NOT_MODIFIED);
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
			// Calendar cal = Calendar.getInstance();
			// cal.set(Calendar.MILLISECOND, 0);
			// Date lastModified = cal.getTime();
			pResponse.setDateHeader("Last-Modified", res.getLastModified());

			OutputStream out = pResponse.getOutputStream();

			/**
			 * 注意:必须在这进行gzip判断,因为数据进行gzip cache处理,但是有的客户端支持,有的不支持gzip 所以每次都需要判断.
			 * ie6下不启用gzip压缩.
			 */
			boolean isSupportedGzip = ResourceWebUtils.isSupportedGzip(pRequest);
			if (isSupportedGzip) {
				if (ResourceWebUtils.isIE6(pRequest)) {
					isSupportedGzip = res.getLastModified() != 0;// 当等于0时，不支持gzip压缩,因为这种情况只能
					// 通过etag来判断文件是否修改了，但是ie6起用gzip压缩时
					// etag值会丢失.
				}
			}
			if (isSupportedGzip) {// 客户端支持gzip压缩
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

	public static final String PREFIX_MAPPING_PARAM_KEY = "prefixMapping";
	private List oldPrefixs = new ArrayList();
	private List newPrefixs = new ArrayList();

	private FilterConfig filterConfig = null;

	protected abstract ResourceManager createResourceManager(FilterConfig pFilterConfig);

	public void init(FilterConfig pFilterConfig) throws ServletException {
		this.filterConfig = pFilterConfig;
		HttpHolder.setServletContext(pFilterConfig.getServletContext());
		logger.info("正在创建G4.Resource静态资源管理器...");
		resourceManager = createResourceManager(pFilterConfig);
		resourceManager.init();
		logger.info("创建G4.Resource静态资源管理器成功.");

	}

}
