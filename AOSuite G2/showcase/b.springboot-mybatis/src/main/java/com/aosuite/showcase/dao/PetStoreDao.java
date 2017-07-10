package com.aosuite.showcase.dao;

import com.aosuite.showcase.mapper.entity.PetBasicInfoEntity;

/**
 * 数据访问对象
 * 
 * @author xiongchun
 *
 */
public interface PetStoreDao {
	
	/**
	 * 查询宠物基本信息
	 * 
	 * @return
	 */
	 PetBasicInfoEntity getPetBasicInfoEntity(Integer id);
	 
	 /**
	  * 统计宠物平均年龄
	  * 
	  * @return
	  */
	 Integer getAvgPetAge();
}
