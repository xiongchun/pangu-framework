package com.pulanit.pangu.admin.system.api.param;

import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * 用户入参
 * @author xiongchun
 */
@Data
@Accessors(chain = true)
public class RoleSelectIn implements Serializable {

    private static final long serialVersionUID = 8573106672603542665L;

    /**
     * 所属角色集合
     */
    private long[] roleIds;

}
