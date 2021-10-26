### 介绍

盘古开发框架(PanGu Dev Framework)是[普蓝开源](https://gitee.com/pulanos)生态下一个简单、纯洁、成熟的技术开发框架。

:fa-book:盘古框架开发指南 :fa-flask:[盘古框架开发范例集合](https://gitee.com/pulanos/pangu-showcases) :fa-linux:[普蓝开源社区](https://gitee.com/pulanos)

### :sunflower: 框架安装

```
<parent>
        <groupId>com.gitee.pulanos.pangu</groupId>
        <artifactId>pangu-framework-parent</artifactId>
        <version>5.0.6</version>
        <relativePath/>
</parent>
```

### :leaves: 代码生成插件安装

```
<plugin>
    <groupId>com.gitee.pulanos.pangu</groupId>
    <artifactId>pangu-framework-generator-maven-plugin</artifactId>
    <version>5.0.6</version>
    <configuration>
        <url>jdbc:mysql://127.0.0.1:3306/pangu-showcases</url>
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

### :maple_leaf: 获取更多资源

- :fa-book:盘古框架开发指南
- :fa-flask:[盘古框架开发范例集合](https://gitee.com/pulanos/pangu-showcases)
- :fa-linux:[普蓝开源社区](https://gitee.com/pulanos)
    