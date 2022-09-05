package com.gitee.pulanos.pangu.framework.common.model;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.Data;
import lombok.ToString;
import lombok.experimental.Accessors;

import java.util.Collections;
import java.util.List;

/**
 * 通用分页响应结果对象
 * @author xiongchun
 * @since 4.0.0
 * @param <T>
 */
@Data
@ToString
@Accessors(chain = true)
public class PageResult<T> {

    private Long page;

    private Long pageSize;

    private List<T> rows = Collections.emptyList();

    private Long total;

    public static <T> PageResult<T> from(Page<T> page) {
        return new PageResult<T>().setPage(page.getCurrent()).setPageSize(page.getSize()).setTotal(page.getTotal()).setRows(page.getRecords());
    }

}
