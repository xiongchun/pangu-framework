package cn.osworks.aos.core.asset;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import cn.osworks.aos.core.dao.SqlDao;
import cn.osworks.aos.system.dao.po.Aos_sys_dicPO;
import cn.osworks.aos.system.service.AOSService;


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
	public static SqlDao sqlDao = getSqlDao("sqlDao");

	/**
	 * 系统服务组件AosService
	 */
	public static AOSService aosService = getAosService();

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
	public static AOSService getAosService() {
		AOSService aosService = (AOSService) getBean("aosService");
		return aosService;
	}

	/**
	 * 获取指定ID的SqlDao组件
	 * 
	 * @param springBeaID
	 * @return
	 */
	public static SqlDao getSqlDao(String sqlDaoID) {
		SqlDao sqlDao = (SqlDao) getBean(sqlDaoID);
		return sqlDao;
	}
	
	/**
	 * 从XML参数配置文中根据参数键获取参数值
	 * 
	 * @param key
	 *            参数键
	 * @return
	 */
	public static String getCfgOfXML(String key) {
		String valueString = AOSXmlOptionsHandler.getValue(key);
		return valueString;
	}

	/**
	 * 从Properties参数配置文中根据参数键获取参数值
	 * 
	 * @param key
	 *            参数键
	 * @return
	 */
	public static String getCfgOfProperties(String key) {
		String valueString = AOSPropertiesHandler.getProperty(key);
		return valueString;
	}

	/**
	 * 根据数据字典标识键获取字典对照集合
	 * 
	 * @param dickey
	 *            数据字典标识键
	 * @return
	 */
	public static List<Aos_sys_dicPO> getDicList(String dickey) {
		List<Aos_sys_dicPO> dicList = AOSCxt.aosService.getAosSysDicPOListFromCache(dickey);
		return dicList;
	}

	/**
	 * 根据数据字典标识键和字典对照代码获取字典对照值
	 * 
	 * @param dickey
	 *            数据字典标识键
	 * @param code
	 *            数据字典对照代码
	 * @return
	 */
	public static String getDicCodeDesc(String dickey, String code) {
		String desc = "";
		List<Aos_sys_dicPO> dicList = AOSCxt.aosService.getAosSysDicPOListFromCache(dickey);
		for (Aos_sys_dicPO aos_sys_dicPO : dicList) {
			if (aos_sys_dicPO.getCode_().equals(code)) {
				desc = aos_sys_dicPO.getDesc_();
				break;
			}
		}
		return desc;
	}

}
