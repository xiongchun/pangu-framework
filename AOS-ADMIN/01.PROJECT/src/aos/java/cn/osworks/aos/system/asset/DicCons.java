package cn.osworks.aos.system.asset;

/**
 * <b>数据字典常量表</b>
 * 
 * @author OSWorks-XC
 * @since 1.0
 * @date 2009-1-22
 */
public interface DicCons { 
	
	/**
	 * ID类型：APPID
	 */
	public static final String SEQUENCE_TYPE_APPID = "1";
	
	/**
	 * ID类型：UUID
	 */
	public static final String SEQUENCE_TYPE_UUID = "2";
	
	/**
	 * ID类型：DBSequence
	 */
	public static final String SEQUENCE_TYPE_DBSEQUENCE = "3";
	
	/**
	 * 用户类型：缺省
	 */
	public static final String USER_TYPE_DEFAULT = "1";
	
	/**
	 * 用户类型：超级用户
	 */
	public static final String USER_TYPE_SUPER = "2";
	
	/**
	 * 用户类型：注册用户
	 */
	public static final String USER_TYPE_REG = "3";
	
	/**
	 * 当前状态：启用
	 */
	public static final String ENABLED_YES = "1";
	
	/**
	 * 当前状态：停用
	 */
	public static final String ENABLED_NO = "0";
	
	/**
	 * 角色类型：管理员创建
	 */
	public static final String ROLE_TYPE_CREATE = "1";
	
	/**
	 * 角色类型：系统内置
	 */
	public static final String ROLE_TYPE_SYSTEM = "2";
	
	/**
	 * 用户状态：正常
	 */
	public static final String USER_STATUS_NORMAL = "1";
	
	/**
	 * 授权类型：经办权限
	 */
	public static final String GRANT_TYPE_BIZ = "1";
	
	/**
	 * 授权类型：管理权限
	 */
	public static final String GRANT_TYPE_ADMIN = "2";
	
	/**
	 * 页面元素授权类型：未授权
	 */
	public static final String ELEMENT_GRANT_TYPE_WSQ = "1";
	
	/**
	 * 页面元素授权类型：撤消授权
	 */
	public static final String ELEMENT_GRANT_TYPE_CXSQ = "99";
	
	/**
	 * 模型创建方式：1-在线设计
	 */
	public static final String CREATE_TYPE_DESIGN = "1";
	
	/**
	 * 模型创建方式：2-文件导入
	 */
	public static final String CREATE_TYPE_FILE = "2";
	
	/**
	 * 导航类型：1-快捷菜单
	 */
	public static final String MODULE_USER_NAV_TYPE_QUICK = "1";
	
	/**
	 * 图标类型：1-小图标
	 */
	public static final String SMALL_FILE_ICON = "1";
	
	/**
	 * 图标类型：2-大图标
	 */
	public static final String BIG_FILE_ICON = "2";
	
	/**
	 * 图标类型：3-矢量图标
	 */
	public static final String VECTOR_ICON = "3";
	
	/**
	 * 页面类型：1-主页面
	 */
	public static final String PAGE_TYPE_MAIN = "1";
	
	/**
	 * 页面类型：2-子页面
	 */
	public static final String PAGE_TYPE_SUB = "2";
	
	/**
	 * 页面类型：3-关联页面
	 */
	public static final String PAGE_TYPE_LINK = "3";
	
	/**
	 * 流程实例状态：1：运行中
	 */
	public static final String PROCINST_STATUS_RUNNING = "1";
	
	/**
	 * 流程实例状态：2：已结束
	 */
	public static final String PROCINST_STATUS_COMPLETED = "2";
	
	/**
	 * 实例/任务活动状态：1：激活
	 */
	public static final String SUSPENSION_STATE_ACTIVED = "1";
	
	/**
	 * 实例/任务活动状态：9：结束
	 */
	public static final String SUSPENSION_STATE_COMPLETED = "9";
	
	/**
	 * 流程任务状态：1：待办
	 */
	public static final String PROCTASK_STATUS_DB = "1";
	
	/**
	 * 流程任务状态：2：办结
	 */
	public static final String PROCTASK_STATUS_BJ = "2";
	
	/**
	 * 流程任务状态：3：待签收
	 */
	public static final String PROCTASK_STATUS_DQS = "3";
	
	/**
	 * 逻辑删除标识
	 *
	 */
	public static  final class DELETE_FLAG{
		//删除
		public static final String YES = "1";
		//正常
		public static final String NO = "0";
	}
	
 }
