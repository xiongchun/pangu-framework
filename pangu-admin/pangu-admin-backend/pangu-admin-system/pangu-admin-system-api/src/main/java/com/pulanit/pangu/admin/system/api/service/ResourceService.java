package com.pulanit.pangu.admin.system.api.service;

import com.gitee.pulanos.pangu.framework.common.model.PageResult;
import com.pulanit.pangu.admin.system.api.entity.ResourceEntity;

import java.util.List;

/**
 * 资源
 *
 * @author xiongchun
 */
public interface ResourceService {

    /**
     * 查询列表信息
     * @param name
     * @return
     */
    PageResult<ResourceEntity> list(String name);

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
