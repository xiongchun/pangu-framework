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
	
	@Override
	public double getSum(int quantity){
		double price = demoDao.getPrice();
		double sum = price * 2.5;
		logger.info("总价：{}", sum);
		return sum;
	}

	@Override
	public void log() {
		logger.debug("日志测试，这是{}","调试信息[DEBUG]");
		logger.info("{}测试，这是{}","日志", "提示信息[INFO]");
		logger.warn("日志测试，这是警告信息[WARN]");
		logger.error("日志测试，这是出错信息[ERROR]");
	}
	
}
