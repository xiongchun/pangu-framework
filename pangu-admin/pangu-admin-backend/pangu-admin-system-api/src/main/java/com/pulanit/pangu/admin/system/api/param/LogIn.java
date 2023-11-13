package com.pulanit.pangu.admin.system.api.param;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

/**
 * 日志数据入参
 */
@Data
@Accessors(chain = true)
public class LogIn implements Serializable {

    private static final long serialVersionUID = -4348614990282883920L;

    /**
     *  流水号
     */
    private Long id;

    /**
     * 应用名称标识
     */
    private String appName;

    /**
     * 路径入口标识
     */
    private String path;

    /**
     * 标签标识
     */
    private String tag;

    /**
     * 业务耗时
     */
    private Integer timeElapsed;

    /**
     * 经办时间
     */
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date gmtExecuted;

    /**
     * 经办人
     */
    private Long createdBy;

    /**
     * 经办人姓名
     */
    private String createdByName;

    /**
     * 创建时间
     */
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date gmtCreated;

    /**
     * 输入
     */
    private String input;

    /**
     * 输出
     */
    private String output;

    /**
     * 是否成功
     */
    private Boolean success;

}
