package cn.osworks.aos.web.tag.tld;

import org.apache.commons.lang3.StringUtils;

/**
 * 资源文件路径常量
 * 
 * <p>此文件需放在资源文件根目录
 * 
 * @author OSWorks-XC
 * @date 2013-06-06
 */
public class TldResource {
	
	/**
	 * 动态读取基础路径
	 */
	static{
		String basePath = TldResource.class.getCanonicalName();
		basePath = StringUtils.substringBeforeLast(basePath, ".").replace(".", "/");
		setBasePath("/" + basePath + "/");
	}
	
	private  static String basePath;
	
	public final static String EXT_TLD_VM = basePath + "aos.tld.vm";
	
	public final static String EXT_TLD_BASE_XML = basePath + "aos.tld.base.xml";
	
	public final static String EXT_TLD_XML = basePath + "aos.tld.xml";

	public static String getBasePath() {
		return basePath;
	}

	public static void setBasePath(String basePath) {
		TldResource.basePath = basePath;
	}
}
