package com.gitee.pulanos.pangu.framework;

import org.springframework.boot.SpringApplication;
import org.springframework.context.ConfigurableApplicationContext;

/**
 * PanGu Application Bootstrap Main Class
 * 
 * @author xiongchun
 * @since 4.0.0
 */
public class PanguApp {

    private PanguApp() {
        // the default constructor is not visible
    }

    /**
     * startup
     * 
     * @param primarySource
     * @param panguAppType {@link PanguAppType}
     * @param args
     * @return
     */
    public static ConfigurableApplicationContext run(Class<?> primarySource, PanguAppType panguAppType, String... args) {
        SpringApplication application = new SpringApplication(primarySource);
        application.setWebApplicationType(PanguAppType.toWebApplicationType(panguAppType));
        return application.run(args);
    }

}
