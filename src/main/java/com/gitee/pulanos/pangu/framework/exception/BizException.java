package com.gitee.pulanos.pangu.framework.exception;

import lombok.Getter;

/**
 * Business Exception
 *
 * <p>业务模块抛出的通用异常</p>
 *
 * @author xiongchun
 * @since 1.0.0
 */
public class BizException extends RuntimeException {

    private static final long serialVersionUID = -1030469420838093832L;

    @Getter
    private int code = -1;

    public BizException() {
    }

    public BizException(String msg) {
        super(msg);
    }

    public BizException(int code, String msg) {
        this(msg);
        this.code = code;
    }

    public BizException(Throwable throwable) {
        super(throwable);
    }

    public BizException(String msg, Throwable throwable) {
        super(msg, throwable);
    }

}
