package aos.framework.builder.resources;

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

	public final static String PO_JAVA_VM = basePath + "po.java.vm";

	public final static String DAO_JAVA_VM = basePath + "dao.java.vm";

	public final static String DAO_XML_VM = basePath + "dao.xml.vm";
	
	public final static String D_JAVA_VM = basePath + "d.java.vm";

	public static String getBasePath() {
		return basePath;
	}

	public static void setBasePath(String basePath) {
		Resources.basePath = basePath;
	}


}
