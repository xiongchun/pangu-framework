package com.pulanit.pangu.admin.system.api.service;

import cn.hutool.core.lang.tree.Tree;
import com.gitee.pulanos.pangu.framework.sdk.exception.BizException;
import com.pulanit.pangu.admin.system.api.entity.ResourceEntity;
import com.pulanit.pangu.admin.system.api.param.ResourceForLoginOut;
import com.pulanit.pangu.admin.system.api.param.ResourceOut;

import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * 资源
 *
 * @author xiongchun
 */
public interface ResourceService {

    /**
     * 登录获取资源权限信息
     * @param userId
     * @return
     */
    ResourceForLoginOut listForLogin(Long userId) throws BizException;

    /**
     * 查询资源树结构信息
     * @return
     */
    List<Tree<Integer>> listForManage() throws BizException;

    /**
     * 查询资源树结构信息(角色授权使用)
     * @param roleId
     * @return
     */
    ResourceOut listForGrant(Long roleId) throws BizException;

    /**
     * 新增
     * @param resourceEntity
     */
    Long add(ResourceEntity resourceEntity) throws BizException;

    /**
     * 修改
     * @param resourceEntity
     */
    void update(ResourceEntity resourceEntity) throws BizException;

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
     * 校验资源别名唯一性
     * @param resourceKey
     * @param id
     * @return
     */
    long validateResourceKey(String resourceKey, Long id) throws BizException;

    /**
     * 根据用户 ID 获取资源权限
     * @param userId
     * @return
     */
    List<Tree<Integer>> listAllResourcesByUserId(Long userId) throws BizException;

}
