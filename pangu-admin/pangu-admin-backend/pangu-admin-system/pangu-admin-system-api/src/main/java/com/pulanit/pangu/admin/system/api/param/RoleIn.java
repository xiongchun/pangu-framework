package com.pulanit.pangu.admin.system.api.param;

import com.gitee.pulanos.pangu.framework.common.model.MyPage;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * 角色查询入参
 * @author xiongchun
 */
@Data
@Accessors(chain = true)
public class RoleIn extends MyPage implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 角色名称
     */
    private String name;

}
