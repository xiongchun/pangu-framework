package com.pulanit.pangu.admin.system.api.param;

import com.gitee.pulanos.pangu.framework.common.entity.Page;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import lombok.experimental.Accessors;

/**
 * 角色查询入参
 * @author xiongchun
 */
@Data
@Accessors(chain = true)
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
public class RoleIn extends Page {

    /**
     * 角色名称
     */
    private String name;

}
