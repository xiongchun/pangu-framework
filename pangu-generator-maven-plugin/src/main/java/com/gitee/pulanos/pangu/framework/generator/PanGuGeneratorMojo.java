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

package com.gitee.pulanos.pangu.framework.generator;

import cn.hutool.core.util.StrUtil;
import com.gitee.pulanos.pangu.framework.generator.pojo.Column;
import com.gitee.pulanos.pangu.framework.generator.pojo.PluginConfig;
import com.gitee.pulanos.pangu.framework.generator.pojo.Table;
import com.gitee.pulanos.pangu.framework.generator.utils.CommonUtil;
import com.gitee.pulanos.pangu.framework.generator.utils.DbMetaInfoUtil;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.apache.maven.plugin.AbstractMojo;
import org.apache.maven.plugins.annotations.Mojo;
import org.apache.maven.plugins.annotations.Parameter;

import java.sql.Connection;
import java.util.List;

/**
 * 插件入口
 *
 * @author xiongchun
 */
@Slf4j
@Mojo(name = "generate")
public class PanGuGeneratorMojo extends AbstractMojo {

    @Parameter(property = "url")
    private String url;
    @Parameter(property = "user")
    private String user;
    @Parameter(property = "password")
    private String password;

    @Parameter(property = "entityFilePath")
    private String entityFilePath;
    @Parameter(property = "mapperFilePath")
    private String mapperFilePath;
    @Parameter(property = "tables")
    private String tables;

    @Parameter(property = "author")
    private String author;

    @SneakyThrows
    @Override
    public void execute() {
        PluginConfig pluginConfig = initConfigContext();
        Connection connection = DbMetaInfoUtil.createConnect(url, user, password);
        List<Table> allTables = DbMetaInfoUtil.listTables(connection);
        List<String> tableNames = StrUtil.split(tables, ",");
        tableNames.forEach(tableName -> {
            Table table = DbMetaInfoUtil.findTableInfo(allTables, tableName);
            List<Column> columns = DbMetaInfoUtil.listTableColumns(connection, tableName);
            if (StrUtil.isNotEmpty(pluginConfig.getEntityFilePath())){
                EntityGenerator.generate(table, columns, pluginConfig);
            }
            if (StrUtil.isNotEmpty(pluginConfig.getMapperFilePath())){
                MapperGenerator.generate(table, pluginConfig);
            }
        });

    }

    private PluginConfig initConfigContext(){
        PluginConfig pluginConfig = new PluginConfig();
        pluginConfig.setEntityFilePath(entityFilePath);
        pluginConfig.setEntityPackageName(CommonUtil.filePathToPkgName(entityFilePath));
        pluginConfig.setMapperFilePath(mapperFilePath);
        pluginConfig.setMapperPackageName(CommonUtil.filePathToPkgName(mapperFilePath));
        pluginConfig.setPassword(password);
        pluginConfig.setTables(tables);
        pluginConfig.setUrl(url);
        pluginConfig.setUser(user);
        pluginConfig.setAuthor(StrUtil.isEmpty(author) ? "PanGu Dev Framework" : author);
        return pluginConfig;
    }

}
