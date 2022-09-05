package com.pulanit.pangu.admin.system.api.param;

import com.pulanit.pangu.admin.system.api.entity.DeptEntity;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.List;

/**
 * 部门查询出参
 */
@Data
@Accessors(chain = true)
public class ListDeptOut extends DeptEntity implements Serializable {

    private static final long serialVersionUID=1L;

    /**
     * 子孙节点集合
     */
    private List<ListDeptOut> children;


}
