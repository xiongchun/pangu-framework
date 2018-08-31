package com.gitee.myclouds.admin.web.modules.sys.user;

import java.util.List;
import java.util.Map;

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
 * 用户管理
 * 
 * @author xiongchun
 *
 */
@Controller
@RequestMapping("sys/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("init")
	public String init(ModelMap map) {

		return "modules/sys/user";
	}

	/**
	 * 查询列表
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "list", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json")
	@ResponseBody
	public String listUsers(HttpServletRequest request) {
		Dto inDto = Dtos.newDto(request);
		return userService.list(inDto);
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
		return userService.get(inDto.getInteger("id"));
	}

	/**
	 * 新增
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "save", method = { RequestMethod.POST }, produces = "application/json")
	@ResponseBody
	public Dto saveUser(HttpServletRequest request, HttpSession httpSession) {
		Dto inDto = Dtos.newDto(request, httpSession);
		return Dtos.newDto(userService.save(inDto));
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
		return Dtos.newDto(userService.update(inDto));
	}

	/**
	 * 删除
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "delete", method = { RequestMethod.POST }, produces = "application/json")
	@ResponseBody
	public Dto deleteUser(HttpServletRequest request) {
		Dto inDto = Dtos.newDto(request);
		return Dtos.newDto(userService.delete(inDto));
	}
	
	/**
	 * 根据用户查询待授权角色列表和已授权角色列表
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "listRoleGrantInfo", method = { RequestMethod.POST }, produces = "application/json")
	@ResponseBody
	public List<Map<String, Object>> listRoleGrantInfo(HttpServletRequest request) {
		Dto inDto = Dtos.newDto(request);
		return userService.listRoleGrantInfo(inDto.getInteger("id"));
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
		return Dtos.newDto(userService.grant(inDto));
	}
	
	/**
	 * 修改当前登录用户密码
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "updatePwd", method = { RequestMethod.POST }, produces = "application/json")
	@ResponseBody
	public Dto updatePwd(HttpServletRequest request, HttpSession httpSession) {
		Dto inDto = Dtos.newDto(request, httpSession);
		return Dtos.newDto(userService.updatePwd(inDto));
	}
	
	/**
	 * 管理员重置用户密码
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "resetPwd", method = { RequestMethod.POST }, produces = "application/json")
	@ResponseBody
	public Dto resetPwd(HttpServletRequest request) {
		Dto inDto = Dtos.newDto(request);
		return Dtos.newDto(userService.resetPwd(inDto));
	}
	
}
