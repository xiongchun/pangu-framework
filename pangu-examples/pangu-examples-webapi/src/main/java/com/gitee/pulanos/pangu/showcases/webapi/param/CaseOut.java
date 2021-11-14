package com.gitee.pulanos.pangu.showcases.webapi.param;

import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * Case3出参
 * @author xc
 */
@Data
@Accessors(chain = true)
public class CaseOut implements Serializable {

    private static final long serialVersionUID = -1650037156136839090L;

    /**
     * ID
     */
    private Long id;

    /**
     * 名称
     */
    private String name;

    /**
     * 年龄
     */
    private  Integer age;

}
