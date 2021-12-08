package com.gitee.pulanos.pangu.showcases.webapi.dubbo;

import com.gitee.pulanos.pangu.framework.starter.PanGuApplicationBuilder;
import org.apache.dubbo.config.spring.context.annotation.EnableDubbo;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @author xiongchun
 */
@EnableDubbo
@SpringBootApplication
public class WebApiDubboServiceApplication {
	public static void main(String[] args) {
		PanGuApplicationBuilder.init(WebApiDubboServiceApplication.class).run(args);
	}
}
