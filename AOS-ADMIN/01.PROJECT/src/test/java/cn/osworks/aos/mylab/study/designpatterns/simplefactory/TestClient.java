package cn.osworks.aos.mylab.study.designpatterns.simplefactory;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.math.BigDecimal;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * 简单工厂模式实现计算器客户端
 * 
 * 一个灵活的可扩展可维护的且具备高度可复用能力的计算器程序实现了！
 * <p>
 * 简单工厂模式虽然能够帮我们把程序解耦，实现我们的目标！但他也有一个致命缺陷，当我们的业务逻辑分支很多的话，
 * 我们的简单工厂类将会变得很冗长！这个问题就留给以后的工厂方法模式来解决！但，简单工厂方法模式在我们的程序设计中也是应用非常普片的。
 * </p>
 * 
 * @author OSWorks-XC
 * @date 2009-04-05
 */
public class TestClient {
	private static Log log = LogFactory.getLog(TestClient.class);

	public static void main(String[] args) throws Exception {
		BaseOperation oper;
		BigDecimal numberA = null;
		BigDecimal numberB = null;
		char operate;
		BigDecimal result = null;
		BufferedReader bReader = new BufferedReader(new InputStreamReader(System.in));
		try {
			System.out.println("请输入一个数字:");
			numberA = new BigDecimal(bReader.readLine());
			System.out.println("请再输入一个数字:");
			numberB = new BigDecimal(bReader.readLine());
			System.out.println("请输入运算符:");
			operate = bReader.readLine().toCharArray()[0];
		} catch (Exception e) {
			log.error("发生严重错误!");
			e.printStackTrace();
			throw e;
		}
		oper = OperationFactory.createOperation(operate);
		oper.setNumberA(numberA);
		oper.setNumberB(numberB);
		result = oper.getResult();
		//result = oper.getResult1();
		System.out.println("计算结果:" + numberA + operate + numberB + " = " + result);
	}
}
