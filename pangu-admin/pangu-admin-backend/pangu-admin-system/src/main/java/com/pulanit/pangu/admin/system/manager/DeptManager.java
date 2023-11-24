package com.pulanit.pangu.admin.system.manager;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.collection.ListUtil;
import com.pulanit.pangu.admin.system.api.entity.DeptEntity;
import com.pulanit.pangu.admin.system.dao.mapper.DeptMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Collections;
import java.util.List;

import static com.pulanit.pangu.admin.system.api.SystemConstants.ROOT_NODE_ID;

@Component
@Slf4j
public class DeptManager {

    @Autowired
    private DeptMapper deptMapper;

    private final String DEPT_SEPARATOR = " / ";

    private final int MAX_LOOP = 10;

    /**
     * 获取级联部门名称（含上级部门）
     * @param deptId
     * @return
     */
    public String queryCascadeDeptName(Long deptId){
        List<String> names = ListUtil.list(false);
        for (int i = 0; i < MAX_LOOP; i++) {
            DeptEntity deptEntity = findDeptEntityById(deptId);
            names.add(deptEntity.getName());
            deptId = deptEntity.getParentId();
            if (ROOT_NODE_ID.longValue() == deptId.longValue()){
                break;
            }
        }
        return CollUtil.join(names, DEPT_SEPARATOR);
    }

    public DeptEntity findDeptEntityById(Long deptId){
        return deptMapper.selectById(deptId);
    }


}
