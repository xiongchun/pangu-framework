package com.gitee.pulanos.pangu.model.pagination;

/**
 * 分页模型包装
 * 
 * @author xiongchun
 * @see com.baomidou.mybatisplus.extension.plugins.pagination.Page
 */
public class Page<T> extends com.baomidou.mybatisplus.extension.plugins.pagination.Page<T> {

    private static final long serialVersionUID = 3288001902993995066L;

    public Page() {}

    public Page(long current, long size) {
        this(current, size, 0);
    }

    public Page(long current, long size, long total) {
        this(current, size, total, true);
    }

    public Page(long current, long size, boolean isSearchCount) {
        this(current, size, 0, isSearchCount);
    }

    public Page(long current, long size, long total, boolean isSearchCount) {
        if (current > 1) {
            setCurrent(current);
        }
        setSize(size);
        setTotal(total);
        setSearchCount(isSearchCount);
    }
    
    /**
     * 将PanGu自定义分页参数组装到PageWrapper对象
     * @param pageIn 继承了{@link PageIn}的入参对象
     */
    public Page(PageIn pageIn) {
        setCurrent(pageIn.getPageCurrent()).setSize(pageIn.getPageSize()).setSearchCount(pageIn.isSearchCount());
    }
    
    /**
     * wrapper to {@link PageOut} Object
     * @return
     */
    public PageOut<T> pageOut(){
        PageOut<T> pageOut = new PageOut<>();
        pageOut.setCurrentPage(getCurrent());
        pageOut.setPageSize(getSize());
        pageOut.setRecords(getRecords());
        pageOut.setTotal(getTotal());
        return pageOut;
    }

}
