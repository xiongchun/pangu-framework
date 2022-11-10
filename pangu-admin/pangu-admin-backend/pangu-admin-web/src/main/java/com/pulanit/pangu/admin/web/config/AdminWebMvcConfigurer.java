package com.pulanit.pangu.admin.web.config;

import com.google.common.collect.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.List;

@Configuration
public class AdminWebMvcConfigurer implements WebMvcConfigurer {

    @Autowired
    private JwtInterceptor jwtInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        regJwt(registry);
    }

    private void regJwt(InterceptorRegistry registry){
        List<String> excludePathPatterns = Lists.newArrayList();
        excludePathPatterns.add("/**/login");
        registry.addInterceptor(jwtInterceptor).addPathPatterns("/**").excludePathPatterns(excludePathPatterns);
    }

}
