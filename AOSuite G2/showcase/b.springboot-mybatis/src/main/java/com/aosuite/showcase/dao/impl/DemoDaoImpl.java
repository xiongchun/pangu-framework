package com.aosuite.showcase.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aosuite.showcase.dao.DemoDao;

@Repository
public class DemoDaoImpl implements DemoDao {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public double getPrice() {
		
		return 2.5;
	}

}
