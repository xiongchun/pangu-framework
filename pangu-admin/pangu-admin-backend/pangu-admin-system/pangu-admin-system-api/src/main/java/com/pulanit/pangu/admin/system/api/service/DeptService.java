package com.pulanit.pangu.admin.system.api.service;

import cn.hutool.core.lang.tree.Tree;
import com.pulanit.pangu.admin.system.api.entity.DeptEntity;
import com.pulanit.pangu.admin.system.api.param.ListDeptIn;

import java.util.List;

/**
 * 部门
 *
 * @author xiongchun
 */
public interface DeptService {

    /**
     * 查询列表信息
     * @param listDeptIn
     * @return
     */
    List<Tree<Integer>> list(ListDeptIn listDeptIn);

    /**
     * 新增
     * @param deptEntity
     */
    void add(DeptEntity deptEntity);

    /**
     * 修改
     * @param deptEntity
     */
    void update(DeptEntity deptEntity);

    /**
     * 删除
     * @param deptId
     */
    void delete(Long deptId);

    /**
     * 批量删除
     * @param deptIds
     */
    void batchDelete(List<Long> deptIds);

}
