package com.aosuite.showcase.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aosuite.showcase.dao.DemoDao;
import com.aosuite.showcase.service.DemoService;

@Service
public class DemoServiceImpl implements DemoService{
	
	@Autowired
	private DemoDao demoDao;
	
	@Override
	public double getSum(int quantity){
		double price = demoDao.getPrice();
		double sum = price * 2.5;
		System.out.println("总价：" + sum);
		return sum;
	}
	
}
