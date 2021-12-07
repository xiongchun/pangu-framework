/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.gitee.pulanos.pangu.framework.generator.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * <b>数据表对象</b>
 * 
 * @author xiongchun
 * @date 2013-06-06
 */
@Data
public class Table implements Serializable {

	private static final long serialVersionUID = 1L;
	
	/**
	 * 表名
	 */
	private String name;
	
	/**
	 * 注释
	 */
	private String comment;
	
	/**
	 * 所有者
	 */
	private String owner;
	
	/**
	 * 自增列主键的名称(如果表是以自增列作为主键)
	 */
	private String autoincrementPkName;

	
}
