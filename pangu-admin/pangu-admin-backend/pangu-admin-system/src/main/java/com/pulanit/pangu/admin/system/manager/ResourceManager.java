package com.pulanit.pangu.admin.system.manager;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.lang.Assert;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.pulanit.pangu.admin.system.api.entity.ResourceEntity;
import com.pulanit.pangu.admin.system.api.entity.RoleResourceEntity;
import com.pulanit.pangu.admin.system.api.entity.UserRoleEntity;
import com.pulanit.pangu.admin.system.dao.mapper.ResourceMapper;
import com.pulanit.pangu.admin.system.dao.mapper.RoleResourceMapper;
import com.pulanit.pangu.admin.system.dao.mapper.UserRoleMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Component
@Slf4j
public class ResourceManager {

    @Autowired
    private ResourceMapper resourceMapper;
    @Autowired
    private RoleResourceMapper roleResourceMapper;
    @Autowired
    private UserRoleMapper userRoleMapper;

    public List<ResourceEntity> listResourceEntitiesByRoleId(Long roleId){
        Assert.notNull(roleId, "角色 ID 不能为空");
        List<ResourceEntity> resourceEntities = Collections.emptyList();;
        LambdaQueryWrapper<RoleResourceEntity> lambdaQueryWrapper = Wrappers.lambdaQuery(RoleResourceEntity.class).eq(RoleResourceEntity::getRoleId, roleId);
        List<RoleResourceEntity> entities = roleResourceMapper.selectList(lambdaQueryWrapper);
        List<Long> resourceIds = entities.stream().map(RoleResourceEntity::getResourceId).collect(Collectors.toList());
        if (CollUtil.isNotEmpty(resourceIds)){
            resourceEntities = resourceMapper.selectBatchIds(resourceIds);
        }
        return resourceEntities;
    }

    public List<ResourceEntity> listResourceEntitiesByUserId(Long userId){
        Assert.notNull(userId, "用户 ID 不能为空");
        List<ResourceEntity> resourceEntities = Collections.emptyList();;
        LambdaQueryWrapper<UserRoleEntity> lambdaQueryWrapper = Wrappers.lambdaQuery(UserRoleEntity.class).eq(UserRoleEntity::getUserId, userId);
        List<UserRoleEntity> userRoleEntities = userRoleMapper.selectList(lambdaQueryWrapper);
        for (UserRoleEntity userRoleEntity : userRoleEntities) {
            resourceEntities.addAll(this.listResourceEntitiesByRoleId(userRoleEntity.getRoleId()));
        }
        resourceEntities = resourceEntities.stream().distinct().collect(Collectors.toList());
        return resourceEntities;
    }

}
