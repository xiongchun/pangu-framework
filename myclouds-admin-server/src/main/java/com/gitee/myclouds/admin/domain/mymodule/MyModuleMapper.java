package com.gitee.myclouds.admin.domain.mymodule;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.gitee.myclouds.common.wrapper.Dto;

/**
 * <b>资源模块事件注册表[my_module]数据访问接口</b>
 * 
 * <p>
 * 注意:此文件由MyClouds平台自动生成-禁止手工修改
 * </p>
 * 
 * @author myclouds team
 * @date 2018-06-28 22:48:38
 */
@Mapper
public interface MyModuleMapper {

	/**
	 * 插入一个数据实体对象(插入字段为传入Entity实体的非空属性)
	 * <p> 防止DB字段缺省值需要程序中再次赋值
	 *
	 * @param my_moduleEntity
	 *            要插入的数据实体对象
	 * @return 返回影响行数
	 */
	int insert(MyModuleEntity myModuleEntity);
	
	/**
	 * 插入一个数据实体对象(含所有字段)
	 * 
	 * @param my_moduleEntity
	 *            要插入的数据实体对象
	 * @return 返回影响行数
	 */
	int insertAll(MyModuleEntity myModuleEntity);

	/**
	 * 根据主键修改数据实体对象
	 * 
	 * @param myModuleEntity
	 *            要修改的数据实体对象
	 * @return int 返回影响行数
	 */
	int updateByKey(MyModuleEntity myModuleEntity);

	/**
	 * 根据主键查询并返回数据实体对象
	 * 
	 * @return MyModuleEntity
	 */
	MyModuleEntity selectByKey(@Param(value = "id") Integer id);

	/**
	 * 根据唯一组合条件查询并返回数据实体对象
	 * 
	 * @return MyModuleEntity
	 */
	MyModuleEntity selectOne(Dto pDto);

	/**
	 * 根据Dto查询并返回数据实体对象集合
	 * 
	 * @return List<MyModuleEntity>
	 */
	List<MyModuleEntity> list(Dto pDto);

	/**
	 * 根据Dto查询并返回分页数据实体对象集合
	 * 
	 * @return List<MyModuleEntity>
	 */
	List<MyModuleEntity> listPage(Dto pDto);
		
	/**
	 * 根据Dto模糊查询并返回数据实体对象集合(字符型字段模糊匹配，其余字段精确匹配)
	 * 
	 * @return List<MyModuleEntity>
	 */
	List<MyModuleEntity> like(Dto pDto);

	/**
	 * 根据Dto模糊查询并返回分页数据实体对象集合(字符型字段模糊匹配，其余字段精确匹配)
	 * 
	 * @return List<MyModuleEntity>
	 */
	List<MyModuleEntity> likePage(Dto pDto);

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

	
}
