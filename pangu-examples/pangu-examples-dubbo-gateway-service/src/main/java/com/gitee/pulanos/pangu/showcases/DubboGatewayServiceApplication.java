package com.gitee.pulanos.pangu.showcases;

import com.gitee.pulanos.pangu.framework.PanGuApplicationBuilder;
import org.apache.dubbo.config.spring.context.annotation.EnableDubbo;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

/**
 * @author xiongchun
 */
@EnableDubbo
@SpringBootApplication
@ComponentScan({"com.gitee.pulanos.pangu.showcases.dubbo"})
public class DubboGatewayServiceApplication {
	public static void main(String[] args) {
		PanGuApplicationBuilder.init(DubboGatewayServiceApplication.class).run(args);
	}
}
