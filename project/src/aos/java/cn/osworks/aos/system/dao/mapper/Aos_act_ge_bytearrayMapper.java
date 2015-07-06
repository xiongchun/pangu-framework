package cn.osworks.aos.system.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.osworks.aos.core.annotation.Mapper;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.system.dao.po.Aos_act_ge_bytearrayPO;

/**
 * <b>InnoDB free: 9216 kB[aos_act_ge_bytearray]数据访问接口</b>
 * 
 * <p>
 * 注意:此文件由AOS平台开发插件自动生成-禁止手工修改
 * </p>
 * 
 * @author OSWorks-XC
 * @date 2015-07-05 16:03:20
 */
@Mapper
public interface Aos_act_ge_bytearrayMapper {

	/**
	 * 插入一个数据持久化对象(插入字段为传入PO实体的非空属性)
	 * <p> 防止DB字段缺省值需要程序中再次赋值
	 *
	 * @param aos_act_ge_bytearrayPO
	 *            要插入的数据持久化对象
	 * @return 返回影响行数
	 */
	int insert(Aos_act_ge_bytearrayPO aos_act_ge_bytearrayPO);
	
	/**
	 * 插入一个数据持久化对象(含所有字段)
	 * 
	 * @param aos_act_ge_bytearrayPO
	 *            要插入的数据持久化对象
	 * @return 返回影响行数
	 */
	int insertAll(Aos_act_ge_bytearrayPO aos_act_ge_bytearrayPO);

	/**
	 * 根据主键修改数据持久化对象
	 * 
	 * @param aos_act_ge_bytearrayPO
	 *            要修改的数据持久化对象
	 * @return int 返回影响行数
	 */
	int updateByKey(Aos_act_ge_bytearrayPO aos_act_ge_bytearrayPO);

	/**
	 * 根据主键查询并返回数据持久化对象
	 * 
	 * @return Aos_act_ge_bytearrayPO
	 */
	Aos_act_ge_bytearrayPO selectByKey(@Param(value = "id_") String id_);

	/**
	 * 根据唯一组合条件查询并返回数据持久化对象
	 * 
	 * @return Aos_act_ge_bytearrayPO
	 */
	Aos_act_ge_bytearrayPO selectOne(Dto pDto);

	/**
	 * 根据Dto查询并返回数据持久化对象集合
	 * 
	 * @return List<Aos_act_ge_bytearrayPO>
	 */
	List<Aos_act_ge_bytearrayPO> list(Dto pDto);

	/**
	 * 根据Dto查询并返回分页数据持久化对象集合
	 * 
	 * @return List<Aos_act_ge_bytearrayPO>
	 */
	List<Aos_act_ge_bytearrayPO> listPage(Dto pDto);
		
	/**
	 * 根据Dto模糊查询并返回数据持久化对象集合(字符型字段模糊匹配，其余字段精确匹配)
	 * 
	 * @return List<Aos_act_ge_bytearrayPO>
	 */
	List<Aos_act_ge_bytearrayPO> like(Dto pDto);

	/**
	 * 根据Dto模糊查询并返回分页数据持久化对象集合(字符型字段模糊匹配，其余字段精确匹配)
	 * 
	 * @return List<Aos_act_ge_bytearrayPO>
	 */
	List<Aos_act_ge_bytearrayPO> likePage(Dto pDto);

	/**
	 * 根据主键删除数据持久化对象
	 *
	 * @return 影响行数
	 */
	int deleteByKey(@Param(value = "id_") String id_);
	
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
