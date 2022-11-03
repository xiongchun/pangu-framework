package com.gitee.pulanos.pangu.framework.common.entity;

import lombok.Data;
import lombok.ToString;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * 通用分页参数对象
 * @author xiongchun
 * @since 4.0.0
 */
@Data
@ToString
@Accessors(chain = true)
public class Page implements Serializable {

    private static final long serialVersionUID = 8282352350805029767L;

    private long page;

    private long pageSize;

}
