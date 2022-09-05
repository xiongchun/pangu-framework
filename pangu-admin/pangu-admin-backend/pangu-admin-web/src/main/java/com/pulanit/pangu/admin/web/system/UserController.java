package com.pulanit.pangu.admin.web.system;

import cn.hutool.core.io.resource.ResourceUtil;
import cn.hutool.core.util.CharsetUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.gitee.pulanos.pangu.framework.common.model.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 用户
 *
 * @author xiongchun
 */
@Slf4j
@RestController
@RequestMapping("/api/system/user")
public class UserController {

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

}
