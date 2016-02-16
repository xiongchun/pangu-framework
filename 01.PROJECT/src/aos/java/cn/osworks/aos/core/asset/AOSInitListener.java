package cn.osworks.aos.core.asset;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.system.modules.service.log.LogService;


/**
 * <b>系统启动监听器</b>
 * 
 * @author OSWorks-XC
 * @date 2010-04-13
 */
public class AOSInitListener implements ServletContextListener{

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		initSystemVars(sce.getServletContext());
		deleteSessionLogs();
	}
	
	/**
	 * 设置系统变量
	 * 
	 * @param servletContext
	 */
	private void initSystemVars(ServletContext servletContext){
		String cxtString = servletContext.getContextPath();
		System.setProperty(AOSCons.CXT_KEY, cxtString);
	}
	
	/**
	 * 重置会话日志
	 * 
	 * @param servletContext
	 */
	private void deleteSessionLogs(){
		LogService logService = (LogService)AOSBeanLoader.getSpringBean("logService");
		logService.deleteSessionLogs(Dtos.newDto());
	}
	

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		
	}

}
