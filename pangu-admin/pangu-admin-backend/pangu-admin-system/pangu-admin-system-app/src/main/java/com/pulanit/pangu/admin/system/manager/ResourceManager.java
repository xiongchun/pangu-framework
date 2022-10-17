package com.pulanit.pangu.admin.system.manager;

import com.pulanit.pangu.admin.system.dao.mapper.ResourceMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
@Slf4j
public class ResourceManager {

    @Autowired
    private ResourceMapper resourceMapper;


}
