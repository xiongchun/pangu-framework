package com.pulanit.pangu.admin.system.api.param;

import com.gitee.pulanos.pangu.framework.common.model.Page;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * 用户查询入参
 * @author xiongchun
 */
@Data
@Accessors(chain = true)
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
public class UserIn extends Page {

    private static final long serialVersionUID = 1L;

    /**
     * 角色名称
     */
    private String name;

}
