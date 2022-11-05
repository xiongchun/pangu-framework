package com.pulanit.pangu.admin.web.config;

import com.google.common.collect.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.List;

@Configuration
public class AdminWebMvcConfigurer implements WebMvcConfigurer {

    @Autowired
    private JwtInterceptor jwtInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        InterceptorRegistration interceptorRegistration = registry.addInterceptor(jwtInterceptor);
        interceptorRegistration.addPathPatterns("/**");
        //白名单
        List<String> excludePathPatterns = Lists.newArrayList();
        excludePathPatterns.add("/**/login");
        interceptorRegistration.excludePathPatterns(excludePathPatterns);
        //Bean加载的时候有先后顺序 默认也是0 和@Order(0) 一个作用
        interceptorRegistration.order(0);
    }

}
