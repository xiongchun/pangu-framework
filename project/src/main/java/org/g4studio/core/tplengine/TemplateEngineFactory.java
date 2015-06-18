package org.g4studio.core.tplengine;

import java.util.HashMap;
import java.util.Map;

import org.g4studio.core.tplengine.velocity.VelocityTemplateEngine;
import org.g4studio.core.util.G4Constants;

/**
 * 模板引擎工厂
 * @author XiongChun
 * @since 2009-07-26
 */
public class TemplateEngineFactory {
	/**
	 * 引擎容器
	 */
	private static Map ENGINES = new HashMap();
	
	/**
	 * 实例化模板引擎并压入引擎容器
	 */
	static{
		if (isExistClass("org.apache.velocity.app.VelocityEngine")){
			VelocityTemplateEngine ve = new VelocityTemplateEngine();
			ENGINES.put(TemplateType.VELOCITY, ve);
		}else{
			//todo 支持其他模板引擎扩展
		}
	}
	
	/**
	 * 检查当前ClassLoader种,是否存在指定class
	 * @param pClass
	 * @return
	 */
	private static boolean isExistClass(String pClass) {
		try {
			Class.forName(pClass);
		} catch (ClassNotFoundException e) {
			return false;
		}
		return true;
	}
	
	/**
	 * 获取模板引擎实例
	 * @param pTemplateType 引擎类型
	 * @return 返回模板引擎实例
	 */
	public static TemplateEngine getTemplateEngine(TemplateType pType) {
		if (pType == null) {
			return null;
		}
		if (ENGINES.containsKey(pType) == false) {
			throw new IllegalArgumentException(G4Constants.Exception_Head + "不支持的模板类别:" + pType.getType());
		}
		return (TemplateEngine) ENGINES.get(pType);
	}
}
