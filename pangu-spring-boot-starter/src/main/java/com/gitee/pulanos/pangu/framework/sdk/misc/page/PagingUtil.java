package com.gitee.pulanos.pangu.framework.sdk.misc.page;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import java.util.List;

/**
 * Paging Utils
 *
 * @author xiongchun
 * @since 4.1.0
 */
public class PagingUtil {

    public static Page createPage(long page, long pageSize){
        return new Page(page, pageSize);
    }

    public static Page createPage(com.gitee.pulanos.pangu.framework.common.entity.Page page){
        return createPage(page.getPage(), page.getPageSize());
    }

    public static PageResult transformPageResult(Page page) {
        return new PageResult().setPage(page.getCurrent()).setPageSize(page.getSize()).setTotal(page.getTotal()).setRows(page.getRecords());
    }

    public static PageResult transformPageResult(Page page, List records) {
        return new PageResult().setPage(page.getCurrent()).setPageSize(page.getSize()).setTotal(page.getTotal()).setRows(records);
    }

}
