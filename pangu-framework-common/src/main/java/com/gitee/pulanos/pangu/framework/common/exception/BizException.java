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

package com.gitee.pulanos.pangu.framework.common.exception;

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
