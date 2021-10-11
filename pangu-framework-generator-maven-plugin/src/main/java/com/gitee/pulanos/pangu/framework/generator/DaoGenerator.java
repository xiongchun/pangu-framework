package com.gitee.pulanos.pangu.framework.generator;

import cn.hutool.core.io.file.FileAppender;
import cn.hutool.core.util.StrUtil;
import com.gitee.pulanos.pangu.framework.generator.pojo.Column;
import com.gitee.pulanos.pangu.framework.generator.pojo.PluginConfig;
import com.gitee.pulanos.pangu.framework.generator.pojo.Table;

import java.io.File;
import java.util.List;

import static cn.hutool.core.text.StrFormatter.format;

/**
 * Dao 代码生成器
 * @author xiongchun
 *
 */
public class DaoGenerator {

    public void generateMapper(Table table, PluginConfig pluginConfig) {

    }

    public static void generateEntity(Table table, List<Column> columns, PluginConfig pluginConfig) {
        String tableName = StrUtil.upperFirst(StrUtil.toCamelCase(table.getName()));
        FileAppender appender = new FileAppender(new File(format("{}Entity.java", tableName)), 50, true);
        appender.append(format("package {};", pluginConfig.getEntityPackageName()));
        appender.flush();
    }

}
