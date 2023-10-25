package com.gitee.pulanos.pangu.framework.sdk.misc.page;

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

}
