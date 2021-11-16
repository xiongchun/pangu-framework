#### :mushroom: 范例演示功能
1. 使用本地配置文件的方式进行应用配置

> :fa-thumbs-o-up: 为了满足一些特殊的场景，我们可以使用这种基于本地配置文件的开发模式。但使用Nacos配置中心对参数进行统一配置和管理才是盘古应用的标准开发模式，详情请参阅范例`pangu-examples-config-remote-nacos`。

#### :four_leaf_clover: 基于本地配置文件的开发模式
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

-  **第二步：本地配置文件** 

    ```
    spring.application.name=pangu-examples-config-local
    demo.app.id=1000001
    ```

- **第三步：使用@NacosValue注解获取参数值** 
    ```java
        @SpringBootApplication
        public class LocalConfigurationApplication {
        
            public static void main(String[] args) {
                PanGuApplicationBuilder.init(LocalConfigurationApplication.class).run(args);
            }
        
            @Component
            public class LocalConfiguration {
        
                @NacosValue("${demo.app.id}")
                private String appId;
                @NacosValue("${spring.application.name}")
                private String appName;
        
                @PostConstruct
                @Scheduled
                public void execute() {
                    log.info("演示获取本地配置数据");
                    log.info("参数appId：{}", appId);
                    log.info("参数appName：{}", appName);
                }
            }
        }
    ```
