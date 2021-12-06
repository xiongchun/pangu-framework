package com.gitee.pulanos.pangu.showcases;

import com.gitee.pulanos.pangu.framework.PanGuApplicationBuilder;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

/**
 * @author xiongchun
 */
@SpringBootApplication
public class WebApiDubboServiceApplication {
	public static void main(String[] args) {
		PanGuApplicationBuilder.init(WebApiDubboServiceApplication.class).run(args);
	}
}
