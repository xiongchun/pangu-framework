package com.pulanit.pangu.admin;

import com.gitee.pulanos.pangu.framework.starter.PanGuApplicationBuilder;
import com.yomahub.tlog.core.enhance.bytes.AspectLogEnhance;
import org.apache.dubbo.config.spring.context.annotation.EnableDubbo;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @author xiongchun
 */
@EnableDubbo
@SpringBootApplication
public class AdminWebApplication {

	static {
		AspectLogEnhance.enhance();
	}
	public static void main(String[] args) {
		PanGuApplicationBuilder.init(AdminWebApplication.class).run(args);
	}
}
