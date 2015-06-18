package org.g4studio.system.common.util;

import org.g4studio.core.util.G4Constants;

/**
 * 常量表
 * @author XiongChun
 * @since 2010-01-13
 */
public interface SystemConstants extends G4Constants{
	
	/**
	 * 启用状态<br>
	 * 1:启用
	 */
	public static final String ENABLED_Y = "1"; 
	
	/**
	 * 启用状态<br>
	 * 0:停用
	 */
	public static final String ENABLED_N = "0";
	
	/**
	 * 编辑模式<br>
	 * 1:可编辑
	 */
	public static final String EDITMODE_Y = "1"; 
	
	/**
	 * 编辑模式<br>
	 * 0:只读
	 */
	public static final String EDITMODE_N = "0";
	
	/**
	 * 锁定态<br>
	 * 1:锁定
	 */
	public static final String LOCK_Y = "1"; 
	
	/**
	 * 锁定状态<br>
	 * 0:解锁
	 */
	public static final String LOCK_N = "0";
	
	/**
	 * 强制类加载<br>
	 * 1:强制
	 */
	public static final String FORCELOAD_Y = "1"; 
	
	/**
	 * 强制类加载<br>
	 * 0:不强制
	 */
	public static final String FORCELOAD_N = "0";
	
	/**
	 * 树节点类型<br>
	 * 1:叶子节点
	 */
	public static final String LEAF_Y = "1"; 
	
	/**
	 * 树节点类型<br>
	 * 0:树枝节点
	 */
	public static final String LEAF_N = "0";
	
	/**
	 * 角色类型<br>
	 * 1:业务角色
	 */
	public static final String ROLETYPE_BUSINESS = "1";
	
	/**
	 * 角色类型<br>
	 * 2:管理角色
	 */
	public static final String ROLETYPE_ADMIN = "2";
	
	/**
	 * 角色类型<br>
	 * 3:系统内置角色
	 */
	public static final String ROLETYPE_EMBED = "3";
	
	/**
	 * 权限级别<br>
	 * 1:访问权限
	 */
	public static final String AUTHORIZELEVEL_ACCESS = "1"; 
	
	/**
	 * 权限级别<br>
	 * 2:管理权限
	 */
	public static final String AUTHORIZELEVEL_ADMIN = "2";
	
	/**
	 * 用户类型<br>
	 * 1:经办员
	 */
	public static final String USERTYPE_BUSINESS = "1";
	
	/**
	 * 用户类型<br>
	 * 2:管理员
	 */
	public static final String USERTYPE_ADMIN = "2";
	
	/**
	 * 用户类型<br>
	 * 3:系统内置用户
	 */
	public static final String USERTYPE_EMBED = "3";
	
	/**
	 * 根节点ID<br>
	 * 01:菜单树
	 */
	public static final String ROORID_MENU = "01";
	
	/**
	 * 帐户类型<br>
	 * 1:常规帐户
	 */
	public static final String ACCOUNTTYPE_NORMAL = "1";
	
	/**
	 * 帐户类型<br>
	 * 2:SUPER帐户
	 */
	public static final String ACCOUNTTYPE_SUPER = "2";
	
	/**
	 * 帐户类型<br>
	 * 3:DEVELOPER帐户
	 */
	public static final String ACCOUNTTYPE_DEVELOPER = "3";
	
	/**
	 * 操作员事件跟踪监控开关[1:打开;0:关闭]<br>
	 * 1:打开
	 */
	public static final String EVENTMONITOR_ENABLE_Y = "1";
	
	/**
	 * 操作员事件跟踪监控开关[1:打开;0:关闭]<br>
	 * 0:关闭
	 */
	public static final String EVENTMONITOR_ENABLE_N = "0";
	
	/**
	 * 菜单类型<br>
	 * 1:系统菜单
	 */
	public static final String MENUTYPE_SYSTEM = "1";
	
	/**
	 * 菜单类型<br>
	 * 0:业务菜单
	 */
	public static final String MENUTYPE_BUSINESS = "0";
	
	/**
	 * UI元素授权类型<br>
	 * 0:未授权
	 */
	public static final String PARTAUTHTYPE_NOGRANT = "0";
}
