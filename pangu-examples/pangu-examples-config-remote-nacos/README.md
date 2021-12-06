#### :mushroom: 范例演示功能
1. 如何获取Nacos配置中心的远程配置参数。
2. 参数值修改后动态刷新Nacos配置数据。

> :fa-thumbs-o-up: 使用Nacos配置中心对参数进行统一配置和管理是盘古应用的标准开发模式。当然，盘古开发框架也可以支持本地配置的开发模式，具体请参阅本地配置模式开发的相关范例。

#### :four_leaf_clover: 如何获取配置中心的配置参数
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
    spring.application.name=pangu-examples-config-remote-nacos
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
    1. 在配置中心新建命名空间，命名空间ID与本地配置文件`application.properties`中的参数`nacos.config.namespace`值一致。（pangu-dev）
    2. 在`pangu-dev`命名空间下，新建配置。DataId与本地配置文件`application.properties`中的参数`nacos.config.data-id`值一致。（pangu-examples-config-remote-nacos）配置如下参数信息。
        ```properties
        # 演示参数配置
        demo.app.id=XC001001
        demo.app.name=盘古开发框架
        demo.app.author=普蓝开源社区
        
        logging.level.root=INFO
        logging.level.com.gitee.pulanos.pangu=INFO
        logging.level.com.alibaba.nacos.client.config.impl.ClientWorker=WARN
        ```

- **第四步：使用@NacosValue注解获取参数值** 
    ```java
    /**
     * 开启 autoRefreshed配置项, 可以实现参数的动态刷新
     */
    @NacosValue(value = "${demo.app.id}")
    private String appId;
    @NacosValue(value = "${demo.app.name}", autoRefreshed = true)
    private String appName;
    @NacosValue(value = "${demo.app.author}", autoRefreshed = true)
    private String appAuthor;
    ```

#### :blossom: 动态刷新配置数据

登录Nacos配置中心，修改对应参数值，查看控制台正在循环输出日志的变化情况。以验证动态刷新配置数据功能。
```
2021-09-15 12:28:30.005  INFO : 参数appId：XC001001
2021-09-15 12:28:30.005  INFO : 参数appName：盘古开发框架
2021-09-15 12:28:30.005  INFO : 参数appAuthor：普蓝开源社区
```
