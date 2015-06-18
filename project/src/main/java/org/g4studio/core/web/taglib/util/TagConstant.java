package org.g4studio.core.web.taglib.util;

/**
 * 常量表
 * @author XiongChun
 * @since 2010-01-13
 */
public interface TagConstant {
	/**
	 * Ext运行模式<br>
	 * run:生产模式
	 */
	public static final String Ext_Mode_Run = "run";
	
	/**
	 * Ext运行模式<br>
	 * run:调试模式
	 */
	public static final String Ext_Mode_debug = "debug";
	
	/**
	 * 系统运行模式
	 * 0:演示模式
	 */
	public static final String RUN_MODE_DEMO = "0";
	
	/**
	 * 系统运行模式
	 * 0:正常模式
	 */
	public static final String RUN_MODE_NORMAL = "1";
	
	/**
	 * 模板变量输出模式<br>
	 * on:打开
	 */
	public static final String Tpl_Out_On = "on";
	
	/**
	 * 模板变量输出模式<br>
	 * off:关闭
	 */
	public static final String Tpl_Out_Off = "off";
	
	/**
	 * JS头<br>
	 */
	public static final String SCRIPT_START = "<script type=\"text/javascript\">\n";
	
	/**
	 * JS尾<br>
	 */
	public static final String SCRIPT_END = "\n</script>";
}
