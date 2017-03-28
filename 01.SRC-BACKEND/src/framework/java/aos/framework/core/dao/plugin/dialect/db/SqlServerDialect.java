package aos.framework.core.dao.plugin.dialect.db;

import org.apache.commons.lang3.StringUtils;

import aos.framework.core.dao.plugin.dialect.Dialect;
import aos.framework.core.typewrap.Dto;
import aos.framework.core.utils.AOSUtils;

/**
 * MS SQLServer分页方言实现
 * 
 * @see Dialect
 * @author xiongchun
 */
public class SqlServerDialect  implements Dialect {

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
		StringBuilder stringBuilder = new StringBuilder("WITH aos_query_ AS (");
		stringBuilder.append("SELECT TOP 100 PERCENT ROW_NUMBER () OVER (ORDER BY CURRENT_TIMESTAMP) AS aos_rn_,");
		pSql = StringUtils.replace(pSql, "select", "SELECT");
		stringBuilder.append(StringUtils.substringAfter(pSql, "SELECT"));
		stringBuilder.append(") SELECT * FROM aos_query_ WHERE aos_rn_ BETWEEN ");
		stringBuilder.append(start).append(" AND ").append(end).append(" ORDER BY aos_rn");
		return stringBuilder.toString();
	}

	@Override
	public String getOrderSql(String pSql, String order) {
		//用大写ORDER来匹配，约定SQL关键字都用大写。
		if (StringUtils.contains(pSql, "ORDER")) {
			pSql  = pSql+ ", " + order;
		}else {
			pSql  = pSql+ " ORDER BY  " + order;
		}
		return pSql;
	}

	@Override
	public String getCountSql(String pSql) {
		StringBuilder stringBuilder = new StringBuilder("WITH aos_query_ AS (");
		stringBuilder.append(pSql).append(")SELECT COUNT (0) from aos_query_ AS aos_count");
		return stringBuilder.toString();
	}

}
