package com.gitee.myclouds.admin.web.modules.sys.param;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gitee.myclouds.common.wrapper.Dto;
import com.gitee.myclouds.common.wrapper.Dtos;

/**
 * 键值参数管理
 * 
 * @author xiongchun
 *
 */
@Controller
@RequestMapping("sys/param")
public class ParamController {

	@Autowired
	private ParamService paramService;

	@RequestMapping("init")
	public String init(ModelMap map) {
		return "modules/sys/param";
	}

	/**
	 * 查询列表
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "list", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json")
	@ResponseBody
	public String list(HttpServletRequest request) {
		Dto inDto = Dtos.newDto(request);
		return paramService.list(inDto);
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
		return paramService.get(inDto.getInteger("id"));
	}

	/**
	 * 新增
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "save", method = { RequestMethod.POST }, produces = "application/json")
	@ResponseBody
	public Dto save(HttpServletRequest request) {
		Dto inDto = Dtos.newDto(request);
		return Dtos.newDto(paramService.save(inDto));
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
		return Dtos.newDto(paramService.update(inDto));
	}

	/**
	 * 删除
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "delete", method = { RequestMethod.POST }, produces = "application/json")
	@ResponseBody
	public Dto delete(HttpServletRequest request) {
		Dto inDto = Dtos.newDto(request);
		return Dtos.newDto(paramService.delete(inDto));
	}

}
