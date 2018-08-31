package com.gitee.myclouds.admin.web.modules.sys.role;

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
 * 角色管理
 * 
 * @author xiongchun
 *
 */
@Controller
@RequestMapping("sys/role")
public class RoleController {
	
	@Autowired
	private RoleService roleService;

	@RequestMapping("init")
	public String init(ModelMap map) {

		return "modules/sys/role";
	}

	/**
	 * 查询列表
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "list", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json")
	@ResponseBody
	public String listRoles(HttpServletRequest request) {
		Dto inDto = Dtos.newDto(request);
		return roleService.list(inDto);
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
		return roleService.get(inDto.getInteger("id"));
	}

	/**
	 * 新增
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "save", method = { RequestMethod.POST }, produces = "application/json")
	@ResponseBody
	public Dto saveRole(HttpServletRequest request, HttpSession httpSession) {
		Dto inDto = Dtos.newDto(request, httpSession);
		return Dtos.newDto(roleService.save(inDto));
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
		return Dtos.newDto(roleService.update(inDto));
	}

	/**
	 * 删除
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "delete", method = { RequestMethod.POST }, produces = "application/json")
	@ResponseBody
	public Dto deleteRole(HttpServletRequest request) {
		Dto inDto = Dtos.newDto(request);
		return Dtos.newDto(roleService.delete(inDto));
	}
	
	/**
	 * 查询授权树列表
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "listGrantTree", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json")
	@ResponseBody
	public String listGrantTree(HttpServletRequest request, HttpSession httpSession) {
		Dto inDto = Dtos.newDto(request);
		return roleService.listGrantTree(inDto.getInteger("role_id"));
	}
	
	/**
	 * 授权
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "grant", method = { RequestMethod.POST }, produces = "application/json")
	@ResponseBody
	public Dto grant(HttpServletRequest request, HttpSession httpSession) {
		Dto inDto = Dtos.newDto(request, httpSession);
		return Dtos.newDto(roleService.grant(inDto));
	}
	
}
