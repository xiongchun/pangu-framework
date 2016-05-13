package cn.osworks.aos.mylab.study;

import java.util.Iterator;
import java.util.List;
import java.util.Random;

import org.apache.commons.lang.math.RandomUtils;



import cn.osworks.aos.core.asset.AOSUtils;

import com.google.common.collect.Lists;

/**
 * <b>综合小例子</b>
 * 
 * @author OSWorks-XC
 * @date 2013-08-18
 */
@SuppressWarnings("unused")
public class AnyExamples {

	public static void main(String[] args) {
		//getRandom();
		removeListItem();
	}

	/**
	 * 获取随机数
	 */
	private static void getRandom() {
		Random random = new Random();
		int intNumber = random.nextInt(100);// 获取一个整型数(0-99)
		float floatNumber = random.nextFloat();// 获取一个浮点数(0-1)
		double doubleNumber = random.nextDouble();// 获取双精度数(0-1)
		boolean booleanNumber = random.nextBoolean();// 获取boolean数
		System.out.println("intNumber:" + intNumber);
		System.out.println("floatNumber:" + floatNumber);
		System.out.println("doubleNumber:" + doubleNumber);
		System.out.println("booleanNumber:" + booleanNumber);
	}
	
	/**
	 * 对集合元素进行删除
	 */
	private static void removeListItem() {
		List<String> list = Lists.newArrayList();
		list.add("a");
		list.add("c");
		list.add("c");
		Iterator<String> iterator = list.iterator();
		while (iterator.hasNext()) {
			String string = (String) iterator.next();
			if (string.equals("c")) {
				iterator.remove();
			}
		}
		for (String string : list) {
			AOSUtils.debug(string);
		}
	}

}
