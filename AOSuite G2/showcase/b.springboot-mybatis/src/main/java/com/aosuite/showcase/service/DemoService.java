package com.aosuite.showcase.service;

import org.springframework.stereotype.Service;

import com.aosuite.showcase.mapper.entity.PetBasicInfoEntity;

/**
 * 演示SpringBean注解功能
 * 
 * @author xiongchun
 *
 */
@Service
public interface DemoService {
	
	/**
	 * 查询宠物基本信息
	 * 
	 * @return
	 */
	 PetBasicInfoEntity getPetBasicInfoEntity(Integer id);
	
}
