#### :mushroom: 范例演示功能
1. 如何在线热切换日志输出级别。

> :fa-thumbs-o-up: 通过在Nacos配置中心修改日志级别配置参数，应用监听日志级别参数变更并动态刷新日志级别。

#### :four_leaf_clover: 如何在线热切换日志级别
-  **第一步：安装pom依赖**

    ```xml
    <parent>
        <groupId>com.gitee.pulanos.pangu</groupId>
        <artifactId>pangu-framework-parent</artifactId>
        <version>latest.version.xxx</version>
        <relativePath/>
    </parent>
    ```
    ```xml
    <dependency>
        <groupId>com.gitee.pulanos.pangu</groupId>
        <artifactId>pangu-framework-spring-boot-starter</artifactId>
    </dependency>
    ```

-  **第二步：模块的本地配置文件模版** 

    ```properties
    spring.application.name=pangu-examples-log-dynamic
    spring.profiles.active=${spring.profiles.active:dev}
    nacos.config.bootstrap.enable=true
    nacos.config.bootstrap.log-enable=true
    nacos.config.auto-refresh=true
    #对应Nacos配置中心的命名空间ID
    nacos.config.namespace=${nacos.namespace:pangu-dev}
    nacos.config.server-addr=${nacos.server-addr:127.0.0.1:8848}
    nacos.config.type=properties
    nacos.config.data-id=${spring.application.name}.properties
    ```

-  **第三步：在Nacos配置中心新建配置** 
    
    在配置中心命名空间（`nacos.config.namespace`值）下，新建DataId为`pangu-examples-log-dynamic.properties`的配置文件。
    ```properties
    # 演示如何在线热切换日志级别
    logging.level.root=INFO
    logging.level.com.gitee.pulanos.pangu=INFO
    logging.level.com.alibaba.nacos.client.config.impl.ClientWorker=WARN
    ```

- **第四步：启动&验证效果** 
  
    > 请在Nacos控制台修改日志级别后查看输出效果。

    ``` java
    @SpringBootApplication
    public class DynamicLogApplication {
    
        public static void main(String[] args) {
            PanGuApplicationBuilder.init(DynamicLogApplication.class).run(args);
        }
    
        @Component
        public class DynamicLogExample {
    
            @PostConstruct
            public void execute() {
                CronUtil.schedule("*/10 * * * * *", new Task() {
                    @Override
                    public void execute() {
                        Console.log("演示日志级别热切换功能，请在Nacos控制台修改日志级别后查看输出效果");
                        log.trace("这是trace信息");
                        log.debug("这是debug信息");
                        log.info("这是info信息");
                        log.warn("这是warn信息");
                        log.error("这是error信息");
                    }
                });
                CronUtil.setMatchSecond(true);
                CronUtil.start();
            }
    
        }
    
    }
    ```
