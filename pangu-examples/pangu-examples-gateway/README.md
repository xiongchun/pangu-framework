#### :mushroom: 本范例演示功能

1. 如何开发一个网关模块，实现泛华调用后端Dubbo应用。

> 盘古网关基于Apache Shenyu 网关系统开发。
>  - 支持各种语言(http 协议)，支持 Dubbo、 Spring Cloud、 gRPC、 Motan、 Sofa、 Tars 等协议。
>  - 灵活的流量筛选，能满足各种流量控制。流量配置动态化，性能极高。
>  - 内置丰富的插件支持，鉴权，限流，熔断，防火墙等等。
>  - 支持集群部署，支持 A/B Test，蓝绿发布。

#### :four_leaf_clover: 如何开发一个网关模块，实现泛华调用后端Dubbo应用
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
    <dependencies>
        <dependency>
            <groupId>com.gitee.pulanos.pangu</groupId>
            <artifactId>pangu-framework-spring-boot-starter</artifactId>
        </dependency>
        <dependency>
            <groupId>com.gitee.pulanos.pangu</groupId>
            <artifactId>pangu-framework-gateway-spring-boot-starter</artifactId>
        </dependency>
        <dependency>
            <groupId>com.gitee.pulanos.pangu</groupId>
            <artifactId>pangu-framework-dubbo-spring-boot-starter</artifactId>
        </dependency>
    </dependencies>
   ```

-  **第二步：模块的本地配置文件模版**
    ```properties
    spring.application.name=pangu-examples-gateway
    spring.profiles.active=${spring.profiles.active:dev}
    nacos.config.bootstrap.enable=true
    nacos.config.bootstrap.log-enable=true
    nacos.config.auto-refresh=true
    #对应Nacos配置中心的命名空间ID
    nacos.config.namespace=${nacos.namespace:pangu-dev}
    nacos.config.server-addr=${nacos.server-addr:127.0.0.1:8848}
    nacos.config.type=yaml
    nacos.config.data-id=${spring.application.name}.yaml
    ```  

-  **第三步：在Nacos配置中心新建配置**
    1. 在配置中心新建命名空间，命名空间ID与本地配置文件`application.properties`中的参数`nacos.config.namespace`值一致。（pangu-dev）
    2. 在`pangu-dev`命名空间下，新建配置。DataId与本地配置文件`application.properties`中的参数`nacos.config.data-id`值一致。（pangu-examples-config-remote-nacos）配置如下参数信息。
        ```yaml       
        
        ```   