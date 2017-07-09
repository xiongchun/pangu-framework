package com.aosuite.showcase.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.aosuite.showcase.mapper.entity.PetBasicInfoEntity;

/**
 * 宠物基本信息单表SQL映射接口
 * 
 * @author xiongchun
 *
 */
@Mapper
public interface PetBasicInfoMapper {
	
	/**
	 * 根据主键查询实体对象
	 * 
	 * @param id
	 * @return
	 */
	PetBasicInfoEntity selectByKey(Integer id);
	
}
