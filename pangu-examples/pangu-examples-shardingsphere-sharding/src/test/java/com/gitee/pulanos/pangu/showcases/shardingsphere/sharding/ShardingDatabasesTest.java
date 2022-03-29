package com.gitee.pulanos.pangu.showcases.shardingsphere.sharding;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.gitee.pulanos.pangu.showcases.shardingsphere.sharding.dao.entity.TOrderEntity;
import com.gitee.pulanos.pangu.showcases.shardingsphere.sharding.dao.entity.UserEntity;
import com.gitee.pulanos.pangu.showcases.shardingsphere.sharding.dao.mapper.TOrderMapper;
import com.gitee.pulanos.pangu.showcases.shardingsphere.sharding.dao.mapper.UserMapper;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

/**
 * 只分库测试用例 对应配置：#spring.profiles.active=sharding-databases
 */
@Slf4j
@RunWith(SpringRunner.class)
@SpringBootTest
public class ShardingDatabasesTest {

    @Autowired
    private TOrderMapper tOrderMapper;
    @Autowired
    private UserMapper userMapper;

    /**
     * 测试写入数据分片
     */
    @Test
    public void createOrder() {
        TOrderEntity entity1 = new TOrderEntity().setUserId(1).setStatus("0");
        tOrderMapper.insert(entity1);
        TOrderEntity entity2 = new TOrderEntity().setUserId(2).setStatus("0");
        tOrderMapper.insert(entity2);
    }

    /**
     * 测试查询SQL路由
     * <p>包含分片键，将根据分片键路由到真实表执行查询</p>
     */
    @Test
    public void routingQuery() {
        List<TOrderEntity> list1 = tOrderMapper.selectList(Wrappers.<TOrderEntity>lambdaQuery().eq(TOrderEntity::getUserId, 1));
        log.info("结果集：{}" , list1);
        List<TOrderEntity> list2 = tOrderMapper.selectList(Wrappers.<TOrderEntity>lambdaQuery().eq(TOrderEntity::getUserId, 2));
        log.info("结果集：{}" , list2);
    }

    /**
     * 测试对不分片的单表的操作
     * 对于没有分片配置的单表，会优先使用第一个数据源ds-0，如果找不到表则继续使用后面的数据源寻找单表
     * @return
     */
    @Test
    public void createUserNoSharding() {
        log.info("插入数据...");
        UserEntity userEntity = new UserEntity();
        userEntity.setName("XC").setAge(18).setUserType("1");
        int row = userMapper.insert(userEntity);
        log.info("成功插入{}条数据。{}", row, userEntity);
    }

    /**
     * 测试查询结果集聚合
     * <p>不包含分片键，将扫描所有表后聚合结果集。不建议使用。</p>
     */
    @Test
    public void mergeQuery() {
        LambdaQueryWrapper<TOrderEntity> lambdaQueryWrapper = Wrappers.lambdaQuery();
        lambdaQueryWrapper.eq(TOrderEntity::getStatus, "0");
        List<TOrderEntity> tOrderEntities = tOrderMapper.selectList(lambdaQueryWrapper);
        log.info("结果集：{}", tOrderEntities);
    }

}