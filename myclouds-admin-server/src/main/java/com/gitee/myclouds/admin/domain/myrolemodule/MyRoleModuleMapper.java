package com.gitee.myclouds.admin.domain.myrolemodule;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Mapper;

import com.gitee.myclouds.admin.domain.myrolemodule.MyRoleModuleEntity;
import com.gitee.myclouds.common.wrapper.Dto;

/**
 * <b>功能模块-角色关联表[my_role_module]数据访问接口</b>
 * 
 * <p>
 * 注意:此文件由MyClouds平台自动生成-禁止手工修改
 * </p>
 * 
 * @author myclouds team
 * @date 2018-03-15 16:23:47
 */
@Mapper
public interface MyRoleModuleMapper {

	/**
	 * 插入一个数据实体对象(插入字段为传入Entity实体的非空属性)
	 * <p> 防止DB字段缺省值需要程序中再次赋值
	 *
	 * @param my_role_moduleEntity
	 *            要插入的数据实体对象
	 * @return 返回影响行数
	 */
	int insert(MyRoleModuleEntity myRoleModuleEntity);
	
	/**
	 * 插入一个数据实体对象(含所有字段)
	 * 
	 * @param my_role_moduleEntity
	 *            要插入的数据实体对象
	 * @return 返回影响行数
	 */
	int insertAll(MyRoleModuleEntity myRoleModuleEntity);

	/**
	 * 根据主键修改数据实体对象
	 * 
	 * @param myRoleModuleEntity
	 *            要修改的数据实体对象
	 * @return int 返回影响行数
	 */
	int updateByKey(MyRoleModuleEntity myRoleModuleEntity);

	/**
	 * 根据主键查询并返回数据实体对象
	 * 
	 * @return MyRoleModuleEntity
	 */
	MyRoleModuleEntity selectByKey(@Param(value = "id") Integer id);

	/**
	 * 根据唯一组合条件查询并返回数据实体对象
	 * 
	 * @return MyRoleModuleEntity
	 */
	MyRoleModuleEntity selectOne(Dto pDto);

	/**
	 * 根据Dto查询并返回数据实体对象集合
	 * 
	 * @return List<MyRoleModuleEntity>
	 */
	List<MyRoleModuleEntity> list(Dto pDto);

	/**
	 * 根据Dto查询并返回分页数据实体对象集合
	 * 
	 * @return List<MyRoleModuleEntity>
	 */
	List<MyRoleModuleEntity> listPage(Dto pDto);
		
	/**
	 * 根据Dto模糊查询并返回数据实体对象集合(字符型字段模糊匹配，其余字段精确匹配)
	 * 
	 * @return List<MyRoleModuleEntity>
	 */
	List<MyRoleModuleEntity> like(Dto pDto);

	/**
	 * 根据Dto模糊查询并返回分页数据实体对象集合(字符型字段模糊匹配，其余字段精确匹配)
	 * 
	 * @return List<MyRoleModuleEntity>
	 */
	List<MyRoleModuleEntity> likePage(Dto pDto);

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
	 * @param myRoleModuleEntity
	 *            要修改的数据实体对象
	 * @return int 返回影响行数
	 */
	int updateByUkey1(MyRoleModuleEntity myRoleModuleEntity);

	/**
	 * 根据唯一键[ukey1]查询并返回数据实体对象
	 * 
	 * @return MyRoleModuleEntity
	 */
	MyRoleModuleEntity selectByUkey1(@Param(value = "role_id") Integer role_id,@Param(value = "module_id") Integer module_id,@Param(value = "grant_type") String grant_type);
	
	/**
	 * 根据唯一键[ukey1]删除数据实体对象
	 *
	 * @return 影响行数
	 */
	int deleteByUkey1(@Param(value = "role_id") Integer role_id,@Param(value = "module_id") Integer module_id,@Param(value = "grant_type") String grant_type);
	
}
