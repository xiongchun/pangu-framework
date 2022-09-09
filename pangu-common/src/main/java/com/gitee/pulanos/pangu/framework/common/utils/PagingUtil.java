package com.gitee.pulanos.pangu.framework.common.utils;

import cn.hutool.core.util.ReflectUtil;
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

    public static Page createPage(Object obj){
        long page = Long.valueOf(ReflectUtil.getFieldValue(obj, "page").toString());
        long pageSize = Long.valueOf(ReflectUtil.getFieldValue(obj, "pageSize").toString());
        return createPage(page, pageSize);
    }

    public static PageResult getPageResult(Page page) {
        return new PageResult().setPage(page.getCurrent()).setPageSize(page.getSize()).setTotal(page.getTotal()).setRows(page.getRecords());
    }

}
