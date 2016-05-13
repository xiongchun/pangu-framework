package cn.osworks.aos.web.tag.core.resources;

import org.apache.commons.lang3.StringUtils;

/**
 * 资源文件路径常量
 * 
 * <p>此文件需放在资源文件根目录
 * 
 * @author OSWorks-XC
 * @date 2013-06-06
 */
public class TagResources {
	
	/**
	 * 动态读取基础路径
	 */
	static{
		String basePath = TagResources.class.getCanonicalName();
		basePath = StringUtils.substringBeforeLast(basePath, ".").replace(".", "/");
		setBasePath("/" + basePath + "/");
	}
	
	private  static String basePath;
		
	public final static String BASEPATH_TAG= basePath + "tag/";
	
	public final static String BASEPATH_TAG_APP= BASEPATH_TAG + "app/";
	
	public final static String BASEPATH_TAG_EXT= BASEPATH_TAG + "ext/";

	public static String getBasePath() {
		return basePath;
	}

	public static void setBasePath(String basePath) {
		TagResources.basePath = basePath;
	}

}
