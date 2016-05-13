package cn.osworks.aos.builder.asset;

import java.util.List;

import org.apache.commons.lang3.StringUtils;

import cn.osworks.aos.builder.metainfo.vo.ColumnVO;
import cn.osworks.aos.builder.metainfo.vo.TableVO;
import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;

import com.google.common.collect.Lists;

/**
 * <b>代码生成辅助工具类</b>
 * 
 * @author OSWorks-XC
 */
public class BuilderUtils {
	
    /**
     * 转换TableVO对象
     *
     * @param tableVO
     * @return Dto
     */
    public static Dto convertTableVO(TableVO tableVO) {
        Dto tableDto = tableVO.toDto();
        //先全部转为小写，再首字母大写。变态的Oracle、H2表名全部返回大写字母。
        String name = StringUtils.lowerCase(tableVO.getName());
        tableDto.put("upname", StringUtils.capitalize(name));
        tableDto.put("name", name);
        tableDto.put("autoincrementPkName", tableVO.getAutoincrementPkName());
        return tableDto;
    }
    
    /**
     * 后处理ColumnVO对象
     *
     * @param columnVOs
     * @return columnDtos
     */
    public static List<Dto> convertColumnVO(List<ColumnVO> columnVOs) {
    	List<Dto> columnDtos = Lists.newArrayList();
        for (ColumnVO columnVO : columnVOs) {
            if (AOSUtils.isEmpty(columnVO.getComment())) {
                columnVO.setComment(columnVO.getName());
            }
            Dto columnDto = columnVO.toDto();
           //先全部转为小写，再首字母大写。变态的Oracle、H2表名全部返回大写字母。
            String name = StringUtils.lowerCase(columnVO.getName());
            columnDto.put("upname", StringUtils.capitalize(name));
            columnDto.put("name", name);
            //DBTYPE 不同的数据库可能会有字面上的差异
			// dbype转换为对应的JavaType PO变量类型使用
            columnDto.put("javatype", BuilderUtils.toJavaType(columnVO.getType()));
			// dbype转换为对应的jdbctype Mapper Xml文件使用
            columnDto.put("jdbctype", BuilderUtils.toJdbcType(columnVO.getType()));
            columnDtos.add(columnDto);
        }
        return columnDtos;
    }

	/**
	 * 将type转换为对应的JavaType。PO使用
	 * 
	 * @param colDbType
	 */
	public static String toJavaType(String colDbType) {
		String javaType = "String";
		if (StringUtils.indexOfIgnoreCase(colDbType, "date") != -1) {
			//date/datetime
			javaType = "Date";
		} else if ("timestamp".equalsIgnoreCase(colDbType)) {
			// java统一用data，DB根据日期还是日期时间选择使用Data和Timestamp(或datetime)。
			javaType = "Date";
		} else if ("numeric".equalsIgnoreCase(colDbType)) {
			javaType = "BigDecimal";
		}  else if ("number".equalsIgnoreCase(colDbType)) {
			javaType = "BigDecimal";
		}  else if (StringUtils.indexOfIgnoreCase(colDbType, "decimal") != -1) {
			javaType = "BigDecimal";
		}else if (StringUtils.indexOfIgnoreCase(colDbType, "int") != -1) {
			javaType = "Integer";
		}else if (StringUtils.indexOfIgnoreCase(colDbType, "integer") != -1) {
			javaType = "Integer";
		} else if (StringUtils.indexOfIgnoreCase(colDbType, "byte") != -1) {
			javaType = "byte[]";
		}else if (StringUtils.indexOfIgnoreCase(colDbType, "blob") != -1) {
			javaType = "byte[]";
		}else if (StringUtils.indexOfIgnoreCase(colDbType, "binary") != -1) {
			javaType = "byte[]";
		}
		return javaType;
	}

	/**
	 * 将type转换为对应的JdbcType。Xml Mapper 使用。
	 * 
	 * <p> JDBC 类型是仅仅需要对插入, 更新和删除操作可能为空的列进行处理。这是 JDBC 的需要。
	 * 
	 * @param colDbType
	 */
	public static String toJdbcType(String colDbType) {
		String jdbcType = "VARCHAR";
		if ("date".equalsIgnoreCase(colDbType)) {
			jdbcType = "DATE";
		} else if ("timestamp".equalsIgnoreCase(colDbType)) {
			jdbcType = "TIMESTAMP";
		} else if (StringUtils.indexOfIgnoreCase(colDbType, "numeric") != -1) {
			jdbcType = "NUMERIC";
		}else if (StringUtils.indexOfIgnoreCase(colDbType, "decimal") != -1) {
			jdbcType = "NUMERIC";
		}else if (StringUtils.indexOfIgnoreCase(colDbType, "number") != -1) {
			jdbcType = "NUMERIC";
		} else if (StringUtils.indexOfIgnoreCase(colDbType, "int") != -1) {
			jdbcType = "INTEGER";
		}else if (StringUtils.indexOf(colDbType, "byte") != -1) {
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
	public static Dto getImportDto(List<Dto> columnDtos) {
		Dto importDto = Dtos.newDto();
		for (Dto columnDto : columnDtos) {
			String javatype = columnDto.getString("javatype");
			if ("Date".equalsIgnoreCase(javatype)) {
				importDto.put("data", true);
			} else if ("Timestamp".equalsIgnoreCase(javatype)) {
				importDto.put("timestamp", true);
			} else if ("BigDecimal".equalsIgnoreCase(javatype)) {
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
				String name = StringUtils.lowerCase(columnVO.getName());
				String javaType = toJavaType(columnVO.getType());
				byKeyString = byKeyString + ",@Param(value = \"" + name + "\") " + javaType + " " + name;
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
				String name = StringUtils.lowerCase(columnVO.getName());
				byKeyString = byKeyString + " AND " + name + " = #{" + name + "}";
			}
		}
		byKeyString = StringUtils.substring(byKeyString, 4);
		return byKeyString;
	}
	
	/**
	 * 标记该表是否以自增列为主键
	 * 
	 * @param tableVO
	 * @return
	 */
	public static TableVO isAutoIncreamentColAsPK(List<ColumnVO> columnVOs,TableVO tableVO){
		for (ColumnVO columnVO : columnVOs) {
			if (columnVO.getIsAutoincrement() && columnVO.getIsPkey()) {
				tableVO.setAutoincrementPkName(columnVO.getName());
				break;
			}
		}
		return tableVO;
	}

}
