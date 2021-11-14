package com.gitee.pulanos.pangu.showcases;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

/**
 * @author xiongchun
 */
@SpringBootApplication
@ComponentScan({"com.gitee.pulanos.pangu"})
public class GatewayApplication {
	public static void main(String[] args) {
		SpringApplication.run(GatewayApplication.class);
	}
}
