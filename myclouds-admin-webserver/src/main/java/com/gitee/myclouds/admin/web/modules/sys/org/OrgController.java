package com.gitee.myclouds.admin.web.modules.sys.org;

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
 * 组织机构管理
 * 
 * @author xiongchun
 *
 */
@Controller
@RequestMapping("sys/org")
public class OrgController {

	@Autowired
	private OrgService orgService;

	@RequestMapping("init")
	public String init(ModelMap map) {

		return "modules/sys/org";
	}

	/**
	 * 查询列表
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "list", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json")
	@ResponseBody
	public String listOrgs(HttpServletRequest request) {
		Dto inDto = Dtos.newDto(request);
		return orgService.list(inDto);
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
		return orgService.get(inDto.getInteger("id"));
	}

	/**
	 * 新增
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "save", method = { RequestMethod.POST }, produces = "application/json")
	@ResponseBody
	public Dto saveOrg(HttpServletRequest request, HttpSession httpSession) {
		Dto inDto = Dtos.newDto(request, httpSession);
		return Dtos.newDto(orgService.save(inDto));
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
		return Dtos.newDto(orgService.update(inDto));
	}

	/**
	 * 删除
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "delete", method = { RequestMethod.POST }, produces = "application/json")
	@ResponseBody
	public Dto deleteOrg(HttpServletRequest request) {
		Dto inDto = Dtos.newDto(request);
		return Dtos.newDto(orgService.delete(inDto));
	}
	
	/**
	 * 查询部门树
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "listOrgTree", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json")
	@ResponseBody
	public String listOrgTree(HttpServletRequest request) {
		Dto inDto = Dtos.newDto(request);
		return orgService.listOrgTree(inDto);
	}
	
}
