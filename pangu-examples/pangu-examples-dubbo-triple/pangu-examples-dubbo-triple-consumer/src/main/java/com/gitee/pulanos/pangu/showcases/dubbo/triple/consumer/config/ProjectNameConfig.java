package com.gitee.pulanos.pangu.showcases.dubbo.triple.consumer.config;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.EnvironmentAware;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;

@Configuration
public class ProjectNameConfig implements EnvironmentAware {

    @Value("${spring.application.name:-}")
    private String applicationName;

    @Override
    public void setEnvironment(Environment environment) {
        // 解决 Nacos 订阅者列表的 所属应用 列为空的BUG
        System.setProperty("project.name", applicationName);
    }
}
