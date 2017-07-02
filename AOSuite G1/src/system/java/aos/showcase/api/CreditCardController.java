package aos.showcase.api;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import aos.framework.core.asset.WebCxt;
import aos.framework.core.typewrap.Dto;
import aos.framework.core.typewrap.Dtos;
import aos.framework.core.typewrap.impl.HashDto;
import aos.framework.core.utils.AOSJson;

/**
 * Http后台接口范例
 * 
 * <p>
 * 以网上信用卡申请为例子
 * 
 * @author xiongchun
 *
 */
@Controller
@RequestMapping(value = "api/creditCard")
public class CreditCardController {

	/**
	 * 注册接口<br>
	 * 
	 * <p>
	 * 这种方式的前提是H5、Android、IOS的提交方式是Get提交或POST表单提交
	 * contentType:"application/x-www-form-urlencoded"
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "register")
	public void register(HttpServletRequest request, HttpServletResponse response) {
		Dto inDto = Dtos.newInDto(request);
		System.out.println(inDto);
		WebCxt.write(response, "收到数据!");
	}

	/**
	 * 注册接口<br>
	 * <p>
	 * 这种方式的前提是H5 Ajax的dataType:"json",contentType:"application/json"时或Android、
	 * IOS通过Http类库直接提交JSON的情况
	 * 
	 * @param jsonString
	 * @param response
	 */
	@RequestMapping(value = "register2")
	public void register2(@RequestBody String jsonString, HttpServletRequest request, HttpServletResponse response) {
		System.out.println(jsonString);
		// 可以通过下面的API将JSON反序列化到Dto
		Dto inDto = AOSJson.fromJson(jsonString, HashDto.class);
		inDto.println();
		WebCxt.write(response, "收到数据!");
	}

	/**
	 * resetful风格的Http接口
	 * 
	 * @param version
	 * @param id
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "info/{id}", method = RequestMethod.GET)
	public void getCardInfo(@PathVariable String version, @PathVariable String id, HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println(id);
		WebCxt.write(response, "收到数据!");
	}

}
