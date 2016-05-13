package cn.osworks.aos.core.dao.asset;

import org.apache.commons.lang3.StringUtils;

/**
 * 数据库方言转换工具类
 * 
 * @author OSWorks-XC
 */
public class DBDialectUtils {

	/**
	 * 转换LENGTH函数
	 * 
	 * @param dataBaseId
	 * @return
	 */
	public static String fnLength(String dataBaseId) {
		String outString = "LENGTH";
		if (dataBaseId != null && StringUtils.equalsIgnoreCase(dataBaseId, DBType.SQLSERVER)) {
			outString = "LEN";
		}
		return outString;
	}
}
