package cn.osworks.aos.mylab.study.lang;

import java.util.ArrayList;
import java.util.List;


import org.apache.commons.collections.ListUtils;


import cn.osworks.aos.core.asset.AOSUtils;

import com.google.common.collect.Maps;

/**
 * Java语言特性
 * 
 * @author OSWorks-XC
 * @date 2013-08-18
 */
@SuppressWarnings("all")
public class LangExample1 {

	public static void main(String[] args) {
/*		multiInParam(0, "a", "b", "c");
		String aString = multiOutType(1);
		AppUtils.println(aString);
		List<String> list1 = test("String");
		List<Integer> list2 = test(10);*/
		testWhile();
	}

	/**
	 * 传递不确定个数的同类型参数，该参数只能作为最后一个参数
	 * 
	 * @param strings
	 */
	public static void multiInParam(int a, String... strings) {
		for (String string : strings) {
			AOSUtils.debug(string);
		}
	}

	/**
	 * 返回不确定类型
	 * <p>
	 * 和返回Object比较其优点是不需要强制类型转换
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static <T> T multiOutType(int a) {
		if (a == 1) {
			return (T) "a";
		} else if (a == 2) {
			return (T) ListUtils.EMPTY_LIST;
		}
		return (T) Maps.newHashMap();
	}

	/**
	 * 现在T是什么类型谁都不知道,编译器在编译的时候也是不知道的,只有在runtime时才知道
	 * 
	 * @param t
	 * @return
	 */
	public static <T> List<T> test(T t) {
		List<T> l = new ArrayList<T>();
		l.add(t);
		System.out.println(t);
		return l;
	}
	
	/**
	 * 测试跳出While循环
	 */
	public static void testWhile(){
		while(true){
		   AOSUtils.debug("ok");
		   //break; 结束循环
		   continue;  //跳出本次循环，继续执行下一次迭代。
		}
	}

}
