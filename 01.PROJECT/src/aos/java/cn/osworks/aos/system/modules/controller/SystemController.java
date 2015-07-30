package cn.osworks.aos.system.modules.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.osworks.aos.core.asset.AOSJson;
import cn.osworks.aos.core.asset.WebCxt;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.system.modules.service.SystemService;


/**
 * <b>公用控制器</b>
 * 
 * @author OSWorks-XC
 * @date 2014-07-06
 */
@Controller
@RequestMapping(value = "system")
public class SystemController {
	
	@Autowired
	private SystemService systemService;
	
	/**
	 * 查询分类科目树
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "listCatalogs")
	public void listCatalogs(HttpServletRequest request, HttpServletResponse response) {
		Dto qDto = Dtos.newDto(request);
		List<Dto> treeNodes = systemService.listCatalogs(qDto);
		String outString = AOSJson.toJson(treeNodes);
		WebCxt.write(response, outString);
	}
	
	/**
	 * 查询组织树列表
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "listOrgTree")
	public void listOrgTree(HttpServletRequest request, HttpServletResponse response) {
		Dto qDto = Dtos.newDto(request);
		List<Dto> treeNodes = systemService.getOrgTree(qDto);
		String jsonString = AOSJson.toJson(treeNodes);
		WebCxt.write(response, jsonString);
	}
	
	/**
	 * 获取菜单树(异步)
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "getModuleTree")
	public void getModuleTree(HttpServletRequest request, HttpServletResponse response) {
		Dto qDto = Dtos.newDto(request);
		List<Dto> treeNodes = systemService.listModuleTree(qDto);
		String jsonString = AOSJson.toJson(treeNodes);
		WebCxt.write(response, jsonString);
	}
	
}
