package aos.framework.core.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import org.springframework.stereotype.Component;

/**
 * <b>标识Mapper接口,供MapperScannerConfigurer扫描</b>
 * 
 * @author xiongchun
 * @see org.mybatis.spring.mapper.MapperScannerConfigurer
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.TYPE)
@Documented
@Component
public @interface Dao {
	
	String value() default "";
	
}
