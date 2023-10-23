package com.gitee.pulanos.pangu.showcases.dubbo.triple.provider.config;

import org.jetbrains.annotations.NotNull;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.EnvironmentAware;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;

@Configuration
public class ProjectNameConfig implements EnvironmentAware {

    @Value("${spring.application.name:-}")
    private String applicationName;

    @Override
    public void setEnvironment(@NotNull Environment environment) {
        System.setProperty("project.name", applicationName);
    }
}
