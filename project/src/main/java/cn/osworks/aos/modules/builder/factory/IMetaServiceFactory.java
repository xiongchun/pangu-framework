package cn.osworks.aos.modules.builder.factory;

import cn.osworks.aos.base.asset.AOSBeanLoader;
import cn.osworks.aos.base.exception.AOSException;

/**
 * <b>元数据服务代理工厂</b>
 * 
 * @author OSWorks-XC
 * @date 2013-06-06
 */
public class IMetaServiceFactory {

	/**
	 * 返回特定数据库类型的元数据服务实现
	 * 
	 * @param dbName
	 * @return
	 */
	public static IMetaService getService(String dbName) {
		IMetaService service = null;
		if ("postgresql".equalsIgnoreCase(dbName)) {
			service = (IMetaService) AOSBeanLoader.getSpringBean("postgresqlService");
		} else {
			throw new AOSException("sys-200");
		}
		return service;
	}

}
