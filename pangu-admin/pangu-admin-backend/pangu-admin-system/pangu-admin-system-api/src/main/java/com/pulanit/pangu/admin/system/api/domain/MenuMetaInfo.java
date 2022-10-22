package com.pulanit.pangu.admin.system.api.domain;

import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * 菜单元数据对象
 */
@Data
@Accessors(chain = true)
public class MenuMetaInfo implements Serializable {

    private static final long serialVersionUID = -5038015644309451210L;

    /**
     * 名称
     */
    private String title;

    /**
     * 图标
     */
    private String icon;

    /**
     * 类型
     */
    private String type;

    /**
     * 控制台快捷菜单的背景色
     */
    private String color;

    /**
     * 是否固定(标签卡片没有关闭按钮)
     */
    private boolean affix = false;

    /**
     * 是否隐藏菜单(详情页等)
     */
    private boolean hidden = false;

    /**
     * 是否整页打开路由
     */
    private boolean fullpage = false;

}
