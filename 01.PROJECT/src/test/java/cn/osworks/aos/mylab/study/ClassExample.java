package cn.osworks.aos.mylab.study;

import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

import cn.osworks.aos.core.asset.AOSBeanLoader;
import cn.osworks.aos.demo.modules.service.DemoService;



/**
 * <b>一些和类相关的基础的模版代码</b>
 * 
 * @author OSWorks-XC
 * @date 2013-08-18
 */
@SuppressWarnings("all")
public class ClassExample {

	public static void main(String[] args) {
		classInstance();
	}

	/**
	 * 简单演示类装载和实例化
	 */
	private static void classInstance() {
/*		Class myClass = null;
		Object myInstance = null;
		try {
			myClass = Class.forName("aos.test.testcase.data.TestData");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			myInstance = myClass.newInstance();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
		TestData testData = (TestData) myInstance;
		Dto dto = testData.getAz01Dto();
		dto.println();*/
	}

	/**
	 * 清除当前对象属性 调用set**()方法
	 */
	public void clear() {
		Method[] methods = this.getClass().getMethods();
		for (int i = 0, n = methods.length; i < n; i++) {
			try {
				Method method = methods[i];
				if ((method.getModifiers() & Modifier.PUBLIC) == 1) {
					String methodName = method.getName();
					if (methodName.startsWith("set")) {
						method.invoke(this, new Object[] { null });
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * Java原生反射方法调用
	 * 
	 * @throws Exception
	 */
	public static void testJdkReflect() throws Exception {
		DemoService caseService = new DemoService();
		long begin = System.currentTimeMillis();
		Method method = DemoService.class.getMethod("sayHi", String.class);
		for (int j = 0; j < 1000; j++) {
			method.invoke(caseService, "Afghan007");
		}
		System.out.print("耗时：" + (System.currentTimeMillis() - begin) + " 毫秒");
	}

	/**
	 * Java原生反射：对象实例-方法调用
	 * 
	 * @throws Exception
	 */
	public static void testJdkReflect2() throws Exception {
		Class c = Class.forName("aos.asset.modules.CaseService");
		Method method = c.getMethod("sayHi", String.class);
		method.invoke(c.newInstance(), "Afghan007");
	}

	/**
	 * Java原生反射：反射动态调用SpringBean
	 * 
	 * @throws Exception
	 */
	public static void testJdkReflect3() throws Exception {
		Object object = AOSBeanLoader.getSpringBean("caseService");
		Class c = object.getClass();
		Method method = c.getMethod("sayHi", String.class);
		method.invoke(object, "Afghan007");
	}

	/**
	 * ReflectAsm反射方法调用 !依赖包asm.jar版本冲突,暂时不用此种方式进行反射 asm.jar需要升级到4.0
	 * 
	 * @throws Exception
	 */
	public static void testReflectAsm() {
	}

}
