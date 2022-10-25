package com.pulanit.pangu.admin.web.controller;

import cn.hutool.core.lang.Assert;
import cn.hutool.core.lang.tree.Tree;
import com.gitee.pulanos.pangu.framework.common.model.Result;
import com.pulanit.pangu.admin.system.api.entity.DeptEntity;
import com.pulanit.pangu.admin.system.api.param.DeptIn;
import com.pulanit.pangu.admin.system.api.service.DeptService;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 部门
 *
 * @author xiongchun
 */
@Slf4j
@RestController
@RequestMapping("/api/system/dept")
public class DeptController {

    @Reference(version = "1.0.0", group = "pangu-admin-system-app")
    private DeptService deptService;

    /**
     * 获取列表
     *
     * @return
     */
    @GetMapping("/list")
    public Result<List<Tree<Integer>>> list(@RequestParam(required = false) String name) {
        DeptIn deptIn = new DeptIn();
        deptIn.setName(name);
        List<Tree<Integer>> treeNodes = deptService.list(deptIn);
        return Result.success(treeNodes);
    }

    /**
     * 新增
     *
     * @param deptEntity
     * @return
     */
    @PostMapping("/add")
    public Result<Void> add(@RequestBody DeptEntity deptEntity) {
        deptService.add(deptEntity);
        return Result.success();
    }


    /**
     * 修改
     *
     * @param deptEntity
     * @return
     */
    @PostMapping("/update")
    public Result<Void> update(@RequestBody DeptEntity deptEntity) {
        Assert.notNull(deptEntity.getId(), "部门 ID 不能为空");
        deptService.update(deptEntity);
        return Result.success();
    }


    /**
     * 删除
     *
     * @param id
     * @return
     */
    @PostMapping("/delete")
    public Result<Void> delete(@RequestParam Long id) {
        Assert.notNull(id, "部门 ID 不能为空");
        deptService.delete(id);
        return Result.success();
    }

    /**
     * 批量删除
     *
     * @param ids
     * @return
     */
    @PostMapping("/batchDelete")
    public Result<Void> batchDelete(@RequestParam List<Long> ids) {
        Assert.notEmpty(ids, "部门 ID 不能为空");
        deptService.batchDelete(ids);
        return Result.success();
    }


}
