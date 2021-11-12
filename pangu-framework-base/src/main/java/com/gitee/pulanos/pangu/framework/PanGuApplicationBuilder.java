package com.gitee.pulanos.pangu.framework;

import cn.hutool.core.util.StrUtil;
import lombok.extern.slf4j.Slf4j;
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
@Slf4j
public class PanGuApplicationBuilder{

    private final SpringApplication application;

    private ConfigurableApplicationContext context;

    public PanGuApplicationBuilder(Class<?>... sources) {
        this.application = createSpringApplication(sources);
    }

    /**
     * 初始化应用构造器
     * @param sources
     * @return
     */
    public static PanGuApplicationBuilder init(Class<?>... sources){
        return new PanGuApplicationBuilder(sources);
    }
    /**
     * 创建一个新的 {@link SpringApplication} 实例
     * @param sources the sources
     * @return {@link SpringApplication} 实例
     */
    protected SpringApplication createSpringApplication(Class<?>... sources) {
        SpringApplication springApplication = new SpringApplication(sources);;
        return springApplication;
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
        String info = Constants.Msg.START;
        if (log.isInfoEnabled()){
            log.info(info);
        }else {
            System.out.println(info);
        }
        try{
            this.preCheckpoint();
            this.context = this.application.run(args);
            this.startedEvent();
        }catch (Exception e) {
            log.error("{} 异常摘要：{}", Constants.Msg.START_ERROR, e.getMessage());
            e.printStackTrace();
            System.exit(1);
        }
        return this.context;
    }

    /**
     * 启动参数必要检查点
     */
    private void preCheckpoint(){
        String active = System.getProperty("active");
        String nacosUrl = System.getProperty("nacos.url");
        if (StrUtil.isEmpty(active) || StrUtil.isEmpty(nacosUrl)){
            String cfgMsg = "-Dactive=dev -Dnacos.url=127.0.0.1:8848 -Dnacos.username=xxxx -Dnacos.password=****";
            String errMsg = StrUtil.format("未配置启动参数。配置示例：[{}]", cfgMsg);
            throw new IllegalArgumentException(errMsg);
        }else {
            String paramsMsg = StrUtil.format("启动参数：-Dactive={} -Dnacos.url={} -D...", active, nacosUrl);
            if (log.isInfoEnabled()){
                log.info(paramsMsg);
            }else {
                System.out.println(paramsMsg);
            }
        }
    }

    /**
     * 启动成功事件
     */
    private void startedEvent(){
        String info = Constants.Msg.START_SUCCESS;
        if (log.isInfoEnabled()){
            log.info(info);
        }else {
            System.out.println(info);
        }
    }

}
