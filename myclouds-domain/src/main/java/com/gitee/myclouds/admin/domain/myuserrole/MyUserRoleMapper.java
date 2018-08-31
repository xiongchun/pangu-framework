package com.gitee.myclouds.admin.domain.myuserrole;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Mapper;

import com.gitee.myclouds.admin.domain.myuserrole.MyUserRoleEntity;
import com.gitee.myclouds.common.wrapper.Dto;

/**
 * <b>用户-角色关联表[my_user_role]数据访问接口</b>
 * 
 * <p>
 * 注意:此文件由MyClouds平台自动生成-禁止手工修改
 * </p>
 * 
 * @author myclouds team
 * @date 2018-03-09 18:24:29
 */
@Mapper
public interface MyUserRoleMapper {

	/**
	 * 插入一个数据实体对象(插入字段为传入Entity实体的非空属性)
	 * <p> 防止DB字段缺省值需要程序中再次赋值
	 *
	 * @param my_user_roleEntity
	 *            要插入的数据实体对象
	 * @return 返回影响行数
	 */
	int insert(MyUserRoleEntity myUserRoleEntity);
	
	/**
	 * 插入一个数据实体对象(含所有字段)
	 * 
	 * @param my_user_roleEntity
	 *            要插入的数据实体对象
	 * @return 返回影响行数
	 */
	int insertAll(MyUserRoleEntity myUserRoleEntity);

	/**
	 * 根据主键修改数据实体对象
	 * 
	 * @param myUserRoleEntity
	 *            要修改的数据实体对象
	 * @return int 返回影响行数
	 */
	int updateByKey(MyUserRoleEntity myUserRoleEntity);

	/**
	 * 根据主键查询并返回数据实体对象
	 * 
	 * @return MyUserRoleEntity
	 */
	MyUserRoleEntity selectByKey(@Param(value = "id") Integer id);

	/**
	 * 根据唯一组合条件查询并返回数据实体对象
	 * 
	 * @return MyUserRoleEntity
	 */
	MyUserRoleEntity selectOne(Dto pDto);

	/**
	 * 根据Dto查询并返回数据实体对象集合
	 * 
	 * @return List<MyUserRoleEntity>
	 */
	List<MyUserRoleEntity> list(Dto pDto);

	/**
	 * 根据Dto查询并返回分页数据实体对象集合
	 * 
	 * @return List<MyUserRoleEntity>
	 */
	List<MyUserRoleEntity> listPage(Dto pDto);
		
	/**
	 * 根据Dto模糊查询并返回数据实体对象集合(字符型字段模糊匹配，其余字段精确匹配)
	 * 
	 * @return List<MyUserRoleEntity>
	 */
	List<MyUserRoleEntity> like(Dto pDto);

	/**
	 * 根据Dto模糊查询并返回分页数据实体对象集合(字符型字段模糊匹配，其余字段精确匹配)
	 * 
	 * @return List<MyUserRoleEntity>
	 */
	List<MyUserRoleEntity> likePage(Dto pDto);

	/**
	 * 根据主键删除数据实体对象
	 *
	 * @return 影响行数
	 */
	int deleteByKey(@Param(value = "id") Integer id);
	
	/**
	 * 根据Dto统计行数
	 * 
	 * @param pDto
	 * @return
	 */
	int rows(Dto pDto);
	
	/**
	 * 根据数学表达式进行数学运算
	 * 
	 * @param pDto
	 * @return String
	 */
	String calc(Dto pDto);

	/**
	 * 根据唯一键[ukey1]修改数据实体对象
	 * 
	 * @param myUserRoleEntity
	 *            要修改的数据实体对象
	 * @return int 返回影响行数
	 */
	int updateByUkey1(MyUserRoleEntity myUserRoleEntity);

	/**
	 * 根据唯一键[ukey1]查询并返回数据实体对象
	 * 
	 * @return MyUserRoleEntity
	 */
	MyUserRoleEntity selectByUkey1(@Param(value = "user_id") Integer user_id,@Param(value = "role_id") Integer role_id);
	
	/**
	 * 根据唯一键[ukey1]删除数据实体对象
	 *
	 * @return 影响行数
	 */
	int deleteByUkey1(@Param(value = "user_id") Integer user_id,@Param(value = "role_id") Integer role_id);
	
}
