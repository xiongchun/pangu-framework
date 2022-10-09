package com.pulanit.pangu.admin.system.manager;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.lang.Assert;
import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.pulanit.pangu.admin.system.api.entity.UserRoleEntity;
import com.pulanit.pangu.admin.system.dao.mapper.UserRoleMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

@Component
@Slf4j
public class UserManager {

    @Autowired
    private UserRoleMapper userRoleMapper;


    public void deleteUserRoleByUserId(Long userId){
        userRoleMapper.delete(Wrappers.lambdaQuery(UserRoleEntity.class).eq(UserRoleEntity::getUserId, userId));
    }

    public void deleteUserRoleByBatchUserIds(List<Long> userIds){
        LambdaQueryWrapper<UserRoleEntity> lambdaQueryWrapper = Wrappers.lambdaQuery();
        lambdaQueryWrapper.in(UserRoleEntity::getUserId, userIds);
        userRoleMapper.delete(lambdaQueryWrapper);
    }

    public void creatUserRole(Long userId, long[] roleIds){
        Assert.notNull(userId, "userId 不能为空");
        if (ObjectUtil.isEmpty(roleIds)) return;
        for (long roleId : roleIds){
            UserRoleEntity userRoleEntity = new UserRoleEntity();
            userRoleEntity.setUserId(userId);
            userRoleEntity.setRoleId(roleId);
            userRoleEntity.setGmtCreated(DateUtil.date());
            userRoleMapper.insert(userRoleEntity);
        }
    }

    public List<Long> queryRoleIdsByUserId(Long userId){
        LambdaQueryWrapper<UserRoleEntity> lambdaQueryWrapper = Wrappers.lambdaQuery();
        lambdaQueryWrapper.eq(UserRoleEntity::getUserId, userId).orderByDesc(UserRoleEntity::getRoleId);
        List<UserRoleEntity> userRoleEntities = userRoleMapper.selectList(lambdaQueryWrapper);
        List<Long> roleIds = userRoleEntities.stream().map(UserRoleEntity::getRoleId).collect(Collectors.toList());
        return  roleIds;
    }



}
