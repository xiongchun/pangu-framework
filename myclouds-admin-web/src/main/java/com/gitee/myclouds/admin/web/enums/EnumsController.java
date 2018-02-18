package com.gitee.myclouds.admin.web.enums;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gitee.myclouds.admin.web.param.ParamService;
import com.gitee.myclouds.toolbox.wrap.Dto;
import com.gitee.myclouds.toolbox.wrap.Dtos;

/**
 * 枚举类型管理
 * 
 * @author xiongchun
 *
 */
@Controller
@RequestMapping("enums")
public class EnumsController {

	@Autowired
	private ParamService paramService;

	@RequestMapping("init")
	public String init(ModelMap map) {

		return "modules/enums";
	}

	@RequestMapping(value = "list", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json")
	@ResponseBody
	public String list(HttpServletRequest request, HttpServletResponse response) {
		Dto inDto = Dtos.newDto(request);
		String jsonString = paramService.getParams(inDto);
		return jsonString;
	}
	
}
