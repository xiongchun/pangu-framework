package cn.osworks.aos.testcase;


/**
 * <b>模板引擎测试用例</b>
 * 
 * @author OSWorks-XC
 * @since 1.0
 * @date 2009-12-10
 * @lastmodify 2013-08-30
 */
public class TemplateTest {

/*	*//**
	 * 测试字符串模版
	 *//*
	@Test
	public void testStringTemplate() {
		String templateString = "${name}, I Love You!";
		Dto dto = new HashDto();
		dto.put("name", "App169");
		StringWriter writer = VelocityHelper.mergeStringTemplate(templateString, dto);
		String actualString = writer.toString();
		String expectString = "App169, I Love You!";
		assertEquals(expectString, actualString);
	}

	*//**
	 * 测试文件模版
	 *//*
	@Test
	public void testFileTemplate() {
		List<Aos_sh_az01PO> az01List = TestData.getAz01List();
		Dto dto = new HashDto();
		dto.put("az01List", az01List);
		dto.put("title", "账户信息");
		
		StringWriter writer = VelocityHelper.mergeFileTemplate("aos/testcase/data/test.vm", dto);
		String actualString = writer.toString().replaceAll("\r", "");
		String expectString = "账户信息==卡号:0001姓名:xiongchun**卡号:0002姓名:lily**";
		assertEquals(expectString, actualString);
	}*/

}
