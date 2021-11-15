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
执行maven脚本：`mvn pangu:generate`。输出如下图所示信息。


