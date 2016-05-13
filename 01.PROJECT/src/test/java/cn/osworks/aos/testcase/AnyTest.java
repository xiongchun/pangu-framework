package cn.osworks.aos.testcase;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.asset.AOSXmlOptionsHandler;

/**
 * <b>大杂烩测试用例</b>
 * 
 * @author OSWorks-XC
 * @since 1.0
 * @date 2009-08-10
 */
public class AnyTest {

	/**
	 * 测试获取Xml配置文件配置参数
	 */
	@Test
	public void testProperties() {
		String actualString = AOSXmlOptionsHandler.getValue("testkey1");
		String expectString = "AOS!";
		assertEquals(expectString, actualString);
	}

	/**
	 * 测试字符串合并
	 */
	@Test
	public void testStringTemplate() {
		String templateString = "{0}, I Love You{1}";
		String actualString = AOSUtils.merge(templateString, "hy", "!");
		String expectString = "hy, I Love You!";
		assertEquals(expectString, actualString);
	}
	
	
}
