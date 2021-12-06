package com.gitee.pulanos.pangu.showcases.webapi.param;

import lombok.Data;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.io.Serializable;

/**
 * Case3入参
 * @author xc
 */
@Data
@Accessors(chain = true)
public class CaseIn implements Serializable {

    private static final long serialVersionUID = -1650037956136839090L;

    /**
     * ID
     */
    @NotNull(message="ID不能为空")
    private Long id;

    /**
     * 名称
     */
    @NotEmpty(message = "名称不能为空")
    private String name;

}
