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

package com.gitee.pulanos.pangu.framework.sdk.misc.exception;

import com.gitee.pulanos.pangu.framework.common.Constants;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * Business Exception
 *
 * <p>业务模块抛出的通用异常</p>
 *
 * @author xiongchun
 * @since 1.0.0
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
public class BizException extends RuntimeException {

    private static final long serialVersionUID = -1030469420838093832L;

    private String code = Constants.Code.BIZ_FAILED;

    public BizException() {
    }

    public BizException(String message) {
        super(message);
    }

    public BizException(String code, String message) {
        super(message);
        this.code = code;
    }

    public BizException(Throwable throwable) {
        super(throwable);
    }

    public BizException(String message, Throwable throwable) {
        super(message, throwable);
    }

}
