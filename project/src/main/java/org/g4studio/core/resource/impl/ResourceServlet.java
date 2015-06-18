package org.g4studio.core.resource.impl;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletConfig;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.g4studio.core.resource.AbstractResourceServlet;
import org.g4studio.core.resource.ResourceManager;
import org.g4studio.core.resource.util.StringUtils;

/**
 * ResourceServlet
 * 
 * @author HuangYunHui|XiongChun
 * @since 2009-05-22
 */
public class ResourceServlet extends AbstractResourceServlet {

	private static final long serialVersionUID = 1L;

	private final Log logger = LogFactory.getLog(this.getClass());

	public static final String CONFIG_PARAM_KEY = "config";
	public static final String DEFAULT_CONFIG = "/WEB-INF/classes/g4resource.properties";

	protected ResourceManager createResourceManager(ServletConfig pServletConfig) {
		final String config = pServletConfig.getInitParameter(CONFIG_PARAM_KEY);

		String useConifg = config;

		Configuration configuration = new Configuration();
		if (StringUtils.hasLength(config) == false) {// 没设置了配置文件
			logger.info("没有指定资源管理器的配置文件，采用默认的配置: " + DEFAULT_CONFIG);
			useConifg = DEFAULT_CONFIG;
		}
		logger.debug("G4.Resource配置文件是:" + useConifg);
		InputStream is = this.getServletContext().getResourceAsStream(useConifg);
		if (is == null) {
			final String MSG = "没有发现配置文件:" + useConifg + "\n" + "系统启用默认的配置!";
			logger.warn(MSG);
			configuration.build();
		} else {
			try {
				configuration.buildInputStream(is);
			} finally {
				try {
					if (is != null)
						is.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		ResourceManager result = configuration.buildResourceManager();
		return result;
	}

}
