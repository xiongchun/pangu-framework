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

package com.gitee.pulanos.pangu.framework.sdk.misc;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.exceptions.ValidateException;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.groups.Default;
import java.util.List;
import java.util.stream.Collectors;

/**
 * BeanValidator Utils
 *
 * @author xiongchun
 * @since 4.1.0
 */
public class BeanValidator {

    private static Validator validator = Validation.buildDefaultValidatorFactory().getValidator();

    private static final int INVALID_STATUS_CODE = -999;


    /**
     * Validates all constraints on {@code object}.
     * <p> ValidateException if a validate error happens during the validation process
     *
     */
    public static void validate(Object object) {
        validate(object, Default.class);
    }

    /**
     * Validates all constraints on {@code object}.
     * <p> ValidateException if a validate error happens during the validation process
     *
     */
    public static void validate(Object object, Class<?>... groups) {
        List<String> invalidMsgList = validateBean(object, groups);
        if (CollUtil.isNotEmpty(invalidMsgList)) {
            throw new ValidateException(INVALID_STATUS_CODE, String.join(" | ", invalidMsgList));
        }
    }

    /**
     * preValidate all constraints on {@code object}.
     *
     */
    public static void preValidate(Object object) {
        preValidate(object, Default.class);
    }

    /**
     * preValidate all constraints on {@code object}.
     *
     * @return retrun the simple validate error list
     */
    public static List<String> preValidate(Object object, Class<?>... groups) {
        return validateBean(object, groups);
    }

    private static List<String> validateBean(Object object, Class<?>... groups) {
        return validator.validate(object, groups).stream().map(ConstraintViolation::getMessage).collect(Collectors.toList());
    }

}
