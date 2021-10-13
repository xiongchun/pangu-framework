package com.gitee.pulanos.pangu.framework.generator.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * <b>插件配置对象</b>
 *
 * @author xiongchun
 * @date 2018-06-06
 */
@Data
public class PluginConfig implements Serializable {

    private static final long serialVersionUID = 1L;

    public final static String KEY = "PLUGIN_CONFIG";

    private String url;
    private String user;
    private String password;

    private String entityFilePath;
    private String entityPackageName;
    private String mapperFilePath;
    private String mapperPackageName;
    private String tables;

    private String author;
}
