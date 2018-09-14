package com.gitee.myclouds.common.util;

/**
 * 平台常量表 <br>
 * 提示：业务常量请别混在这里
 * 
 * @author xiongchun
 *
 */
public class MyCons {

	/**
	 * 通用的是否布尔值
	 */
	public static enum YesOrNo {

		NO(0, "否"), YES(1, "是");

		private YesOrNo(Integer value, String name) {
			this.value = value;
			this.name = name;
		}

		private final Integer value;
		private final String name;

		public Integer getValue() {
			return value;
		}

		public String getName() {
			return name;
		}
	}

	/**
	 * 平台缓存Key/前缀
	 */
	public static enum CacheKeyOrPrefix {

		MyParam("myparam", "键值参数缓存Key的前缀"), 
		MyEnum("myenum", "枚举参数缓存Key的前缀"),
		MyModule("mymodule", "模块菜单缓存Key"),
		LastCacheTime("lastcachetime", "最后一次缓存对象插入时间Key"),
		DefaultOpenMenuId("myclouds:defaultexpandmenuid", "登录后缺省展开的一级菜单节点ID"),
		RoleAuth("roleauth", "角色授权对象前缀");

		private CacheKeyOrPrefix(String value, String name) {
			this.value = value;
			this.name = name;
		}

		private final String value;
		private final String name;

		public String getValue() {
			return value;
		}

		public String getName() {
			return name;
		}
	}

	/**
	 * 角色菜单授权类型
	 */
	public static enum GrantType {

		BIZ("1", "经办权限"), ADMIN("2", "管理权限");

		private GrantType(String value, String name) {
			this.value = value;
			this.name = name;
		}

		private final String value;
		private final String name;

		public String getValue() {
			return value;
		}

		public String getName() {
			return name;
		}
	}

	/**
	 * 缺省的密码字段加解密钥
	 */
	public static final String PWD_KEY = "HY&XC&MW";

	/**
	 * 缺省当前用户数据对象会话KEY
	 */
	public static final String My_USER = "_user";

	public static void main(String[] args) {

	}

}
