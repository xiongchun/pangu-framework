package com.pulanit.pangu.admin.system.api.service;

import cn.hutool.core.lang.tree.Tree;
import com.pulanit.pangu.admin.system.api.entity.ResourceEntity;
import com.pulanit.pangu.admin.system.api.param.ResourceOut;

import java.util.List;
import java.util.Map;

/**
 * 资源
 *
 * @author xiongchun
 */
public interface ResourceService {

    /**
     * 查询资源树结构信息
     * @return
     */
    List<Tree<Integer>> listForManage();

    /**
     * 查询资源树结构信息(角色授权使用)
     * @param roleId
     * @return
     */
    ResourceOut listForGrant(Long roleId);

    /**
     * 新增
     * @param resourceEntity
     */
    Long add(ResourceEntity resourceEntity);

    /**
     * 修改
     * @param resourceEntity
     */
    void update(ResourceEntity resourceEntity);

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
     * 校验资源别名唯一性
     * @param resourceKey
     * @param id
     * @return
     */
    long validateResourceKey(String resourceKey, Long id);

}
