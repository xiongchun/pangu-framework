package com.gitee.myclouds.base.util;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 常量表 <br>
 * 提示：业务常量请别混在这里
 * 
 * @author xiongchun
 *
 */
public class BaseCons {
	
	/**
	 * Redis键前缀常量
	 */
	@AllArgsConstructor
	public static enum RedisKey {
		Token("My:Token:", "Token缓存前缀");
        @Getter
		private final String value;
        @Getter
		private final String name;
	}

	
	
	
	
   //=============== to delete follows================	
	
	
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

		MyDict("mydict", "数据字典缓存Key的前缀");

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
	public static final String My_USER = "userVO";

	public static void main(String[] args) {

	}

}
