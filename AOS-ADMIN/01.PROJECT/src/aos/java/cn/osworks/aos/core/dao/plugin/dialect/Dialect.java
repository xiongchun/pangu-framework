package cn.osworks.aos.core.dao.plugin.dialect;

import cn.osworks.aos.core.typewrap.Dto;

/**
 * <b>方言抽象</b>
 * 
 * @author OSWorks-XC
 * @since 6.0
 * @date 2013-08-10
 * @lastmodify
 */
public interface Dialect {

	/**
	 * 将查询SQL转换为分页SQL
	 * 
	 * @param pSql
	 *            原始SQL
	 * @param pDto
	 *            包含分页信息的参数对象
	 * @return
	 */
	String getPageSql(String pSql, Dto pDto);

	/**
	 * 将sql转换为带排序的SQL
	 * 
	 * @param pSql
	 *            原始SQL
	 * @param order
	 *            排序器
	 * @return
	 */
	String getOrderSql(String pSql, String order);

	/**
	 * 生成查询记录总数的SQL
	 * 
	 * @param pSql
	 *            原始SQL
	 * @return 总记录数的sql
	 */
	String getCountSql(String pSql);

}
