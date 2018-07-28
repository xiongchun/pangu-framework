package com.gitee.myclouds.admin.web;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.cloud.netflix.feign.EnableFeignClients;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;

import com.gitee.myclouds.admin.web.common.filters.AuthFilter;
import com.gitee.myclouds.admin.web.common.filters.LoginFilter;
import com.gitee.myclouds.admin.web.common.filters.RequestFilter;

@SpringBootApplication
@EnableFeignClients
@ComponentScan(basePackages={"com.gitee.myclouds"}) 
public class StartAdminWebApplication {

	public static void main(String[] args) throws Exception {
		SpringApplication.run(StartAdminWebApplication.class, args);
	}
	
	@Bean  
    public FilterRegistrationBean  requestFilter() {
        FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean();  
        filterRegistrationBean.setFilter(new RequestFilter());
        filterRegistrationBean.setOrder(1);
        return filterRegistrationBean;  
    } 
	
	@Bean  
    public FilterRegistrationBean  loginFilter() {
        FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean();  
        filterRegistrationBean.setFilter(new LoginFilter());
        filterRegistrationBean.setOrder(2);
        return filterRegistrationBean;  
    } 
	
	@Bean  
    public FilterRegistrationBean  AuthFilter() {
        FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean();  
        filterRegistrationBean.setFilter(new AuthFilter());
        filterRegistrationBean.setOrder(3);
        return filterRegistrationBean;  
    }
	
}
