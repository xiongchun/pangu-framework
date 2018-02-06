package com.gitee.myclouds.toolbox.util;

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
	 * 平台缓存Key前缀
	 */
	public static enum CacheKeyPrefix {

		MyParam("myparam:", "键值参数缓存Key的前缀"), myEnum("myenum:", "枚举参数缓存Key的前缀");

		private CacheKeyPrefix(String value, String name) {
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

	public static void main(String[] args) {

	}

}
