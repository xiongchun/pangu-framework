package cn.osworks.aos.mylab.study.designpatterns.simplefactory.operator;

import java.math.BigDecimal;

import cn.osworks.aos.mylab.study.designpatterns.simplefactory.BaseOperation;




/**
 * 减法运算器（面向对象-封装、继承、多态）
 * 
 * @author OSWorks-XC
 * @date 2008-08-18
 */
public class SubOperation extends BaseOperation {
	
	@Override
	public BigDecimal getResult(){
		BigDecimal result = null;
		result = this.getNumberA().subtract(this.getNumberB());
		return result;
		}

	@Override
	protected BigDecimal getResult1() {
		BigDecimal result = null;
		result = this.getNumberA().subtract(this.getNumberB());
		return result;
	}
	
}
