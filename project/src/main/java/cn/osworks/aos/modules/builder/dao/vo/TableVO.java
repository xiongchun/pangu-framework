package cn.osworks.aos.modules.builder.dao.vo;

import cn.osworks.aos.base.typewrap.VO;

/**
 * <b>数据表值对象</b>
 * 
 * @author OSWorks-XC
 * @date 2013-06-06
 */
public class TableVO extends VO{

	private static final long serialVersionUID = 1L;
	
	/**
	 * 表名
	 */
	private String name;
	
	/**
	 * 带注释的表名
	 */
	private String name_comment;
	
	/**
	 * 领域对象前缀
	 */
	private String alias;
	
	/**
	 * 首字母大写的表名
	 */
	private String upname;
	
	/**
	 * 注释
	 */
	private String comment;
	
	/**
	 * 表主键
	 */
	private String pkey;
	
	/**
	 * 表DDL语句
	 */
	private String ddl;
	
	/**
	 * 行数
	 */
	private Integer rows;
	
	/**
	 * 所有者
	 */
	private String owner;
	
	/**
	 * 是否启用Mybatis二级缓存
	 */
	private Boolean cacheEnabled;

	/**
	 * @return the 表名
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param 表名 the name to set
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
	 * @return the 行数
	 */
	public Integer getRows() {
		return rows;
	}

	/**
	 * @param 行数 the rows to set
	 */
	public void setRows(Integer rows) {
		this.rows = rows;
	}

	/**
	 * @return the 表DDL语句
	 */
	public String getDdl() {
		return ddl;
	}

	/**
	 * @param 表DDL语句 the ddl to set
	 */
	public void setDdl(String ddl) {
		this.ddl = ddl;
	}

	/**
	 * @return the 表主键
	 */
	public String getPkey() {
		return pkey;
	}

	/**
	 * @param 表主键 the pkey to set
	 */
	public void setPkey(String pkey) {
		this.pkey = pkey;
	}

	/**
	 * @return the 所有者
	 */
	public String getOwner() {
		return owner;
	}

	/**
	 * @param 所有者 the owner to set
	 */
	public void setOwner(String owner) {
		this.owner = owner;
	}

	/**
	 * @return the 首字母大写的表名
	 */
	public String getUpname() {
		return upname;
	}

	/**
	 * @param 首字母大写的表名 the upname to set
	 */
	public void setUpname(String upname) {
		this.upname = upname;
	}

	public Boolean getCacheEnabled() {
		return cacheEnabled;
	}

	public void setCacheEnabled(Boolean cacheEnabled) {
		this.cacheEnabled = cacheEnabled;
	}

	public String getName_comment() {
		return name_comment;
	}

	public void setName_comment(String name_comment) {
		this.name_comment = name_comment;
	}

	public String getAlias() {
		return alias;
	}

	public void setAlias(String alias) {
		this.alias = alias;
	}



}
