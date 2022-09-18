package com.pulanit.pangu.admin.system.api.param;

import com.pulanit.pangu.admin.system.api.entity.UserEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import lombok.experimental.Accessors;

import java.util.List;

/**
 * 用户出参
 */
@Data
@Accessors(chain = true)
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
public class UserOut extends UserEntity {

    private List<Long> roleIds;

}
