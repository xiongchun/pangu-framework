package com.aosuite.showcase.petstore.service;

import org.springframework.stereotype.Service;

import com.aosuite.showcase.petstore.mapper.entity.PetBasicInfoEntity;

/**
 * 演示SpringBean注解功能
 * 
 * @author xiongchun
 *
 */
@Service
public interface PetStoreService {
	
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
