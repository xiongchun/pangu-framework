package com.pulanit.pangu.admin.system.service;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gitee.pulanos.pangu.framework.common.model.PageResult;
import com.gitee.pulanos.pangu.framework.common.utils.PagingUtil;
import com.pulanit.pangu.admin.system.api.entity.RoleEntity;
import com.pulanit.pangu.admin.system.api.param.RoleIn;
import com.pulanit.pangu.admin.system.api.service.RoleService;
import com.pulanit.pangu.admin.system.dao.mapper.RoleMapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Slf4j
@Service(version = "1.0.0", group = "pangu-admin-system-app")
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleMapper roleMapper;

    @Override
    public PageResult<RoleEntity> list(RoleIn roleIn) {
        Page<RoleEntity> page = PagingUtil.createPage(roleIn);
        LambdaQueryWrapper<RoleEntity> lambdaQueryWrapper = Wrappers.lambdaQuery();
        lambdaQueryWrapper.like(ObjectUtil.isNotEmpty(roleIn.getName()), RoleEntity::getName, roleIn.getName());
        roleMapper.selectPage(page, lambdaQueryWrapper);
        return PagingUtil.getPageResult(page);
    }

    @Override
    public void add(RoleEntity roleEntity) {
        roleEntity.setGmtCreated(DateUtil.date());
        roleMapper.insert(roleEntity);
    }

    @Override
    public void update(RoleEntity roleEntity) {
        roleEntity.setGmtModified(DateUtil.date());
    }

    @Override
    public void delete(Long id) {
        roleMapper.deleteById(id);
    }

    @Override
    public void batchDelete(List<Long> ids) {
        roleMapper.deleteBatchIds(ids);
    }
}
