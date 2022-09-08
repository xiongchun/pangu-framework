package com.pulanit.pangu.admin.system.service;

import com.gitee.pulanos.pangu.framework.common.model.MyPage;
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
    public MyPage<RoleEntity> list(RoleIn roleIn) {

        return null;
    }

    @Override
    public void add(RoleEntity roleEntity) {

    }

    @Override
    public void update(RoleEntity roleEntity) {

    }

    @Override
    public void delete(Long id) {

    }

    @Override
    public void batchDelete(List<Long> ids) {

    }
}
