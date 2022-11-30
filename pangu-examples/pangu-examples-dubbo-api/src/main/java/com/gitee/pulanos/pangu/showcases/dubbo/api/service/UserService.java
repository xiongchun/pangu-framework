package com.gitee.pulanos.pangu.showcases.dubbo.api.service;

import com.gitee.pulanos.pangu.showcases.dubbo.api.entity.UserEntity;
import com.gitee.pulanos.pangu.showcases.dubbo.api.dto.UserInDto;
import com.gitee.pulanos.pangu.showcases.dubbo.api.dto.UserOutDto;

import java.util.List;

/**
 * @author xiongchun
 */
public interface UserService {

    UserEntity findUserEntity(Long id);

    List<UserOutDto> listUserOuts(UserInDto userInDto);

}
