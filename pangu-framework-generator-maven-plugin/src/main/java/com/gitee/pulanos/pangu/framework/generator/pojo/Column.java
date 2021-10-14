package com.gitee.pulanos.pangu.framework.generator.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * <b>数据表字段对象</b>
 * 
 * @author xiongchun
 * @date 2013-06-06
 */
@Data
public class Column implements Serializable {

	private static final long serialVersionUID = 1L;

	/**
	 * 字段名
	 */
	private String name;
	
	/**
	 * 字段原始DB类型
	 */
	private String type;
	
	/**
	 * 注释
	 */
	private String comment;
	
	/**
	 * 长度
	 */
	private Integer length;
	
	/**
	 * 浮点数的精度(小数点)
	 */
	private Integer scale;
	
	/**
	 * 是否可以为空
	 */
	private Boolean nullAble;
	
	/**
	 * 缺省值
	 */
	private String defaultValue;
	
	/**
	 * 是主键
	 */
	private Boolean isPkey;
	
	/**
	 * 是否为自增列(提示：自增列不一定是主键哦)
	 */
	private Boolean isAutoincrement;
	
	/**
	 * 所属表名
	 */
	private String tablename;

	/**
	 * 字段顺序号
	 */
	private Integer number;

	/**
	 * 对应Java类型
	 */
	private String javaType;

}
