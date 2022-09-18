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

import java.util.Collections;
import java.util.List;

@Component
@Slf4j
public class UserManager {

    @Autowired
    private UserRoleMapper userRoleMapper;

    public void deleteUserRoleByUserId(Long userId){
        userRoleMapper.delete(Wrappers.lambdaQuery(UserRoleEntity.class).eq(UserRoleEntity::getUserId, userId));
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

    public List<Long> queryRolesByUserId(Long userId){
        List<Long> roleIds = Collections.EMPTY_LIST;
        LambdaQueryWrapper<UserRoleEntity> lambdaQueryWrapper = Wrappers.lambdaQuery();
        lambdaQueryWrapper.select(UserRoleEntity::getRoleId).eq(UserRoleEntity::getUserId, userId);
        roleIds = (List) userRoleMapper.selectObjs(lambdaQueryWrapper);
        return  roleIds;
    }
}
