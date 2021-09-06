package com.gitee.pulanos.pangu.framework;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.WebApplicationType;
import org.springframework.context.ConfigurableApplicationContext;

/**
 * 创建 {@link SpringApplication} 和 {@link ConfigurableApplicationContext} 实例。
 *
 * <p>
 * 基于PanGu框架开发请通过{@link PanGuApplicationBuilder}来完成应用的创建和上下文初始化。
 *
 * @author xiongchun
 * @since PanGu 5.0.0
 * @see SpringApplication
 * @see ConfigurableApplicationContext
 */
public class PanGuApplicationBuilder{

    private final SpringApplication application;

    private ConfigurableApplicationContext context;

    public PanGuApplicationBuilder(Class<?>... sources) {
        this.application = createSpringApplication(sources);
    }

    /**
     * 创建一个新的 {@link SpringApplication} 实例
     * @param sources the sources
     * @return {@link SpringApplication} 实例
     */
    protected SpringApplication createSpringApplication(Class<?>... sources) {
        return new SpringApplication(sources);
    }

    /**
     * 访问当前应用上下文
     * @return ApplicationContext (or null if not yet running)
     */
    public ConfigurableApplicationContext context() {
        return this.context;
    }

    /**
     * 访问当前应用
     * @return the current application (never null)
     */
    public SpringApplication application() {
        return this.application;
    }

    /**
     * 指定应用启动类型
     * <p>Auto-detected basedon the classpath if not set.
     * @param webApplicationType the type of web application
     * @return the current builder
     */
    public PanGuApplicationBuilder web(WebApplicationType webApplicationType) {
        this.application.setWebApplicationType(webApplicationType);
        return this;
    }

    /**
     * 创建应用上下文（启动）
     * @param args the command line arguments
     * @return an application context created from the current state
     */
    public ConfigurableApplicationContext run(String... args) {
        this.context = this.application.run(args);
        return this.context;
    }

}
