#### :mushroom: 本范例演示功能

1.创建一个基于原生SpringBoot框架的空应用

> :fa-hand-o-right: 这是在需要开发标准原生SpringBoot应用的特殊场景下的开发模式，依赖的`pangu-framework-parent`只提供了一点必要的非侵入依赖管理。

#### :four_leaf_clover: 如何创建&启动一个原生SpringBoot应用
-  **第一步：pom.xml** 
    ``` xml
    <parent>
        <groupId>com.gitee.pulanos.pangu</groupId>
        <artifactId>pangu-framework-parent</artifactId>
        <version>latest.version.xxx</version>
        <relativePath/>
    </parent>
    ```
-  **第二步：启动类** 

    采用SpringBoot标准启动方式启动。

    ``` java
    @SpringBootApplication
    public class EmptySpringBootApplication {
    
    	public static void main(String[] args) {
    		SpringApplication.run(EmptySpringBootApplication.class, args);
    	}
    
    	@Component
    	public class EmptyService{
    		@PostConstruct
    		public void print(){
    			log.info("这是一个完全基于SpringBoot原生框架的空项目...");
    		}
    	}
    
    }
    ```
