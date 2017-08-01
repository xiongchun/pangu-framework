>AOSuite后端主要依赖被广泛使用的Spring和MyBatis框架。因此，大家的技术积累和经验在这里一样是通用的。所以，我们就只介绍一些需要重点关注的地方。

#### §1. 需要先搞明白的几种数据结构

- PO：数据持久化实体对象。一个持久化对象对应一个表，PO属性和表字段一一对应，PO通过代码生成器生成，不可以手工维护。
- Dao：数据访问对象。一个数据访问对象对应一个表，提供单表的数据访问相关操作，Dao通过代码生成器生成，不可以手工维护。
- Dto：数据传输对象，在AOSuite里约定为一种继承自Map的增强型数据结构(类似MQ框架里的MapMessage对象)。他提供了一些Key值的强制类型转换功能，具有比原生Map更强的容错性和灵活性。 在各应用层中充当着非常重要的角色，建议大家可以重点关注一下其相关用法。其相关实现可以查看HashDto.java。

#### §2. 需要重点关注的几个类/文件
- HttpRouterController：HTTP请求路由转发器。在进行AOSuite开发后台模块的时候，Aiax请求通过这个转发器以反射方式调用服务实现，所以我们不需要创建Controller类，只需要服务实现就可以了。
- AOSBeanLoader：SpringBean加载器。通过这个类可以在任何地方获取容器中的SpringBean组件。一般情况下用不到，大部分时候我们都是通过注入的方式引用SpringBean组件的。
- AOSCxt：应用系统上下文。可以获取到参数配置信息、数据字典信息、当前登录用户的信息等。
- WebCxt：Web系统上下文。和Web层相关的一些常用操作。
- SqlDao：通用数据访问接口。通过这个接口可以进行任意的数据访问交互。
- AOSPropertiesHandler：读取aos.properties文件中的属性值。
- aos.properties：所有属性配置都可以在这个文件统一进行，不同的打包脚本会根据配置来自动修改这些值。

#### §3. 必备的MyBatis动态SQL映射技能

单表操作的SQL映射我们已经通过生成器生成，但是针对多表操作和一些单表的特殊SQL仍然需要开发人员编写SQL。因此，使用MyBatis进行动态SQL成为AOSuite开发的 必备技能。关于这部分内容，请查询相关资料即可，这方面的教程已经非常丰富了。推荐：[MyBatis动态SQL官方教程](http://http://www.mybatis.org/mybatis-3/zh/dynamic-sql.html)