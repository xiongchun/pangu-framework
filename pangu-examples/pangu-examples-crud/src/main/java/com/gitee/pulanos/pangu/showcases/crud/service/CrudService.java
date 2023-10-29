/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.gitee.pulanos.pangu.showcases.crud.service;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.lang.Console;
import cn.hutool.core.map.MapUtil;
import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import com.gitee.pulanos.pangu.showcases.crud.dao.entity.UserEntity;
import com.gitee.pulanos.pangu.showcases.crud.dao.mapper.CrudMapper;
import com.gitee.pulanos.pangu.showcases.crud.dao.mapper.UserMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * 演示基于MybatisPlus框架的数据持久化相关操作
 *
 * @author xiongchun
 */
@Slf4j
@Component
public class CrudService {

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private CrudMapper crudMapper;

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

    /**
     * 可以用自定义SQL映射的方式去做一些多表联合的复杂SQL操作
     */
    public void bSelect() {
        log.info("自定义SQL映射查询数据...");
        Map<String, Object> params = MapUtil.newHashMap();
        params.put("userType", "1");
        List<UserEntity> userEntities = crudMapper.listUsersByMap(params);
        userEntities.forEach(System.out::println);
    }

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
        Map<String, Object> params = MapUtil.newHashMap();
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


}
