package com.gitee.pulanos.pangu.framework.generator.utils;

import com.gitee.pulanos.pangu.framework.generator.Constants;
import org.apache.commons.lang3.StringUtils;

/**
 * 工具类
 * @author xiongchun
 */
public class CommonUtil {

    /**
     * 数据库字段类型和Java类型的映射关系
     * @param colDbType
     * @return
     */
    public static String toJavaType(String colDbType) {
        String javaType = "String";
        if (StringUtils.indexOfIgnoreCase(colDbType, "date") != -1) {
            //date/datetime
            javaType = Constants.JavaType.DATE;
        }
        if ("timestamp".equalsIgnoreCase(colDbType)) {
            javaType = Constants.JavaType.DATE;
        }
        if ("numeric".equalsIgnoreCase(colDbType)) {
            javaType = Constants.JavaType.BIGDECIMAL;
        }
        if ("number".equalsIgnoreCase(colDbType)) {
            javaType = Constants.JavaType.BIGDECIMAL;
        }
        if (StringUtils.indexOfIgnoreCase(colDbType, "decimal") != -1) {
            javaType = Constants.JavaType.BIGDECIMAL;
        }
        if (StringUtils.indexOfIgnoreCase(colDbType, "int") != -1) {
            javaType = Constants.JavaType.INTEGER;
        }
        if (StringUtils.indexOfIgnoreCase(colDbType, "bigint") != -1) {
            javaType = Constants.JavaType.BIGINTEGER;
        }
        if (StringUtils.indexOfIgnoreCase(colDbType, "byte") != -1) {
            javaType = Constants.JavaType.BYTE;
        }
        if (StringUtils.indexOfIgnoreCase(colDbType, "blob") != -1) {
            javaType = Constants.JavaType.BYTE;
        }
        if (StringUtils.indexOfIgnoreCase(colDbType, "binary") != -1) {
            javaType = Constants.JavaType.BYTE;
        }
        return javaType;
    }
}
