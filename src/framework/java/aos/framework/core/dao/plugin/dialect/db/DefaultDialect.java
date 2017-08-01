package aos.framework.core.dao.plugin.dialect.db;

import java.util.Stack;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang3.StringUtils;

import aos.framework.core.dao.plugin.dialect.Dialect;
import aos.framework.core.typewrap.Dto;
import aos.framework.core.utils.AOSUtils;


/**
 * 缺省通用分页方言实现
 * 
 * <p>已知可适配此通用分页方言的数据库产品有：Mysql、PostgreSQL、...更多待验证。
 * 
 * @author OSWorks-XC
 * @date 2013-08-10
 */
public class DefaultDialect implements Dialect {

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
	public String getPageSql(String pSql, Dto pDto){
		Integer startInteger = pDto.getPageStart();
		Integer limitInteger = pDto.getPageLimit();
		int start, limit;
		if (AOSUtils.isEmpty(startInteger)) {
			start = 0;
		}else {
			start = startInteger.intValue();
		}
		if (AOSUtils.isEmpty(limitInteger)) {
			limit = Integer.MAX_VALUE;
		}else {
			limit = limitInteger.intValue();
		}
        StringBuilder stringBuilder = new StringBuilder(pSql);
        //步长
        stringBuilder.append(" limit ");
        stringBuilder.append(limit);
        //start相当于SQL中的offset，偏移起始位置
        stringBuilder.append(" offset ");
        stringBuilder.append(start);
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
	    int a = getPairIndex(pSql, "select", "from");
		String shortSql = "SELECT 1 FROM";
		//处理子查询SQL语句 (砍掉结果集字段，只要条件块)
		shortSql = shortSql + pSql.substring(a + 4);
		shortSql = removeOrder(shortSql);
		String countSql = "SELECT COUNT(0) FROM (" + shortSql + ") AS aos_count";
		return countSql;
	}
    
	/**
	 * 匹配主干sql的from关键字
	 * 
	 * @author Kun
	 * @param plainStr
	 * @param lPair
	 * @param rPair
	 * @return
	 */
    private int getPairIndex(String plainStr, String lPair, String rPair) {

        Stack<Integer> queue = new Stack<>();
        Pattern p = Pattern.compile(lPair + "|" + rPair, Pattern.CASE_INSENSITIVE);
        Matcher m = p.matcher(plainStr);
        int index = -1;
        while (m.find()) {
            index = m.start();
            String group = m.group().toLowerCase();
            if(group.matches(lPair)) {
                queue.push(index);
            }
            if(group.matches(rPair)) {
                queue.pop();
            }
            if(queue.isEmpty()) {
                return index;
            }
        }
        return -1;
    }
    
    /**
     * 移除条件中最外层的orderby
     * 
     * @author Kun
     * @param str
     * @return
     */
    private String removeOrder(String str) {
        Pattern p = Pattern.compile("order\\s+by\\s+", Pattern.CASE_INSENSITIVE);
        Matcher m = p.matcher(str);
        int lastIndex = -1;
        while (m.find()) {
            lastIndex = m.start();
        }
        if(lastIndex != -1) {
            String orderSql = str.substring(lastIndex);
            // 跳过子句中的order by语句
            if(!orderSql.contains(")")
                    || getPairIndex(orderSql, "\\)", "\\(") != -1) {
                return str.substring(0, lastIndex);
            }
        }
        return str;
    }

}