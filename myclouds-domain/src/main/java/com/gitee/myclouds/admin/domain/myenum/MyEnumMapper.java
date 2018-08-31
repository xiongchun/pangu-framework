package com.gitee.myclouds.admin.domain.myenum;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Mapper;

import com.gitee.myclouds.admin.domain.myenum.MyEnumEntity;
import com.gitee.myclouds.common.wrapper.Dto;

/**
 * <b>枚举类型参数表[my_enum]数据访问接口</b>
 * 
 * <p>
 * 注意:此文件由MyClouds平台自动生成-禁止手工修改
 * </p>
 * 
 * @author myclouds team
 * @date 2018-03-09 18:24:27
 */
@Mapper
public interface MyEnumMapper {

	/**
	 * 插入一个数据实体对象(插入字段为传入Entity实体的非空属性)
	 * <p> 防止DB字段缺省值需要程序中再次赋值
	 *
	 * @param my_enumEntity
	 *            要插入的数据实体对象
	 * @return 返回影响行数
	 */
	int insert(MyEnumEntity myEnumEntity);
	
	/**
	 * 插入一个数据实体对象(含所有字段)
	 * 
	 * @param my_enumEntity
	 *            要插入的数据实体对象
	 * @return 返回影响行数
	 */
	int insertAll(MyEnumEntity myEnumEntity);

	/**
	 * 根据主键修改数据实体对象
	 * 
	 * @param myEnumEntity
	 *            要修改的数据实体对象
	 * @return int 返回影响行数
	 */
	int updateByKey(MyEnumEntity myEnumEntity);

	/**
	 * 根据主键查询并返回数据实体对象
	 * 
	 * @return MyEnumEntity
	 */
	MyEnumEntity selectByKey(@Param(value = "id") Integer id);

	/**
	 * 根据唯一组合条件查询并返回数据实体对象
	 * 
	 * @return MyEnumEntity
	 */
	MyEnumEntity selectOne(Dto pDto);

	/**
	 * 根据Dto查询并返回数据实体对象集合
	 * 
	 * @return List<MyEnumEntity>
	 */
	List<MyEnumEntity> list(Dto pDto);

	/**
	 * 根据Dto查询并返回分页数据实体对象集合
	 * 
	 * @return List<MyEnumEntity>
	 */
	List<MyEnumEntity> listPage(Dto pDto);
		
	/**
	 * 根据Dto模糊查询并返回数据实体对象集合(字符型字段模糊匹配，其余字段精确匹配)
	 * 
	 * @return List<MyEnumEntity>
	 */
	List<MyEnumEntity> like(Dto pDto);

	/**
	 * 根据Dto模糊查询并返回分页数据实体对象集合(字符型字段模糊匹配，其余字段精确匹配)
	 * 
	 * @return List<MyEnumEntity>
	 */
	List<MyEnumEntity> likePage(Dto pDto);

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
	 * @param myEnumEntity
	 *            要修改的数据实体对象
	 * @return int 返回影响行数
	 */
	int updateByUkey1(MyEnumEntity myEnumEntity);

	/**
	 * 根据唯一键[ukey1]查询并返回数据实体对象
	 * 
	 * @return MyEnumEntity
	 */
	MyEnumEntity selectByUkey1(@Param(value = "enum_key") String enum_key,@Param(value = "element_key") String element_key);
	
	/**
	 * 根据唯一键[ukey1]删除数据实体对象
	 *
	 * @return 影响行数
	 */
	int deleteByUkey1(@Param(value = "enum_key") String enum_key,@Param(value = "element_key") String element_key);
	
}
