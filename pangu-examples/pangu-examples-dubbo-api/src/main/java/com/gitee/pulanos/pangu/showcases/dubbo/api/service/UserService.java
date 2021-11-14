package com.gitee.pulanos.pangu.showcases.dubbo.api.service;

import com.gitee.pulanos.pangu.showcases.dubbo.api.entity.UserEntity;
import com.gitee.pulanos.pangu.showcases.dubbo.api.in.UserIn;
import com.gitee.pulanos.pangu.showcases.dubbo.api.out.UserOut;

import java.util.List;

/**
 * @author xiongchun
 */
public interface UserService {

    UserEntity findUserEntity(Long id);

    List<UserOut> listUserOuts(UserIn userIn);

}
