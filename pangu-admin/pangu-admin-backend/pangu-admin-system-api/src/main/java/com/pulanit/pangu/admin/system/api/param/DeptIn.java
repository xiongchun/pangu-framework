package com.pulanit.pangu.admin.system.api.param;

import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * 部门查询入参
 * @author xiongchun
 */
@Data
@Accessors(chain = true)
public class DeptIn implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 部门名称
     */
    private String name;

}
