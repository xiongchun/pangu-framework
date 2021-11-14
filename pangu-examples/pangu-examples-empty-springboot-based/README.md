#### :mushroom: 本范例演示功能

1. 如何初始化创建一个基本的盘古空应用
2. 应用日志输出级别的动态热切换演示
3. 如何启动盘古应用（启动参数配置）

#### :four_leaf_clover: 如何创建&启动一个盘古空应用
-  **第一步：[pom.xml](https://gitee.com/pulanos/pangu-showcases/blob/master/pangu-showcases-empty/pom.xml)** 
    ``` xml
    <parent>
        <groupId>com.gitee.pulanos.pangu</groupId>
        <artifactId>pangu-framework-parent</artifactId>
        <version>5.0.1</version>
        <relativePath/>
    </parent>
    ```
- **第二步：参数配置** 
  - 本地参数配置（[application.properties](https://gitee.com/pulanos/pangu-showcases/blob/master/pangu-showcases-empty/src/main/resources/application.properties))
    ```
    spring.application.name=pangu-showcases-empty
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
    
    logging.level.root=INFO
    logging.level.com.gitee.pulanos.pangu=INFO
    logging.level.com.alibaba.nacos.client.config.impl.ClientWorker=WARN
    ```
    > 关于Nacos的安装和基本使用请查看盘古开发相关文档。

-  **第三步：[启动类](https://gitee.com/pulanos/pangu-showcases/blob/master/pangu-showcases-empty/src/main/java/com/gitee/pulanos/pangu/showcases/EmptyApplication.java)** 

    ``` java
    @SpringBootApplication
    @ComponentScan({"com.gitee.pulanos.pangu"})
    public class EmptyApplication {
        public static void main(String[] args) {
            PanGuApplicationBuilder.init(EmptyApplication.class).run(args);
        }
    }
    ```
    > :fa-bullhorn: 启动参数设置 ：`-Dactive=dev -Dnacos.url=127.0.0.1:8848 -Dnacos.username=xxxx -Dnacos.password=****`  
      (根据实际情况设置启动参数中Nacos配置中心的连接和认证信息）

#### :rose: 应用日志输出级别的动态热切换演示

登录Nacos配置中心，修改如下log输出级别，查看控制台正在循环输出日志的变化情况。以验证日志级别的动态热切换功能。

    ```
    logging.level.root=INFO
    logging.level.com.gitee.pulanos.pangu=INFO
    logging.level.com.alibaba.nacos.client.config.impl.ClientWorker=WARN
    ```
