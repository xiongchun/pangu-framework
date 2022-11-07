package com.pulanit.pangu.admin.system.service;

import cn.hutool.core.date.DateUtil;
import com.pulanit.pangu.admin.system.api.entity.LogExcEntity;
import com.pulanit.pangu.admin.system.api.service.LogService;
import com.pulanit.pangu.admin.system.dao.mapper.LogExcMapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

@Slf4j
@Service(version = "1.0.0", group = "pangu-admin-system-app")
public class LogServiceImpl implements LogService {

    @Autowired
    private LogExcMapper logExcMapper;

    @Override
    public void saveLogExc(LogExcEntity entity) {
        entity.setGmtCreated(DateUtil.date());
        logExcMapper.insert(entity);
    }
}
