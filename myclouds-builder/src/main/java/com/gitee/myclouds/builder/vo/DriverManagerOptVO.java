package com.gitee.myclouds.builder.vo;

/**
 * <b>JDBC驱动配置对象</b>
 * 
 * @author xiongchun
 * @date 2013-06-06
 */
public class DriverManagerOptVO {

	//数据库类型
	private String dataBaseType;
	// 数据库主机IP
	private String ip;
	// 数据库主机端口
	private String port;
	// 数据库名/实例名
	private String catalog;
	// 数据库用户名
	private String userName;
	// 数据库密码
	private String password;

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getPort() {
		return port;
	}

	public void setPort(String port) {
		this.port = port;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getDataBaseType() {
		return dataBaseType;
	}

	public void setDataBaseType(String dataBaseType) {
		this.dataBaseType = dataBaseType;
	}

	public String getCatalog() {
		return catalog;
	}

	public void setCatalog(String catalog) {
		this.catalog = catalog;
	}

}
