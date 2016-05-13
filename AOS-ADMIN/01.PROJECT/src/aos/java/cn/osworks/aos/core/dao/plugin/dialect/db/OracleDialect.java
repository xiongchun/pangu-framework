package cn.osworks.aos.core.dao.plugin.dialect.db;

import org.apache.commons.lang3.StringUtils;

import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.dao.plugin.dialect.Dialect;
import cn.osworks.aos.core.typewrap.Dto;

/**
 * <b>Oracle分页方言实现</b>
 * 
 * @see Dialect
 * @author OSWorks-XC
 */
public class OracleDialect implements Dialect {

	/**
	 * 将查询SQL转换为分页SQL
	 * 
	 * @param pSql
	 *            原始SQL
	 * @param pDto
	 *            包含分页信息的参数对象
	 * @return
	 */
	@Override
	public String getPageSql(String pSql, Dto pDto) {
		Integer startInteger = pDto.getPageStart();
		Integer limitInteger = pDto.getPageLimit();
		int start, limit, end;
		if (AOSUtils.isEmpty(startInteger)) {
			start = 0;
		} else {
			start = startInteger.intValue();
		}
		if (AOSUtils.isEmpty(limitInteger)) {
			limit = Integer.MAX_VALUE;
		} else {
			limit = limitInteger.intValue();
		}
		end = start + limit;
		start = start + 1;
		StringBuilder stringBuilder = new StringBuilder("SELECT * FROM (SELECT page.*, ROWNUM AS aos_rn_ FROM (");
		stringBuilder.append(pSql);
		stringBuilder.append(") page) WHERE aos_rn_ BETWEEN ");
		stringBuilder.append(start).append(" AND ").append(end);
		return stringBuilder.toString();
	}

	/**
	 * 将sql转换为带排序的SQL
	 * 
	 * @return 
	 */
	@Override
	public String getOrderSql(String pSql, String order){
		//用大写ORDER来匹配，约定SQL关键字都用大写。
		if (StringUtils.contains(pSql, "ORDER")) {
			pSql  = pSql+ ", " + order;
		}else {
			pSql  = pSql+ " ORDER BY  " + order;
		}
		return pSql;
	}
	
	/**
	 * 生成查询记录总数的SQL
	 * 
	 * @return 总记录数的sql
	 */
	@Override
	public String getCountSql(String pSql){
		String countSql = "SELECT COUNT(0) AS aos_count_ FROM (" + pSql + ")";
		return countSql;
	}
}
