package com.pulanit.pangu.admin.system.api.param;

import com.pulanit.pangu.admin.system.api.entity.ResourceApiEntity;
import com.pulanit.pangu.admin.system.api.entity.ResourceEntity;
import com.pulanit.pangu.admin.system.api.entity.UserEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import lombok.experimental.Accessors;

import java.util.List;

/**
 * 资源入参
 * @author xiongchun
 */
@Data
@Accessors(chain = true)
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
public class ResourceIn extends ResourceEntity {

    /**
     * 资源-API绑定列表
     */
    private List<ResourceApiEntity> apiList;

}
