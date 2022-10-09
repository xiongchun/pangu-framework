package com.pulanit.pangu.admin.system.api.service;

import cn.hutool.core.lang.tree.Tree;
import com.pulanit.pangu.admin.system.api.entity.ResourceEntity;

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
     * @param resourceEntity
     */
    void add(ResourceEntity resourceEntity);

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

}
