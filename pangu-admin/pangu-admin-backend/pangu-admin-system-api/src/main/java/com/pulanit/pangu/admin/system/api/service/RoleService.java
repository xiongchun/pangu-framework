package com.pulanit.pangu.admin.system.api.service;

import com.gitee.pulanos.pangu.framework.sdk.dto.page.PageResult;
import com.gitee.pulanos.pangu.framework.sdk.exception.BizException;
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
    PageResult<RoleEntity> list(RoleIn roleIn) throws BizException;

    /**
     * 新增
     * @param roleEntity
     */
    void add(RoleEntity roleEntity) throws BizException;

    /**
     * 修改
     * @param roleEntity
     */
    void update(RoleEntity roleEntity) throws BizException;

    /**
     * 删除
     * @param id
     */
    void delete(Long id) throws BizException;

    /**
     * 批量删除
     * @param ids
     */
    void batchDelete(List<Long> ids) throws BizException;

    /**
     * 校验角色标识字段
     *
     * @param roleKey
     * @param id
     * @return
     */
    long validateRoleKey(String roleKey, Long id) throws BizException;

    /**
     * 角色资源授权
     */
    void grantResource(Long roleId, List<Long> userIds) throws BizException;

    /**
     * 角色人员授权
     */
    void grantUser(Long roleId, List<Long> userIds) throws BizException;

    /**
     * 取消角色人员授权
     */
    void cancelUser(Long roleId, List<Long> userIds) throws BizException;

}
