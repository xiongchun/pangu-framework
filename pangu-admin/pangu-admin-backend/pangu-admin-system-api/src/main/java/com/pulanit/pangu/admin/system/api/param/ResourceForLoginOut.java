package com.pulanit.pangu.admin.system.api.param;

import cn.hutool.core.lang.tree.Tree;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.List;

/**
 * 登录获取资源权限信息出参
 */
@Data
@Accessors(chain = true)
public class ResourceForLoginOut implements Serializable {

    private static final long serialVersionUID = 2498779879725400677L;

    private List<Tree<Integer>> menu;

    private List<String> permissions;
}
