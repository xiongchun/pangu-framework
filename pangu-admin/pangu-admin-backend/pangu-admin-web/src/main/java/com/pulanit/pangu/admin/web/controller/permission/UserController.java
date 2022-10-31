package com.pulanit.pangu.admin.web.controller.permission;

import cn.hutool.core.lang.Assert;
import com.gitee.pulanos.pangu.framework.common.model.PageResult;
import com.gitee.pulanos.pangu.framework.common.model.Result;
import com.pulanit.pangu.admin.system.api.entity.RoleEntity;
import com.pulanit.pangu.admin.system.api.param.UserIn;
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
     * @param userIn
     * @return
     */
    @PostMapping("/add")
    public Result<Void> add(@RequestBody UserIn userIn) {
        userService.add(userIn);
        return Result.success();
    }

    /**
     * 修改
     *
     * @param userIn
     * @return
     */
    @PostMapping("/update")
    public Result<Void> update(@RequestBody UserIn userIn) {
        Assert.notNull(userIn.getId(), "人员 ID 不能为空");
        userService.update(userIn);
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
     * 查询用户详细信息
     *
     * @return
     */
    @GetMapping("/queryUserDetailInfoById")
    public Result<UserOut> queryUserDetailInfoById(@RequestParam Long userId) {
        UserOut userOut = userService.queryUserDetailInfoById(userId);
        return Result.success(userOut);
    }

    @PostMapping("/resetPassword")
    public Result<Void> resetPassword(@RequestParam List<Long> userIds, @RequestParam String password) {
        Assert.notEmpty(userIds, "请先选中用户");
        Assert.notEmpty(password, "密码字段不能为空");
        userService.resetPassword(userIds, password);
        return Result.success();
    }

}