package cn.osworks.aos.core.asset;

/**
 * <b>全局常量表</b>
 * 
 * @author OSWorks-XC
 * @since 1.0
 * @date 2008-06-06
 */
public interface AOSCons {

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
	public static final int PROC_SUCCESS = 1;

	/**
	 * 业务状态码：成功
	 */
	public static final int SUCCESS = 1;

	/**
	 * 业务状态码：失败
	 */
	public static final int ERROR = -1;

	/**
	 * 字符布尔值：真
	 */
	public static final String STR_TRUE = "1";

	/**
	 * 字符布尔值：假
	 */
	public static final String STR_FALSE = "0";

	/**
	 * 系统运行模式：开发模式
	 */
	public static final String RUNAS_DEV = "0";

	/**
	 * 系统运行模式：生产模式
	 */
	public static final String RUNAS_PRO = "1";

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
	 * UserInfo对象在Session中的key，Dto中的当前UserInfo也使用此Key
	 */
	public static final String USERINFOKEY = "_userInfoVO";

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
	 * 系统皮肤：blue
	 */
	public static final String SKIN_BLUE = "blue";

	/**
	 * 系统皮肤：gray
	 */
	public static final String SKIN_GRAY = "gray";

	/**
	 * 系统皮肤：neptune
	 */
	public static final String SKIN_NEPTUNE = "neptune";

	/**
	 * 系统皮肤：aos
	 */
	public static final String SKIN_AOS = "aos";

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
	 * 会话中验证码的缺省Key
	 */
	public static final String VERCODE = "_vercode";
	
	/**
	 * WEBAPPCXT是否成功的标志KEY
	 */
	public static final String WEBAPPCXT_IS_SUCCESS_KEY = "_webappcxt_is_success";
	
	/**
	 * ContextPath在系统变量中的Key
	 */
	public static final String CXT_KEY = "cxt";
	
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
	 * JDBC执行模式。1：只读模式。
	 */
	public static final String JDBC_EXECUTE_ONLYREAD = "1";
	
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
	 * Cache对象前缀
	 *
	 */
	public static  final class CACHE_PREFIX{
		//全局参数
		public static final String PARAM = "aos.cache.param.key_:";
		//字典
		public static final String DIC = "aos.cache.dic.key_:";
		//组件各位授权
		public static final String CMP_POST = "aos.cache.cmp.post.key_:";
		//组件角色授权
		public static final String CMP_ROLE = "aos.cache.cmp.role.key_:";
		//组件用户授权
		public static final String CMP_USER = "aos.cache.cmp.user.key_:";
	}

}
