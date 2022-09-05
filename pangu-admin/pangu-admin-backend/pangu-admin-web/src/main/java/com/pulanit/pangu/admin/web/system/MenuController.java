package com.pulanit.pangu.admin.web.system;

import cn.hutool.core.io.resource.ResourceUtil;
import cn.hutool.core.util.CharsetUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.gitee.pulanos.pangu.framework.common.model.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 资源（菜单等）
 *
 * @author xiongchun
 */
@Slf4j
@RestController
@RequestMapping("/api/system/menu")
public class MenuController {

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
     * 获取菜单
     * @return
     */
    @GetMapping("/list2")
    public Result<JSONArray> list2() {
        String menu = ResourceUtil.readStr("json/menu2.json", CharsetUtil.CHARSET_UTF_8);
        JSONArray jsonArray = JSON.parseArray(menu);
        return Result.success(jsonArray);
    }

}
