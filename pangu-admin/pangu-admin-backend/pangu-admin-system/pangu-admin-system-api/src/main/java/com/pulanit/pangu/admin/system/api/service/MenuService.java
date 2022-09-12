package com.pulanit.pangu.admin.system.api.service;

import com.gitee.pulanos.pangu.framework.common.model.PageResult;
import com.pulanit.pangu.admin.system.api.entity.MenuEntity;

import java.util.List;

/**
 * 菜单
 *
 * @author xiongchun
 */
public interface MenuService {

    /**
     * 查询列表信息
     * @param menuName
     * @return
     */
    PageResult<MenuEntity> list(String menuName);

    /**
     * 新增
     * @param menuEntity
     */
    void add(MenuEntity menuEntity);

    /**
     * 修改
     * @param menuEntity
     */
    void update(MenuEntity menuEntity);

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
