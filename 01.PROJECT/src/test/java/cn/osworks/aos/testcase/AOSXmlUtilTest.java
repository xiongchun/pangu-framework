package cn.osworks.aos.testcase;

import org.dom4j.Document;
import org.dom4j.Element;
import org.junit.Test;

import cn.osworks.aos.core.asset.AOSXmlUtils;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.impl.HashDto;

import java.io.InputStream;
import java.math.BigDecimal;

import static org.junit.Assert.assertEquals;


/**
 * <b>XML资料格式参考处理类单元测试用例</b>
 * 
 * @author OSWorks-XC
 * @since 6.0
 * @date 2013-08-10
 */
public class AOSXmlUtilTest {

	@Test
	public void testDtoToXml() {
		Dto dto = getAz01Dto();
		String xmlString = AOSXmlUtils.toNodeXmlFromDto(dto, "root");
		String expectString = "<root><az01a5>12</az01a5><az01a0>000001</az01a0><az01a1>xiongchun</az01a1></root>";
		assertEquals(expectString, xmlString);
	}
	
	@Test
	public void testBasicOperate() {
		ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
		InputStream is = classLoader.getResourceAsStream("aos/testcase/data/test.xml");
		Document document = AOSXmlUtils.parse(is);
		Element root = document.getRootElement();
		Element elProcess = root.element("process");
		String name = elProcess.valueOf("@name");
		String id = elProcess.valueOf("@id");
		Element elDocumentation = elProcess.element("documentation");
		String documentation = elDocumentation.getTextTrim();
		assertEquals("_id_01", id);
		assertEquals("_name_process1", name);
		assertEquals("文本描述", documentation);
	}

	/**
	 * 准备数据
	 * @return
	 */
	private Dto getAz01Dto() {
		Dto az01Dto = new HashDto();
		az01Dto.put("az01a0", "000001");
		az01Dto.put("az01a1", "0001");
		az01Dto.put("az01a1", "xiongchun");
		az01Dto.put("az01a5", new BigDecimal("12"));
		return az01Dto;
	}

}
