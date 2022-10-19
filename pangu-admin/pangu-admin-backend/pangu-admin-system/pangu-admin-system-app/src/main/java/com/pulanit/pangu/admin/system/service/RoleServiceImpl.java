package com.pulanit.pangu.admin.system.service;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Assert;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gitee.pulanos.pangu.framework.common.model.PageResult;
import com.gitee.pulanos.pangu.framework.common.utils.PagingUtil;
import com.pulanit.pangu.admin.system.api.entity.RoleEntity;
import com.pulanit.pangu.admin.system.api.entity.RoleResourceEntity;
import com.pulanit.pangu.admin.system.api.param.RoleIn;
import com.pulanit.pangu.admin.system.api.service.RoleService;
import com.pulanit.pangu.admin.system.dao.mapper.RoleMapper;
import com.pulanit.pangu.admin.system.dao.mapper.RoleResourceMapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Slf4j
@Service(version = "1.0.0", group = "pangu-admin-system-app")
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleMapper roleMapper;
    @Autowired
    private RoleResourceMapper roleResourceMapper;

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
        if (ObjectUtil.isNotNull(id)){
            RoleEntity roleEntity = roleMapper.selectById(id);
            if (StrUtil.equalsIgnoreCase(roleKey, roleEntity.getRoleKey())){
                return 0;
            }
        }
        return result;
    }

    @Transactional
    @Override
    public void grant(Long roleId, List<Long> ids) {
        Assert.notNull(roleId, "角色 ID 不能为空");
        Assert.notEmpty(ids, "资源 ID 不能为空");
        roleResourceMapper.delete(Wrappers.lambdaQuery(RoleResourceEntity.class).eq(RoleResourceEntity::getRoleId, roleId));
        Date now = DateUtil.date();
        ids.forEach(id ->{
            RoleResourceEntity entity = new RoleResourceEntity();
            entity.setRoleId(roleId);
            entity.setResourceId(id);
            entity.setGmtCreated(now);
            roleResourceMapper.insert(entity);
        });
    }
}
