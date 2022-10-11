package com.pulanit.pangu.admin.web.system;

import cn.hutool.core.io.resource.ResourceUtil;
import cn.hutool.core.lang.Assert;
import cn.hutool.core.lang.tree.Tree;
import cn.hutool.core.util.CharsetUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.gitee.pulanos.pangu.framework.common.model.Result;
import com.pulanit.pangu.admin.system.api.entity.DeptEntity;
import com.pulanit.pangu.admin.system.api.entity.ResourceEntity;
import com.pulanit.pangu.admin.system.api.param.DeptIn;
import com.pulanit.pangu.admin.system.api.param.ResourceIn;
import com.pulanit.pangu.admin.system.api.service.ResourceService;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.beans.factory.annotation.Autowired;
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

    @Reference(version = "1.0.0", group = "pangu-admin-system-app")
    private ResourceService resourceService;

    /**
     * 用户登录获取菜单资源
     * @return
     */
    @GetMapping("/list")
    public Result<JSONObject> list() {
        String menu = ResourceUtil.readStr("json/menu.json", CharsetUtil.CHARSET_UTF_8);
        JSONObject jsonObject = JSON.parseObject(menu);
        return Result.success(jsonObject);
    }

    /**
     * 获取菜单(管理模块)
     * @return
     */
    @GetMapping("/listForManage")
    public Result<List<Tree<Integer>>> listForManage() {
        List<Tree<Integer>> treeNodes = resourceService.listForManage();
        return Result.success(treeNodes);
    }

    /**
     * 新增
     *
     * @param resourceIn
     * @return
     */
    @PostMapping("/add")
    public Result<Void> add(@RequestBody ResourceIn resourceIn) {
        return Result.success();
    }


    /**
     * 修改
     *
     * @param resourceIn
     * @return
     */
    @PostMapping("/update")
    public Result<Void> update(@RequestBody ResourceIn resourceIn) {
        Assert.notNull(resourceIn.getId(), "资源 ID 不能为空");

        return Result.success();
    }

}
