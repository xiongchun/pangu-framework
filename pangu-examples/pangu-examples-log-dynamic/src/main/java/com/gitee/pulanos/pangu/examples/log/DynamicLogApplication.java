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

package com.gitee.pulanos.pangu.examples.log;

import cn.hutool.core.lang.Console;
import cn.hutool.cron.CronUtil;
import cn.hutool.cron.task.Task;
import com.alibaba.nacos.api.config.ConfigService;
import com.alibaba.nacos.spring.context.annotation.config.EnableNacosConfig;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

/**
 * @author xiongchun
 */
@Slf4j
@SpringBootApplication
public class DynamicLogApplication {

	public static void main(String[] args) {
		SpringApplication.run(DynamicLogApplication.class, args);
	}

	@Component
	public class DynamicLogExample {

		@PostConstruct
		public void execute() {
			CronUtil.schedule("*/10 * * * * *", new Task() {
				@Override
				public void execute() {
					Console.log("演示日志级别热切换功能，请在Nacos控制台修改日志级别后查看输出效果");
					log.trace("这是trace信息");
					log.debug("这是debug信息");
					log.info("这是info信息");
					log.warn("这是warn信息");
					log.error("这是error信息");
				}
			});
			CronUtil.setMatchSecond(true);
			CronUtil.start();
		}

	}

}


