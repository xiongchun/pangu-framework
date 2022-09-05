package com.pulanit.pangu.admin.system.api.service;

import com.pulanit.pangu.admin.system.api.param.LoginIn;
import com.pulanit.pangu.admin.system.api.param.LoginOut;

/**
 * 用户
 * @author xiongchun
 */
public interface UserService {

    LoginOut login(LoginIn inDto);

}
