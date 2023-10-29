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

package com.gitee.pulanos.pangu.showcases.config.remote.nacos;

import cn.hutool.cron.CronUtil;
import cn.hutool.cron.task.Task;
import com.alibaba.nacos.api.config.annotation.NacosValue;
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
public class NacosConfigurationApplication {

	public static void main(String[] args) {
		SpringApplication.run(NacosConfigurationApplication.class, args);
	}

	@Component
	public class RemoteConfiguration {
		/**
		 * 开启 autoRefreshed配置项, 可以实现参数的动态刷新
		 */
		@NacosValue(value = "${demo.app.id:}")
		private String appId;
		@NacosValue(value = "${demo.app.name:}", autoRefreshed = true)
		private String appName;
		@NacosValue(value = "${demo.app.author:}", autoRefreshed = true)
		private String appAuthor;

		@PostConstruct
		public void execute() {
			CronUtil.schedule("*/10 * * * * *", new Task() {
				@Override
				public void execute() {
					log.info("演示获取配置数据，可以在配置中心修改参数值后查看动态刷新效果");
					log.info("参数appId：{}", appId);
					log.info("参数appName：{}", appName);
					log.info("参数appAuthor：{}", appAuthor);
				}
			});
			CronUtil.setMatchSecond(true);
			CronUtil.start();
		}
	}

}


