package com.pulanit.pangu.admin.system.api.service;

import com.gitee.pulanos.pangu.framework.common.model.PageResult;
import com.pulanit.pangu.admin.system.api.entity.RoleEntity;
import com.pulanit.pangu.admin.system.api.param.RoleIn;

import java.util.List;

/**
 * 角色
 *
 * @author xiongchun
 */
public interface RoleService {

    /**
     * 查询列表信息
     * @param roleIn
     * @return
     */
    PageResult<RoleEntity> list(RoleIn roleIn);

    /**
     * 新增
     * @param roleEntity
     */
    void add(RoleEntity roleEntity);

    /**
     * 修改
     * @param roleEntity
     */
    void update(RoleEntity roleEntity);

    /**
     * 删除
     * @param id
     */
    void delete(Long id);

    /**
     * 批量删除
     * @param ids
     */
    void batchDelete(List<Long> ids);

    /**
     * 校验角色标识字段
     *
     * @param roleKey
     * @param id
     * @return
     */
    long validateRoleKey(String roleKey, Long id);

}
