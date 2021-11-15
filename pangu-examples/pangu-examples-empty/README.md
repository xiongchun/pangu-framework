#### :mushroom: 本范例演示功能

1.创建一个基于盘古框架的空应用

#### :four_leaf_clover: 如何创建&启动一个盘古应用
-  **第一步：安装pom依赖** 
    ``` xml
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
-  **第二步：启动类** 
   
   采用SpringBoot标准启动方式启动。
   
   ``` java
   @SpringBootApplication
   public class EmptyPanguApplication {
       public static void main(String[] args) {
           PanGuApplicationBuilder.init(EmptyPanguApplication.class).run(args);
       }
       @Component
       public class EmptyService{
           @PostConstruct
           public void print(){
               log.info("这是一个基于盘古开发框架的空应用...");
           }
       }
   }
   ```
