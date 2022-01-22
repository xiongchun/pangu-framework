package com.gitee.pulanos.pangu.showcases.crud.dao.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gitee.pulanos.pangu.showcases.crud.dao.entity.UserEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * 提示：自定义sql手工映射大部分时候为复杂的多表联合查询的SQL，单表操作和简单的多表连接都应该统一使用mybatis plus的API
 *
 * @author xiongchun
 */
@Mapper
public interface CrudMapper {

    /**
     * 分页查询
     * @param page 分页查询对象
     * @param param
     * @return
     */
    List<UserEntity> listUsersByPage(Page<UserEntity> page, Map<String, Object> param);

    /**
     * 分页查询
     * @param page 分页查询对象
     * @param userType
     * @return
     */
    List<Map<String, Object>> listUserMapsByPage(Page<Map<String, Object>> page, String userType);

    /**
     * 普通集合查询
     * @param param
     * @return
     */
    List<UserEntity> listUsersByMap(Map<String, Object> param);

}
