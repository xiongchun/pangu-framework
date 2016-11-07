package aos.framework.core.utils;

/**
 * <b>全局常量表</b>
 * 
 * @author xiongchun
 * @since 1.0
 * @date 2008-06-06
 */
public class AOSCons {

	/**
	 * 日期格式
	 */
	public static final String DATA = "yyyy-MM-dd";

	/**
	 * 日期时间格式
	 */
	public static final String DATATIME = "yyyy-MM-dd HH:mm:ss";
	
	/**
	 * 存储过程业务成功状态码：成功
	 */
	public static final String PROC_SUCCESS = "1";

	/**
	 * 业务状态码：成功
	 */
	public static final String SUCCESS = "1";

	/**
	 * 业务状态码：失败
	 */
	public static final String ERROR = "-1";

	/**
	 * 字符布尔值：真
	 */
	public static final String STR_TRUE = "1";

	/**
	 * 字符布尔值：假
	 */
	public static final String STR_FALSE = "0";

	/**
	 * Json输出模式。格式化输出模式。
	 */
	public static final String JSON_FORMAT = "0";

	/**
	 * Ext Reader对象的totalProperty属性名称
	 */
	public static final String READER_TOTAL_PROPERTY = "_total";

	/**
	 * Ext Reader对象的root属性名称
	 */
	public static final String READER_ROOT_PROPERTY = "_rows";

	/**
	 * Dto对象中的内部变量：交易状态码
	 */
	public static final String APPCODE_KEY = "appcode";

	/**
	 * Dto对象中的内部变量：交易状态信息
	 */
	public static final String APPMSG_KEY = "appmsg";
	
	/**
	 * Dto对象中的内部变量：异常堆栈信息
	 */
	public static final String TRACEMSG_KEY = "tracemsg";
	
	/**
	 * 请求相应成功标志
	 */
	public static final String REQUEST_SUCCESS = "success";

	/**
	 * 控制台醒目标记1
	 */
	public static final String CONSOLE_FLAG1 = "● ";

	/**
	 * 控制台醒目标记2
	 */
	public static final String CONSOLE_FLAG2 = "●● ";
	
	/**
	 * 控制台醒目标记3
	 */
	public static final String CONSOLE_FLAG3 = "●●● ";

	/**
	 * User对象在上下文重的KEY
	 */
	public static final String USERINFOKEY = "aos_user_model_";

	/**
	 * 获取前端UI选择模型选中的标识字段的数组，前端请求参数key应为：aos_rows_，方能取到。
	 */
	public static final String AOS_ROWS_ = "aos_rows_";

	/**
	 * 是
	 */
	public static final String YES = "1";

	/**
	 * 否
	 */
	public static final String NO = "0";

	/**
	 * 数序运算SQL的参数Dto中的运算表达式Key。
	 */
	public static final String CALCEXPR = "_expr";

	/**
	 * DTO缺省字符串Key
	 */
	public static final String DEFAULT_STRING_KEY = "_default_string_a";

	/**
	 * DTO缺省List Key
	 */
	public static final String DEFAULT_LIST_KEY = "_default_list_a";

	/**
	 * DTO缺省BigDecimal Key
	 */
	public static final String DEFAULT_BIGDECIMAL_KEY = "_default_bigdecimal_a";

	/**
	 * DTO缺省Integer Key
	 */
	public static final String DEFAULT_INTEGER_KEY = "_default_integer_a";

	/**
	 * DTO缺省Boolean Key
	 */
	public static final String DEFAULT_BOOLEAN_KEY = "_default_boolean_a";
	
	/**
	 * WEBAPPCXT是否成功的标志KEY
	 */
	public static final String WEBAPPCXT_IS_SUCCESS_KEY = "_webappcxt_is_success";
	
	/**
	 * JOSQL AOSListUtils 中使用的KEY
	 */
	public static final String AOSLIST_KEY = ":AOSList";
	
	/**
	 * 排序器在参数对象中的Key
	 */
	public static final String ORDER_KEY = "_order";
	
	/**
	 * 点击菜单节点自动拼接到URL上面的菜单模块编号参数
	 */
	public static final String MODULE_ID_KEY = "aos_module_id_";
	
	/**
	 * 点击主页面上二级导航页面的页面ID参数
	 */
	public static final String PAGE_ID_KEY = "aos_page_id_";
	
	/**
	 * 角色授权模式。1：可见当前管理员创建的角色和当前管理员所属组织的其他管理员创建的角色。
	 */
	public static final String ROLE_GRANT_MODE_NOCASCADE = "1";
	
	/**
	 * 角色授权模式。2：可见当前管理员创建的角色和当前管理员所属组织及其下级子孙组织的其他管理员创建的角色。
	 */
	public static final String ROLE_GRANT_MODE_CASCADE = "2";
	
	/**
	 * 快捷菜单布局风格。1：平铺。
	 */
	public static final String NAV_QUICK_LAYOUT_FLAT = "1";
	
	/**
	 * 快捷菜单布局风格。2：树状。
	 */
	public static final String NAV_QUICK_LAYOUT_TREE = "2";
	
	/**
	 * AOS官网
	 */
	public static final String OSWORKS_WEBSITE = "http://git.oschina.net/osworks/AOS";
	
	/**
	 * 功能模块根节点ID
	 */
	public static final String MODULE_ROOT_ID = "2a4c060f44d944ea926fe44522ce7b39";
	
	/**
	 * 组织根节点ID
	 */
	public static final String ORG_ROOT_ID = "63cf387a243d4d9799367d773b853346";
	
	/**
	 * 对象删除规则
	 *
	 */
	public static  final class OBJECT_DELETE_RULE{
		//逻辑删除
		public static final String UPDATE = "update";
		//物理删除
		public static final String DELETE = "delete";
	}
	
	/**
	 * 是否标识
	 */
	public static final class IS{
		public static final String YES = "1";
		public static final String NO = "0";
	}
	
	/**
	 * 系统皮肤类型
	 *
	 */
	public static  final class SKIN{
		public static final String BLUE = "blue";
		public static final String GRAY = "gray";
	}
	
	/**
	 * 系统运行模式
	 *
	 */
	public static  final class RUN_MODE{
		public static final String DEV = "0";
		public static final String PRO = "1";
		public static final String DEMO = "2";
	}
	
	/**
	 * App应用全局Key标识
	 */
	public static  final String APP_KEY = AOSCfgHandler.getValue("app_key");
	
	/**
	 *Redis全局Key前缀
	 */
	public static final class KEYS{
		//全局KEY
		public static final String GLOBAL = APP_KEY + ":";
		//序列号
		public static final String ID = GLOBAL + "id_";
		//卡片组
		public static final String CARDLIST= GLOBAL + "cardlist_";
		//全局参数
		public static final String PARAM_KEY = GLOBAL + "param_";
		//数据字典
	    public static final String DIC_KEY = GLOBAL + "dic_";
		//在线用户集合
		public static final String USER_LIST_KEY = GLOBAL + "online_users_";
		//卡片导航树
		public static final String CARD_TREE = GLOBAL + "card_tree_";
	}
	
	/**
	 * 通用SQL数据访问对象Bean名称
	 */
	public static  final String SQLDAO = "sqlDao";

}
