package com.aosuite.showcase.petstore.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.aosuite.showcase.petstore.dao.PetStoreDao;
import com.aosuite.showcase.petstore.mapper.entity.PetBasicInfoEntity;
import com.aosuite.showcase.petstore.service.PetStoreService;

@Service
public class PetStoreServiceImpl implements PetStoreService{
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private PetStoreDao petStoreDao;
	
	//Service也可以直接注入mapper组件，但是不建议这么干。
	//@Autowired
	//private PetBasicInfoMapper petBasicInfoMapper;
	
	//Service也可以直接注入SqlSession，直接调用具体的某个SQL语句，但也不建议这么干。
	//@Autowired
	//private SqlSession sqlSession;
	
	@Override
	public PetBasicInfoEntity getPetBasicInfoEntity(Integer id){
		PetBasicInfoEntity petBasicInfoEntity = petStoreDao.getPetBasicInfoEntity(id);
		logger.info("宠物实体对象：{}", JSON.toJSONString(petBasicInfoEntity));
		return petBasicInfoEntity;
	}
	
	@Override
	public Integer getAvgPetAge(){
		Integer avgAge = petStoreDao.getAvgPetAge();
		logger.info("宠物平均年龄：{}", avgAge);
		return avgAge;
	}
}
