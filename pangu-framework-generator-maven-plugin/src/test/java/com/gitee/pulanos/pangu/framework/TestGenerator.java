package com.gitee.pulanos.pangu.framework;

import cn.hutool.core.util.StrUtil;
import com.gitee.pulanos.pangu.framework.generator.EntityGenerator;
import com.gitee.pulanos.pangu.framework.generator.utils.DbMetaInfoUtil;
import com.gitee.pulanos.pangu.framework.generator.pojo.Column;
import com.gitee.pulanos.pangu.framework.generator.pojo.PluginConfig;
import com.gitee.pulanos.pangu.framework.generator.pojo.Table;
import org.apache.maven.plugins.annotations.Parameter;

import java.sql.Connection;
import java.util.List;

public class TestGenerator {

    @Parameter(property = "url")
    private static String url = "jdbc:mysql://127.0.0.1:3306/pangu-showcases";
    @Parameter(property = "user")
    private static String user = "root";
    @Parameter(property = "password")
    private static String password = "root123456";

    @Parameter(property = "entityFilePath")
    private static String entityFilePath="/Users/xc/git2/pangu-framework/pangu-framework-generator-maven-plugin/src/test/java/com/gitee/pulanos/pangu/framework/entity";
    @Parameter(property = "entityPackageName")
    private static String entityPackageName = "com.gitee.pulanos.pangu.framework.entity";
    @Parameter(property = "mapperFilePath")
    private static String mapperFilePath = "/Users/xc/git2/pangu-framework/pangu-framework-generator-maven-plugin/src/test/java/com/gitee/pulanos/pangu/framework/mapper";
    @Parameter(property = "mapperPackageName")
    private static String mapperPackageName = "com.gitee.pulanos.pangu.framework";
    @Parameter(property = "tables")
    private static String tables = "pangu_user,user";
    private static String author = "";

    public static void main(String[] args) {
        PluginConfig pluginConfig = initConfigContext();
        Connection connection = DbMetaInfoUtil.createConnect(url, user, password);
        List<Table> allTables = DbMetaInfoUtil.listTables(connection);
        List<String> tableNames = StrUtil.split(tables, ",");
        for (String tableName : tableNames) {
            Table table = DbMetaInfoUtil.findTableInfo(allTables, tableName);
            List<Column> columns = DbMetaInfoUtil.listTableColumns(connection, tableName);
            EntityGenerator.generate(table, columns, pluginConfig);
        }
    }

    private static PluginConfig initConfigContext(){
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
