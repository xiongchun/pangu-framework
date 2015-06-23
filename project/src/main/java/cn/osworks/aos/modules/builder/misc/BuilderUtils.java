package cn.osworks.aos.modules.builder.misc;

import java.util.List;

import org.apache.commons.lang3.StringUtils;


import cn.osworks.aos.base.typewrap.Dto;
import cn.osworks.aos.base.typewrap.Dtos;
import cn.osworks.aos.modules.builder.dao.vo.ColumnVO;

import com.google.common.collect.Lists;

/**
 * <b>代码生成辅助工具类</b>
 * 
 * @author OSWorks-XC
 * @date 2013-10-06
 */
public class BuilderUtils {

	/**
	 * 将type转换为对应的JavaType。PO使用
	 * 
	 * @param dbType
	 */
	public static String toJavaType(String dbType) {
		String javaType = "String";
		if ("date".equalsIgnoreCase(dbType)) {
			javaType = "Date";
		} else if ("timestamp".equalsIgnoreCase(dbType)) {
			// java统一用data，DB根据日期还是日期时间选择使用Data和Timestamp(或datetime)。
			javaType = "Date";
		} else if ("numeric".equalsIgnoreCase(dbType)) {
			javaType = "BigDecimal";
		} else if (StringUtils.indexOf(dbType, "int") != -1) {
			javaType = "Integer";
		} else if (StringUtils.indexOf(dbType, "byte") != -1) {
			javaType = "byte[]";
		}
		return javaType;
	}

	/**
	 * 将type转换为对应的JdbcType。Xml Mapper 使用。
	 * 
	 * <p> JDBC 类型是仅仅需要对插入, 更新和删除操作可能为空的列进行处理。这是 JDBC 的需要, jdbcType 而不是 MyBatis 的。
	 * 
	 * @param dbType
	 */
	public static String toJdbcType(String dbType) {
		String jdbcType = "VARCHAR";
		if ("date".equalsIgnoreCase(dbType)) {
			jdbcType = "DATE";
		} else if ("timestamp".equalsIgnoreCase(dbType)) {
			jdbcType = "TIMESTAMP";
		} else if ("numeric".equalsIgnoreCase(dbType)) {
			jdbcType = "NUMERIC";
		} else if (StringUtils.indexOf(dbType, "int") != -1) {
			jdbcType = "INTEGER";
		}else if (StringUtils.indexOf(dbType, "byte") != -1) {
			jdbcType = "BINARY";
		}
		return jdbcType;
	}

	/**
	 * 生成导入包识别枚举
	 * 
	 * @param columnVOs
	 * @return
	 */
	public static Dto getImportDto(List<ColumnVO> columnVOs) {
		Dto importDto = Dtos.newDto();
		for (ColumnVO columnVO : columnVOs) {
			if ("Date".equalsIgnoreCase(columnVO.getJavatype())) {
				importDto.put("data", true);
			} else if ("Timestamp".equalsIgnoreCase(columnVO.getJavatype())) {
				importDto.put("timestamp", true);
			} else if ("BigDecimal".equalsIgnoreCase(columnVO.getJavatype())) {
				importDto.put("bigDecimal", true);
			} else {
				// java.lang.*下的类型不需要导入
			}
		}
		return importDto;
	}

	/**
	 * 生成Mapper接口使用的ByKey字符串
	 * 
	 * @param columnVOs
	 * @return
	 */
	public static String getByKeyStr(List<ColumnVO> columnVOs) {
		String byKeyString = "";
		for (ColumnVO columnVO : columnVOs) {
			if (columnVO.getIsPkey()) {
				String nameString = columnVO.getName();
				byKeyString = byKeyString + ",@Param(value = \"" + nameString + "\") String " + nameString;
			}
		}
		byKeyString = StringUtils.substring(byKeyString, 1);
		return byKeyString;
	}

	/**
	 * 生成Mapper XML使用的ByKey语句的Where字符串
	 * 
	 * @param columnVOs
	 * @return
	 */
	public static String getByKeyWhereStr(List<ColumnVO> columnVOs) {
		String byKeyString = "";
		for (ColumnVO columnVO : columnVOs) {
			if (columnVO.getIsPkey()) {
				String name = columnVO.getName();
				byKeyString = byKeyString + " AND " + name + " = #{" + name + "}";
			}
		}
		byKeyString = StringUtils.substring(byKeyString, 4);
		return byKeyString;
	}

	/**
	 * 获取主键集合
	 * 
	 * @param columnVOs
	 * @return
	 */
	public static List<ColumnVO> getPkeys(List<ColumnVO> columnVOs) {
		List<ColumnVO> pkeys = Lists.newArrayList();
		for (ColumnVO columnVO : columnVOs) {
			if (columnVO.getIsPkey()) {
				pkeys.add(columnVO);
			}
		}
		return pkeys;
	}
}
