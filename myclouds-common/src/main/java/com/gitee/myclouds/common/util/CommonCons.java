package com.gitee.myclouds.common.util;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 常量表 <br>
 * 
 * @author xiongchun
 *
 */
public class CommonCons {
	
	@AllArgsConstructor
	public static enum RedisKey {
		Token("my:token:", "token缓存前缀");
        @Getter
		private final String value;
        @Getter
		private final String name;
	}

	@AllArgsConstructor
	public static enum Common {
		Token("X-Auth-Token", "Token参数名");
        @Getter
		private final String value;
        @Getter
		private final String name;
	}
}
