package com.pulanit.pangu.admin.web.controller.permission;

import cn.hutool.core.lang.Assert;
import com.gitee.pulanos.pangu.framework.sdk.dto.Result;
import com.gitee.pulanos.pangu.framework.sdk.dto.page.PageResult;
import com.pulanit.pangu.admin.system.api.entity.RoleEntity;
import com.pulanit.pangu.admin.system.api.entity.UserEntity;
import com.pulanit.pangu.admin.system.api.param.UserOut;
import com.pulanit.pangu.admin.system.api.param.UserPageIn;
import com.pulanit.pangu.admin.system.api.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 用户
 *
 * @author xiongchun
 */
@Slf4j
@RestController
@RequestMapping("/api/system/user")
public class UserController {

    @Reference(version = "1.0.0", group = "pangu-admin-system-app")
    private UserService userService;

    /**
     * 获取用户
     * @return
     */
    @GetMapping("/list")
    public Result<PageResult<UserOut>> list(UserPageIn userPageIn) {
        PageResult<UserOut> pageResult = userService.list(userPageIn);
        return Result.success(pageResult);
    }

    /**
     * 新增
     *
     * @param userEntity
     * @return
     */
    @PostMapping("/add")
    public Result<Void> add(@RequestBody UserEntity userEntity) {
        userService.add(userEntity);
        return Result.success();
    }

    /**
     * 修改
     *
     * @param userEntity
     * @return
     */
    @PostMapping("/update")
    public Result<Void> update(@RequestBody UserEntity userEntity) {
        Assert.notNull(userEntity.getId(), "人员 ID 不能为空");
        userService.update(userEntity);
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
        Assert.notNull(id, "人员 ID 不能为空");
        userService.delete(id);
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
        Assert.notEmpty(ids, "人员 ID 不能为空");
        userService.batchDelete(ids);
        return Result.success();
    }

    /**
     * 校验登录账号
     *
     * @return
     */
    @GetMapping("/validateUserName")
    public Result<Long> validateUserName(@RequestParam String userName, @RequestParam Long id) {
        long cnt = userService.validateUserName(userName, id);
        return Result.success(cnt);
    }

    /**
     * 查询用户分配角色
     *
     * @return
     */
    @GetMapping("/queryRolesByUserId")
    public Result<List<RoleEntity>> queryRolesByUserId(@RequestParam Long userId) {
        return Result.success(userService.queryRolesByUserId(userId));
    }

    /**
     * 查询用户待分配角色
     *
     * @return
     */
    @GetMapping("/queryGrantRolesByUserId")
    public Result<List<RoleEntity>> queryGrantRolesByUserId(@RequestParam Long userId) {
        return Result.success(userService.queryGrantRolesByUserId(userId));
    }

    /**
     * 查询用户详细信息
     *
     * @return
     */
    @GetMapping("/queryUserDetailInfoById")
    public Result<UserOut> queryUserDetailInfoById(@RequestParam Long userId) {
        UserOut userOut = userService.queryUserDetailInfoById(userId);
        return Result.success(userOut);
    }

    /**
     * 重置密码
     * @param userIds
     * @param password
     * @return
     */
    @PostMapping("/resetPassword")
    public Result<Void> resetPassword(@RequestParam List<Long> userIds, @RequestParam String password) {
        Assert.notEmpty(userIds, "用户 ID 不能为空");
        Assert.notEmpty(password, "密码字段不能为空");
        userService.resetPassword(userIds, password);
        return Result.success();
    }

    /**
     * 修改密码
     * @param userId
     * @param password
     * @param newPassword
     * @return
     */
    @PostMapping("/updatePassword")
    public Result<Void> updatePassword(@RequestParam Long userId, @RequestParam String password, @RequestParam String newPassword) {
        Assert.notNull(userId, "用户 ID 不能为空");
        Assert.notEmpty(password, "当前密码不能为空");
        Assert.notEmpty(newPassword, "新密码不能为空");
        userService.updatePassword(userId, password, newPassword);
        return Result.success();
    }

    /**
     * 选择角色
     * @param userId
     * @param roleIds
     * @return
     */
    @PostMapping("/grantSelectRole")
    public Result<Void> grantSelectRole(@RequestParam Long userId, @RequestParam List<Long> roleIds) {
        Assert.notNull(userId, "人员 ID 不能为空");
        Assert.notEmpty(roleIds, "角色 ID 不能为空");
        userService.grantSelectRole(userId, roleIds);
        return Result.success();
    }

    /**
     * 撤销选择角色
     * @param userId
     * @param roleIds
     * @return
     */
    @PostMapping("/cancelRole")
    public Result<Void> cancelRole(@RequestParam Long userId, @RequestParam List<Long> roleIds) {
        Assert.notNull(userId, "人员 ID 不能为空");
        Assert.notEmpty(roleIds, "角色 ID 不能为空");
        userService.cancelRole(userId, roleIds);
        return Result.success();
    }

}
