package com.aosuite.showcase.petstore.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aosuite.showcase.petstore.dao.PetStoreDao;
import com.aosuite.showcase.petstore.mapper.PetBasicInfoMapper;
import com.aosuite.showcase.petstore.mapper.entity.PetBasicInfoEntity;

@Repository
public class PetStoreDaoImpl implements PetStoreDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private PetBasicInfoMapper petBasicInfoMapper;

	@Override
	public PetBasicInfoEntity getPetBasicInfoEntity(Integer id) {
		//调用代码生成根据自动生成的SQL
		return petBasicInfoMapper.selectByKey(id);
	}
	
	@Override
	public Integer getAvgPetAge() {
		//调用手工编写的自定义SQL
		Integer avgAge = sqlSession.selectOne("PetStore.avgPetAge");
		return avgAge;
	}

}
