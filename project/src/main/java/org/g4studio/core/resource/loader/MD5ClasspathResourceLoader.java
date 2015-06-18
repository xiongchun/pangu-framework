/*
 * Copyright 2002-2005 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * 欢迎加入 E3平台联盟QQ群:21523645 
 */
package org.g4studio.core.resource.loader;

import org.g4studio.core.resource.util.MD5;

/**
 * MD5ClasspathResourceLoader
 * 
 * @author HuangYunHui|XiongChun
 * @since 2009-08-3
 */
public class MD5ClasspathResourceLoader extends ClasspathResourceLoader{
	public static final String FILE_PREFIX = "G4Res_";
	public static final String FILE_POSTFIX = ".g4";
	private MD5 m = new MD5();
	/**
	 * 如果要进行url转换处理，覆盖该方法.
	 * @param pUri
	 * @return
	 */
	protected String urlMapping(String pUri){
    	String filename = pUri.replace('\\','/');           // 4
		return FILE_PREFIX + m.getMD5ofStr(filename) + FILE_POSTFIX;
	}

}
