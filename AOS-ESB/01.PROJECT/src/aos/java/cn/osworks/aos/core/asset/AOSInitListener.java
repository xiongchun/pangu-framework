package cn.osworks.aos.core.asset;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;


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
	

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		
	}

}
