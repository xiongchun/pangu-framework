package com.gitee.myclouds.builder.vm;

import org.apache.commons.lang3.StringUtils;

/**
 * 资源文件路径常量
 * 
 * <p>此文件需放在资源文件根目录
 * 
 * @author xiongchun
 */
public class Resources {
	
	/**
	 * 动态读取基础路径
	 */
	static{
		String basePath = Resources.class.getCanonicalName();
		basePath = StringUtils.substringBeforeLast(basePath, ".").replace(".", "/");
		setBasePath("/" + basePath + "/");
	}
	
	private  static String basePath;

	public final static String Entity_JAVA_VM = basePath + "entity.java.vm";

	public final static String MAPPER_JAVA_VM = basePath + "mapper.java.vm";

	public final static String MAPPER_XML_VM = basePath + "mapper.xml.vm";

	public static String getBasePath() {
		return basePath;
	}

	public static void setBasePath(String basePath) {
		Resources.basePath = basePath;
	}


}
