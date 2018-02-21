package com.gitee.myclouds.admin.web.param;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String listParams(HttpServletRequest request, HttpServletResponse response) {
		Dto inDto = Dtos.newDto(request);
		return paramService.getParams(inDto);
	}
	
	@RequestMapping(value = "save", method = { RequestMethod.POST}, produces = "application/json")
	@ResponseBody
	public Dto saveParam(HttpServletRequest request, HttpServletResponse response) {
		Dto inDto = Dtos.newDto(request);
		return Dtos.newDto(paramService.saveParam(inDto));
	}
	
	@RequestMapping(value = "delete", method = { RequestMethod.POST}, produces = "application/json")
	@ResponseBody
	public Dto deleteParam(HttpServletRequest request, HttpServletResponse response) {
		Dto inDto = Dtos.newDto(request);
		return Dtos.newDto(paramService.deleteParam(inDto));
	}
	
}
