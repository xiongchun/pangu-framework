package cn.osworks.aos.mylab.study.designpatterns.simplefactory;

import java.math.BigDecimal;

/**
 * 计算器运算类（面向对象-封装、继承、多态）
 * 
 * 该类也可以是一个接口
 * 
 * @author OSWorks-XC 
 * @date 2008-08-18
 */
public abstract class BaseOperation {

	private BigDecimal numberA = null;
	
	private BigDecimal numberB = null;

	/**
	 * 此方法将在派生类中重写
	 */
	protected BigDecimal getResult() {
		BigDecimal result = null;
		return result;
	}
	
	/**
	 * 抽象接口的形式，抽象接口在派生类中实现
	 * 
	 * @return
	 */
	protected abstract BigDecimal getResult1();

	public BigDecimal getNumberA() {
		return numberA;
	}

	public void setNumberA(BigDecimal numberA) {
		this.numberA = numberA;
	}

	public BigDecimal getNumberB() {
		return numberB;
	}

	public void setNumberB(BigDecimal numberB) {
		this.numberB = numberB;
	}
}
