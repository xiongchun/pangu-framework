#### :mushroom: 本范例演示功能

1. 如何调用一个已注册到Nacos服务中心的Dubbo远程服务

#### :four_leaf_clover: 如何开发一个Dubbo远程服务并将其注册到Nacos服务中心
- **第一步： 增加依赖**
    ```xml
        <dependency>
            <groupId>com.gitee.pulanos.pangu</groupId>
            <artifactId>pangu-framework-spring-boot-starter</artifactId>
        </dependency>
        <dependency>
            <groupId>com.gitee.pulanos.pangu</groupId>
            <artifactId>pangu-framework-dubbo-spring-boot-starter</artifactId>
        </dependency>
        <dependency>
            <groupId>com.gitee.pulanos.pangu</groupId>
            <artifactId>pangu-examples-dubbo-api</artifactId>
            <version>1.0.0</version>
        </dependency>
    ```
  
- **第二步：参数配置**
    - 本地参数配置
    ```properties
    spring.application.name=pangu-examples-dubbo-service
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
    - 远程参数配置（Nacos配置中心)
    ```properties
     dubbo.protocol.name=dubbo
     dubbo.protocol.port=20880
     dubbo.consumer.timeout=5000
     dubbo.registry.address=nacos://${nacos.config.server-addr}?namespace=${nacos.config.namespace}
     dubbo.consumer.check=false
      
     logging.level.root=INFO
     logging.level.com.gitee.pulanos.pangu=INFO
     logging.level.com.alibaba.nacos.client.config.impl.ClientWorker=WARN
     ```
 - **第三步：调用远程服务接口** 

    ```
    @Component
    public class UserAdminManager {
        @Reference(version = "1.0.0", group = "pangu-examples-dubbo-service")
        private UserService userService;
    
        public void findUserEntityById(Long id){
            log.info("开始Dubbo远程调用...");
            UserEntity userEntity = userService.findUserEntity(id);
            log.info("[OK] 调用成功 {}", userEntity);
        }
    }
    ```

 - **第四步：启动类**

    ``` java
    @EnableDubbo
    @SpringBootApplication
    @ComponentScan({"com.gitee.pulanos.pangu.showcases.dubbo"})
    public class DubboConsumerApplication {
    	public static void main(String[] args) {
    		PanGuApplicationBuilder.init(DubboConsumerApplication.class).run(args);
    	}
    }
    ```
    > :fa-bullhorn: 运行测试类参数设置 ：`-Dnacos.server-addr=ip:port`  
      (根据实际情况设置启动参数）