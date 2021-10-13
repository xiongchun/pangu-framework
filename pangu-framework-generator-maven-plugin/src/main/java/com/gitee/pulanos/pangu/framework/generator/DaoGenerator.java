package com.gitee.pulanos.pangu.framework.generator;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.io.FileUtil;
import cn.hutool.core.io.file.FileAppender;
import cn.hutool.core.util.StrUtil;
import com.gitee.pulanos.pangu.framework.generator.pojo.Column;
import com.gitee.pulanos.pangu.framework.generator.pojo.PluginConfig;
import com.gitee.pulanos.pangu.framework.generator.pojo.Table;
import lombok.extern.slf4j.Slf4j;

import java.io.File;
import java.util.List;

import static cn.hutool.core.text.StrFormatter.format;

/**
 * Dao 代码生成器
 * @author xiongchun
 */
@Slf4j
public class DaoGenerator {

    public void generateMapper(Table table, PluginConfig pluginConfig) {

    }

    public static void generateEntity(Table table, List<Column> columns, PluginConfig pluginConfig) {
        log.info("开始生成数据表[{}]对应的实体文件...", table.getName());
        String tableName = StrUtil.upperFirst(StrUtil.toCamelCase(table.getName()));
        String filePath = format("{}/{}Entity.java", pluginConfig.getEntityFilePath(), tableName);
        File file = new File(filePath);
        // 每次都是重新生成全新的文件
        FileUtil.del(file);
        FileAppender appender = new FileAppender(file, 100, true);

        appender.append(format("package {};", pluginConfig.getEntityPackageName()));
        appender.append("");

        appender.append("import com.baomidou.mybatisplus.annotation.*;");
        appender.append("import lombok.Data;");
        appender.append("import lombok.EqualsAndHashCode;");
        appender.append("import lombok.experimental.Accessors;");
        appender.append("import java.io.Serializable;");
        appender.append("");

        appender.append("/**");
        appender.append(format(" * {}", table.getComment()));
        appender.append(" *");
        appender.append(format(" * @author {}", pluginConfig.getAuthor()));
        appender.append(format(" * @date {}", DateUtil.now()));
        appender.append(" */");
        appender.append("");

        appender.append("@Data");
        appender.append("@EqualsAndHashCode(callSuper = true)");
        appender.append("@Accessors(chain = true)");
        //ORACLE appender.append("@KeySequence({})", seqName);
        appender.append(format("@TableName({})", table.getName()));
        appender.append(format("public class {}Entity implements Serializable {", tableName));
        appender.append("   private static final long serialVersionUID=1L;");

        appender.append("}");

        appender.flush();
        log.info("{}Entity.java 生成成功。文件路径：{}", tableName, filePath);
    }

}
