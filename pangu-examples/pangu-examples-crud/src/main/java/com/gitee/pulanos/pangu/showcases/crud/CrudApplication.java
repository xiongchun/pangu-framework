package com.gitee.pulanos.pangu.showcases.crud;

import com.gitee.pulanos.pangu.framework.PanGuApplicationBuilder;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * @author xiongchun
 */
@EnableTransactionManagement
@SpringBootApplication
@ComponentScan({"com.gitee.pulanos.pangu"})
public class CrudApplication {
	public static void main(String[] args) {
		PanGuApplicationBuilder.init(CrudApplication.class).run(args);
	}
}
