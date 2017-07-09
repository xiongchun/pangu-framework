package com.aosuite.showcase.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aosuite.showcase.dao.DemoDao;
import com.aosuite.showcase.mapper.PetBasicInfoMapper;
import com.aosuite.showcase.mapper.entity.PetBasicInfoEntity;

@Repository
public class DemoDaoImpl implements DemoDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private PetBasicInfoMapper petBasicInfoMapper;

	@Override
	public PetBasicInfoEntity getPetBasicInfoEntity(Integer id) {
		
		return petBasicInfoMapper.selectByKey(id);
	}

}
