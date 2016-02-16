package cn.osworks.aos.demo.dao;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import org.springframework.stereotype.Component;

/**
 * 标识Mapper接口,供MapperScannerConfigurer扫描
 * 
 * <p>不同的数据源配置需要使用不同的Mapper注解类。这个Mapper供范例系统数据源使用。
 * 
 * @author OSWorks-XC
 * @see org.mybatis.spring.mapper.MapperScannerConfigurer
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.TYPE)
@Documented
@Component
public @interface Mapper {
	
	String value() default "";
	
}
