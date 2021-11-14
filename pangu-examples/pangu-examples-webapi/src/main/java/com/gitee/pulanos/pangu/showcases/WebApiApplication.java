package com.gitee.pulanos.pangu.showcases;

import com.gitee.pulanos.pangu.framework.PanGuApplicationBuilder;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

/**
 * @author xiongchun
 */
@SpringBootApplication
@ComponentScan({"com.gitee.pulanos.pangu"})
public class WebApiApplication {
	public static void main(String[] args) {
		PanGuApplicationBuilder.init(WebApiApplication.class).run(args);
	}
}
