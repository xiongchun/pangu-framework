package aos.system.common.utils;

import aos.framework.core.utils.AOSCons;

/**
 * 系统常量表
 * 
 * @author xiongchun
 *
 */
public class SystemCons extends AOSCons{
	
	/**
	 * 基于数据表的AOS_SEQUENCE的序列名称
	 */
	public static final class SEQ{
		//系统模块使用的序列号
		public static final String SEQ_SYSTEM = "seq_system";
		//演示模块使用的序列号
		public static final String SEQ_DEMO = "seq_demo";
	}
	
	/**
	 * 授权类型
	 */
	public static final class GRANT_TYPE{
		//业务办理权限
		public static final String BIZ = "1";
		//管理授权权限
		public static final String ADMIN = "2";
	}
	
	/**
	 * 用户状态
	 */
	public static final class USER_STATUS{
		//正常
		public static final String NORMAL = "1";
		//锁定
		public static final String LOCK = "2";
		//停用
		public static final String DISABLE = "3";
	}
	
	/**
	 * 图标类型
	 */
	public static final class ICON_TYPE{
		//小图标
		public static final String SMALL = "1";
		//大图标
		public static final String BIG = "2";
		//字体图标
		public static final String FONT = "3";
	}
	
	/**
	 * Redis命令数据类型
	 */
	public static final class CMD_TYPE{
		//String
	    public static final String STRING = "1";
		//MAP
		public static final String MAP = "2";
		//LIST
		public static final String LIST = "3";
		//SET
		public static final String SET = "4";
	}
	
	/**
	 * 树组件的更节点的父节点ID
	 */
	public static  final String ROOTNODE_PARENT_ID = "0";
	
	/**
	 * 超级管理员流水号
	 */
	public static  final String SUPER_USER_ID = "-1";
	
	/**
	 * 超级管理员角色流水号
	 */
	public static  final String SUPER_ROLE_ID = "-1";
	
	/**
	 * 角色管理菜单流水号
	 */
	public static  final String ROLE_MODULE_ID = "-1";
	
	
}
