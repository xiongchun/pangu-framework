package com.pulanit.pangu.admin.web.system;

import cn.hutool.core.io.resource.ResourceUtil;
import cn.hutool.core.lang.Assert;
import cn.hutool.core.util.CharsetUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.gitee.pulanos.pangu.framework.common.model.PageResult;
import com.gitee.pulanos.pangu.framework.common.model.Result;
import com.pulanit.pangu.admin.system.api.entity.UserEntity;
import com.pulanit.pangu.admin.system.api.param.UserIn;
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
     * 获取菜单资源
     * @return
     */
    @GetMapping("/list")
    public Result<JSONObject> list() {
        String roles = ResourceUtil.readStr("json/user.json", CharsetUtil.CHARSET_UTF_8);
        JSONObject jsonObject = JSON.parseObject(roles);
        return Result.success(jsonObject);
    }

    /**
     * 获取用户
     * @return
     */
    @GetMapping("/list")
    public Result<PageResult<UserEntity>> list(UserIn userIn) {
        PageResult<UserEntity> pageResult = userService.list(userIn);
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
    @GetMapping("/validateRoleKey")
    public Result<Long> validateRoleKey(@RequestParam  String account, @RequestParam  Long id) {
        long cnt = userService.validateAccount(account, id);
        return Result.success(cnt);
    }



}
