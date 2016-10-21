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
        if(a != -1) pSql = pSql.substring(0, a) + "FRoM" + pSql.substring(a + 4);

		if (StringUtils.indexOf(pSql, "FRoM") != -1) {
			 pSql = getShortSql(pSql);
		}
		String countSql = "SELECT COUNT(0) FROM (" + pSql + ") AS aos_count_";
		return countSql;
	}

    /**
     * 改sql太烦了,自动转换好了
     * 获取串中,左串匹配的右串位置,大小写不敏感
     * <p>
     *     如,"AAbbb",匹配第0个A的是第3个b
     * </p>
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
            if(lPair.equalsIgnoreCase(m.group())) {
                queue.push(index);
            }
            if(rPair.equalsIgnoreCase(m.group())) {
                queue.pop();
            }
            if(queue.isEmpty()) {
                return index;
            }
        }
        return -1;
    }

	/**
	 * 处理子查询SQL语句
	 * 
	 * @param pSql
	 * @return
	 */
	private String getShortSql(String pSql){
		String shortSql = "SELECT 1 FROM";
		pSql = StringUtils.substringAfter(pSql, "FRoM");
        pSql = removeOrder(pSql);
		return shortSql + pSql;
	}
    
	/**
	 * 移除排序
	 * 
	 * @param str
	 * @return
	 */
    private String removeOrder(String str) {
        StringBuffer sb = new StringBuffer();
        //忽略大小写进行匹配
        Pattern p = Pattern.compile("order\\s+by.*", Pattern.CASE_INSENSITIVE);
        Matcher m = p.matcher(str);
        while (m.find()) {
            m.appendReplacement(sb, "");
        }
        m.appendTail(sb);
        return sb.toString();
    }

}