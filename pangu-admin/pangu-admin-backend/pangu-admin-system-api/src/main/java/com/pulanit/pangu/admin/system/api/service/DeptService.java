package com.pulanit.pangu.admin.system.api.service;

import cn.hutool.core.lang.tree.Tree;
import com.gitee.pulanos.pangu.framework.sdk.exception.BizException;
import com.pulanit.pangu.admin.system.api.entity.DeptEntity;
import com.pulanit.pangu.admin.system.api.param.DeptIn;

import java.util.List;

/**
 * 部门
 *
 * @author xiongchun
 */
public interface DeptService {

    /**
     * 查询列表信息
     * @param deptIn
     * @return
     */
    List<Tree<Integer>> list(DeptIn deptIn) throws BizException;

    /**
     * 新增
     * @param deptEntity
     */
    void add(DeptEntity deptEntity) throws BizException;

    /**
     * 修改
     * @param deptEntity
     */
    void update(DeptEntity deptEntity) throws BizException;

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

}
