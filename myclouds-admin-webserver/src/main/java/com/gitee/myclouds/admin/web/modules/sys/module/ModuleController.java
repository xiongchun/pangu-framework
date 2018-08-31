package com.gitee.myclouds.admin.web.modules.sys.module;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gitee.myclouds.common.wrapper.Dto;
import com.gitee.myclouds.common.wrapper.Dtos;

/**
 * 资源模块管理
 * 
 * @author xiongchun
 *
 */
@Controller
@RequestMapping("sys/module")
public class ModuleController {

	@Autowired
	private ModuleService moduleService;
	
	@RequestMapping("init")
	public String init(ModelMap map) {

		return "modules/sys/module";
	}

	/**
	 * 查询列表
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "list", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json")
	@ResponseBody
	public String listModules(HttpServletRequest request) {
		Dto inDto = Dtos.newDto(request);
		return moduleService.list(inDto);
	}
	
	/**
	 * 查询实体
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "get", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json")
	@ResponseBody
	public String get(HttpServletRequest request) {
		Dto inDto = Dtos.newDto(request);
		return moduleService.get(inDto.getInteger("id"));
	}

	/**
	 * 新增
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "save", method = { RequestMethod.POST }, produces = "application/json")
	@ResponseBody
	public Dto saveModule(HttpServletRequest request, HttpSession httpSession) {
		Dto inDto = Dtos.newDto(request, httpSession);
		return Dtos.newDto(moduleService.save(inDto));
	}
	
	/**
	 * 修改
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "update", method = { RequestMethod.POST }, produces = "application/json")
	@ResponseBody
	public Dto update(HttpServletRequest request) {
		Dto inDto = Dtos.newDto(request);
		return Dtos.newDto(moduleService.update(inDto));
	}

	/**
	 * 删除
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "delete", method = { RequestMethod.POST }, produces = "application/json")
	@ResponseBody
	public Dto deleteModule(HttpServletRequest request) {
		Dto inDto = Dtos.newDto(request);
		return Dtos.newDto(moduleService.delete(inDto));
	}
	
	/**
	 * 查询资源树
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "listModuleTree", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json")
	@ResponseBody
	public String listModuleTree(HttpServletRequest request) {
		Dto inDto = Dtos.newDto(request);
		return moduleService.listModuleTree(inDto);
	}
}
