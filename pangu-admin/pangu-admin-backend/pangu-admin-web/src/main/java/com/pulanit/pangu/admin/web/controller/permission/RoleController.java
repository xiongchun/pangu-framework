package com.pulanit.pangu.admin.web.controller.permission;

import cn.hutool.core.lang.Assert;
import com.gitee.pulanos.pangu.framework.sdk.dto.Result;
import com.gitee.pulanos.pangu.framework.sdk.dto.page.PageResult;
import com.pulanit.pangu.admin.system.api.entity.RoleEntity;
import com.pulanit.pangu.admin.system.api.param.RoleIn;
import com.pulanit.pangu.admin.system.api.param.UserOut;
import com.pulanit.pangu.admin.system.api.param.UserPageIn;
import com.pulanit.pangu.admin.system.api.service.RoleService;
import com.pulanit.pangu.admin.system.api.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.DubboReference;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 角色
 *
 * @author xiongchun
 */
@Slf4j
@RestController
@RequestMapping("/api/system/role")
public class RoleController {

    @DubboReference(version = "1.0.0", group = "pangu-admin-system")
    private RoleService roleService;
    @DubboReference(version = "1.0.0", group = "pangu-admin-system")
    private UserService userService;

    /**
     * 获取角色
     * @return
     */
    @GetMapping("/list")
    public Result<PageResult<RoleEntity>> list(RoleIn roleIn) {
        PageResult<RoleEntity> pageResult = roleService.list(roleIn);
        return Result.success(pageResult);
    }

    /**
     * 新增
     *
     * @param roleEntity
     * @return
     */
    @PostMapping("/add")
    public Result<Void> add(@RequestBody RoleEntity roleEntity) {
        roleService.add(roleEntity);
        return Result.success();
    }


    /**
     * 修改
     *
     * @param roleEntity
     * @return
     */
    @PostMapping("/update")
    public Result<Void> update(@RequestBody RoleEntity roleEntity) {
        Assert.notNull(roleEntity.getId(), "角色 ID 不能为空");
        roleService.update(roleEntity);
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
        Assert.notNull(id, "角色 ID 不能为空");
        roleService.delete(id);
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
        Assert.notEmpty(ids, "角色 ID 不能为空");
        roleService.batchDelete(ids);
        return Result.success();
    }

    /**
     * 校验角色标识字段
     *
     * @return
     */
    @GetMapping("/validateRoleKey")
    public Result<Long> validateRoleKey(@RequestParam String roleKey, @RequestParam  Long id) {
        long cnt = roleService.validateRoleKey(roleKey, id);
        return Result.success(cnt);
    }

    /**
     * 角色资源授权
     * @param roleId
     * @param ids
     * @return
     */
    @PostMapping("/grantResource")
    public Result<Void> grantResource(@RequestParam Long roleId, @RequestParam List<Long> ids) {
        Assert.notNull(roleId, "角色 ID 不能为空");
        Assert.notEmpty(ids, "资源 ID 不能为空");
        roleService.grantResource(roleId, ids);
        return Result.success();
    }

    /**
     * 角色人员授权
     * @param roleId
     * @param ids
     * @return
     */
    @PostMapping("/grantUser")
    public Result<Void> grantUser(@RequestParam Long roleId, @RequestParam List<Long> ids) {
        Assert.notNull(roleId, "角色 ID 不能为空");
        Assert.notEmpty(ids, "人员 ID 不能为空");
        roleService.grantUser(roleId, ids);
        return Result.success();
    }

    /**
     * 取消角色人员授权
     * @param roleId
     * @param ids
     * @return
     */
    @PostMapping("/cancelUser")
    public Result<Void> cancelUser(@RequestParam Long roleId, @RequestParam List<Long> ids) {
        Assert.notNull(roleId, "角色 ID 不能为空");
        Assert.notEmpty(ids, "人员 ID 不能为空");
        roleService.cancelUser(roleId, ids);
        return Result.success();
    }


    /**
     * 查询角色授权待选用户
     * @param pageIn
     * @return
     */
    @GetMapping("/listUnGrantedUsersByRoleId")
    public Result<PageResult<UserOut>> listUnGrantedUsersByRoleId(UserPageIn pageIn) {
        Assert.notNull(pageIn.getRoleId(), "角色 ID 不能为空");
        PageResult<UserOut> pageResult = userService.listUnGrantedUsersByRoleId(pageIn);
        return Result.success(pageResult);
    }

    /**
     * 查询角色授权已选用户
     * @param roleId
     * @return
     */
    @GetMapping("/listGrantedUsersByRoleId")
    public Result<List<UserOut>> listGrantedUsersByRoleId(@RequestParam Long roleId) {
        List<UserOut> userOuts = userService.listGrantedUsersByRoleId(roleId);
        return Result.success(userOuts);
    }
}
