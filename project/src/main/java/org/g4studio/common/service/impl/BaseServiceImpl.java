package org.g4studio.common.service.impl;

import org.g4studio.common.dao.Dao;
import org.g4studio.common.service.BaseService;
import org.g4studio.core.properties.PropertiesFactory;
import org.g4studio.core.properties.PropertiesFile;
import org.g4studio.core.properties.PropertiesHelper;

/**
 * 业务模型实现基类<br>
 * 
 * @author OSWorks-XC
 * @since 2009-07-21
 */
public class BaseServiceImpl implements BaseService {

	/**
	 * 基类中给子类暴露的一个DAO接口<br>
	 * 连接平台数据库
	 */
	protected Dao g4Dao;

	protected static PropertiesHelper g4PHelper = PropertiesFactory.getPropertiesHelper(PropertiesFile.G4);
	
	protected static PropertiesHelper appPHelper = PropertiesFactory.getPropertiesHelper(PropertiesFile.APP);
    
	public void setG4Dao(Dao g4Dao) {
		this.g4Dao = g4Dao;
	}
}
