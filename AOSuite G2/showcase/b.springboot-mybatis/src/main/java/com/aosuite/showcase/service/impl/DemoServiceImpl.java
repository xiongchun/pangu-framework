package com.aosuite.showcase.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aosuite.showcase.dao.DemoDao;
import com.aosuite.showcase.service.DemoService;

@Service
public class DemoServiceImpl implements DemoService{
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private DemoDao demoDao;
	
	
}
