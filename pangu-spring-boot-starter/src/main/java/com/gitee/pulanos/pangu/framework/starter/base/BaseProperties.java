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

package com.gitee.pulanos.pangu.framework.starter.base;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * PanguAppProperties
 *
 * @author xiongchun
 */
@Data
@ConfigurationProperties(prefix = "pangu")
public class BaseProperties {

    /**
     * 盘古应用ID标识(缺省："")
     */
    private String appId = "";

    /**
     * 根据Nacos配置实现动态热刷新日志级别（缺省：true）
     */
    private boolean logReload = true;

}
