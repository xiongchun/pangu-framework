package com.gitee.pulanos.pangu.framework.model.pagination;

import java.io.Serializable;
import java.util.Collections;
import java.util.List;

import lombok.Data;
import lombok.experimental.Accessors;

/**
 * 分页出参模型
 * <p> 封装此对象的目的是避免page对象对非ORM项目的侵入而导致不必要的环境依赖问题
 * @author xiongchun
 */
@Data
@Accessors(chain = true)
public class PageOut<T> implements Serializable{

    private static final long serialVersionUID = 8345971141073914966L;

    /**
     * 数据列表
     */
    private List<T> records = Collections.emptyList();

    /**
     * 总数
     */
    private long total = 0;

    /**
     * 每页显示条数，默认 10
     */
    private long pageSize = 10;

    /**
     * 当前页
     */
    private long currentPage = 1;

}
