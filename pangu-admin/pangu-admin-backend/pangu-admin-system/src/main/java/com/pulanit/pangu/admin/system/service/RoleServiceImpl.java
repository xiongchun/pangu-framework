package com.pulanit.pangu.admin.system.service;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Assert;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gitee.pulanos.pangu.framework.sdk.dto.page.PageResult;
import com.gitee.pulanos.pangu.framework.sdk.dto.page.PagingUtil;
import com.gitee.pulanos.pangu.framework.sdk.exception.BizException;
import com.pulanit.pangu.admin.system.api.entity.RoleEntity;
import com.pulanit.pangu.admin.system.api.entity.RoleResourceEntity;
import com.pulanit.pangu.admin.system.api.entity.UserRoleEntity;
import com.pulanit.pangu.admin.system.api.param.RoleIn;
import com.pulanit.pangu.admin.system.api.service.RoleService;
import com.pulanit.pangu.admin.system.dao.mapper.RoleMapper;
import com.pulanit.pangu.admin.system.dao.mapper.RoleResourceMapper;
import com.pulanit.pangu.admin.system.dao.mapper.UserRoleMapper;
import com.pulanit.pangu.admin.system.manager.UserManager;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Slf4j
@DubboService(version = "1.0.0", group = "pangu-admin-system")
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleMapper roleMapper;
    @Autowired
    private RoleResourceMapper roleResourceMapper;
    @Autowired
    private UserRoleMapper userRoleMapper;
    @Autowired
    private UserManager userManager;

    @Override
    public PageResult<RoleEntity> list(RoleIn roleIn) {
        Page<RoleEntity> page = PagingUtil.createPage(roleIn);
        LambdaQueryWrapper<RoleEntity> lambdaQueryWrapper = Wrappers.lambdaQuery();
        lambdaQueryWrapper.like(ObjectUtil.isNotEmpty(roleIn.getName()), RoleEntity::getName, roleIn.getName());
        lambdaQueryWrapper.orderByDesc(RoleEntity::getId);
        roleMapper.selectPage(page, lambdaQueryWrapper);
        return PagingUtil.transformPageResult(page);
    }

    @Override
    public void add(RoleEntity roleEntity) {
        roleEntity.setGmtCreated(DateUtil.date());
        roleMapper.insert(roleEntity);
    }

    @Override
    public void update(RoleEntity roleEntity) {
        roleEntity.setGmtModified(DateUtil.date());
        roleMapper.updateById(roleEntity);
    }

    @Override
    public void delete(Long id) {
        roleMapper.deleteById(id);
    }

    @Override
    public void batchDelete(List<Long> ids) {
        roleMapper.deleteBatchIds(ids);
    }

    @Override
    public long validateRoleKey(String roleKey, Long id) {
        long result = roleMapper.selectCount(Wrappers.lambdaQuery(RoleEntity.class).eq(RoleEntity::getRoleKey, roleKey));
        if (ObjectUtil.isNotNull(id)) {
            RoleEntity roleEntity = roleMapper.selectById(id);
            if (StrUtil.equalsIgnoreCase(roleKey, roleEntity.getRoleKey())) {
                return 0;
            }
        }
        return result;
    }

    @Transactional
    @Override
    public void grantResource(Long roleId, List<Long> userIds) {
        Assert.notNull(roleId, "角色 ID 不能为空");
        Assert.notEmpty(userIds, "资源 ID 不能为空");
        roleResourceMapper.delete(Wrappers.lambdaQuery(RoleResourceEntity.class).eq(RoleResourceEntity::getRoleId, roleId));
        Date now = DateUtil.date();
        userIds.forEach(id -> {
            RoleResourceEntity entity = new RoleResourceEntity();
            entity.setRoleId(roleId);
            entity.setResourceId(id);
            entity.setGmtCreated(now);
            roleResourceMapper.insert(entity);
        });
    }

    @Override
    public void grantUser(Long roleId, List<Long> userIds) {
        Assert.notNull(roleId, "角色 ID 不能为空");
        Assert.notNull(userIds, "人员 ID 不能为空");
        for (long userId : userIds) {
            UserRoleEntity userRoleEntity = new UserRoleEntity();
            userRoleEntity.setUserId(userId);
            userRoleEntity.setRoleId(roleId);
            userRoleEntity.setGmtCreated(DateUtil.date());
            userRoleMapper.insert(userRoleEntity);
        }
    }

    @Override
    public void cancelUser(Long roleId, List<Long> userIds) {
        Assert.notNull(roleId, "角色 ID 不能为空");
        Assert.notNull(userIds, "人员 ID 不能为空");
        for (Long userId : userIds) {
            userManager.deleteUserRole(userId, roleId);
        }
    }
}
