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

package com.gitee.pulanos.pangu.framework.starter.autoconfigure;

import com.gitee.pulanos.pangu.framework.sdk.Constants;
import lombok.extern.slf4j.Slf4j;

import javax.annotation.PreDestroy;

/**
 * ApplicationExitHook
 *
 * @author xiongchun
 */
@Slf4j
public class ApplicationExitHook {

    @PreDestroy
    public void applicationExitHandler() {
        exitLog();
    }

    private void exitLog() {
        String info = Constants.Msg.APP_EXIT;
        if (log.isInfoEnabled()) {
            log.info(info);
        } else {
            System.out.println(info);
        }
    }

}
