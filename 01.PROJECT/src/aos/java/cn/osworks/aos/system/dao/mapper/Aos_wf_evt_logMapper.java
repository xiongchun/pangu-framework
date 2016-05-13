package cn.osworks.aos.system.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.osworks.aos.core.annotation.Mapper;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.system.dao.po.Aos_wf_evt_logPO;

/**
 * <b>aos_wf_evt_log[aos_wf_evt_log]数据访问接口</b>
 * 
 * <p>
 * 注意:此文件由AOS平台自动生成-禁止手工修改
 * </p>
 * 
 * @author AHei
 * @date 2015-12-22 22:10:31
 */
@Mapper
public interface Aos_wf_evt_logMapper {

	/**
	 * 插入一个数据持久化对象(插入字段为传入PO实体的非空属性)
	 * <p> 防止DB字段缺省值需要程序中再次赋值
	 *
	 * @param aos_wf_evt_logPO
	 *            要插入的数据持久化对象
	 * @return 返回影响行数
	 */
	int insert(Aos_wf_evt_logPO aos_wf_evt_logPO);
	
	/**
	 * 插入一个数据持久化对象(含所有字段)
	 * 
	 * @param aos_wf_evt_logPO
	 *            要插入的数据持久化对象
	 * @return 返回影响行数
	 */
	int insertAll(Aos_wf_evt_logPO aos_wf_evt_logPO);

	/**
	 * 根据主键修改数据持久化对象
	 * 
	 * @param aos_wf_evt_logPO
	 *            要修改的数据持久化对象
	 * @return int 返回影响行数
	 */
	int updateByKey(Aos_wf_evt_logPO aos_wf_evt_logPO);

	/**
	 * 根据主键查询并返回数据持久化对象
	 * 
	 * @return Aos_wf_evt_logPO
	 */
	Aos_wf_evt_logPO selectByKey(@Param(value = "log_nr_") Integer log_nr_);

	/**
	 * 根据唯一组合条件查询并返回数据持久化对象
	 * 
	 * @return Aos_wf_evt_logPO
	 */
	Aos_wf_evt_logPO selectOne(Dto pDto);

	/**
	 * 根据Dto查询并返回数据持久化对象集合
	 * 
	 * @return List<Aos_wf_evt_logPO>
	 */
	List<Aos_wf_evt_logPO> list(Dto pDto);

	/**
	 * 根据Dto查询并返回分页数据持久化对象集合
	 * 
	 * @return List<Aos_wf_evt_logPO>
	 */
	List<Aos_wf_evt_logPO> listPage(Dto pDto);
		
	/**
	 * 根据Dto模糊查询并返回数据持久化对象集合(字符型字段模糊匹配，其余字段精确匹配)
	 * 
	 * @return List<Aos_wf_evt_logPO>
	 */
	List<Aos_wf_evt_logPO> like(Dto pDto);

	/**
	 * 根据Dto模糊查询并返回分页数据持久化对象集合(字符型字段模糊匹配，其余字段精确匹配)
	 * 
	 * @return List<Aos_wf_evt_logPO>
	 */
	List<Aos_wf_evt_logPO> likePage(Dto pDto);

	/**
	 * 根据主键删除数据持久化对象
	 *
	 * @return 影响行数
	 */
	int deleteByKey(@Param(value = "log_nr_") Integer log_nr_);
	
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
