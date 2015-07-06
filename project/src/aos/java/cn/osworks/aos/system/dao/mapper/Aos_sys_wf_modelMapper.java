package cn.osworks.aos.system.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.osworks.aos.core.annotation.Mapper;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.system.dao.po.Aos_sys_wf_modelPO;

/**
 * <b>流程模型扩展表[aos_sys_wf_model]数据访问接口</b>
 * 
 * <p>
 * 注意:此文件由AOS平台开发插件自动生成-禁止手工修改
 * </p>
 * 
 * @author OSWorks-XC
 * @date 2015-07-05 16:03:21
 */
@Mapper
public interface Aos_sys_wf_modelMapper {

	/**
	 * 插入一个数据持久化对象(插入字段为传入PO实体的非空属性)
	 * <p> 防止DB字段缺省值需要程序中再次赋值
	 *
	 * @param aos_sys_wf_modelPO
	 *            要插入的数据持久化对象
	 * @return 返回影响行数
	 */
	int insert(Aos_sys_wf_modelPO aos_sys_wf_modelPO);
	
	/**
	 * 插入一个数据持久化对象(含所有字段)
	 * 
	 * @param aos_sys_wf_modelPO
	 *            要插入的数据持久化对象
	 * @return 返回影响行数
	 */
	int insertAll(Aos_sys_wf_modelPO aos_sys_wf_modelPO);

	/**
	 * 根据主键修改数据持久化对象
	 * 
	 * @param aos_sys_wf_modelPO
	 *            要修改的数据持久化对象
	 * @return int 返回影响行数
	 */
	int updateByKey(Aos_sys_wf_modelPO aos_sys_wf_modelPO);

	/**
	 * 根据主键查询并返回数据持久化对象
	 * 
	 * @return Aos_sys_wf_modelPO
	 */
	Aos_sys_wf_modelPO selectByKey(@Param(value = "id_") String id_);

	/**
	 * 根据唯一组合条件查询并返回数据持久化对象
	 * 
	 * @return Aos_sys_wf_modelPO
	 */
	Aos_sys_wf_modelPO selectOne(Dto pDto);

	/**
	 * 根据Dto查询并返回数据持久化对象集合
	 * 
	 * @return List<Aos_sys_wf_modelPO>
	 */
	List<Aos_sys_wf_modelPO> list(Dto pDto);

	/**
	 * 根据Dto查询并返回分页数据持久化对象集合
	 * 
	 * @return List<Aos_sys_wf_modelPO>
	 */
	List<Aos_sys_wf_modelPO> listPage(Dto pDto);
		
	/**
	 * 根据Dto模糊查询并返回数据持久化对象集合(字符型字段模糊匹配，其余字段精确匹配)
	 * 
	 * @return List<Aos_sys_wf_modelPO>
	 */
	List<Aos_sys_wf_modelPO> like(Dto pDto);

	/**
	 * 根据Dto模糊查询并返回分页数据持久化对象集合(字符型字段模糊匹配，其余字段精确匹配)
	 * 
	 * @return List<Aos_sys_wf_modelPO>
	 */
	List<Aos_sys_wf_modelPO> likePage(Dto pDto);

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
