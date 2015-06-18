package org.g4studio.core.resource.loader;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.g4studio.core.resource.HttpHolder;
import org.g4studio.core.resource.LoadResoruceException;
import org.g4studio.core.resource.Resource;
import org.g4studio.core.resource.support.DefaultResource;

/**
 * DynamicResourceLoader
 * 
 * @author HuangYunHui|XiongChun
 * @since 2009-08-3
 */
public class DynamicResourceLoader extends AbstractResourceLoader {

	private final Log logger = LogFactory.getLog(this.getClass());

	public long getLastModified(String uri) {
		return 0;
	}

	public Resource load(String uri) throws LoadResoruceException {
		HttpServletRequest request = HttpHolder.getRequest();
		HttpServletResponse response = HttpHolder.getResponse();
		FilterChain filterChain = HttpHolder.getFilterChain();

		BufferResponseWrapper wrapper = new BufferResponseWrapper(response);
		try {
			filterChain.doFilter(request, wrapper);
		} catch (Exception e) {
			throw new LoadResoruceException(e);
		}

		// 必须执行flush操作,否则可能取不到数据.
		try {
			wrapper.flush();
		} catch (IOException e) {
			throw new LoadResoruceException(e);
		}
		byte[] datas = wrapper.getDatas();
		DefaultResource result = new DefaultResource(uri, datas);
		result.setLastModified(getLastModified(uri));
		return result;
	}

}
