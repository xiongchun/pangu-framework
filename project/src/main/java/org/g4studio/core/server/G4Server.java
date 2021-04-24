package org.g4studio.core.server;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.eclipse.jetty.server.Connector;
import org.eclipse.jetty.server.Server;
import org.eclipse.jetty.server.nio.SelectChannelConnector;
import org.eclipse.jetty.webapp.WebAppContext;
import org.g4studio.common.util.SpringBeanLoader;
import org.g4studio.core.properties.PropertiesFactory;
import org.g4studio.core.properties.PropertiesFile;
import org.g4studio.core.properties.PropertiesHelper;
import org.g4studio.system.common.util.SystemConstants;


public class G4Server {
	
	private static Log log = LogFactory.getLog(G4Server.class);

	/**
	 * 监听端口, 缺省为169。
	 */
	private int port = 169;

	/**
	 * 应用上下文, 缺省为/(无上下文)
	 */
	private String webContext = "/";

	public G4Server() {

	}

	/**
	 * 构造Server实例
	 * 
	 * @param pWebContext
	 * @param port
	 */
	public G4Server(String pWebContext, int pPort) {
		setWebContext(pWebContext);
		setPort(pPort);
	}

	public void start() throws Exception {
	    PropertiesHelper pHelper = PropertiesFactory.getPropertiesHelper(PropertiesFile.G4);
	    String forceLoad = pHelper.getValue("forceLoad", SystemConstants.FORCELOAD_N);
		/**
		 * 强制改变加载顺序
		 * 解决直接使用iBatis源码带来的初始化Spring容器报错的问题
		 */
	    if(forceLoad.equals(SystemConstants.FORCELOAD_Y)){
		    log.info("********************************************");
		    log.info("G4Studio行业应用二次快速开发平台->开始启动...");
		    log.info("********************************************");
		    log.info("系统正在初始化Spring...");
		    SpringBeanLoader.getApplicationContext();
		    log.info("Spring初始化成功,SpringBean已经被实例化。");
		}
		final String webRoot = System.getProperty("user.dir") + "/webapp";
		Server server = new Server();
		SelectChannelConnector connector0 = new SelectChannelConnector();
		//disable nio cache to unlock the css and js file when running
		connector0.setUseDirectBuffers(false);
		connector0.setPort(port);
		server.setConnectors(new Connector[] {connector0});
		WebAppContext context = new WebAppContext();
		context.setDescriptor(webRoot + "/WEB-INF/web.xml");
		context.setResourceBase(webRoot);
		context.setContextPath(webContext);
		context.setParentLoaderPriority(true);
		server.setHandler(context);
		server.start();
		String msg = "启动成功";
		webContext = webContext.equals("/") ? "" : webContext;
		msg = msg + " >> localhost:" + port + webContext +  "";
		System.out.println(msg);
		server.join();
	}

	public int getPort() {
		return port;
	}

	/**
	 * 监听端口, 缺省为169
	 * 
	 * @param port
	 */
	public void setPort(int port) {
		this.port = port;
	}

	public String getWebContext() {
		return webContext;
	}

	/**
	 * 应用上下文, 缺省为/(无上下文)
	 * 
	 * @param webContext
	 */
	public void setWebContext(String webContext) {
		this.webContext = webContext;
	}
}
