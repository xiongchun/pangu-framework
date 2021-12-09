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

package com.gitee.pulanos.pangu.framework.starter.jdbc.autoconfigure;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.extension.plugins.MybatisPlusInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.PaginationInnerInterceptor;
import com.gitee.pulanos.pangu.framework.common.Constants;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * JdbcAutoConfiguration
 *
 * @author xiongchun
 */
@Slf4j
@Configuration
@EnableConfigurationProperties(JdbcProperties.class)
public class JdbcAutoConfiguration {

    @Autowired
    private JdbcProperties jdbcProperties;

    @Bean
    @ConditionalOnMissingBean
    public MybatisPlusInterceptor mybatisPlusInterceptor() {
        MybatisPlusInterceptor interceptor = new MybatisPlusInterceptor();
        PaginationInnerInterceptor paginationInnerInterceptor = new PaginationInnerInterceptor();
        String dbType = jdbcProperties.getDbType();
        String msg = "自动识别";
        if (StrUtil.isNotEmpty(dbType)){
            //显式指定，免得每次都去自动获取类型拼装分页方言
            DbType dbTypeEnum = DbType.getDbType(dbType);
            paginationInnerInterceptor.setDbType(dbTypeEnum);
            msg = dbTypeEnum.getDb();
        }
        interceptor.addInnerInterceptor(paginationInnerInterceptor);
        log.info("{}分页插件 {} 自动装配成功，分页SQL方言被显式设置为:{}", Constants.Msg.OK, PaginationInnerInterceptor.class.getSimpleName(), msg);
        return interceptor;
    }
}
