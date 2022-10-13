package com.pulanit.pangu.admin.system.api.service;

import cn.hutool.core.lang.tree.Tree;
import com.pulanit.pangu.admin.system.api.entity.ResourceEntity;
import com.pulanit.pangu.admin.system.api.param.ResourceIn;

import java.util.List;

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
     * 新增
     * @param resourceIn
     */
    Long add(ResourceIn resourceIn);

    /**
     * 修改
     * @param resourceIn
     */
    void update(ResourceIn resourceIn);

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
