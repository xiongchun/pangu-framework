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
 * <b>数据表字段对象</b>
 * 
 * @author xiongchun
 * @date 2013-06-06
 */
@Data
public class Column implements Serializable {

	private static final long serialVersionUID = 1L;

	/**
	 * 字段名
	 */
	private String name;
	
	/**
	 * 字段原始DB类型
	 */
	private String type;
	
	/**
	 * 注释
	 */
	private String comment;
	
	/**
	 * 长度
	 */
	private Integer length;
	
	/**
	 * 浮点数的精度(小数点)
	 */
	private Integer scale;
	
	/**
	 * 是否可以为空
	 */
	private Boolean nullAble;
	
	/**
	 * 缺省值
	 */
	private String defaultValue;
	
	/**
	 * 是主键
	 */
	private Boolean isPkey;
	
	/**
	 * 是否为自增列(提示：自增列不一定是主键哦)
	 */
	private Boolean isAutoincrement;
	
	/**
	 * 所属表名
	 */
	private String tablename;

	/**
	 * 字段顺序号
	 */
	private Integer number;

	/**
	 * 对应Java类型
	 */
	private String javaType;

}
