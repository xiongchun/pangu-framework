package org.g4studio.core.resource.handler;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.g4studio.core.resource.HandleResourceException;
import org.g4studio.core.resource.Resource;
import org.g4studio.core.resource.ResourceHandler;

/**
 * JSMinResourceHandler
 * 
 * @author HuangYunHui|XiongChun
 * @since 2009-08-10
 */
public class JSMinResourceHandler implements ResourceHandler {

	private final Log logger = LogFactory.getLog(this.getClass());

	public void handle(Resource pResource) throws HandleResourceException {
		InputStream is = new ByteArrayInputStream(pResource.getTreatedData());
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		JSMin jsMin = new JSMin(is, out);
		logger.info("正在对资源:" + pResource.getUri() + "进行js min压缩...");
		try {
			jsMin.jsmin();
			pResource.setTreatedData(out.toByteArray());
			logger.info("js min资源:" + pResource.getUri() + "成功.");
		} catch (Exception ex) {
			final String MSG = "js min资源:" + pResource.getUri() + "失败！";
			logger.warn(MSG, ex);
			return;
		}

	}

}
