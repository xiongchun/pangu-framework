package cn.osworks.aos.core.asset;

import org.activiti.engine.ProcessEngine;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import cn.osworks.aos.core.AosService;
import cn.osworks.aos.core.dao.SqlDao;


/**
 * <b>应用系统上下文</b>
 * 
 * @author OSWorks-XC
 */
@SuppressWarnings("all")
public class AOSCxt {

	private static Log log = LogFactory.getLog(AOSCxt.class);

	/**
	 * 缺省的SqlDao组件
	 */
	public static SqlDao sysDao = getSysDao();

	/**
	 * 系统服务组件AosService
	 */
	public static AosService aosService = getAosService();

	/**
	 * 从Spring容器上下文中获取SpringBean组件
	 * 
	 * @param springBeaID
	 *            SpringBeaID
	 * @return
	 */
	public static Object getBean(String springBeaID) {
		Object bean = AOSBeanLoader.getSpringBean(springBeaID);
		return bean;
	}

	/**
	 * 获取系统服务组件AppService
	 * 
	 * @return
	 */
	public static AosService getAosService() {
		AosService aosService = (AosService) getBean("aosService");
		return aosService;
	}

	/**
	 * 获取缺省SqlDao组件
	 * 
	 * @return
	 */
	public static SqlDao getSysDao() {
		SqlDao sysDao = (SqlDao) getBean("sysDao");
		return sysDao;
	}

	/**
	 * 获取指定ID的SqlDao组件
	 * 
	 * @param springBeaID
	 * @return
	 */
	public static SqlDao getSysDao(String sysDaoID) {
		SqlDao sysDao = (SqlDao) getBean(sysDaoID);
		return sysDao;
	}
	
	/**
	 * 获取缺省流程处理引擎
	 * 
	 * @return
	 */
	public static ProcessEngine getProcessEngine() {
		ProcessEngine processEngine = (ProcessEngine) getBean("processEngine");
		return processEngine;
	}

}
