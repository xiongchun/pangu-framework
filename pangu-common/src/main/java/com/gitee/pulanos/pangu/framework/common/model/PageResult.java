package com.gitee.pulanos.pangu.framework.common.model;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.Data;
import lombok.ToString;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Collections;
import java.util.List;
import java.util.Map;

/**
 * 通用分页结果对象
 * @author xiongchun
 * @since 4.0.0
 * @param <T>
 */
@Data
@ToString
@Accessors(chain = true)
public class PageResult<T> implements Serializable {

    private static final long serialVersionUID = 2597168666049973688L;

    private long page;

    private long pageSize;

    private long total;

    private List<T> rows = Collections.emptyList();

    private Map<String, String> summary = Collections.EMPTY_MAP;

    public static <T> PageResult<T> of(Page<T> page) {
        return new PageResult<T>().setPage(page.getCurrent()).setPageSize(page.getSize()).setTotal(page.getTotal()).setRows(page.getRecords());
    }

}
