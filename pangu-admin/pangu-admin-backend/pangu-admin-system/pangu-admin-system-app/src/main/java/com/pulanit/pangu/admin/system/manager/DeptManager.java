package com.pulanit.pangu.admin.system.manager;

import com.pulanit.pangu.admin.system.dao.mapper.DeptMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
@Slf4j
public class DeptManager {

    @Autowired
    private DeptMapper deptMapper;

    public String queryCascadeDeptName(Long deptId){
        String deptName = "";

        return deptName;
    }


}
