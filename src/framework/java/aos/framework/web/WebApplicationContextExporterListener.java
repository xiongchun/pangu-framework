package aos.framework.web;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;


import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import aos.framework.core.utils.AOSCons;


/**
 * <b>Web监听:导出WebApplicationContext对象</b>
 * <p>
 * 提供在非Servlet环境下获取已经启动的Spring上下文的能力
 * </P>
 * 
 * @author xiongchun
 */
public class WebApplicationContextExporterListener implements ServletContextListener {

	private static WebApplicationContext webApplicationContext;

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		webApplicationContext = WebApplicationContextUtils.getWebApplicationContext(sce.getServletContext());
		String flag = AOSCons.STR_TRUE;
		if (webApplicationContext == null) {
			flag = AOSCons.STR_FALSE;
		}
		System.setProperty(AOSCons.WEBAPPCXT_IS_SUCCESS_KEY, flag);
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {

	}

	/**
	 * 导出ServletContext下的WebApplicationContext
	 * 
	 * @return
	 */
	public static WebApplicationContext getWebApplicationContext() {
		return webApplicationContext;
	}

}
