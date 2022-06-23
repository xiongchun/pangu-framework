package com.gitee.pulanos.pangu.showcases.webapi.dubbo;

import com.gitee.pulanos.pangu.framework.starter.PanGuApplicationBuilder;
import com.yomahub.tlog.core.enhance.bytes.AspectLogEnhance;
import org.apache.dubbo.config.spring.context.annotation.EnableDubbo;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @author xiongchun
 */
@EnableDubbo
@SpringBootApplication
public class WebApiDubboServiceApplication {

	static {
		AspectLogEnhance.enhance();
	}
	public static void main(String[] args) {
		PanGuApplicationBuilder.init(WebApiDubboServiceApplication.class).run(args);
	}
}
