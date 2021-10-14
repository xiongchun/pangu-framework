package com.gitee.pulanos.pangu.framework.generator;

import cn.hutool.core.util.StrUtil;
import com.gitee.pulanos.pangu.framework.generator.pojo.Column;
import com.gitee.pulanos.pangu.framework.generator.pojo.PluginConfig;
import com.gitee.pulanos.pangu.framework.generator.pojo.Table;
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
    @Parameter(property = "entityPackageName")
    private String entityPackageName;
    @Parameter(property = "mapperFilePath")
    private String mapperFilePath;
    @Parameter(property = "mapperPackageName")
    private String mapperPackageName;
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
            EntityGenerator.generate(table, columns, pluginConfig);
        });

    }

    private PluginConfig initConfigContext(){
        PluginConfig pluginConfig = new PluginConfig();
        pluginConfig.setEntityPackageName(entityPackageName);
        pluginConfig.setEntityFilePath(entityFilePath);
        pluginConfig.setMapperFilePath(mapperFilePath);
        pluginConfig.setPassword(password);
        pluginConfig.setTables(tables);
        pluginConfig.setUrl(url);
        pluginConfig.setUser(user);
        pluginConfig.setMapperPackageName(mapperPackageName);
        pluginConfig.setAuthor(StrUtil.isEmpty(author) ? "普蓝开源社区" : author);
        return pluginConfig;
    }

}
