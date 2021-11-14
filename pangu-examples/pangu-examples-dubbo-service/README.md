#### :mushroom: 本范例演示功能

1. 如何开发一个Dubbo远程服务并将其注册到Nacos服务中心

#### :four_leaf_clover: 如何开发一个Dubbo远程服务并将其注册到Nacos服务中心
-  **第一步：[pom.xml](https://gitee.com/pulanos/pangu-showcases/blob/master/pangu-showcases-dubbo-provider/pom.xml)** 增加依赖
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
  - 本地参数配置（[application.properties](https://gitee.com/pulanos/pangu-showcases/blob/master/pangu-showcases-dubbo-provider/src/main/resources/application.properties))
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
    server.port=8080
    
    dubbo.protocol.name=dubbo
    dubbo.protocol.port=-1
    dubbo.consumer.timeout=5000
    dubbo.registry.address=nacos://${nacos.url}/?username=${nacos.username}&password=${nacos.password}&namespace=pangu-${active}
    dubbo.consumer.check=false
    
    logging.level.root=INFO
    logging.level.com.gitee.pulanos.pangu=INFO
    logging.level.com.alibaba.nacos.client.config.impl.ClientWorker=WARN
    ```
 - **第三步：[实现远程服务接口 `UserServiceImpl`](https://gitee.com/pulanos/pangu-showcases/blob/master/pangu-showcases-dubbo-provider/src/main/java/com/gitee/pulanos/pangu/showcases/dubbo/provider/service/UserServiceImpl.java)** 

```
    @Service(version = "1.0.0", group = "pangu-showcases-dubbo-service")
    public class UserServiceImpl implements UserService {
        @Override
        public UserEntity findUserEntity(Long id) {
            log.info("参数ID：{}", id);
            UserEntity userEntity = new UserEntity();
            userEntity.setId(id);
            userEntity.setName("云南码农大熊");
            return userEntity;
        }
    }
```

 - **第四步：[启动类](https://gitee.com/pulanos/pangu-showcases/blob/master/pangu-showcases-dubbo-provider/src/main/java/com/gitee/pulanos/pangu/showcases/DubboProviderApplication.java)**

    ``` java
    @EnableDubbo
    @SpringBootApplication
    @ComponentScan({"com.gitee.pulanos.pangu.showcases.dubbo"})
    public class DubboProviderApplication {
    	public static void main(String[] args) {
    		PanGuApplicationBuilder.init(DubboProviderApplication.class).run(args);
    	}
    }
    ```
    > :fa-bullhorn: 启动参数设置 ：`-Dactive=dev -Dnacos.url=127.0.0.1:8848 -Dnacos.username=xxxx -Dnacos.password=****`  
      (根据实际情况设置启动参数中Nacos配置中心的连接和认证信息）

 - **第五步：查看服务注册中心已注册的Dubbo服务**

    成功启动应用后，即可在Naocs服务注册中心页查看效果。如下图所示。

![盘古开发Dubbo服务](https://images.gitee.com/uploads/images/2021/1101/095150_5b057bdd_431745.png "盘古开发Dubbo服务.png")
