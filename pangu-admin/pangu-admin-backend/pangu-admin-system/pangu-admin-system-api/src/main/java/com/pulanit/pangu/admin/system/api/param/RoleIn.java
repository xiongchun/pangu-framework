package com.pulanit.pangu.admin.system.api.param;

import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * 角色查询入参
 * @author xiongchun
 */
@Data
@Accessors(chain = true)
public class RoleIn implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 角色名称
     */
    private String name;

}
