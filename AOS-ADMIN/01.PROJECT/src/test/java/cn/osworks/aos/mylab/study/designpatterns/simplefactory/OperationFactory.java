package cn.osworks.aos.mylab.study.designpatterns.simplefactory;

import cn.osworks.aos.mylab.study.designpatterns.simplefactory.operator.AddOperation;
import cn.osworks.aos.mylab.study.designpatterns.simplefactory.operator.SubOperation;

/**
 * 简单运算工厂类(实例化所需的运算器)
 * 
 * @author OSWorks-XC
 * @date 2009-04-05
 */
public class OperationFactory {

	public static BaseOperation createOperation(char pOperate) {
		BaseOperation oper = null;
		switch (pOperate) {
		case '+':
			oper = new AddOperation();
			break;
		case '-':
			oper = new SubOperation();
			break;
		}
		return oper;
	}
}
