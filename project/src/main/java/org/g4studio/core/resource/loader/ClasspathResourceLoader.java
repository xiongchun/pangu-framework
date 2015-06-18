package org.g4studio.core.resource.loader;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.g4studio.core.resource.LoadResoruceException;
import org.g4studio.core.resource.Resource;
import org.g4studio.core.resource.support.DefaultResource;
import org.g4studio.core.resource.util.ClassUtils;

/**
 * ClasspathResourceLoader
 * 
 * @author HuangYunHui|XiongChun
 * @since 2009-08-1
 */
public class ClasspathResourceLoader extends AbstractResourceLoader {

	private final Log logger = LogFactory.getLog(this.getClass());
	private int cacheSize;

	public ClasspathResourceLoader() {
		cacheSize = 1024 * 2;
	}

	public ClasspathResourceLoader(int pCacheSize) {
		cacheSize = pCacheSize;
	}

	// 这种资源始终认为是不会修改的
	public long getLastModified(String pUri) {
		return 1;
	}

	/**
	 * 如果要进行url转换处理，覆盖该方法.
	 * 
	 * @param pUri
	 * @return
	 */
	protected String urlMapping(String pUri) {
		return pUri;
	}

	public Resource load(String pUri) throws LoadResoruceException {
		if (pUri == null) {
			throw new NullPointerException("资源URI为空");
		}
		if (logger.isDebugEnabled()) {
			logger.debug("正在装载资源文件:" + pUri + " ...");
		}

		String uri = urlMapping(pUri);
		InputStream is = ClassUtils.getResourceAsStream(this.getClass(), uri);
		if (is == null) {
			final String MSG = "没有找到资源文件:" + uri;
			logger.debug(MSG);
			throw new NotFoundResourceException(MSG);
		}
		ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		byte[] buf = new byte[cacheSize];
		int len;
		try {
			while ((len = is.read(buf)) > 0) {
				outputStream.write(buf, 0, len);
			}
		} catch (IOException e) {
			throw new LoadResoruceException("读取资源文件:" + uri + "失败!", e);
		}

		byte[] data = outputStream.toByteArray();
		if (logger.isDebugEnabled()) {
			logger.debug("装载资源成功:" + uri);
		}
		DefaultResource result = new DefaultResource(uri, data);
		result.setLastModified(0);
		return result;

	}

	public int getCacheSize() {
		return cacheSize;
	}

	public void setCacheSize(int cacheSize) {
		this.cacheSize = cacheSize;
	}

}
