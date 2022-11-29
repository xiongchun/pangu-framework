package com.pulanit.pangu.admin.system.api.service;

import com.gitee.pulanos.pangu.framework.common.entity.PageResult;
import com.pulanit.pangu.admin.system.api.entity.ResourceEntity;
import com.pulanit.pangu.admin.system.api.entity.RoleEntity;
import com.pulanit.pangu.admin.system.api.entity.UserEntity;
import com.pulanit.pangu.admin.system.api.param.*;

import java.util.List;

/**
 * 用户
 * @author xiongchun
 */
public interface UserService {

    LoginOut login(LoginIn loginIn);

    /**
     * 查询列表信息
     * @param pageIn
     * @return
     */
    PageResult<UserOut> list(UserPageIn pageIn);

    /**
     * 查询角色授权待选用户
     * @param pageIn
     * @return
     */
    PageResult<UserOut> listUnGrantedUsersByRoleId(UserPageIn pageIn);

    /**
     * 查询角色授权已选用户
     * @param roleId
     * @return
     */
    List<UserOut> listGrantedUsersByRoleId(Long roleId);

    /**
     * 新增
     * @param userEntity
     */
    void add(UserEntity userEntity);

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
     * 查询用户待分配角色
     * @param userId
     * @return
     */
    List<RoleEntity> queryGrantRolesByUserId(Long userId);

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

    /**
     * 修改密码
     * @param userId
     * @param password
     * @param newPassword
     */
    void updatePassword(Long userId, String password, String newPassword);

    /**
     * 选择角色
     * @param userId
     * @param roleIds
     */
    void grantSelectRole(Long userId, List<Long> roleIds);

    /**
     * 取消角色
     * @param userId
     * @param roleIds
     */
    void cancelRole(Long userId, List<Long> roleIds);


}
