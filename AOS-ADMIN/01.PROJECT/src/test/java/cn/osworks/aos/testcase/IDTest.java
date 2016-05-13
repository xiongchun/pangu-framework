package cn.osworks.aos.testcase;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.id.AOSId;



/**
 * <b>ID生成器单元测试用例</b>
 * 
 * @author OSWorks-XC
 * @date 2013-08-10
 */
public class IDTest {
	
	@Test
	public void testUUID(){
		int length = AOSId.uuid().length();
		assertEquals(36, length);
		AOSId.uuid(4);
	}
	
	@Test
	public void testID(){
		AOSUtils.debug(AOSId.id("GUUID"));
	}
	
	@Test
	public void testAppID(){
		AOSUtils.debug(AOSId.id("TESTID"));
	}
	
	@Test
	public void testTreeID(){
		AOSUtils.debug(AOSId.treeId("0.00.020", 999));
	}

	public static void main(String[] args) {
		AOSUtils.debug(AOSId.treeId("0.00", 999));
	}

}
