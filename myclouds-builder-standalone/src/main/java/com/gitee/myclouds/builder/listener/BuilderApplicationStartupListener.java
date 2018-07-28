package com.gitee.myclouds.builder.listener;

import java.sql.SQLException;

import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;

import com.gitee.myclouds.builder.service.BuildDomainService;

/**
 * 应用启动监听器
 * 
 * @author xiongchun
 * @date 2017-01-01
 */
public class BuilderApplicationStartupListener implements ApplicationListener<ContextRefreshedEvent>{
	
	@Override
	public void onApplicationEvent(ContextRefreshedEvent event) {
		ApplicationContext applicationContext = event.getApplicationContext();
		BuildDomainService buildDomainService = (BuildDomainService)applicationContext.getBean("buildDomainService");
		try {
			buildDomainService.buildDomain();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


}
