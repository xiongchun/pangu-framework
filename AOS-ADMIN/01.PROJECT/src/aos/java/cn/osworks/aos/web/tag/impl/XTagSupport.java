package cn.osworks.aos.web.tag.impl;

import java.io.StringWriter;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

import javax.servlet.jsp.tagext.BodyTagSupport;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.velocity.VelocityHelper;
import cn.osworks.aos.web.tag.core.resources.TagResources;


/**
 * <b>标签实现基类</b>
 * 
 * @author OSWorks-XC
 * @since 6.0
 * @date 2014-02-06
 */
public class XTagSupport extends BodyTagSupport {

	private static final long serialVersionUID = 1L;

	protected Log log = LogFactory.getLog(getClass());

	protected static final String TRUE = "true";

	protected static final String FALSE = "false";

	protected static final String APPVM = "app/";

	protected static final String EXTVM = "ext/";

	/**
	 * 文件模版合并输出
	 * 
	 * @param pVMFile
	 * @param pDto
	 * @return
	 */
	protected String mergeFileTemplate(String pVMFile, Dto pDto) {
		StringWriter writer = VelocityHelper.mergeFileTemplate(TagResources.BASEPATH_TAG + pVMFile, pDto);
		String outString = writer.toString();
		return outString;
	}

	/**
	 * 字符串模版合并输出
	 * 
	 * @return
	 */
	protected String mergeStringTemplate() {
		String outString = "";

		return outString;
	}

	/**
	 * 释放资源
	 */
	public void release() {
		super.release();
		Method[] methods = this.getClass().getMethods();
		for (int i = 0, n = methods.length; i < n; i++) {
			try {
				Method method = methods[i];
				if ((method.getModifiers() & Modifier.PUBLIC) == 1
						&& method.getDeclaringClass() != BodyTagSupport.class
						&& method.getDeclaringClass() != TagSupport.class && method.getDeclaringClass() != Object.class
						&& (method.getParameterTypes() == null || method.getParameterTypes().length == 0)) {
					String methodName = method.getName();
					if (methodName.startsWith("set")) {
						method.invoke(this, new Object[] { null });
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 获取应用上下文
	 * 
	 * @return
	 */
	protected String getContextpath() {
		String contextpath = pageContext.getServletContext().getContextPath();
		return contextpath;
	}

}
