package com.pulanit.pangu.admin.common;

import com.alibaba.fastjson2.JSON;
import com.pulanit.pangu.admin.common.domain.UserInfo;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.rpc.RpcContext;

/**
 * 应用上下文
 */
@Slf4j
public class AppContext {

    /**
     * 获取登录用户信息
     * @return
     */
    public static UserInfo getUserInfo(){
        UserInfo userInfo = null;
        Object obj = RpcContext.getContext().getAttachment(AppConstants.CURRENT_USER_KEY);
        if (obj == null){
            log.warn("没有获取到当前用户信息");
            return null;
        }else {
            userInfo = JSON.parseObject(String.valueOf(obj), UserInfo.class);
        }
        return userInfo;
    }
}
