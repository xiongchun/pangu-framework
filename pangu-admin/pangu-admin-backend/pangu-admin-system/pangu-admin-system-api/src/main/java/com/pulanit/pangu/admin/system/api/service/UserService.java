package com.pulanit.pangu.admin.system.api.service;

import com.gitee.pulanos.pangu.framework.common.model.PageResult;
import com.gitee.pulanos.pangu.framework.common.model.Result;
import com.pulanit.pangu.admin.system.api.entity.RoleEntity;
import com.pulanit.pangu.admin.system.api.entity.UserEntity;
import com.pulanit.pangu.admin.system.api.param.*;

import java.util.List;

/**
 * 用户
 * @author xiongchun
 */
public interface UserService {

    Result<LoginOut> login(LoginIn loginIn);

    /**
     * 查询列表信息
     * @param userPageIn
     * @return
     */
    PageResult<UserOut> list(UserPageIn userPageIn);

    /**
     * 新增
     * @param userIn
     */
    void add(UserIn userIn);

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

    /**
     * 查询用户分配角色
     * @param userId
     * @return
     */
    List<RoleEntity> queryRolesByUserId(Long userId);

    /**
     * 查询用户详细信息
     * @param userId
     * @return
     */
    UserOut queryUserDetailInfoById(Long userId);

    /**
     * 重置密码
     * @param userIds
     * @param password
     */
    void resetPassword(List<Long> userIds, String password);

}
