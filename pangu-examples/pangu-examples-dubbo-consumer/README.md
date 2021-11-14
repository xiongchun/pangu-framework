#### :mushroom: 本范例演示功能

1. 如何调用一个已注册到Nacos服务中心的Dubbo远程服务

#### :four_leaf_clover: 如何开发一个Dubbo远程服务并将其注册到Nacos服务中心
-  **第一步：[pom.xml](https://gitee.com/pulanos/pangu-showcases/blob/master/pangu-showcases-dubbo-consumer/pom.xml)** 增加依赖
    ``` xml
        <dependency>
            <groupId>com.gitee.pulanos.pangu</groupId>
            <artifactId>pangu-showcases-dubbo-api</artifactId>
            <version>1.0.0</version>
        </dependency>
        <dependency>
            <groupId>org.apache.dubbo</groupId>
            <artifactId>dubbo-spring-boot-starter</artifactId>
        </dependency>
        <dependency>
            <groupId>org.apache.dubbo</groupId>
            <artifactId>dubbo-registry-nacos</artifactId>
        </dependency>
    ```
- **第二步：参数配置** 
  - 本地参数配置（[application.properties](https://gitee.com/pulanos/pangu-showcases/blob/master/pangu-showcases-dubbo-consumer/src/main/resources/application.properties))
    ```
    spring.application.name=pangu-showcases-dubbo-provider
    spring.profiles.active=${active}
    nacos.config.bootstrap.enable=true
    nacos.config.bootstrap.log-enable=true
    nacos.config.auto-refresh=true
    #同名的远程配置将覆盖本地配置
    nacos.config.remote-first=true
    #对应Nacos配置中心的命名空间ID
    nacos.config.namespace=pangu-${active}
    nacos.config.server-addr=${nacos.url}
    nacos.config.type=properties
    nacos.config.data-id=${spring.application.name}.properties
    ```
  - 远程参数配置（Nacos配置中心)
    ```
    server.port=8090
    
    dubbo.protocol.name=dubbo
    dubbo.protocol.port=-1
    dubbo.consumer.timeout=5000
    dubbo.registry.address=nacos://${nacos.url}/?username=${nacos.username}&password=${nacos.password}&namespace=pangu-${active}
    dubbo.consumer.check=false
    
    logging.level.root=INFO
    logging.level.com.gitee.pulanos.pangu=INFO
    logging.level.com.alibaba.nacos.client.config.impl.ClientWorker=WARN
    ```
 - **第三步：[调用远程服务接口](https://gitee.com/pulanos/pangu-showcases/blob/master/pangu-showcases-dubbo-consumer/src/main/java/com/gitee/pulanos/pangu/showcases/dubbo/consumer/manager/UserAdminManager.java)** 

    ```
    @Component
    public class UserAdminManager {
        @Reference(version = "1.0.0", group = "pangu-showcases-dubbo-service")
        private UserService userService;
    
        public void findUserEntityById(Long id){
            log.info("开始Dubbo远程调用...");
            UserEntity userEntity = userService.findUserEntity(id);
            log.info("[OK] 调用成功 {}", userEntity);
        }
    }
    ```

 - **第四步：[启动类](https://gitee.com/pulanos/pangu-showcases/blob/master/pangu-showcases-dubbo-consumer/src/main/java/com/gitee/pulanos/pangu/showcases/DubboConsumerApplication.java)**

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
 - **第五步：[测试类](https://gitee.com/pulanos/pangu-showcases/blob/master/pangu-showcases-dubbo-consumer/src/test/java/com/gitee/pulanos/pangu/showcases/dubbo/consumer/ConsumerTest.java)**

    ```
    @RunWith(SpringRunner.class)
    @SpringBootTest
    public class ConsumerTest {
        @Autowired
        private UserAdminManager userAdminManager;
        @Test
        public void findUserTest() {
            userAdminManager.findUserEntityById(1L);
        }
    }
    ```
    > :fa-bullhorn: 运行测试类参数设置 ：`-Dactive=dev -Dnacos.url=127.0.0.1:8848 -Dnacos.username=xxxx -Dnacos.password=****`  
      (根据实际情况设置启动参数中Nacos配置中心的连接和认证信息）