package com.pulanit.pangu.admin.system.api.service;

import com.gitee.pulanos.pangu.framework.sdk.dto.page.PageResult;
import com.gitee.pulanos.pangu.framework.sdk.exception.BizException;
import com.pulanit.pangu.admin.system.api.entity.RoleEntity;
import com.pulanit.pangu.admin.system.api.entity.UserEntity;
import com.pulanit.pangu.admin.system.api.param.LoginIn;
import com.pulanit.pangu.admin.system.api.param.LoginOut;
import com.pulanit.pangu.admin.system.api.param.UserOut;
import com.pulanit.pangu.admin.system.api.param.UserPageIn;

import java.util.List;

/**
 * 用户
 * @author xiongchun
 */
public interface UserService {

    LoginOut login(LoginIn loginIn) throws BizException;

    /**
     * 查询列表信息
     */
    PageResult<UserOut> list(UserPageIn pageIn) throws BizException;

    /**
     * 查询角色授权待选用户
     */
    PageResult<UserOut> listUnGrantedUsersByRoleId(UserPageIn pageIn) throws BizException;

    /**
     * 查询角色授权已选用户
     */
    List<UserOut> listGrantedUsersByRoleId(Long roleId) throws BizException;

    /**
     * 新增
     */
    void add(UserEntity userEntity) throws BizException;

    /**
     * 修改
     */
    void update(UserEntity userEntity) throws BizException;

    /**
     * 删除
     * @param id
     */
    void delete(Long id) throws BizException;

    /**
     * 批量删除
     */
    void batchDelete(List<Long> ids) throws BizException;

    /**
     * 校验登录账号
     */
    long validateUserName(String userName, Long id) throws BizException;

    /**
     * 查询用户分配角色
     */
    List<RoleEntity> queryRolesByUserId(Long userId) throws BizException;

    /**
     * 查询用户待分配角色
     */
    List<RoleEntity> queryGrantRolesByUserId(Long userId) throws BizException;

    /**
     * 查询用户详细信息
     */
    UserOut queryUserDetailInfoById(Long userId) throws BizException;

    /**
     * 重置密码
     */
    void resetPassword(List<Long> userIds, String password) throws BizException;

    /**
     * 修改密码
     */
    void updatePassword(Long userId, String password, String newPassword) throws BizException;

    /**
     * 选择角色
     */
    void grantSelectRole(Long userId, List<Long> roleIds) throws BizException;

    /**
     * 取消角色
     */
    void cancelRole(Long userId, List<Long> roleIds) throws BizException;

}
