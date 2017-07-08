package com.aosuite.showcase.service;

import org.springframework.stereotype.Service;

/**
 * 演示SpringBean注解功能
 * 
 * @author xiongchun
 *
 */
@Service
public interface DemoService {

    /**
     * 计算应付金额
     * 
     * @param quantity 数量
     * @return
     */
	double getSum(int quantity);
	
	/**
	 * 日志输出
	 */
	void log();
	
}
