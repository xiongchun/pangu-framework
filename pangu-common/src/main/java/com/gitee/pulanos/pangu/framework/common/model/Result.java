/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.gitee.pulanos.pangu.framework.common.model;

import com.gitee.pulanos.pangu.framework.common.Constants;
import lombok.Data;
import lombok.ToString;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * 通用请求响应结果对象
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
     * 返回码（必填项）
     * <p>示例值：10000</p>
     */
    private Integer code;

    /**
     * 返回码描述（选填项）
     * <p>示例值：接口调用成功</p>
     */
    private String message;

    /**
     * 返回对象（选填项）
     */
    private T data;

    /**
     * 接口调用成功（快捷模式）
     *
     * @param <T>
     * @return
     */
    public static <T> Result<T> success() {
        return new Result<T>().setCode(Constants.Code.SUCCESS).setMessage("SUCCESS");
    }

    /**
     * 接口调用成功（快捷模式）
     *
     * @param data
     * @param <T>
     * @return
     */
    public static <T> Result<T> success(T data) {
        return new Result<T>().setCode(Constants.Code.SUCCESS).setMessage("SUCCESS").setData(data);
    }

    /**
     * 接口调用失败（快捷模式,带消息）
     *
     * @param code
     * @param <T>
     * @return
     */
    public static <T> Result<T> fail(Integer code, String message) {
        return new Result<T>().setCode(code).setMessage(message);
    }

    /**
     * 接口调用失败（快捷模式）
     *
     * @param code
     * @param <T>
     * @return
     */
    public static <T> Result<T> fail(Integer code) {
        return new Result<T>().setCode(code).setMessage("FAILED");
    }

    /**
     * 接口调用失败（快捷模式）
     *
     * @param message
     * @param <T>
     * @return
     */
    public static <T> Result<T> fail(String message) {
        return new Result<T>().setCode(Constants.Code.BIZ_FAILED).setMessage(message);
    }

    /**
     * 实例返回对象
     *
     * @param <T>
     * @return
     */
    public static <T> Result<T> make() {
        return new Result<T>();
    }

    /**
     * 设置状态码和状态描述
     * @param code 状态码
     * @param message 状态描述
     */
    public void setCodeMsg(Integer code, String message) {
        this.setCode(code).setMessage(message);
    }

}
