package com.pulanit.pangu.admin.system.api.service;

import com.gitee.pulanos.pangu.framework.common.model.PageResult;
import com.pulanit.pangu.admin.system.api.entity.UserEntity;
import com.pulanit.pangu.admin.system.api.param.LoginIn;
import com.pulanit.pangu.admin.system.api.param.LoginOut;
import com.pulanit.pangu.admin.system.api.param.UserAddIn;
import com.pulanit.pangu.admin.system.api.param.UserIn;

import java.util.List;

/**
 * 用户
 * @author xiongchun
 */
public interface UserService {

    LoginOut login(LoginIn inDto);

    /**
     * 查询列表信息
     * @param userIn
     * @return
     */
    PageResult<UserEntity> list(UserIn userIn);

    /**
     * 新增
     * @param userAddIn
     */
    void add(UserAddIn userAddIn);

    /**
     * 修改
     * @param userEntity
     */
    void update(UserEntity userEntity);

    /**
     * 删除
     * @param id
     */
    void delete(Long id);

    /**
     * 批量删除
     * @param ids
     */
    void batchDelete(List<Long> ids);

    /**
     * 校验登录账号
     * @param userName
     * @return
     */
    long validateUserName(String userName, Long id);

}
