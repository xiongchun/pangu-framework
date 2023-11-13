package com.pulanit.pangu.admin.system.service;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.thread.ThreadUtil;
import com.pulanit.pangu.admin.system.api.entity.LogFailEntity;
import com.pulanit.pangu.admin.system.api.entity.LogSuccessEntity;
import com.pulanit.pangu.admin.system.api.param.LogIn;
import com.pulanit.pangu.admin.system.api.service.LogService;
import com.pulanit.pangu.admin.system.dao.mapper.LogFailMapper;
import com.pulanit.pangu.admin.system.dao.mapper.LogSuccessMapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

@Slf4j
@Service(version = "1.0.0", group = "pangu-admin-system-app")
public class LogServiceImpl implements LogService {

    @Autowired
    private LogFailMapper logFailMapper;
    @Autowired
    private LogSuccessMapper logSuccessMapper;

    @Override
    public void saveLog(LogIn logIn) {
        logIn.setGmtCreated(DateUtil.date());
        if (logIn.getSuccess()){
            LogSuccessEntity entity = new LogSuccessEntity();
            BeanUtil.copyProperties(logIn, entity);
            logSuccessMapper.insert(entity);
        }else {
            LogFailEntity entity = new LogFailEntity();
            BeanUtil.copyProperties(logIn, entity);
            logFailMapper.insert(entity);
        }
    }


}
