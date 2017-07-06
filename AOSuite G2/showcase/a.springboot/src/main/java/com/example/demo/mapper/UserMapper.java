package com.example.demo.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.entity.UserEntity;

@Mapper
public interface UserMapper {

	/**
	 * 根据主键查询实体对象
	 * 
	 * @param id
	 * @return
	 */
	UserEntity selectByKey(Integer id);
	
	Map<String, Object> selectMapByKey(Integer id);
}
