package org.g4studio.core.web.taglib.util;

import javax.servlet.jsp.tagext.BodyContent;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.g4studio.core.mvc.xstruts.actions.DispatchAction;
import org.g4studio.core.util.G4Utils;

/**
 * JSP自定义标签(eRedUI)内部使用的辅助工具类
 * @author XiongChun
 * @since 2010-01-23
 * @see DispatchAction
 */
public class TagHelper {
	private static Log log = LogFactory.getLog(TagHelper.class);
	
	/**
	 * 获取模板路径
	 * @param pPath 标签实现类的Java包路径
	 * @return 返回模板路径
	 */
	public static String getTemplatePath(String pPath){
		if(G4Utils.isEmpty(pPath))
			return "";
		String templatePath = "";
		String path = pPath.replace('.', '/');
		String packageUnits[] = path.split("/");
		String className = packageUnits[packageUnits.length - 1];
		templatePath = path.substring(0, path.length() - className.length());
		templatePath += "template/" + className + ".tpl";
		log.debug("模板文件路径:" + templatePath);
		return templatePath;
	}
	
	/**
	 * 获取模板路径
	 * @param pPath 标签实现类的Java包路径
	 * @return 返回模板路径
	 */
	public static String getTemplatePath(String pPath,String pFileName){
		if(G4Utils.isEmpty(pPath))
			return "";
		String templatePath = "";
		String path = pPath.replace('.', '/');
		String packageUnits[] = path.split("/");
		String className = packageUnits[packageUnits.length - 1];
		templatePath = path.substring(0, path.length() - className.length());
		templatePath += "template/" + pFileName;
		log.debug("模板文件路径:" + templatePath);
		return templatePath;
	}
	
	/**
	 * 对BodyContent进行格式处理
	 * @param pBodyContent 传入的BodyContent对象
	 * @return 返回处理后的BodyContent字符串对象
	 */
	public static String formatBodyContent(BodyContent pBodyContent){
		if(G4Utils.isEmpty(pBodyContent))
			return "";
		return pBodyContent.getString().trim();
	}
	
	/**
	 * 对字符串模板中的特殊字符进行处理
	 * @param pStr 传入的字符串模板
	 * @return 返回处理后的字符串
	 */
	public static String replaceStringTemplate(String pStr){
		if(G4Utils.isEmpty(pStr))
			return "";
		pStr = pStr.replace('*','\"');

		return pStr;
	}
	
	/**
	 * 对模板字符型变量进行空校验
	 * @param pString
	 * @return
	 */
	public static String checkEmpty(String pString){
		return G4Utils.isEmpty(pString) ? TagConstant.Tpl_Out_Off : pString;
	}
}
