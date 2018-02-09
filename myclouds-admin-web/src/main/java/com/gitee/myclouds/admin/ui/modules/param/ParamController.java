package com.gitee.myclouds.admin.ui.modules.param;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.gitee.myclouds.toolbox.wrap.Dto;
import com.gitee.myclouds.toolbox.wrap.Dtos;

/**
 * 键值参数管理
 * 
 * @author xiongchun
 *
 */
@Controller
@RequestMapping("param")
public class ParamController {

	@Autowired
	private ParamService paramService;

	@RequestMapping("init")
	public String init(ModelMap map) {

		return "modules/param";
	}

	@RequestMapping(value = "list", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json")
	@ResponseBody
	public String list(HttpServletRequest request, HttpServletResponse response) {
		Dto inDto = Dtos.newDto(request);
		String jsonString = paramService.getParams(inDto);
		return jsonString;
	}
	
	@RequestMapping(value = "save", method = { RequestMethod.POST}, produces = "application/json")
	@ResponseBody
	public String save(HttpServletRequest request, HttpServletResponse response) {
		Dto inDto = Dtos.newDto(request);
		String jsonString = JSON.toJSONString(inDto);
		return jsonString;
	}
	
}
