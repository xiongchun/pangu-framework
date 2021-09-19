package com.gitee.pulanos.pangu.framework.model;

import com.gitee.pulanos.pangu.framework.Constants;
import lombok.Data;
import lombok.ToString;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * 请求响应结果对象
 *
 * @author xiongchun
 * @since 4.0.0
 */
@Data
@ToString
@Accessors(chain = true)
public class Result<T> implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 返回状态（必填项）
     * <p>当code=10000时候为true，其余为false</p>
     */
    private Boolean status;

    /**
     * 返回码（必填项）
     * <p>示例值：10000</p>
     */
    private String code;

    /**
     * 返回码描述（选填项）
     * <p>示例值：接口调用成功</p>
     */
    private String msg;

    /**
     * 返回对象（选填项）
     */
    private T data;

    /**
     * 日志信息（选填项）
     * <p>当请求头中包含x-debug=true时，拦截器将获取错误日志信息返回
     */
    private String log;

    /**
     * 接口调用成功（快捷模式）
     *
     * @param data
     * @param <T>
     * @return
     */
    public static <T> Result<T> success(T data) {
        return new Result<T>().setStatus(true).setCode(Constants.Code.SUCCESS).setMsg("SUCCESS").setData(data);
    }

    /**
     * 接口调用失败（快捷模式,带消息）
     *
     * @param code
     * @param <T>
     * @return
     */
    public static <T> Result<T> fail(String code, String msg) {
        return new Result<T>().setStatus(false).setCode(code).setMsg(msg);
    }

    /**
     * 接口调用失败（快捷模式）
     *
     * @param code
     * @param <T>
     * @return
     */
    public static <T> Result<T> fail(String code) {
        return new Result<T>().setStatus(true).setCode(code).setMsg("FAILED");
    }

    /**
     * 创建返回对象
     *
     * @param <T>
     * @return
     */
    public static <T> Result<T> make() {
        return new Result<T>();
    }

}
