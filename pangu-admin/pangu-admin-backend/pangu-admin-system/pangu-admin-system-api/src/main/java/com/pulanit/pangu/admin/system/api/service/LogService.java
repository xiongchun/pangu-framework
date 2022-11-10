package com.pulanit.pangu.admin.system.api.service;

import com.pulanit.pangu.admin.system.api.entity.LogFailEntity;
import com.pulanit.pangu.admin.system.api.entity.LogSuccessEntity;
import com.pulanit.pangu.admin.system.api.param.LogIn;

/**
 * 日志
 */
public interface LogService {

    void saveLog(LogIn logIn);

}
