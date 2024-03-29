package com.pulanit.pangu.admin.web.controller.permission;

import cn.hutool.core.lang.Assert;
import cn.hutool.core.lang.tree.Tree;
import com.gitee.pulanos.pangu.framework.sdk.dto.Result;
import com.pulanit.pangu.admin.system.api.entity.ResourceEntity;
import com.pulanit.pangu.admin.system.api.param.ResourceForLoginOut;
import com.pulanit.pangu.admin.system.api.param.ResourceOut;
import com.pulanit.pangu.admin.system.api.service.ResourceService;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.DubboReference;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 资源（菜单等）
 *
 * @author xiongchun
 */
@Slf4j
@RestController
@RequestMapping("/api/system/resource")
public class ResourceController {

    @DubboReference(version = "1.0.0", group = "pangu-admin-system")
    private ResourceService resourceService;

    /**
     * 用户登录获取菜单资源
     */
    @GetMapping("/list")
    public Result<ResourceForLoginOut> list(@RequestParam Long userId) {
        Assert.notNull(userId, "用户 ID 不能为空");
        ResourceForLoginOut out = resourceService.listForLogin(userId);
        return Result.success(out);
    }

    /**
     * 获取菜单(管理模块)
     */
    @GetMapping("/listForManage")
    public Result<List<Tree<Integer>>> listForManage() {
        List<Tree<Integer>> treeNodes = resourceService.listForManage();
        return Result.success(treeNodes);
    }

    /**
     * 角色授权
     */
    @GetMapping("/listForGrant")
    public Result<ResourceOut> listForGrant(@RequestParam Long roleId){
        ResourceOut resourceOut = resourceService.listForGrant(roleId);
        return Result.success(resourceOut);
    }

    /**
     * 新增
     */
    @PostMapping("/add")
    public Result<Long> add(@RequestBody ResourceEntity resourceEntity) {
        Long id = resourceService.add(resourceEntity);
        return Result.success(id);
    }

    /**
     * 修改
     */
    @PostMapping("/update")
    public Result<Void> update(@RequestBody ResourceEntity resourceEntity) {
        Assert.notNull(resourceEntity.getId(), "资源 ID 不能为空");
        resourceService.update(resourceEntity);
        return Result.success();
    }

    @GetMapping("/validateResourceKey")
    public Result<Long> validateRoleKey(@RequestParam  String resourceKey, @RequestParam  Long id) {
        long cnt = resourceService.validateResourceKey(resourceKey, id);
        return Result.success(cnt);
    }

    /**
     * 批量删除
     */
    @PostMapping("/batchDelete")
    public Result<Void> batchDelete(@RequestParam List<Long> ids) {
        Assert.notEmpty(ids, "资源 ID 不能为空");
        resourceService.batchDelete(ids);
        return Result.success();
    }

    /**
     * 根据用户查询资源编号
     */
    @GetMapping("/listAllResourcesByUserId")
    public Result<List<Tree<Integer>>> listAllResourcesByUserId(@RequestParam Long userId){
        Assert.notNull(userId, "用户编号不能为空");
        List<Tree<Integer>> treeList = resourceService.listAllResourcesByUserId(userId);
        return Result.success(treeList);
    }

}
