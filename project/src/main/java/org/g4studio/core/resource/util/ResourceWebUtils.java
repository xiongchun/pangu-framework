package org.g4studio.core.resource.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * ResourceWebUtils
 * 
 * @author HuangYunHui|XiongChun
 * @since 2009-11-09
 */
public abstract class ResourceWebUtils {

	private ResourceWebUtils() {

	}

	public static final String ACCEPTED_ENCODING = "Accept-Encoding";
	public static final String GZIP = "gzip";
	public static final String CONTENT_ENCODING = "Content-Encoding";

	public static boolean isSupportedGzip(HttpServletRequest pRequest) {
		String acceptEncoding = pRequest.getHeader(ACCEPTED_ENCODING);
		boolean isSupportedGZIP = (acceptEncoding != null) && (acceptEncoding.indexOf(GZIP) != -1);
		return isSupportedGZIP;
	}

	public static boolean isIE6(HttpServletRequest pRequest) {
		return !(isNotIE6(pRequest));
	}

	public static boolean isNotIE6(HttpServletRequest pRequest) {
		String agent = pRequest.getHeader("User-Agent");
		if (agent.indexOf("MSIE   6.0") != -1) {
			return false;
		} else {
			return true;
		}
	}

	public static void setGzipHeader(HttpServletResponse pResponse) {
		pResponse.setHeader(CONTENT_ENCODING, GZIP);
	}

}
