package cn.osworks.aos.modules.builder.dao.vo;

import cn.osworks.aos.base.typewrap.VO;

/**
 * <b>数据表字段值对象</b>
 * 
 * @author OSWorks-XC
 * @date 2013-06-06
 */
public class ColumnVO extends VO{

	private static final long serialVersionUID = 1L;

	/**
	 * 字段名
	 */
	private String name;
	
	/**
	 * 首字母大写的字段名
	 */
	private String upname;
	
	/**
	 * 字段类型
	 */
	private String type;
	
	/**
	 * 字段对应的Java类型(Doman文件声明变量类型使用)
	 */
	private String Javatype;
	
	/**
	 * 字段对应的Java类型(Mapper xml文件使用)
	 */
	private String Jdbctype;
	
	/**
	 * 注释
	 */
	private String comment;
	
	/**
	 * 长度
	 */
	private Integer length;
	
	/**
	 * 小数点
	 */
	private Integer scale;
	
	/**
	 * 不可以为空
	 */
	private Boolean notnull;
	
	/**
	 * 缺省值
	 */
	private String defaultValue;
	
	/**
	 * 是主键
	 */
	private Boolean isPkey;
	
	/**
	 * 所属表名
	 */
	private String tablename;
	
	/**
	 * 字段的DDL语句
	 */
	private String ddl;
	
	/**
	 * @return the 字段名
	 */
	public String getName() {
		return name;
	}
	
	/**
	 * 字段顺序号
	 */
	private Integer number;

	/**
	 * @param 字段名 the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the 注释
	 */
	public String getComment() {
		return comment;
	}

	/**
	 * @param 注释 the comment to set
	 */
	public void setComment(String comment) {
		this.comment = comment;
	}

	/**
	 * @return the 长度
	 */
	public Integer getLength() {
		return length;
	}

	/**
	 * @param 长度 the length to set
	 */
	public void setLength(Integer length) {
		this.length = length;
	}

	/**
	 * @return the 小数点
	 */
	public Integer getScale() {
		return scale;
	}

	/**
	 * @param 小数点 the scale to set
	 */
	public void setScale(Integer scale) {
		this.scale = scale;
	}

	/**
	 * @return the 是主键
	 */
	public Boolean getIsPkey() {
		return isPkey;
	}

	/**
	 * @param 是主键 the isPkey to set
	 */
	public void setIsPkey(Boolean isPkey) {
		this.isPkey = isPkey;
	}

	/**
	 * @return the 缺省值
	 */
	public String getDefaultValue() {
		return defaultValue;
	}

	/**
	 * @param 缺省值 the defaultValue to set
	 */
	public void setDefaultValue(String defaultValue) {
		this.defaultValue = defaultValue;
	}

	/**
	 * @return the 字段的DDL语句
	 */
	public String getDdl() {
		return ddl;
	}

	/**
	 * @param 字段的DDL语句 the ddl to set
	 */
	public void setDdl(String ddl) {
		this.ddl = ddl;
	}

	/**
	 * @return the 字段顺序号
	 */
	public Integer getNumber() {
		return number;
	}

	/**
	 * @param 字段顺序号 the number to set
	 */
	public void setNumber(Integer number) {
		this.number = number;
	}

	/**
	 * @return the 字段类型
	 */
	public String getType() {
		return type;
	}

	/**
	 * @param 字段类型 the type to set
	 */
	public void setType(String type) {
		this.type = type;
	}

	/**
	 * @return the 不可以为空
	 */
	public Boolean getNotnull() {
		return notnull;
	}

	/**
	 * @param 不可以为空 the notnull to set
	 */
	public void setNotnull(Boolean notnull) {
		this.notnull = notnull;
	}

	/**
	 * @return the 所属表名
	 */
	public String getTablename() {
		return tablename;
	}

	/**
	 * @param 所属表名 the tablename to set
	 */
	public void setTablename(String tablename) {
		this.tablename = tablename;
	}

	/**
	 * @return the 首字母大写的字段名
	 */
	public String getUpname() {
		return upname;
	}

	/**
	 * @param 首字母大写的字段名 the upname to set
	 */
	public void setUpname(String upname) {
		this.upname = upname;
	}

	/**
	 * @return the javatype
	 */
	public String getJavatype() {
		return Javatype;
	}

	/**
	 * @param javatype the javatype to set
	 */
	public void setJavatype(String javatype) {
		Javatype = javatype;
	}

	/**
	 * @return the jdbctype
	 */
	public String getJdbctype() {
		return Jdbctype;
	}

	/**
	 * @param jdbctype the jdbctype to set
	 */
	public void setJdbctype(String jdbctype) {
		Jdbctype = jdbctype;
	}
	
}
