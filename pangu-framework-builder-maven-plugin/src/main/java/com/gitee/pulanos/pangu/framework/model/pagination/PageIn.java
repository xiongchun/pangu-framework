package com.gitee.pulanos.pangu.framework.model.pagination;

import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * 分页入参模型
 * @author xiongchun
 */
@Data
@Accessors(chain = true)
public class PageIn implements Serializable{

    private static final long serialVersionUID = -5756604230854510842L;

    /**
     * 每页显示条数，默认 10
     */
    private long pageSize = 10;

    /**
     * 当前页
     */
    private long pageCurrent = 1;

    /**
     * 是否进行 count 查询
     */
    private boolean searchCount = true;

}
