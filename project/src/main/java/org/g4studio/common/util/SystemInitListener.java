package org.g4studio.common.util;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.g4studio.common.dao.Dao;
import org.g4studio.common.dao.Reader;
import org.g4studio.core.metatype.impl.BaseDto;
import org.g4studio.core.properties.PropertiesFactory;
import org.g4studio.core.properties.PropertiesFile;
import org.g4studio.core.properties.PropertiesHelper;
import org.g4studio.core.util.G4Constants;
import org.g4studio.core.util.G4Utils;
import org.g4studio.system.admin.service.MonitorService;
import org.g4studio.system.common.util.SystemConstants;
import org.springframework.context.ApplicationContext;

/**
 * 系统启动监听器
 * 
 * @author OSWorks-XC
 * @since 2010-04-13
 */
public class SystemInitListener implements ServletContextListener {
	private static Log log = LogFactory.getLog(SystemInitListener.class);
	private boolean success = true;
	private ApplicationContext wac = null;

	public void contextDestroyed(ServletContextEvent sce) {

	}

	public void contextInitialized(ServletContextEvent sce) {
		systemStartup(sce.getServletContext());
	}

	/**
	 * 应用平台启动
	 */
	private void systemStartup(ServletContext servletContext) {
		PropertiesHelper pHelper = PropertiesFactory.getPropertiesHelper(PropertiesFile.G4);
		String forceLoad = pHelper.getValue("forceLoad", SystemConstants.FORCELOAD_N);
		long start = System.currentTimeMillis();
		if (forceLoad.equalsIgnoreCase(SystemConstants.FORCELOAD_N)) {
			log.info("*******************************************************");
			log.info("G4Studio行业应用二次快速开发平台->开始启动...");
			log.info("*******************************************************");
		}
		try {
			wac = SpringBeanLoader.getApplicationContext();
		} catch (Exception e) {
			success = false;
			e.printStackTrace();
		}
		if (success) {
			MonitorService monitorService = (MonitorService) SpringBeanLoader.getSpringBean("monitorService");
			monitorService.deleteHttpSession(new BaseDto());
			try {
				initDbType();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (success) {
			log.info("系统开始启动字典装载程序...");
			log.info("开始加载字典...");
			Reader g4Reader = (Reader) SpringBeanLoader.getSpringBean("g4Reader");
			List codeList = null;
			try {
				codeList = g4Reader.queryForList("Resource.getCodeViewList");
				log.info("字典加载成功!");
			} catch (Exception e) {
				success = false;
				log.error("字典加载失败!");
				e.printStackTrace();
			}
			servletContext.setAttribute("EACODELIST", codeList);
		}
		if (success) {
			log.info("系统开始启动全局参数表装载程序...");
			log.info("开始加载全局参数表...");
			List paramList = null;
			try {
				Reader g4Reader = (Reader) SpringBeanLoader.getSpringBean("g4Reader");
				paramList = g4Reader.queryForList("Resource.getParamList");
				log.info("全局参数表加载成功!");
			} catch (Exception e) {
				success = false;
				log.error("全局参数表加载失败!");
				e.printStackTrace();
			}
			servletContext.setAttribute("EAPARAMLIST", paramList);
		}
		long timeSec = (System.currentTimeMillis() - start) / 1000;
		log.info("********************************************");
		if (success) {
			log.info("G4Studio行业应用二次快速开发平台->启动成功[" + G4Utils.getCurrentTime() + "]");
			log.info("启动总耗时: " + timeSec / 60 + "分 " + timeSec % 60 + "秒 ");
		} else {
			log.error("G4Studio行业应用二次快速开发平台->启动失败[" + G4Utils.getCurrentTime() + "]");
			log.error("启动总耗时: " + timeSec / 60 + "分" + timeSec % 60 + "秒");
		}
		log.info("********************************************");
	}

	/**
	 * 识别缺省的JDBC驱动类型(g4Dao)
	 * 
	 * @throws SQLException
	 */
	private void initDbType() throws SQLException {
		Dao g4Dao = (Dao) SpringBeanLoader.getSpringBean("g4Dao");
		Connection connection = g4Dao.getConnection();
		String dbString = connection.getMetaData().getDatabaseProductName().toLowerCase();
		try {
			connection.close();
		} catch (Exception e) {
			log.error(G4Constants.Exception_Head + "未正常关闭数据库连接");
			e.printStackTrace();
		}
		if (dbString.indexOf("ora") > -1) {
			System.setProperty("g4Dao.db", "oracle");
		} else if (dbString.indexOf("mysql") > -1) {
			System.setProperty("g4Dao.db", "mysql");
		}else if (dbString.indexOf("microsoft") > -1) {
			System.setProperty("g4Dao.db", "sqlserver");
		} else {
			if (log.isErrorEnabled()) {
				log.error(G4Constants.Exception_Head + "G4Studio平台目前还不支持你使用的数据库产品.如需获得支持,请和我们联系!");
			}
			System.exit(0);
		}
	}
}
