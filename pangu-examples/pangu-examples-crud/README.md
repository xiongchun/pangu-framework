#### :mushroom: 本范例演示功能

1. 使用盘古代码生成Maven插件生成DAO相关Mapper接口和Entity实体类。
2. 使用MybatisPlus的API接口操作数据库的常用方法。
3. 分页查询和手工映复杂SQL的方法。

> :tw-1f493: 温馨提示：本范例只演示了一些基本和常用的数据库相关操作。更多用法请直接参阅[MybatisPlus文档](https://mp.baomidou.com/guide/)。

> :tw-1f4a3: 特别提示：经过我们对MybatisPlus框架的长期使用和总结，特给出如下2个“最佳实践”：（1）、使用盘古自带的代码成插件生成相关代码。（2）、只使用MyabtisPlus的Mapper CRUD接口，不建议使用Service CRUD接口。

#### :four_leaf_clover: 如何使用盘古代码生成Maven插件生成DAO相关Mapper接口和Entity实体类

- 安装Maven插件

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
- 执行 `mvn pangu:generate`生成代码，查看控制台生成文件的输出信息。

#### :green_apple: 使用MybatisPlus的API接口操作数据库的常用方法

```
public int aInsert() {
        log.info("插入数据...");
        UserEntity userEntity = new UserEntity();
        userEntity.setName("XC").setAge(18).setUserType("1");
        int row = userMapper.insert(userEntity);
        log.info("成功插入{}条数据。{}", row, userEntity);
        return row;
    }

    @Transactional(rollbackFor = RuntimeException.class)
    public void aUpdate() {
        log.info("更新数据...");
        //方式1
        userMapper.updateById(new UserEntity().setId(1L).setName("XC2"));

        //方式2
        LambdaUpdateWrapper<UserEntity> updateWrapper = Wrappers.lambdaUpdate();
        updateWrapper.set(UserEntity::getAge, 100);
        updateWrapper.eq(UserEntity::getId, 2L);
        userMapper.update(null, updateWrapper);
        //方式2简写
        userMapper.update(null, Wrappers.<UserEntity>lambdaUpdate().set(UserEntity::getName, "XC2").eq(UserEntity::getId, 3L));

        //方式3
        UserEntity userEntity = new UserEntity();
        userEntity.setName("XC2");
        userMapper.update(userEntity, Wrappers.<UserEntity>lambdaUpdate().eq(UserEntity::getId, 4L));
    }

    public void aDelete() {
        log.info("删除数据...");
        //方式1
        userMapper.deleteById(1000L);
        //方式2
        userMapper.deleteBatchIds(Arrays.asList(1000L, 1001L));
        //方式3
        userMapper.delete(Wrappers.<UserEntity>lambdaQuery().ge(UserEntity::getAge, 150));
        //方式4
        userMapper.deleteById(new UserEntity().setId(2000L));
    }

    public void aSelect() {
        log.info("查询数据...");
        //方式1
        UserEntity userEntity = userMapper.selectById(1L);

        //方式2
        UserEntity userEntity1 = userMapper.selectOne(Wrappers.<UserEntity>lambdaQuery().eq(UserEntity::getId, 1L));

        //方式3
        List<UserEntity> userEntities = userMapper.selectBatchIds(Arrays.asList(1L, 2L));

        //方式4
        Integer age = 100;
        LambdaQueryWrapper<UserEntity> lambdaQueryWrapper = Wrappers.lambdaQuery();
        //动态组合查询条件的简便写法
        lambdaQueryWrapper.between(ObjectUtil.isNotEmpty(age), UserEntity::getAge, 1, age);
        lambdaQueryWrapper.eq(UserEntity::getUserType, "1");
        lambdaQueryWrapper.orderByDesc(UserEntity::getId);
        List<UserEntity> userEntities1 = userMapper.selectList(lambdaQueryWrapper);

        //方式5
        QueryWrapper<UserEntity> queryWrapper = Wrappers.query();
        queryWrapper.select("id").ge("age", 10).orderByDesc("age");
        List<Long> ids = (List<Long>) (List) userMapper.selectObjs(queryWrapper);

        //方式6
        List<Map<String, Object>> userMaps = userMapper.selectMaps(Wrappers.<UserEntity>lambdaQuery().eq(UserEntity::getUserType, "1"));

        //方式7 count
        Long cnt = userMapper.selectCount(Wrappers.<UserEntity>lambdaQuery().le(UserEntity::getGmtCreate, DateUtil.date()));

        //方式8 group
        QueryWrapper<UserEntity> queryWrapper1 = Wrappers.query();
        queryWrapper1.select("age, count(id) as cnt").groupBy("age");
        List<Map<String, Object>> mapList = userMapper.selectMaps(queryWrapper1);

    }
```

#### :cactus: 分页查询和手工映复杂SQL的方法

- 分页查询

  分页查询需要首先配置分页拦截器，如下。

```
@Configuration
public class MybatisPlusConfig {

    @Bean
    public MybatisPlusInterceptor mybatisPlusInterceptor() {
        MybatisPlusInterceptor interceptor = new MybatisPlusInterceptor();
        PaginationInnerInterceptor paginationInnerInterceptor = new PaginationInnerInterceptor();
        //显式指定，免得每次都去自动获取类型
        paginationInnerInterceptor.setDbType(DbType.MYSQL);
        interceptor.addInnerInterceptor(paginationInnerInterceptor);
        return interceptor;
    }

}
```

```
    public void aPageQuery(){
        log.info("MyBatisPlus API 分页查询数据...");
        Page page = new Page<UserEntity>(1,3);
        userMapper.selectPage(page, Wrappers.<UserEntity>lambdaQuery().ge(UserEntity::getAge, 10).orderByAsc(UserEntity::getId));
        Console.log("总数：{}", page.getTotal());
        List<UserEntity> userEntities = page.getRecords();
        userEntities.forEach(System.out::println);
    }

    public void bPageQuery(){
        log.info("自定义SQL映射分页查询数据...");
        Page page = new Page<UserEntity>(1,3);
        Map<String, Object> params = Maps.newHashMap();
        params.put("userType", "1");
        List<UserEntity> userEntities = crudMapper.listUsersByPage(page, params);
        Console.log("总数：{}", page.getTotal());
        userEntities.forEach(System.out::println);
    }

    public void cPageQuery(){
        log.info("自定义SQL映射分页查询数据...");
        Page page = new Page<Map<String, Object>>(1,3);
        String userType = "1";
        List<Map<String, Object>> userMaps = crudMapper.listUserMapsByPage(page, userType);
        Console.log("总数：{}", page.getTotal());
        userMaps.forEach(System.out::println);
    }
```

- 手工映射复杂SQL

  针对复杂统计类SQL可以通过如下方式手工在XML中写SQL语句。

```
   public void bSelect() {
        log.info("自定义SQL映射查询数据...");
        Map<String, Object> params = Maps.newHashMap();
        params.put("userType", "1");
        List<UserEntity> userEntities = crudMapper.listUsersByMap(params);
        userEntities.forEach(System.out::println);
    }
```

> :tw-1f493: 温馨提示：更多代码请直接查看 [ **CrudService.java** ](https://gitee.com/pulanos/pangu-showcases/blob/master/pangu-showcases-crud/src/main/java/com/gitee/pulanos/pangu/showcases/crud/service/CrudService.java)
