package com.pulanit.pangu.admin.system.manager;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.lang.Assert;
import cn.hutool.core.lang.Validator;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.crypto.SecureUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.google.common.collect.Lists;
import com.pulanit.pangu.admin.system.api.entity.RoleEntity;
import com.pulanit.pangu.admin.system.api.entity.UserEntity;
import com.pulanit.pangu.admin.system.api.entity.UserRoleEntity;
import com.pulanit.pangu.admin.system.dao.mapper.RoleMapper;
import com.pulanit.pangu.admin.system.dao.mapper.UserMapper;
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
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private RoleMapper roleMapper;

    private final String SEPARATOR = " | ";


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

    public List<RoleEntity> listRolesByUserId(Long userId){
        List<RoleEntity> roleEntities = Lists.newArrayList();
        Assert.notNull(userId, "userId 不能为空");
        List<Long> roleIds = this.queryRoleIdsByUserId(userId);
        if (CollUtil.isNotEmpty(roleIds)){
            roleEntities = roleMapper.selectBatchIds(roleIds);
        }
        return roleEntities;
    }

    public String queryRoleNamesByUserId(Long userId){
        String names = "未授予角色权限";
        List<RoleEntity> roleEntities = this.listRolesByUserId(userId);
        if (CollUtil.isNotEmpty(roleEntities)){
            List<String> roleNames = roleEntities.stream().map(RoleEntity::getName).collect(Collectors.toList());
            names = CollUtil.join(roleNames, SEPARATOR);
        }
        return names;
    }

    public UserEntity findUserByAccountKey(String accountKey){
        Assert.notNull(accountKey, "账号标识 不能为空");
        LambdaQueryWrapper<UserEntity> queryWrapper = Wrappers.lambdaQuery();
        if (Validator.isMobile(accountKey)){
            queryWrapper.eq(UserEntity::getMobileNumber, accountKey);
        } else if (Validator.isEmail(accountKey)) {
            queryWrapper.eq(UserEntity::getMail, accountKey);
        }else {
            queryWrapper.eq(UserEntity::getUserName, accountKey);
        }
        return userMapper.selectOne(queryWrapper);
    }

    public String encodeUserPwd(String pwd){
        return SecureUtil.sha256(pwd);
    }



}
