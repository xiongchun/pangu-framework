package com.pulanit.pangu.admin.system.dao.mapper2;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pulanit.pangu.admin.system.api.entity.UserEntity;
import com.pulanit.pangu.admin.system.api.param.UserPageIn;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 手工和映射的 Mapper 接口
 */
@Mapper
public interface CommonMapper {

    List<UserEntity> listUnGrantedUsersByRoleId(Page<UserEntity> page, UserPageIn param);

}
