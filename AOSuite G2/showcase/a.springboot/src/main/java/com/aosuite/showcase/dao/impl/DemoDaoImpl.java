package com.aosuite.showcase.dao.impl;

import org.springframework.stereotype.Repository;

import com.aosuite.showcase.dao.DemoDao;

@Repository
public class DemoDaoImpl implements DemoDao {

	@Override
	public double getPrice() {
		
		return 2.5;
	}

}
