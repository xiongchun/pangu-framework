package com.pulanit.pangu.admin.system.manager;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.lang.Assert;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.google.common.collect.Lists;
import com.pulanit.pangu.admin.system.api.entity.ResourceEntity;
import com.pulanit.pangu.admin.system.api.entity.RoleResourceEntity;
import com.pulanit.pangu.admin.system.dao.mapper.ResourceMapper;
import com.pulanit.pangu.admin.system.dao.mapper.RoleResourceMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

@Component
@Slf4j
public class ResourceManager {

    @Autowired
    private ResourceMapper resourceMapper;
    @Autowired
    private RoleResourceMapper roleResourceMapper;

    public List<ResourceEntity> listResourceEntitiesByRoleId(Long roleId){
        Assert.notNull(roleId, "角色 ID 不能为空");
        List<ResourceEntity> resourceEntities = Lists.newArrayList();
        LambdaQueryWrapper lambdaQueryWrapper = Wrappers.lambdaQuery(RoleResourceEntity.class).eq(RoleResourceEntity::getRoleId, roleId);
        List<RoleResourceEntity> entities = roleResourceMapper.selectList(lambdaQueryWrapper);
        List<Long> resourceIds = entities.stream().map(RoleResourceEntity::getResourceId).collect(Collectors.toList());
        if (CollUtil.isNotEmpty(resourceIds)){
            resourceEntities = resourceMapper.selectBatchIds(resourceIds);
        }
        return resourceEntities;
    }

}
