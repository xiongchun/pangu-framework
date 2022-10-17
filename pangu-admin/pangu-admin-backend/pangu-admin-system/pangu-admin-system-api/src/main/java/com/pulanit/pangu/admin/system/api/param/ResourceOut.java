package com.pulanit.pangu.admin.system.api.param;

import cn.hutool.core.lang.tree.Tree;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.List;

/**
 * 资源授权出参
 */
@Data
@Accessors(chain = true)
public class ResourceOut implements Serializable {

    private static final long serialVersionUID = 3824668588694495765L;

    private List<Tree<Integer>> menuList;

    private List<Long> checkedList;

}
