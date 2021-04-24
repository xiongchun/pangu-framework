package org.g4studio.demo.local.reflect;

import java.lang.reflect.Method;

import org.g4studio.common.util.SpringBeanLoader;
import org.g4studio.core.metatype.Dto;
import org.g4studio.core.metatype.impl.BaseDto;

public class RunReflectDemo {

	/**
	 * 演示Java反射使用实例(基于Java原生方式和基于字节码生成方式) 后者性能优于前者
	 * 
	 * @author OSWorks-XC
	 * @throws Exception
	 * @since 2013-02-19
	 */
	public static void main(String[] args) throws Exception {
		//testJdkReflect();
		testJdkReflect3();
		//testReflectAsm();
	}

	/**
	 * Java原生反射方法调用
	 * 
	 * @throws Exception
	 */
	public static void testJdkReflect() throws Exception {
		StudentClass studentClass = new StudentClass();
		long begin = System.currentTimeMillis();
		Method method = StudentClass.class.getMethod("sayHi", String.class);
		for (int j = 0; j < 1000; j++) {
			method.invoke(studentClass, "Afghan007");
		}
		System.out.print("耗时：" + (System.currentTimeMillis() - begin) + " 毫秒");
	}
	
	/**
	 * Java原生反射：对象实例-方法调用
	 * 
	 * @throws Exception
	 */
	public static void testJdkReflect2() throws Exception {
		Class c=Class.forName("org.g4studio.demo.assist.reflect.StudentClass");
		Method method = c.getMethod("sayHi", String.class);
		method.invoke(c.newInstance(), "Afghan007");
	}
	
	/**
	 * Java原生反射：反射动态调用SpringBean
	 * 
	 * @throws Exception
	 */
	public static void testJdkReflect3() throws Exception {
		Object object = SpringBeanLoader.getSpringBean("demoService");
		Class c = object.getClass();
		Method method = c.getMethod("sayHi", Dto.class);
		Dto dto = new BaseDto();
		dto.put("name", "Afghan007");
		method.invoke(object, dto);
	}

	/**
	 * ReflectAsm反射方法调用
	 * !依赖包asm.jar版本冲突,暂时不用此种方式进行反射
	 * asm.jar需要升级到4.0
	 * @throws Exception
	 */
	public static void testReflectAsm() {
		/*
		StudentClass studentClass = new StudentClass();
		long begin = System.currentTimeMillis();
		MethodAccess access = MethodAccess.get(StudentClass.class);
		for (int j = 0; j < 100000000; j++) {
			access.invoke(studentClass, "sayHi", "Afghan007");
		}
		System.out.print("耗时：" + (System.currentTimeMillis() - begin) + " 毫秒");
        }
       */
    }
}