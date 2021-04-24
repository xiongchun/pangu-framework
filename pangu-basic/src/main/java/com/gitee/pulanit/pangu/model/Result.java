package com.gitee.pulanit.pangu.model;

import java.io.Serializable;

import com.gitee.pulanit.pangu.constants.Constants;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

/**
 * 响应结果封装对象
 * 
 * @author xiongchun
 * @since 1.0.0
 */
@Data
@Accessors(chain = true)
@ApiModel(value = "Result", description = "响应结果封装对象")
public class Result<T> implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@ApiModelProperty(value = "状态标识")
	private boolean status = true;
	
	@ApiModelProperty(value = "自定义状态码")
	private String statusCode;
	
	@ApiModelProperty(value = "提示信息")
	private String message;
	
	/**
	 * 调试信息，当请求头中包含x-debug=true时，拦截器将获取堆栈信息返回前端
	 */
	@ApiModelProperty(value = "调试信息")
	private String debugMsg;
	
	@ApiModelProperty(value = "返回业务消息体")
	private T result;
	
	public Result(Boolean status, String statusCode, String message){
		setStatus(status).setStatusCode(statusCode).setMessage(message);
	}
	
	/**
	 * 请求成功
	 * @param <T>
	 * @param data
	 * @return
	 */
	public static <T> Result<T> success(T data){
		return new Result<T>(true,Constants.Result.SUCCESS, "请求成功").setResult(data);
	}
	
	/**
	 * 请求成功
	 * @param <T>
	 * @param data
	 * @param message
	 * @return
	 */
	public static <T> Result<T> success(T data, String message){
		return new Result<T>(true, Constants.Result.SUCCESS, message).setResult(data);
	}
	
	/**
	 * 请求成功
	 * @param <T>
	 * @return
	 */
	public static <T> Result<T> success(){
		return new Result<T>(true, Constants.Result.SUCCESS, "请求成功");
	}
	
	/**
	 * 请求成功
	 * @param <T>
	 * @param message
	 * @return
	 */
	public static <T> Result<T> success(String message){
		return new Result<T>(true, Constants.Result.SUCCESS, message);
	}
	
	/**
	 * 请求失败
	 * @param <T>
	 * @return
	 */
	public static <T> Result<T> fail(){
		return new Result<T>(false, Constants.Result.FAIL, "请求失败");
	}
	
	/**
	 * 请求失败
	 * @param <T>
	 * @param message
	 * @return
	 */
	public static <T> Result<T> fail(String message){
		return new Result<T>(false, Constants.Result.FAIL, message);
	}
	
}
