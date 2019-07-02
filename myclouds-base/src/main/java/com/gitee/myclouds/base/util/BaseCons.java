package com.gitee.myclouds.base.util;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 常量表 <br>
 * 
 * @author xiongchun
 *
 */
public class BaseCons {
	
	@AllArgsConstructor
	public static enum GrantType {
		BIZ("1", "经办权限"), ADMIN("2", "管理权限");
		@Getter
		private final String value;
		@Getter
		private final String name;

	}

	/**
	 * 缺省的密码字段加解密钥
	 */
	public static final String PWD_KEY = "HY&XC&MW";


}
