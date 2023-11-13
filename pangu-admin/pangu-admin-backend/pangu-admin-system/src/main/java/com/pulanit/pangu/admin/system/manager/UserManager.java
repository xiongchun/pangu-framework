package com.pulanit.pangu.admin.system.manager;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.lang.Assert;
import cn.hutool.core.lang.Validator;
import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.crypto.SecureUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.gitee.pulanos.pangu.framework.common.entity.PageResult;
import com.google.common.collect.Lists;
import com.pulanit.pangu.admin.system.api.entity.DeptEntity;
import com.pulanit.pangu.admin.system.api.entity.RoleEntity;
import com.pulanit.pangu.admin.system.api.entity.UserEntity;
import com.pulanit.pangu.admin.system.api.entity.UserRoleEntity;
import com.pulanit.pangu.admin.system.api.param.UserOut;
import com.pulanit.pangu.admin.system.api.param.UserPageIn;
import com.pulanit.pangu.admin.system.dao.mapper.DeptMapper;
import com.pulanit.pangu.admin.system.dao.mapper.RoleMapper;
import com.pulanit.pangu.admin.system.dao.mapper.UserMapper;
import com.pulanit.pangu.admin.system.dao.mapper.UserRoleMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
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
    @Autowired
    private DeptMapper deptMapper;

    private final String SEPARATOR = " | ";


    public void deleteUserRoleByUserId(Long userId){
        userRoleMapper.delete(Wrappers.lambdaQuery(UserRoleEntity.class).eq(UserRoleEntity::getUserId, userId));
    }

    public void deleteUserRole(Long userId, Long roleId){
        LambdaQueryWrapper<UserRoleEntity> queryWrapper = Wrappers.lambdaQuery();
        queryWrapper.eq(UserRoleEntity::getUserId, userId);
        queryWrapper.eq(UserRoleEntity::getRoleId, roleId);
        userRoleMapper.delete(queryWrapper);
    }

    public void deleteUserRoleByBatchUserIds(List<Long> userIds){
        LambdaQueryWrapper<UserRoleEntity> lambdaQueryWrapper = Wrappers.lambdaQuery();
        lambdaQueryWrapper.in(UserRoleEntity::getUserId, userIds);
        userRoleMapper.delete(lambdaQueryWrapper);
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

    public List<UserOut> transformEntity(List<UserEntity> userEntities){
        List<UserOut> userOuts = Lists.newArrayList();
        List<Long> deptIds = userEntities.stream().map(UserEntity::getDeptId).collect(Collectors.toList());
        deptIds = ObjectUtil.isEmpty(deptIds) ? Arrays.asList(-1L) : deptIds;
        List<DeptEntity> deptEntities = deptMapper.selectBatchIds(deptIds);
        Map<Long, DeptEntity> deptEntityMap = deptEntities.stream().collect(Collectors.toMap(DeptEntity::getId, Function.identity()));
        userEntities.forEach(e -> {
            UserOut userOut = new UserOut();
            BeanUtil.copyProperties(e, userOut);
            DeptEntity deptEntity = deptEntityMap.get(e.getDeptId());
            if (deptEntity != null){
                userOut.setDeptName(deptEntity.getName());
            }
            userOuts.add(userOut);
        });
        return userOuts;
    }

    public List<Long> listUserIdsByRoleId(Long roleId){
        Assert.notNull(roleId, "角色 ID 不能为空");
        LambdaQueryWrapper<UserRoleEntity> queryWrapper = Wrappers.lambdaQuery();
        queryWrapper.eq(UserRoleEntity::getRoleId, roleId);
        queryWrapper.orderByDesc(UserRoleEntity::getId);
        List<UserRoleEntity> userRoleEntities = userRoleMapper.selectList(queryWrapper);
        List<Long> userIds = userRoleEntities.stream().map(UserRoleEntity::getUserId).collect(Collectors.toList());
        return userIds;
    }

    public List<UserEntity> listUsersByRoleId(Long roleId){
        List<UserEntity> userEntities = Lists.newArrayList();
        List<Long> userIds = listUserIdsByRoleId(roleId);
        if (CollUtil.isNotEmpty(userIds)){
            LambdaQueryWrapper<UserEntity> queryWrapper = Wrappers.lambdaQuery();
            queryWrapper.select(UserEntity.class, tableFieldInfo -> !tableFieldInfo.getColumn().equals("password"));
            userEntities = userMapper.selectBatchIds(userIds);
        }
        return userEntities;
    }



}
