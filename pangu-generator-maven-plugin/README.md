#### :mushroom: 代码生成器介绍

盘古代码生成器以Maven插件的方式提供，可以方便的辅助生成符合盘古应用开发规范的模版代码。目前版本支持生成实体类、MyBatis(Plus) Mapper接口。

#### :four_leaf_clover: 安装&配置
```xml
<plugin>
    <groupId>com.gitee.pulanos.pangu</groupId>
    <artifactId>pangu-framework-generator-maven-plugin</artifactId>
    <version>5.0.6</version>
    <configuration>
        <url>jdbc:mysql://127.0.0.1:3306/pangu-examples</url>
        <user>root</user>
        <password>root123456</password>
        <tables>user</tables>
        <author>普蓝开源社区</author>
        <!-- 可以使用绝对路径 -->
        <entityFilePath>${project.basedir}/src/main/java/com/gitee/pulanos/pangu/showcases/crud/dao/entity</entityFilePath>
        <entityPackageName>com.gitee.pulanos.pangu.showcases.crud.dao.entity</entityPackageName>
        <mapperFilePath>${project.basedir}/src/main/java/com/gitee/pulanos/pangu/showcases/crud/dao/mapper</mapperFilePath>
        <mapperPackageName>com.gitee.pulanos.pangu.showcases.crud.dao.mapper</mapperPackageName>
    </configuration>
</plugin>
```
#### :tw-2708: 执行插件
执行maven脚本：`mvn pangu:generate`。输出如下所示信息。
```log
xc@xc-mac pangu-examples-crud % mvn pangu:generate
[INFO] Scanning for projects...
[INFO] 
[INFO] ------------< com.gitee.pulanos.pangu:pangu-examples-crud >-------------
[INFO] Building pangu-examples-crud 1.0.0
[INFO] --------------------------------[ jar ]---------------------------------
[INFO] 
[INFO] --- pangu-framework-generator-maven-plugin:5.0.6:generate (default-cli) @ pangu-examples-crud ---
[INFO] 开始生成数据表[user]对应的实体对象...
[INFO] UserEntity.java 生成成功。文件路径：/Users/xc/git2/pangu-framework/pangu-examples/pangu-examples-crud/src/main/java/com/gitee/pulanos/pangu/showcases/crud/dao/entiity.java
[INFO] 开始生成数据表[user]对应的数据访问接口...
[INFO] UserMapper.java 生成成功。文件路径：/Users/xc/git2/pangu-framework/pangu-examples/pangu-examples-crud/src/main/java/com/gitee/pulanos/pangu/showcases/crud/dao/mapper/UserMapper.java
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  1.291 s
[INFO] Finished at: 2021-11-15T21:54:22+08:00
[INFO] ------------------------------------------------------------------------
```


