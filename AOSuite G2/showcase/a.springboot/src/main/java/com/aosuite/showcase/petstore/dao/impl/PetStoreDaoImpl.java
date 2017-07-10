package com.aosuite.showcase.petstore.dao.impl;

import org.springframework.stereotype.Repository;

import com.aosuite.showcase.petstore.dao.PetStoreDao;

@Repository
public class PetStoreDaoImpl implements PetStoreDao {

	@Override
	public double getPrice() {
		
		return 2.5;
	}

}
