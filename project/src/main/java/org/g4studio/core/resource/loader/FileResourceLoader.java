package org.g4studio.core.resource.loader;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.g4studio.core.resource.HttpHolder;
import org.g4studio.core.resource.LoadResoruceException;
import org.g4studio.core.resource.Resource;
import org.g4studio.core.resource.support.DefaultResource;

/**
 * FileResourceLoader
 * 
 * @author HuangYunHui|XiongChun
 * @since 2009-08-3
 */
public class FileResourceLoader extends AbstractResourceLoader {

	private final Log logger = LogFactory.getLog(this.getClass());
	private int cacheSize;

	public FileResourceLoader() {
		cacheSize = 1024 * 2;
	}

	public FileResourceLoader(int pCacheSize) {
		cacheSize = pCacheSize;
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
		String uri = urlMapping(pUri);
		if (logger.isDebugEnabled()) {
			logger.debug("正在装载资源文件:" + uri + " ...");
		}

		InputStream is = HttpHolder.getServletContext().getResourceAsStream(uri);
		if (is == null) {
			final String MSG = "没有找到资源文件:" + uri;
			logger.error(MSG);
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
		}finally{
			try {
				is.close();
			} catch (IOException e) {
				logger.error("关闭流文件发生严重异常");
				e.printStackTrace();
			}
		}
		byte[] data = outputStream.toByteArray();
		if (logger.isDebugEnabled()) {
			logger.debug("装载资源成功:" + uri);
		}
		DefaultResource result = new DefaultResource(uri, data);
		result.setLastModified(getFileLastModified(uri));
		return result;
	}

	private long getFileLastModified(String pUri) {
		if (pUri == null) {
			final String MSG = "资源URI为空";
			throw new NullPointerException(MSG);
		}
		final String filePath = HttpHolder.getServletContext().getRealPath(pUri);
		if (filePath == null) {
			return 0;
		}
		File file = new File(filePath);
		if (file.canRead()) {
			return file.lastModified();
		} else {
			return 0;
		}
	}

	public int getCacheSize() {
		return cacheSize;
	}

	public void setCacheSize(int cacheSize) {
		this.cacheSize = cacheSize;
	}

	public long getLastModified(String pUri) {
		if (pUri == null) {
			throw new NullPointerException("资源URI为空");
		}
		String uri = urlMapping(pUri);
		return getFileLastModified(uri);
	}

}
