package aos.test.testcase.templateengine;

import java.io.StringWriter;

import aos.framework.core.typewrap.Dto;
import aos.framework.core.typewrap.Dtos;
import aos.framework.core.velocity.VelocityHelper;

public class TemplateEngine {

	public static void main(String[] args) {
		Dto inDto = Dtos.newDto();
		inDto.put("title", "大保健");
		inDto.put("sender", "XC");
		inDto.put("receivers", "zhangpeng");
		inDto.put("content", "来水善汇大保健");
		StringWriter writer = VelocityHelper.mergeFileTemplate("/aos/test/testcase/templateengine/mail.vm", inDto);
		System.out.println(writer.toString());
	}


}
