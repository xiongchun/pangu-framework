package com.pulanit.pangu.admin.system.manager;

import cn.hutool.core.util.StrUtil;
import com.pulanit.pangu.admin.system.api.entity.DeptEntity;
import com.pulanit.pangu.admin.system.dao.mapper.DeptMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import static com.pulanit.pangu.admin.system.api.SystemConstants.ROOT_NODE_ID;

@Component
@Slf4j
public class DeptManager {

    @Autowired
    private DeptMapper deptMapper;

    private final String DEPT_SEPARATOR = " / ";

    /**
     * 获取级联部门名称（含上级部门）
     * @param deptId
     * @return
     */
    public String queryCascadeDeptName(Long deptId){
        String deptName = "";
        for (int i = 0; i < 100; i++) {
            DeptEntity deptEntity = findDeptEntityById(deptId);
            deptName = deptName + deptEntity.getName() + DEPT_SEPARATOR;
            deptId = deptEntity.getParentId();
            if (ROOT_NODE_ID.longValue() == deptId.longValue()){
                break;
            }
        }
        return StrUtil.subBefore(deptName, DEPT_SEPARATOR, true);
    }


    public DeptEntity findDeptEntityById(Long deptId){
        return deptMapper.selectById(deptId);
    }


}
