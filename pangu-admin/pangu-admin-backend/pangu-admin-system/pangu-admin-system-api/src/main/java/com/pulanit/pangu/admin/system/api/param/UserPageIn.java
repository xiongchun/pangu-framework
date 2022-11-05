package com.pulanit.pangu.admin.system.api.param;

import com.gitee.pulanos.pangu.framework.common.entity.Page;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import lombok.experimental.Accessors;

/**
 * 用户查询入参
 * @author xiongchun
 */
@Data
@Accessors(chain = true)
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
public class UserPageIn extends Page {

    private static final long serialVersionUID = 1L;

    /**
     * 用户名称
     */
    private String name;

    /**
     * 所属部门ID
     */
    private Long deptId;

}
