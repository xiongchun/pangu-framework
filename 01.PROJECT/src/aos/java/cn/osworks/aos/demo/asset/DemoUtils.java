package cn.osworks.aos.demo.asset;

import cn.osworks.aos.core.asset.AOSUtils;

/**
 * 范例系统工具类
 * 
 * @author OSWorks-XC
 */
public class DemoUtils {
	
	/**
	 * 范例相关模块使用
	 */
	public static final String DEMOID = "DEMOID";
	
	/**
	 * 范例系统卡号
	 */
	public static final String CARDID = "CARDID";
	
	//姓氏数组
	private static final String firstName[] = {"熊","黄","毛","赵","张","刘","郤","周","段","李"};

	/**
	 * 获取随机人名
	 */
	public static String getPersonName() {
		String nameString = "";
		long length = AOSUtils.randomBetween(2, 3);
		nameString = firstName[AOSUtils.random()];
		if (length == 2) {
			nameString += AOSUtils.randomSimplified();
		}else {
			nameString += AOSUtils.randomSimplified();
			nameString += AOSUtils.randomSimplified();
		}
		return nameString;
	}

	public static void main(String[] args) {
		for (int i = 0; i < 100; i++) {
			System.out.println(getPersonName());
		}
	}
}
