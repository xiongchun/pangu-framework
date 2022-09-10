package com.gitee.pulanos.pangu.framework.common.utils;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gitee.pulanos.pangu.framework.common.model.PageResult;

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

    public static Page createPage(com.gitee.pulanos.pangu.framework.common.model.Page page){
        return createPage(page.getPage(), page.getPageSize());
    }

    public static PageResult getPageResult(Page page) {
        return new PageResult().setPage(page.getCurrent()).setPageSize(page.getSize()).setTotal(page.getTotal()).setRows(page.getRecords());
    }

}
