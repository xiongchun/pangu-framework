package com.gitee.pulanos.pangu.framework;

import cn.hutool.core.util.StrUtil;
import com.gitee.pulanos.pangu.framework.model.Result;

public class Test {

    public static void main(String[] args) {
        Result.make().setCode("").setData("");
        Result.fail(Constants.Code.ERROR_SERVICE, "");
        StrUtil.isNotEmpty("");
    }
}
